using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using LuaInterface;
using UObject = UnityEngine.Object;

namespace LuaFramework
{
    public class ResourceManager : Manager
    {
        //场景集合
        private Dictionary<string, MultiABMgr> m_DicAllScenes = new Dictionary<string, MultiABMgr>();

        //AssetBundle (清单文件) 系统类
        private AssetBundleManifest m_Manifest = null;

        public void Initialize(Action initOK)
        {
            StartCoroutine(ABManifestLoader.GetInstance().LoadManifestFile(delegate (AssetBundleManifest ManifestObj) {
                m_Manifest = ManifestObj;
                initOK();
            }));
        }

        public void LoadScenePack(ScenePack[] pack, LuaFunction onLoading, LuaFunction onCompleted)
        {
            //for (int i = 0; i < pack.Length; i++)
            //{
            //}

            Debug.LogError(pack[0].abNames[0]);
            string[] strDepedenceArray = m_Manifest.GetAllDependencies(pack[0].abNames[0]);
            for (int i = 0; i < strDepedenceArray.Length; i++)
            {
                Debug.LogError(strDepedenceArray[i] + " ");
            }
            
            onLoading.Call(0.5f);
            onCompleted.Call();

            onLoading.Dispose();
            onCompleted.Dispose();
        }
        
        public void UnLoadABPack(string abName, bool unloadAllLoadedObjects = false)
        {
            if (!IsABPackLoaded(abName))
                return;

            List<string> dep = new List<string>();
            dep.Add(abName);
            RetrivalDependencies(abName, dep);

            for (int i = 0; i < dep.Count; i++)
            {
                string[] pack = abName.Split('/');
                string sceneName = pack[0];
                m_DicAllScenes[sceneName].UnLoadAssetBundle(dep[i], unloadAllLoadedObjects);
            }
        }

        //----------------------------------------------------------------加载一个AB包流程
        public void LoadABPack(string abName, LuaFunction onLoadCompleted)
        {
            LoadABPack(abName, delegate ()
            {
                if (onLoadCompleted != null)
                {
                    onLoadCompleted.Call();
                    onLoadCompleted.Dispose();
                }
            });
        }

        [NoToLua] //C#使用
        public void LoadABPack(string abName, Action onLoadCompleted)
        {
            StartCoroutine(OnLoadABPack(abName, onLoadCompleted));
        }

        IEnumerator OnLoadABPack(string abName, Action onLoadCompleted)
        {
            if (IsABPackLoaded(abName))
                yield break;

            List<string> dep = new List<string>();
            dep.Add(abName);
            RetrivalDependencies(abName, dep);

            for (int i = 0; i < dep.Count; i++)
                yield return LoadAssetBundlePack(dep[i]);

            onLoadCompleted();
        }

        void RetrivalDependencies(string abName, List<string> dep)
        {
            string[] strDepedencies = m_Manifest.GetAllDependencies(abName);

            for (int i = 0; i < strDepedencies.Length; i++)
            {
                if (dep.Contains(strDepedencies[i]) == false)
                {
                    dep.Add(strDepedencies[i]);
                    RetrivalDependencies(strDepedencies[i], dep);
                }
            }
        }
        
        public bool IsABPackLoaded(string abName)
        {
            string[] pack = abName.Split('/');
            string sceneName = pack[0];

            if (m_DicAllScenes.ContainsKey(sceneName))
            {
                MultiABMgr tmpMultiMgrObj = m_DicAllScenes[sceneName];
                return tmpMultiMgrObj.IsAssetBundlerLoaded(abName);
            }
            return false;
        }
        
        IEnumerator LoadAssetBundlePack(string abName)
        {
            string[] pack = abName.Split('/');
            string sceneName = pack[0];

            if (!m_DicAllScenes.ContainsKey(sceneName))
            {
                MultiABMgr multiMgrObj = new MultiABMgr(sceneName, abName);
                m_DicAllScenes.Add(sceneName, multiMgrObj);
            }

            yield return m_DicAllScenes[sceneName].LoadAssetBundle(abName);
        }

        //---------------------------------------------------------------------------
        public UObject LoadAsset(string abName, string assetName)
        {
            string[] pack = abName.Split('/');
            string sceneName = pack[0];
            return m_DicAllScenes[sceneName].LoadAsset(abName, assetName);
        }

        public void DisposeAllAsset(string scenesName)
        {
            if (m_DicAllScenes.ContainsKey(scenesName))
            {
                MultiABMgr multObj = m_DicAllScenes[scenesName];
                multObj.DisposeAllAsset();
            }
            else
            {
                Debug.LogError(GetType() + "/DisposeAllAsset()/找不到场景名称，无法释放资源,请检查! scenesName = " + scenesName);
            }
        }
    }//Class_end
}

public class ScenePack
{
    public string sceneName;
    public string[] abNames;
}
