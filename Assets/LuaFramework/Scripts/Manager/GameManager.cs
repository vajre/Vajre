﻿using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;


namespace LuaFramework
{
    public class GameManager : Manager
    {
        struct DownLoadInfo
        {
            public string fileUrl;
            public string localfile;
        }

        protected static bool initialize = false;
        private List<string> downloadFiles = new List<string>();

        /// <summary>
        /// 初始化游戏管理器
        /// </summary>
        void Awake()
        {
            Init();
        }

        /// <summary>
        /// 初始化
        /// </summary>
        void Init()
        {
            DontDestroyOnLoad(gameObject);  //防止销毁自己
            CheckExtractResource();
            Screen.sleepTimeout = SleepTimeout.NeverSleep;
            Application.targetFrameRate = AppConst.GameFrameRate;
        }

        /// <summary>
        /// 释放资源
        /// </summary>
        public void CheckExtractResource()
        {
#if UNITY_ANDROID
            AppConst.UpdateMode = true;
#endif

            if (AppConst.UpdateMode)
            {
                bool isExists = Directory.Exists(Util.DataPath) &&
                                Directory.Exists(Util.DataPath + "lua/") && 
                                File.Exists(Util.DataPath + "files.txt");

                if(isExists)
                    StartCoroutine(OnUpdateResource());
                else
                    StartCoroutine(OnExtractResource());
            }
            else
                OnResourceInited();
        }

        IEnumerator OnExtractResource()
        {
            Debug.LogError("OnExtractResource");
            string dataPath = Util.DataPath;  //数据目录
            string resPath = Util.AppContentPath(); //游戏包资源目录

            if (Directory.Exists(dataPath)) Directory.Delete(dataPath, true);
            Directory.CreateDirectory(dataPath);

            string infile = resPath + "files.txt";
            string outfile = dataPath + "files.txt";
            if (File.Exists(outfile)) File.Delete(outfile);

            string message = "正在解包文件:>files.txt";

            if (Application.platform == RuntimePlatform.Android) {
                WWW www = new WWW(infile);
                yield return www;

                if (www.isDone) {
                    File.WriteAllBytes(outfile, www.bytes);
                }
                yield return 0;
            } else File.Copy(infile, outfile, true);
            yield return new WaitForEndOfFrame();

            //释放所有文件到数据目录
            string[] files = File.ReadAllLines(outfile);
            int current = 0;
            foreach (var file in files) {
                string[] fs = file.Split('|');
                infile = resPath + fs[0];  //
                outfile = dataPath + fs[0];

                message = "正在解包文件:>" + fs[0];

                AppView.Message msg = new AppView.Message();
                current++;
                msg.current = current;
                msg.total = files.Length;
                facade.SendMessageCommand(NotiConst.UPDATE_EXTRACT, msg);

                string dir = Path.GetDirectoryName(outfile);
                if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);

                if (Application.platform == RuntimePlatform.Android) {
                    WWW www = new WWW(infile);
                    yield return www;

                    if (www.isDone) {
                        File.WriteAllBytes(outfile, www.bytes);
                    }
                    yield return 0;
                } else {
                    if (File.Exists(outfile)) {
                        File.Delete(outfile);
                    }
                    File.Copy(infile, outfile, true);
                }
                yield return new WaitForEndOfFrame();
            }
            message = "解包完成!!!";
            facade.SendMessageCommand(NotiConst.UPDATE_EXTRACT_OVER, message);
            yield return new WaitForSeconds(0.1f);

            message = string.Empty;
            //释放完成，开始启动更新资源
            StartCoroutine(OnUpdateResource());
        }

