/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   辅助类:
 *     		        读取AssetBundle 依赖关系文件。(Windows.Manifest)
 *     Description:
 *             功能:
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

namespace ABFW
{
    public class ABManifestLoader : System.IDisposable
    {
        //本类实例
        private static ABManifestLoader _Instance;
        //Assetbundle (清单文件) 系统类
        private AssetBundleManifest _ManifestObj;
        //Assetbundle 清单文件的路径
        private string _StrManifestPath;
        //读取AB 清单文件的AssetBundle
        private AssetBundle _ABReadManifest;
        //是否加载(Manifest)完成
        private bool _IsLoadFinish;
        /* 只读属性 */
        public bool IsLoadFinish
        {
            get { return _IsLoadFinish; }
        }


        //构造函数
        private ABManifestLoader()
        {
            //确定清单文件www下载路径
            _StrManifestPath = PathTools.GetWWWPath() + "/" + PathTools.GetPlatformName();

            _ManifestObj = null;
            _ABReadManifest = null;
            _IsLoadFinish = false;
        }

        /// <summary>
        /// 获取本类实例
        /// </summary>
        /// <returns></returns>
        public static ABManifestLoader GetInstance()
        {
            if (_Instance == null)
            {
                _Instance = new ABManifestLoader();
            }

            return _Instance;
        }

        //加载Manifest 清单文件
        public IEnumerator LoadManifestFile()
        {
            using (WWW www = new WWW(_StrManifestPath))
            {
                yield return www;
                if (www.progress >= 1)
                {
                    //加载完成，获取AssetBundle 实例
                    AssetBundle abObj = www.assetBundle;
                    if (abObj != null)
                    {
                        _ABReadManifest = abObj;
                        //读取清单文件资源。(读取到系统类的实例中)
                        _ManifestObj = _ABReadManifest.LoadAsset(ABDefine.ASSETBUNDLE_MANIFEST) as AssetBundleManifest;
                        //本次加载与读取清单文件完毕
                        _IsLoadFinish = true;
                    }
                    else
                    {
                        Debug.LogError(GetType() + "/LoadManifestFile/WWW下载出错，请检查! _StrManifestPath = " + _StrManifestPath + "  错误信息: " + www.error);
                    }
                }
            }
        }

        /// <summary>
        /// 获取AssetBundleManifest 系统类的实例
        /// </summary>
        /// <returns></returns>
        public AssetBundleManifest GetABManifest()
        {
            if (_IsLoadFinish)
            {
                if (_ManifestObj != null)
                {
                    return _ManifestObj;
                }
                else
                {
                    Debug.LogError(GetType() + "/GetABManifest/ _ManifestObj == null! 请检查");
                }
            }
            else
            {
                Debug.LogError(GetType() + "/GetABManifest/ _IsLoadFinish == false, Manifest没有加载完毕，请检查");
            }

            return null;
        }


        /// <summary>
        /// 获取AssetBundleManifest（系统类） 指定包名称依赖项
        /// </summary>
        /// <param name="abName">AB包名称</param>
        /// <returns></returns>
        public string[] RetrivalDependce(string abName)
        {
            if (_ManifestObj != null && !string.IsNullOrEmpty(abName))
            {
                return _ManifestObj.GetAllDependencies(abName);
            }
            return null;
        }

        /// <summary>
        /// 释放本类资源
        /// </summary>
        public void Dispose()
        {
            if (_ABReadManifest != null)
            {
                if (_ABReadManifest != null)
                {
                    _ABReadManifest.Unload(true);
                }
            }

            throw new System.NotImplementedException();
        }
    }//Class_end
}
