/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   框架主流程(第4层): 所有“场景” 的AssetBundle管理
 *     Description:
 *             功能:
 *                1: 提取 "Menifest 清单文件", 缓存本脚本。
 *                2: 以"场景"为单位, 管理整个项目中所有的AssetBundle 包。
 *
 *     Data: 2017
 *     Version: 0.1版本
 *     Modify Recoder:
 *
 *
 */


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace LuaFramework
{
	public class AssetBundleMgr : MonoBehaviour
	{
        //本类实例
        private static AssetBundleMgr _Instance;

        //场景集合
        private Dictionary<string, MultiABMgr> _DicAllScenes = new Dictionary<string, MultiABMgr>();

        //AssetBundle (清单文件) 系统类
        private AssetBundleManifest _ManifestObj = null;

        private AssetBundleMgr() {}

        //得到本类实例
        public static AssetBundleMgr GetInstance()
        {
            if (_Instance == null)
            {
                _Instance = new GameObject("_AssetBundleMgr").AddComponent<AssetBundleMgr>();
            }
            return _Instance;
        }

        
        /// <summary>
        /// 下载AssetBundle 指定包
        /// </summary>
        /// <param name="scenesName">场景名称</param>
        /// <param name="abName">AssetBundle 包名称</param>
        /// <param name="loadCompleteHandle">委托: 调用是否完成</param>
        /// <returns></returns>
        public IEnumerator LoadAssetBundlePack(string scenesName, string abName, Action loadCompleteHandle)
        {
            //参数检查
            if (string.IsNullOrEmpty(scenesName) || string.IsNullOrEmpty(abName))
            {
                Debug.LogError(GetType() + "/LoadAssetBundlePack()/ScenesName Or abName is null !， 请检查");
                yield return null;
            }

            //等待Manifest清单文件加载完成
            while (!ABManifestLoader.GetInstance().IsLoadFinish)
            {
                yield return null;
            }
            _ManifestObj = ABManifestLoader.GetInstance().GetABManifest();

            if (_ManifestObj == null)
            {
                Debug.LogError(GetType() + "/LoadAssetBundlePack()/_ManifestObj is null !， 请检查");
                yield return null;
            }

            //把当前场景加入集合中
            if (!_DicAllScenes.ContainsKey(scenesName))
            {
                MultiABMgr multiMgrObj = new MultiABMgr(scenesName, abName);
                _DicAllScenes.Add(scenesName, multiMgrObj);

            }

            //调用下一层("多包管理类")
            MultiABMgr tmpMultiMgrObj = _DicAllScenes[scenesName];
            if (tmpMultiMgrObj == null)
            {
                Debug.LogError(GetType() + "/LoadAssetBundlePack()/tmpMultiMgrObj is null !， 请检查");
            }

            //调用 "多包管理类" 的加载指定AB包。
            yield return tmpMultiMgrObj.LoadAssetBundler(abName, loadCompleteHandle);

        }//Method_end

        /// <summary>
        /// 加载（AB包中）资源
        /// </summary>
        /// <param name="scenesName">场景名称</param>
        /// <param name="abName">AssetBundle包名称</param>
        /// <param name="assetName">资源名称</param>
        /// <param name="isCache">是否使用（资源）缓存</param>
        /// <returns></returns>
        public UnityEngine.Object LoadAsset(string scenesName, string abName, string assetName, bool isCache)
        {
            if (_DicAllScenes.ContainsKey(scenesName))
            {
                MultiABMgr multObj = _DicAllScenes[scenesName];
                return multObj.LoadAsset(abName, assetName, isCache);
            }

            Debug.LogError(GetType() + "/LoadAsset()/找不到场景名称,无法加载(AB包中)资源,请检查! scenesName = " + scenesName);
            
            return null;
        }


        /// <summary>
        /// 释放资源。
        /// </summary>
        /// <param name="scenesName">场景名称</param>
        public void DisposeAllAsset(string scenesName)
        {
            if (_DicAllScenes.ContainsKey(scenesName))
            {
                MultiABMgr multObj = _DicAllScenes[scenesName];
                multObj.DisposeAllAsset();
            }
            else
            {
                Debug.LogError(GetType() + "/DisposeAllAsset()/找不到场景名称，无法释放资源,请检查! scenesName = " + scenesName);
            }
        }

    }//Class_end
}
