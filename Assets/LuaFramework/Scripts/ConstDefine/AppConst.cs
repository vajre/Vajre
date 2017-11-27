using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

namespace LuaFramework
{
    public class AppConst
    {
#if UNITY_EDITOR
        public static bool DebugMode = true;                        //调试模式-用于内部测试  Lua文件强制使用LuaFramework/Lua下
        public static bool UpdateMode = false;
#else
		public static bool DebugMode = false;                       
        public static bool UpdateMode = false;
#endif

        public const bool LuaByteMode = false;                      //Lua字节码模式-默认关闭 
        public const bool LuaBundleMode = false;                    //Lua代码AssetBundle模式

        public const int TimerInterval = 1;
        public const int GameFrameRate = 30;                        //游戏帧频

        public const string AppName = "LuaFramework";               //应用程序名称
        public const string LuaTempDir = "Lua/";                    //临时目录
        public const string AppPrefix = AppName + "_";              //应用程序前缀
        public const string ExtName = ".unity3d";                   //素材扩展名
        public const string AssetDir = "StreamingAssets";           //素材目录 & manifestName 
                                                                    

#if UNITY_ANDROID
        public const string WebUrl = "http://www.lixutech.com/mjres/Android/Debug/";      //Android更新地址
#else
        public const string WebUrl = "http://www.lixutech.com/mjres/IOS/Debug/";      //IOS更新地址
#endif


        public static string UserId = string.Empty;                 //用户ID

        public static string FrameworkRoot
		{
            get 
			{
                return Application.dataPath + "/" + AppName;
            }
        }
    }
}