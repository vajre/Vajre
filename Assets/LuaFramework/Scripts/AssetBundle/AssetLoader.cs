/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   框架主流程:
 *     		   第1层: AB资源加载类
 *     Description:
 *             功能:
 *             1: 管理与加载指定的AB的资源
 *             2: 加载具有“缓存功能”的资源，带选用参数
 *             3: 卸载,释放AB资源
 *             4: 查看当前的AB资源
 *
 *     Data: 2017
 *     Version: 0.1版本
 *     Modify Recoder:
 *
 *
 */

using System.Collections;
using UnityEditor;
using UnityEngine;

namespace LuaFramework
{
	public class AssetLoader : System.IDisposable
	{
        //当前Assetbundle
        private AssetBundle _CurrentAssetBundle;
        //缓存容器集合
        private Hashtable _Ht;

        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="abObj">给定www加载的AssetBundle实例</param>
        public AssetLoader(AssetBundle abObj)
        {
            if (abObj != null)
            {
                _CurrentAssetBundle = abObj;
                _Ht = new Hashtable();
            }
            else
            {
                Debug.Log(GetType() + "/ 构造函数 AssetBundle() / 参数 abObj == null!, 请检查");
            }
        }

        /// <summary>
        /// 加载当前包中指定的资源
        /// </summary>
        /// <param name="assetName">资源的名称</param>
        /// <param name="isCache">是否开启缓存</param>
        /// <returns></returns>
        public UnityEngine.Object LoadAsset(string assetName, bool isCache = false)
        {
            return LoadResource<UnityEngine.Object>(assetName, isCache);
        }

        /// <summary>
        /// 加载当前AB包的资源，带缓存
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="assetName">资源的名称</param>
        /// <param name="isCache">是否需要缓存处理</param>
        /// <returns></returns>
        private T LoadResource<T>(string assetName, bool isCache) where T : UnityEngine.Object
        {
            //是否缓存集合已经存在
            if (_Ht.Contains(assetName))
            {
                return _Ht[assetName] as T;
            }

            //正式加载
            T tmpTResource = null;
            
            //如果是DebugMode则 在editor中加载, (用于保存索引) 
            if (AppConst.DebugMode == true)
            {
                string[] abNames = _CurrentAssetBundle.GetAllAssetNames();
                foreach (string item_fullpath in abNames)
                {
                    string[] array = item_fullpath.Split('/');
                    if (array[array.Length - 1].Equals(assetName.ToLower()))
                    {
                        tmpTResource = AssetDatabase.LoadAssetAtPath(item_fullpath, typeof(T)) as T;
                        break;
                    }
                }
            }
            else
            {
                tmpTResource = _CurrentAssetBundle.LoadAsset<T>(assetName);
            }

            //加入缓存集合
            if (tmpTResource != null && isCache)
            {
                _Ht.Add(assetName, tmpTResource);
            }
            else if (tmpTResource == null)
            {
                Debug.LogError(GetType() + "/LoadResource<T>()/参数 tmpTResource == null, 请检查");
            }
            return tmpTResource;
        }

        /// <summary>
        /// 卸载指定的资源
        /// </summary>
        /// <param name="asset">资源名称</param>
        /// <returns></returns>
        public bool UnLoadAsset(UnityEngine.Object asset)
        {
            if (asset != null)
            {
                Resources.UnloadAsset(asset);
                return true;
            }

            Debug.LogError(GetType() + "/UnLoadAsset()/参数 asset==null，请检查!");
            return false;
        }

        /// <summary>
        /// 释放当前AssetBundle内存镜像资源
        /// </summary>
        public void Dispose()
        {
            _CurrentAssetBundle.Unload(false);
        }

        /// <summary>
        /// 释放当前AssetBundle内存镜像资源,且释放内存资源。
        /// </summary>
        public void DisposeAll()
        {
            _CurrentAssetBundle.Unload(true);
        }

        /// <summary>
        /// 查询当前AssetBundle中包含的所有资源名称。
        /// </summary>
        /// <returns></returns>
        public string[] RetriveAllAssetName()
        {
            return _CurrentAssetBundle.GetAllAssetNames();
        }

	}//Class_end
}
