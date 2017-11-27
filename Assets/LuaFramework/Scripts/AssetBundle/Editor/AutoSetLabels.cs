﻿/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   主题:  自动给资源文件添加标记 
 *     Description:
 *          开发思路:
 *              1：  定义需要打包资源的文件夹跟目录。
 *              2：  遍历每个“场景”文件夹（目录）
 *                  A: 遍历本场景目录下所有的目录或者文件。
 *                     如果是目录，则继续“递归”访问里面的文件，直到定位到文件。
 *                  B: 找到文件，则使用AssetImporter类，标记“包名”与“后缀名”。
 *                  
 *
 *     Data: 2017
 *     Version: 0.1版本
 *     Modify Recoder:
 *
 *
 */


using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEditor;
using System.IO;

namespace LuaFramework
{
	public class AutoSetLabels 
	{
        /// <summary>
        /// 设置AB包名
        /// </summary>
        [MenuItem("AssetBundelTools/Set AB Label")]
        public static void SetABLabel()
        {
            /* 方法局部变量 */
            //需要给AB做标记的根目录
            string strNeedSetLabelRoot = string.Empty;

            //目录信息(场景目录信息数组，表示所有的跟目录下场景目录)
            DirectoryInfo[] dirScenesDIRArray = null;

            //清空无用AB包的标记
            AssetDatabase.RemoveUnusedAssetBundleNames();

            //需要打包资源的文件夹跟目录。
            strNeedSetLabelRoot = PathTools.GetABResourcesPath();

            DirectoryInfo dirTempInfo = new DirectoryInfo(strNeedSetLabelRoot);
            dirScenesDIRArray = dirTempInfo.GetDirectories();

            //遍历每个“场景”文件夹（目录）
            foreach (DirectoryInfo currentDIR in dirScenesDIRArray)
            {
                //遍历本场景目录下所有的目录或者文件。
                //如果是目录，则继续“递归”访问里面的文件，直到定位到文件。
                string tmpScenesDIR = strNeedSetLabelRoot + "/" + currentDIR.Name;              //全路径
                int tmpIndex = tmpScenesDIR.LastIndexOf("/");
                string tmpScenesName = tmpScenesDIR.Substring(tmpIndex + 1);                    //场景名称

                //递归调用方法，找到文件，则使用AssetImporter类，标记“包名”与“后缀名”。
                JudgeDIRorFileByRecursive(currentDIR, tmpScenesName);
            }

            //刷新
            AssetDatabase.Refresh();
            //提示信息，标记包名完成。
            Debug.Log("AssetBundle 本次操作设置标记完成!");

        }


        /// <summary>
        /// 递归判断是否为目录与文件，修改AssetBundle的标记(label)
        /// </summary>
        /// <param name="currentDIR">当前文件信息（文件信息与目录信息可以相互转换）</param>
        /// <param name="scenesName">当前场景名称</param>
        private static void JudgeDIRorFileByRecursive(FileSystemInfo fileSysInfo, string scenesName)
        {
            //参数检查
            if (!fileSysInfo.Exists)
            {
                Debug.LogError("文件或者目录名称: " + fileSysInfo + "不存在，请检查");
                return;
            }

            //得到当前目录下一级的文件信息集合
            DirectoryInfo dirInfoObj = fileSysInfo as DirectoryInfo;                           //文件信息转换为目录信息
            FileSystemInfo[] fileSysArray = dirInfoObj.GetFileSystemInfos();
            foreach (FileSystemInfo fileInfo in fileSysArray)
            {
                FileInfo fileInfoObj = fileInfo as FileInfo;

                //文件类型
                if (fileInfoObj != null)
                {
                    //修改此文件的AssetBundle标签
                    SetFileABLabel(fileInfoObj, scenesName);
                }
                //目录类型
                else
                {
                    //如果是目录则递归调用
                    JudgeDIRorFileByRecursive(fileInfo, scenesName);
                }
            }
        }

        /// <summary>
        /// 对指定的文件设置 “AB包名称”
        /// </summary>
        /// <param name="fileinfoObj">文件信息(包含文件绝对路径)</param>
        /// <param name="scenesName">场景名称</param>
        private static void SetFileABLabel(FileInfo fileInfoObj, string scenesName)
        {
            //AssetBundle 包名称
            string strABName = string.Empty;
            //文件路径（相对路径）
            string strAssetFilePath = string.Empty;

            //参数检查
            if (fileInfoObj.Extension == ".meta") return;

            //得到AB包名称
            strABName = GetABName(fileInfoObj, scenesName);
            //获取资源文件的相对路径
            int tmpIndex = fileInfoObj.FullName.IndexOf("Assets");
            strAssetFilePath = fileInfoObj.FullName.Substring(tmpIndex);                    //得到文件相对路径

            //给资源文件设置AB名称已经后缀
            AssetImporter tempImportObj = AssetImporter.GetAtPath(strAssetFilePath);
            tempImportObj.assetBundleName = strABName;

            if (fileInfoObj.Extension == ".unity")
            {
                //定义AB包的扩展名
                tempImportObj.assetBundleVariant = "u3d";
            }
            else
            {
                tempImportObj.assetBundleVariant = "ab";
            }
        }

        /// <summary>
        /// 获取AB包的名称
        /// </summary>
        /// <param name="fileInfoObj">文件信息</param>
        /// <param name="scenesName">场景名称</param>
        /// AB 包形成规则:
        ///     文件AB包名称 = "所在二级目录名称" (场景名称) + "三级目录名称" (下一级的"类型名称")
        /// 
        /// 
        /// <returns>
        /// 返回一个合法的"AB包的名称"
        /// </returns>
        private static string GetABName(FileInfo fileInfoObj, string scenesName)
        {
            //返回AB包名称
            string strABName = string.Empty;

            //Win路径
            string tmpWinPath = fileInfoObj.FullName;                                       //文件信息的全路径（Win格式）
            //Unity路径
            string tmpUnityPath = tmpWinPath.Replace("\\", "/");                            //替换为Unity字符串分隔符
            //定位"场景名称"后面的字符位置
            int tmpSceneNamePostion = tmpUnityPath.IndexOf(scenesName) + scenesName.Length;
            //AB包中"类型名称"所在区域
            string strABFileNameArea = tmpUnityPath.Substring(tmpSceneNamePostion + 1);
            //测试
            //Debug.Log("strABFileNameArea :" + strABFileNameArea);
            if (strABFileNameArea.Contains("/"))
            {
                string[] tmepStrArray = strABFileNameArea.Split('/');
                //AB包名称正式形成
                //Debug.Log("###tmepStrArray[0]:" + tmepStrArray[0]);
                strABName = scenesName + "/" + tmepStrArray[0];
            }
            else
            {
                //定于*.Unity 文件形成的特殊AB包名称
                strABName = scenesName + "/" + scenesName;
            }
            
            return strABName;
        }

    }//Class_end
}
