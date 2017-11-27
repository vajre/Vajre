using UnityEditor;
using UnityEngine;
using System.IO;
using System.Collections.Generic;
using System.Diagnostics;
using LuaFramework;

public class Packager
{
    public static string platform = string.Empty;
    static List<string> paths = new List<string>();
    static List<string> files = new List<string>();
    static List<AssetBundleBuild> maps = new List<AssetBundleBuild>();

    ///-----------------------------------------------------------
    static string[] exts = { ".txt", ".xml", ".lua", ".assetbundle", ".json" };
    static bool CanCopy(string ext)
	{   
		//能不能复制
        foreach (string e in exts)
		{
            if (ext.Equals(e)) return true;
        }
        return false;
    }

    /// <summary>
    /// 打包IOS资源
    /// </summary>
    [MenuItem("LuaFramework/Build IPhone Resource")]
    public static void BuildIPhoneResource()
    {
        BuildResource(BuildTarget.iOS);
    }

    /// <summary>
    /// 打包Android资源
    /// </summary>
    [MenuItem("LuaFramework/Build Android Resource")]
    public static void BuildAndroidResource()
    {
        BuildResource(BuildTarget.Android);
    }

    /// <summary>
    /// 打包Windows资源
    /// </summary>
    [MenuItem("LuaFramework/Build Windows Resource")]
    public static void BuildWindowsResource()
    {
        BuildResource(BuildTarget.StandaloneWindows);
    }

    /// <summary>
    /// 生成打包资源
    /// </summary>
    /// <param name="target"></param>
    public static void BuildResource(BuildTarget target)
    {
        //打包AB输出路径
        string strABOutPathDIR = string.Empty;

        //获取"StreamingAssets"数值
        strABOutPathDIR = PathTools.GetABOutPath();

        if (Directory.Exists(strABOutPathDIR))
            Directory.Delete(strABOutPathDIR, true);
        Directory.CreateDirectory(strABOutPathDIR);
        AssetDatabase.Refresh();

        //判断生成输出目录文件夹
        if (!Directory.Exists(strABOutPathDIR))
        {
            Directory.CreateDirectory(strABOutPathDIR);
        }

        //打包生成
        BuildPipeline.BuildAssetBundles(strABOutPathDIR, BuildAssetBundleOptions.None, target);

        HandleLuaFile();
        BuildFileIndex();
        AssetDatabase.Refresh();

    }

    /// <summary>
    /// 打包Lua脚本
    /// </summary>
    public static void HandleLuaFile()
    {
        string luaPath = PathTools.GetABOutPath() + "/lua/";

        //----------复制Lua文件----------------
        if (!Directory.Exists(luaPath))
        {
            Directory.CreateDirectory(luaPath); 
        }

        string[] luaPaths = { AppDataPath + "/lua/", 
                              AppDataPath + "/LuaFramework/Tolua/Lua/" };

        for (int i = 0; i < luaPaths.Length; i++)
        {
            paths.Clear(); files.Clear();
            string luaDataPath = luaPaths[i].ToLower();
            Recursive(luaDataPath);
            int n = 0;
            foreach (string f in files)
            {
				if (f.EndsWith(".meta") || f.EndsWith(".DS_Store")) continue;
                string newfile = f.Replace(luaDataPath, "");
                string newpath = luaPath + newfile;
                string path = Path.GetDirectoryName(newpath);
                if (!Directory.Exists(path)) Directory.CreateDirectory(path);

                if (File.Exists(newpath))
                    File.Delete(newpath);

                if (AppConst.LuaByteMode) {
					EncodeLuaFile(f, newpath);
                } else {
                    File.Copy(f, newpath, true);
                }
                UpdateProgress(n++, files.Count, newpath);
            } 
        }
        EditorUtility.ClearProgressBar();
        AssetDatabase.Refresh();
    }

