using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UObject = UnityEngine.Object;

namespace LuaFramework
{
    public class AssetBundleInfo
    {
        public AssetBundle m_AssetBundle;
        public int m_ReferenceCount;

        public AssetBundleInfo(AssetBundle assetBundle)
        {
            m_AssetBundle = assetBundle;
            m_ReferenceCount = 1;
        }
    }
    
	public class MultiABMgr 
	{
        Dictionary<string, AssetBundleInfo> m_LoadedAssetBundles;
        string m_BaseDownloadingURL = string.Empty;
        List<string> m_LoadingList = new List<string>();
        

        //（下层）引用类: "单个AB包加载实现类"
        private SingleABLoader _CurrentSingleABLoader;

        //当前AssetBundle 名称
        private string _CurrentABName;

        //AB包与对应依赖关系集合
        private Dictionary<string, ABRelation> _DicABRelation;

        //委托: 所有AB包加载完成
        private Action<string> _LoadAllABPackageCompleteHandel;
        
        public MultiABMgr(string scenesName, string abName)
        {
            m_BaseDownloadingURL = PathTools.GetWWWPath() + "/";
            _CurrentABName = abName;
            m_LoadedAssetBundles = new Dictionary<string, AssetBundleInfo>();
            _DicABRelation = new Dictionary<string, ABRelation>();
        }

        public void UnLoadAssetBundle(string abName, bool unloadAllLoadedObjects = false)
        {
            m_LoadedAssetBundles[abName].m_ReferenceCount--;
            if (m_LoadedAssetBundles[abName].m_ReferenceCount <= 0)
            {
                m_LoadedAssetBundles[abName].m_AssetBundle.Unload(unloadAllLoadedObjects);
                m_LoadedAssetBundles.Remove(abName);
            }
        }

        public IEnumerator LoadAssetBundle(string abName)
        {
            if (IsAssetBundlerLoaded(abName))
            {
                m_LoadedAssetBundles[abName].m_ReferenceCount++;
            }
            else
            {
                if (m_LoadingList.Contains(abName))
                {
                    while(m_LoadingList.Contains(abName))
                        yield return new WaitForEndOfFrame();
                }
                else
                {
                    m_LoadingList.Add(abName);
                    using (WWW www = new WWW(m_BaseDownloadingURL + abName))
                    {
                        //yield return www;
                        while (!www.isDone)
                        {
                            Debug.LogError(abName + ":" + www.progress);
                            yield return new WaitForEndOfFrame();
                        }

                        AssetBundle abObj = null;
                        abObj = www.assetBundle;
                        if (abObj != null)
                            m_LoadedAssetBundles.Add(abName, new AssetBundleInfo(abObj));

                        //if (www.progress >= 1)
                        //{

                        //}
                    }
                    m_LoadingList.Remove(abName);
                }
            }
        }


        public UObject LoadAsset(string abName, string assetName)
        {
            return m_LoadedAssetBundles[abName].m_AssetBundle.LoadAsset<UObject>(assetName);
        }


        /// <summary>
        /// 完成指定AB包调用
        /// </summary>
        /// <param name="abName">AB包名称</param>
        private void CompleteLoadAB(string abName)
        {
            if (abName.Equals(_CurrentABName))
            {
                if (_LoadAllABPackageCompleteHandel != null)
                {
                    _LoadAllABPackageCompleteHandel(abName);
                }
            }
        }

        public bool IsAssetBundlerLoaded(string abName)
        {
            return m_LoadedAssetBundles.ContainsKey(abName);
        }

        /// <summary>
        /// 加载AB包
        /// </summary>
        /// <param name="abName">AssetBundle 名称</param>
        /// <returns></returns>
        public IEnumerator LoadAssetBundler(string abName, Action loadCompleteHandle = null)
        {
            //AB包关系的建立
            if (!_DicABRelation.ContainsKey(abName))
            {
                ABRelation abRelationObj = new ABRelation(abName);

                _DicABRelation.Add(abName, abRelationObj);
            }

            ABRelation tmpABRelationObj = _DicABRelation[abName];
            string[] strDepedenceArray = ABManifestLoader.GetInstance().RetrivalDependce(abName);
            
            //得到指定AB包所有的依赖关系(查询Manifest清单文件)
            foreach (string item_Depence in strDepedenceArray)
            {
                //添加“依赖”项
                tmpABRelationObj.AddDependence(item_Depence);

                //添加"引用"项 (递归调用)
                yield return LoadReference(item_Depence, abName);
            }

            //真正加载AB包
            if (m_LoadedAssetBundles.ContainsKey(abName))
            {
                Debug.LogError("这个包已经被加载过了: " + abName);
                //yield return m_LoadedAssetBundles[abName].LoadAssetBundle(loadCompleteHandle);
            }
            else
            {
                _CurrentSingleABLoader = new SingleABLoader(abName);
                //m_LoadedAssetBundles.Add(abName, _CurrentSingleABLoader);
                yield return _CurrentSingleABLoader.LoadAssetBundle(loadCompleteHandle);
            }
        }//Method_end


        /// <summary>
        /// 加载引用AB包
        /// </summary>
        /// <param name="abName">AB包名称</param>
        /// <param name="refABName">被引用AB包名称</param>
        /// <returns></returns>
        private IEnumerator LoadReference(string abName, string refABName)
        {
            //AB包已经加载
            if (_DicABRelation.ContainsKey(abName))
            {
                ABRelation tmpABRelationObj = _DicABRelation[abName];

                //添加AB包引用关系（被依赖）
                tmpABRelationObj.AddReference(refABName);
            }
            else
            {
                ABRelation tmpABRelationObj = new ABRelation(abName);
                tmpABRelationObj.AddReference(refABName);
                _DicABRelation.Add(abName, tmpABRelationObj);

                //开始加载依赖的包(这是一个递归调用)
                yield return LoadAssetBundler(abName);
            }
        }

        //释放本场景所有的资源
        public void DisposeAllAsset()
        {
            try
            {
                //foreach (singleabloader item_sabloader in m_loadedassetbundles.values)
                //{
                //    item_sabloader.disposeall();
                //}
            }
            finally
            {
                m_LoadedAssetBundles.Clear();
                m_LoadedAssetBundles = null;

                //释放其他对象占用资源
                _DicABRelation.Clear();
                _DicABRelation = null;

                _CurrentABName = null;
                _LoadAllABPackageCompleteHandel = null;

                //卸载没有使用到的资源
                Resources.UnloadUnusedAssets();
                //强制垃圾收集
                System.GC.Collect();
            }
        }

	}//Class_end
}
