/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   主题:  路径工具类
 *     Description:
 *             功能:  包含本框架中所有的路径常量，路径方法
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

namespace LuaFramework
{
    public class PathTools
    {
        /* 路径常量 */
        public const string AB_RESOURCES = "AB_Res";

        /* 路径方法 */
        /// <summary>
        /// 得到AB资源的输入目录
        /// </summary>
        /// <returns></returns>
        public static string GetABResourcesPath()
        {
            return Application.dataPath + "/" + AB_RESOURCES;
        }

        /// <summary>
        /// 获取AB打包路径
        /// 算法:
        ///     1: 平台(PC/移动端)路径
        ///     2: 平台的名称
        /// </summary>
        /// <returns></returns>
        public static string GetABOutPath()
        {
            return ReadOnlyPath + "/" + GetPlatformName();
        }


        /// <summary>
        /// 运行时，AB包的加载目录
        /// </summary>
        public static string ABFilePath
        {
            get
            {
                string path = string.Empty;
                if (AppConst.UpdateMode)
                    path = ReadWritePath + "/" + GetPlatformName();
                else
                    path = ReadOnlyPath + "/" + GetPlatformName();
                
                return path;
            }
        }

        /// <summary>
        /// 只读路径
        /// </summary>
        /// <returns></returns>
        public static string ReadOnlyPath
        {
            get
            {
                string path = string.Empty;
                switch (Application.platform)
                {
                    case RuntimePlatform.OSXPlayer:
                    case RuntimePlatform.WindowsPlayer:
                    case RuntimePlatform.WindowsEditor:
                        path = Application.streamingAssetsPath;
                        break;
                    case RuntimePlatform.IPhonePlayer:
                        path = Application.dataPath + "/Raw/";
                        break;
                    case RuntimePlatform.Android:
                        path = Application.dataPath + "!/assets/";
                        break;
                    default:
                        break;
                }

                return path;
            }

        }

        public static string ReadWritePath
        {
            get
            {
                string path = string.Empty;
                string game = AppConst.AppName.ToLower();

                switch (Application.platform)
                {
                    case RuntimePlatform.OSXPlayer:
                    case RuntimePlatform.WindowsPlayer:
                    case RuntimePlatform.WindowsEditor:
                        int i = Application.dataPath.LastIndexOf('/');
                        path = Application.dataPath.Substring(0, i + 1) + game + "/";
                        break;
                        break;
                    case RuntimePlatform.IPhonePlayer:
                    case RuntimePlatform.Android:
                        path = Application.persistentDataPath + "/" + game + "/";
                        break;
                    default:
                        break;
                }

                return path;
            }
        }


        /// <summary>
        /// 获取平台的名称
        /// </summary>
        /// <returns></returns>
        public static string GetPlatformName()
        {
            string strReturnPlatformName = string.Empty;

            switch (Application.platform)
            {
                case RuntimePlatform.WindowsPlayer:
                case RuntimePlatform.WindowsEditor:
                    strReturnPlatformName = "Windows";
                    break;
                case RuntimePlatform.IPhonePlayer:
                    strReturnPlatformName = "IPhone";
                    break;
                case RuntimePlatform.Android:
                    strReturnPlatformName = "Android";
                    break;
                default:
                    break;
            }

            return strReturnPlatformName;
        }


        /// <summary>
        /// 获取WWW协议下载（AB包）路径
        /// </summary>
        /// <returns></returns>
        public static string GetWWWPath()
        {
            //返回路径字符串
            string strReturnWWWPath = string.Empty;

            switch (Application.platform)
            {
                //Windows 主平台
                case RuntimePlatform.WindowsPlayer:
                case RuntimePlatform.WindowsEditor:
                    strReturnWWWPath = "file://" + ABFilePath;
                    break;
                case RuntimePlatform.IPhonePlayer:
                    strReturnWWWPath = ABFilePath + "/Raw/";
                    break;
                //Android 平台
                case RuntimePlatform.Android:
                    strReturnWWWPath = "jar:file://" + ABFilePath;
                    break;
                default:
                    break;
            }

            return strReturnWWWPath;
        }

    }//Class_end
}