    /// <summary>
    /// 生成打包文件的md5码
    /// </summary>
    static void BuildFileIndex()
    {
        string resPath = PathTools.GetABOutPath();
        ///----------------------创建文件列表-----------------------
        string newFilePath = resPath + "/files.txt";
        if (File.Exists(newFilePath)) File.Delete(newFilePath);

        paths.Clear(); files.Clear();
        Recursive(resPath);

        FileStream fs = new FileStream(newFilePath, FileMode.CreateNew);
        StreamWriter sw = new StreamWriter(fs);
        for (int i = 0; i < files.Count; i++) {
            string file = files[i];
            string ext = Path.GetExtension(file);
            if (file.EndsWith(".meta") || file.Contains(".DS_Store")) continue;

            string md5 = Util.md5file(file);
            string value = file.Replace(resPath + "/", string.Empty);
            sw.WriteLine(value + "|" + md5);
        }
        sw.Close(); fs.Close();
    }

    /// <summary>
    /// 数据目录
    /// </summary>
    static string AppDataPath {
        get { return Application.dataPath.ToLower(); }
    }

    /// <summary>
    /// 遍历目录及其子目录
    /// </summary>
    static void Recursive(string path) {
        string[] names = Directory.GetFiles(path);
        string[] dirs = Directory.GetDirectories(path);
        foreach (string filename in names) {
            string ext = Path.GetExtension(filename);
            if (ext.Equals(".meta")) continue;
            files.Add(filename.Replace('\\', '/'));
        }
        foreach (string dir in dirs) {
            paths.Add(dir.Replace('\\', '/'));
            Recursive(dir);
        }
    }

    static void UpdateProgress(int progress, int progressMax, string desc) {
        string title = "Processing...[" + progress + " - " + progressMax + "]";
        float value = (float)progress / (float)progressMax;
        EditorUtility.DisplayProgressBar(title, desc, value);
    }

    public static void EncodeLuaFile(string srcFile, string outFile) {

        if (!srcFile.ToLower().EndsWith(".lua")) {
            File.Copy(srcFile, outFile, true);
            return;
        }
        bool isWin = true;
        string luaexe = string.Empty;
        string args = string.Empty;
        string exedir = string.Empty;
        string currDir = Directory.GetCurrentDirectory();
        if (Application.platform == RuntimePlatform.WindowsEditor) {
            isWin = true;
            luaexe = "luajit.exe";
            args = "-b " + srcFile + " " + outFile;
            exedir = AppDataPath.Replace("assets", "") + "LuaEncoder/luajit/";
        } else if (Application.platform == RuntimePlatform.OSXEditor) {
            isWin = false;
            luaexe = "./luac";
            args = "-o " + outFile + " " + srcFile;
            exedir = AppDataPath.Replace("assets", "") + "LuaEncoder/luavm/";
        }
        Directory.SetCurrentDirectory(exedir);
        ProcessStartInfo info = new ProcessStartInfo();
        info.FileName = luaexe;
        info.Arguments = args;
        info.WindowStyle = ProcessWindowStyle.Hidden;
        info.ErrorDialog = true;
        info.UseShellExecute = isWin;
        Util.Log(info.FileName + " " + info.Arguments);

        Process pro = Process.Start(info);
        pro.WaitForExit();
        Directory.SetCurrentDirectory(currDir);
    }

    [MenuItem("LuaFramework/Build Protobuf-lua-gen File")]
    public static void BuildProtobufFile() {

        string dir = "Assets/LuaFramework/Lua/3rd/pblua/";
        paths.Clear();
        files.Clear();
        Recursive(dir);

        //string protoc = "d:/protobuf-2.4.1/src/protoc.exe";
        string protoc = "d:/protoc-gen-lua-bin-master/protoc";
        //string protoc_gen_dir = "\"d:/protoc-gen-lua/plugin/protoc-gen-lua.bat\"";
        string protoc_gen_dir = "\"d:/protoc-gen-lua-bin-master/plugin/protoc-gen-lua.bat\"";

        foreach (string f in files) {
            string name = Path.GetFileName(f);
            string ext = Path.GetExtension(f);
            if (!ext.Equals(".proto")) continue;

            ProcessStartInfo info = new ProcessStartInfo();
            info.FileName = protoc;
            info.Arguments = " --lua_out=./ --plugin=protoc-gen-lua=" + protoc_gen_dir + " " + name;
            info.WindowStyle = ProcessWindowStyle.Hidden;
            info.UseShellExecute = true;
            info.WorkingDirectory = dir;
            info.ErrorDialog = true;
            Util.Log(info.FileName + " " + info.Arguments);

            Process pro = Process.Start(info);
            pro.WaitForExit();
        }
        AssetDatabase.Refresh();
    }
}