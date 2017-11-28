using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using LuaInterface;
using UObject = UnityEngine.Object;
using System.Threading;
//using LuaFramework;

#if UNITY_EDITOR
using UnityEditor;
#endif

namespace LuaFramework
{

    public class ResourceManager : Manager
    {
        //场景集合
        private Dictionary<string, MultiABMgr> _DicAllScenes = new Dictionary<string, MultiABMgr>();

        //AssetBundle (清单文件) 系统类
        private AssetBundleManifest _ManifestObj = null;

        public void Initialize(Action initOK)
        {
            StartCoroutine(ABManifestLoader.GetInstance().LoadManifestFile(delegate (AssetBundleManifest ManifestObj) {
                _ManifestObj = ManifestObj;
                initOK();
            }));
        }
        
        [NoToLua]
        public void LoadABPack(string scenesName, string abName, Action loadCompleteHandle)
        {
            StartCoroutine(LoadAssetBundlePack(scenesName, abName, loadCompleteHandle));
        }

        public void LoadABPack(string scenesName, string abName, LuaFunction loadCompleteHandle)
        {
            LoadABPack(scenesName, abName, delegate ()
            {
                if (loadCompleteHandle != null)
                {
                    loadCompleteHandle.Call();
                    loadCompleteHandle.Dispose();
                }
            });
        }

        public bool IsABPackLoaded(string scenesName, string abName)
        {
            if (_DicAllScenes.ContainsKey(scenesName))
            {
                MultiABMgr tmpMultiMgrObj = _DicAllScenes[scenesName];
                return tmpMultiMgrObj.ISAssetBundlerLoaded(abName);
            }
            return false;
        }

        IEnumerator LoadAssetBundlePack(string scenesName, string abName, Action loadCompleteHandle)
        {
            //把当前场景加入集合中
            if (!_DicAllScenes.ContainsKey(scenesName))
            {
                MultiABMgr multiMgrObj = new MultiABMgr(scenesName, abName);
                _DicAllScenes.Add(scenesName, multiMgrObj);
            }

            //调用下一层("多包管理类")
            MultiABMgr tmpMultiMgrObj = _DicAllScenes[scenesName];

            //调用 "多包管理类" 的加载指定AB包。
            yield return tmpMultiMgrObj.LoadAssetBundler(abName, loadCompleteHandle);

        }//Method_end

        public UObject LoadAsset(string scenesName, string abName, string assetName, bool isCache)
        {
            if (_DicAllScenes.ContainsKey(scenesName))
            {
                MultiABMgr multObj = _DicAllScenes[scenesName];
                return multObj.LoadAsset(abName, assetName, isCache);
            }

            Debug.LogError(GetType() + "/LoadAsset()/找不到场景名称,无法加载(AB包中)资源,请检查! scenesName = " + scenesName);

            return null;
        }

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