        /// <summary>
        /// 启动更新下载，这里只是个思路演示，此处可启动线程下载更新
        /// </summary>
        IEnumerator OnUpdateResource()
        {
            Debug.LogError("OnUpdateResource");
            string dataPath = Util.DataPath;  //数据目录
            string url = AppConst.WebUrl;
            string message = string.Empty;
            string random = DateTime.Now.ToString("yyyymmddhhmmss");
            string listUrl = url + "files.txt?v=" + random;
            //Debug.LogWarning("LoadUpdate---->>>" + listUrl);

            WWW www = new WWW(listUrl); yield return www;
            if (www.error != null && www.error.Length != 0)
            {
                Debug.LogError("OnUpdateFailed");
                OnUpdateFailed(string.Empty);
                yield break;
            }
            if (!Directory.Exists(dataPath))
            {
                Directory.CreateDirectory(dataPath);
            }
            File.WriteAllBytes(dataPath + "files.txt", www.bytes);
            string filesText = www.text;
            string[] files = filesText.Split('\n');

            List<DownLoadInfo> list = new List<DownLoadInfo> ();

            for (int i = 0; i < files.Length; i++)
            {
                if (string.IsNullOrEmpty(files[i])) continue;
                string[] keyValue = files[i].Split('|');
                string f = keyValue[0];
                string localfile = (dataPath + f).Trim();
                string path = Path.GetDirectoryName(localfile);
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string fileUrl = url + f + "?v=" + random;
                bool canUpdate = !File.Exists(localfile);

                if (!canUpdate) 
                {
                    string remoteMd5 = keyValue[1].Trim();
                    string localMd5 = Util.md5file(localfile);
                    canUpdate = !remoteMd5.Equals(localMd5);
                    if (canUpdate) File.Delete(localfile);
                }

//              canUpdate = true;
                if (canUpdate) 
                {   
                    DownLoadInfo info;
                    info.fileUrl = fileUrl;
                    info.localfile = localfile;
                    list.Add (info);
                }
            }

            for (int i = 0; i < list.Count; i++)
            {

                Debug.Log (list [i].fileUrl);
                Debug.Log (list [i].localfile);

                AppView.Message msg = new AppView.Message ();
                msg.current = i;
                msg.total = list.Count;

                facade.SendMessageCommand(NotiConst.UPDATE_MESSAGE, msg);
                //这里都是资源文件，用线程下载
                BeginDownload(list[i].fileUrl, list[i].localfile);
                while (!(IsDownOK(list[i].localfile))) { yield return new WaitForEndOfFrame(); }
            }


            yield return new WaitForEndOfFrame();

            message = "更新完成!!";
            facade.SendMessageCommand(NotiConst.UPDATE_DOWNLOAD_OVER, message);

            //StartCoroutine (ReInitResource ());
            OnResourceInited();
        }

        void OnUpdateFailed(string file)
        {
            string message = "更新失败!>" + file;
            facade.SendMessageCommand(NotiConst.UPDATE_MESSAGE, message);
        }

        /// <summary>
        /// 是否下载完成
        /// </summary>
        bool IsDownOK(string file)
        {
            return downloadFiles.Contains(file);
        }

        /// <summary>
        /// 线程下载
        /// </summary>
        void BeginDownload(string url, string file)
        {     //线程下载
            object[] param = new object[2] { url, file };

            ThreadEvent ev = new ThreadEvent();
            ev.Key = NotiConst.UPDATE_DOWNLOAD;
            ev.evParams.AddRange(param);
            ThreadManager.AddEvent(ev, OnThreadCompleted);   //线程下载
        }

        /// <summary>
        /// 线程完成
        /// </summary>
        /// <param name="data"></param>
        void OnThreadCompleted(NotiData data)
        {
            switch (data.evName)
            {
                case NotiConst.UPDATE_EXTRACT:  //解压一个完成
                //
                break;
                case NotiConst.UPDATE_DOWNLOAD: //下载一个完成
                downloadFiles.Add(data.evParam.ToString());
                break;
            }
        }

        /// <summary>
        /// 资源初始化结束
        /// </summary>
        /// 
        public void OnResourceInited()
        {
            ResManager.Initialize(delegate()
            {
                OnInitialize();
            });
        }

        void OnInitialize()
        {
            LuaManager.InitStart();
            LuaManager.DoFile("Logic/Game");         //加载游戏
            Util.CallMethod("Game", "OnInitOK");     //初始化完成
            initialize = true;
        }


        /// <summary>
        /// 析构函数
        /// </summary>
        void OnDestroy()
        {
            if (LuaManager != null)
            {
                Util.CallMethod("Game", "OnDestroy");
                LuaManager.Close();
            }
        }
    }
}