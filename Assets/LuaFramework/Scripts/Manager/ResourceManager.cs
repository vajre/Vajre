using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using LuaInterface;
using UObject = UnityEngine.Object;

#if UNITY_EDITOR
using UnityEditor;
#endif

public class AssetBundleInfo {
    public AssetBundle m_AssetBundle;
    public int m_ReferencedCount;

    public AssetBundleInfo(AssetBundle assetBundle) {
        m_AssetBundle = assetBundle;
        m_ReferencedCount = 0;
    }
}

namespace LuaFramework {
    public class ResourceManager : Manager {
        
        string m_BaseDownloadingURL = "";
        string[] m_AllManifest = null;
        AssetBundleManifest m_AssetBundleManifest = null;
        Dictionary<string, AssetBundleInfo> m_LoadedAssetBundles = new Dictionary<string, AssetBundleInfo>();
        Dictionary<string, List<LoadAssetRequest>> m_LoadRequests = new Dictionary<string, List<LoadAssetRequest>>();


        class LoadAssetRequest {
            public Type assetType;
            public string[] assetNames;
            public LuaFunction luaFunc;
            public Action<UObject[]> sharpFunc;
        }
			
		public void Initialize(bool isLocal, string manifestName, Action initOK)
		{
			LoadingManager.ActiveQueueUpdate ();
			if (isLocal)
				m_BaseDownloadingURL = "file://" + Util.LocalPath;
			else 
				m_BaseDownloadingURL = "file://" + Util.DataPath;
			
			LoadingManager.LoadAsset<AssetBundleManifest>(manifestName, new string[] { "AssetBundleManifest" }, delegate(UObject[] objs) {
				if (objs.Length > 0) {
					m_AssetBundleManifest = objs[0] as AssetBundleManifest;
					m_AllManifest = m_AssetBundleManifest.GetAllAssetBundles();
				}
				if (initOK != null) initOK();
			});
		}

        [NoToLuaAttribute]
		public string GetRealAssetPath(string abName)
		{
            if (abName.Equals(AppConst.AssetDir))
                return abName;
			
            abName = abName.ToLower();

            if (!abName.EndsWith(AppConst.ExtName))
                abName += AppConst.ExtName;
			
            if (abName.Contains("/"))
                return abName;
            //string[] paths = m_AssetBundleManifest.GetAllAssetBundles();  产生GC，需要缓存结果
            for (int i = 0; i < m_AllManifest.Length; i++)
			{
                int index = m_AllManifest[i].LastIndexOf('/');  
                string path = m_AllManifest[i].Remove(0, index + 1);    //字符串操作函数都会产生GC
                if (path.Equals(abName))
				{
                    return m_AllManifest[i];
                }
            }
            Debug.LogError("GetRealAssetPath Error:>>" + abName);
            return null;
        }
	
		List<string> abNameList = new List<string> ();
		List<object> resultAll = new List<object>();
		int current;//当前进度
		int total;  //总进度

		public IEnumerator LoadCtrAsset(string[] panels = null, LuaFunction onLoading = null, LuaFunction loadOver = null)
		{
			abNameList.Clear ();
			current = 0;
			total = 0;

			GameObject parent = GameObject.FindWithTag("GuiCamera");


            if (AppConst.DebugMode == true)
            {
#if UNITY_EDITOR
                List<string> panelList = new List<string>();
                resultAll.Clear();
                foreach (string item in panels)
                {
                    if (parent.transform.Find(item) != null)
                    {
                        Debug.LogError("LoadCtrRes:" + item + " has already existed");
                        continue;
                    }
                    string abName = GetRealAssetPath(item);
                    GameObject go = AssetDatabase.LoadAssetAtPath("Assets/Builds/Prefabs/" + abName.Remove(abName.Length - 8) + ".prefab", typeof(GameObject)) as GameObject;
                    resultAll.Add(go);
                }

                if (onLoading != null)
                {
                    onLoading.Dispose();
                }

                if (loadOver != null)
                {
                    loadOver.Call((object)(resultAll.ToArray()));
                    loadOver.Dispose();
                }
#endif
            }
            else
            {

                List<string> panelList = new List<string>();
                if (panels != null)
                {
                    foreach (string item in panels)
                    {
                        if (parent.transform.Find(item) != null)
                        {
                            UnityEngine.Debug.LogError("LoadCtrRes:" + item + " has already existed");
                            continue;
                        }
                        panelList.Add(item);
                        string abName = GetRealAssetPath(item);
                        string[] assetNames = new string[] { item };

                        LoadAssetRequest request = new LoadAssetRequest();
                        request.assetNames = assetNames;

                        List<LoadAssetRequest> requests = null;
                        if (!m_LoadRequests.TryGetValue(abName, out requests))
                        {
                            requests = new List<LoadAssetRequest>();
                            requests.Add(request);
                            m_LoadRequests.Add(abName, requests);
                        }
                        else
                        {
                            requests.Add(request);
                        }
                        yield return StartCoroutine(CollectAsset(abName));
                    }
                }

                total += abNameList.Count + panelList.Count;
                yield return StartCoroutine(LoadAssetbundle(onLoading));

                resultAll.Clear();


                foreach (KeyValuePair<string, List<LoadAssetRequest>> kvp in m_LoadRequests)
                {
                    string abName = kvp.Key;
                    AssetBundleInfo bundleInfo = GetLoadedAssetBundle(abName);

                    foreach (LoadAssetRequest item in kvp.Value)
                    {
                        foreach (string assetPath in item.assetNames)
                        {
                            AssetBundle ab = bundleInfo.m_AssetBundle;

                            AssetBundleRequest request = ab.LoadAssetAsync(assetPath, typeof(GameObject));
                            yield return request;
                            resultAll.Add(request.asset);

                            current++;
                            if (onLoading != null)
                            {
                                onLoading.Call(current, total);
                            }
                        }
                    }
                }

                m_LoadRequests.Clear();

                if (onLoading != null)
                {
                    onLoading.Dispose();
                }

                if (loadOver != null)
                {
                    loadOver.Call((object)(resultAll.ToArray()));
                    loadOver.Dispose();
                }
            }
		}


		IEnumerator LoadAssetbundle(LuaFunction onLoading = null)
		{
			onLoading.Call(current, total);
			foreach (string abName in abNameList)
			{
				AssetBundleInfo bundleInfo = null;
				if (m_LoadedAssetBundles.TryGetValue (abName, out bundleInfo))
                {
					bundleInfo.m_ReferencedCount++;
				}
                else
                {
					string url = m_BaseDownloadingURL + abName;
					WWW	download = WWW.LoadFromCacheOrDownload(url, m_AssetBundleManifest.GetAssetBundleHash(abName), 0);
					yield return download;

					AssetBundle assetObj = download.assetBundle;
					if (assetObj != null)
                    {
						AssetBundleInfo info = new AssetBundleInfo (assetObj);
						m_LoadedAssetBundles.Add (abName, info);
					}
				}

				current++;
				if (onLoading != null)
                {
					onLoading.Call(current, total);
				}
			}
		}

		//收集当前包所有的依赖
		IEnumerator CollectAsset(string abName)
        {
			string[] dependencies = m_AssetBundleManifest.GetAllDependencies(abName);
			if (dependencies.Length > 0)
            {
				for (int i = 0; i < dependencies.Length; i++)
                {
					string depName = dependencies[i];
					AssetBundleInfo bundleInfo = null;
					if (m_LoadedAssetBundles.TryGetValue(depName, out bundleInfo))
                    {
						bundleInfo.m_ReferencedCount++;
					}
                    else
                    {
						yield return StartCoroutine(CollectAsset(depName));
					}
				}
			}
			abNameList.Add (abName);
		}

				
		//-------------------------------------------------------------------------------------
        /// <summary>
        /// 载入素材
        /// </summary>
		public IEnumerator LoadAssetInCoroutine(Type assetType, string abName, string[] assetNames, Action<UObject[]> action = null)
		{
            if (AppConst.DebugMode == true
#if UNITY_EDITOR
                && abName != "StreamingAssets"
#endif
               )
            {
#if UNITY_EDITOR

                List<UObject> result = new List<UObject>();
                if (abName.Length > 5 && abName.Substring(abName.Length - 5) == "Panel")
                {
                    abName = GetRealAssetPath(abName);
                    GameObject go = AssetDatabase.LoadAssetAtPath("Assets/Builds/Prefabs/" + abName.Remove(abName.Length - 8) + ".prefab", typeof(GameObject)) as GameObject;
                    result.Add(go);
                }
                else
                {
                    abName = GetRealAssetPath(abName);
                    foreach (var item in assetNames)
                    {
                        GameObject go = AssetDatabase.LoadAssetAtPath("Assets/Builds/" + abName.Remove(abName.Length - 8) + "/" + item + ".prefab", typeof(GameObject)) as GameObject;
                        result.Add(go);
                    }
                }


                if (action != null)
                {
                    action(result.ToArray());
                }
#endif
            }
            else
            {
                abName = GetRealAssetPath(abName);
                AssetBundleInfo bundleInfo = GetLoadedAssetBundle(abName);
                if (bundleInfo == null)
                {
                    yield return StartCoroutine(OnLoadAssetBundle(abName, assetType));

                    bundleInfo = GetLoadedAssetBundle(abName);
                    if (bundleInfo == null)
                    {
                        Debug.LogError("OnLoadAsset--->>>" + abName);
                        yield break;
                    }
                }

                List<UObject> result = new List<UObject>();
                AssetBundle ab = bundleInfo.m_AssetBundle;

                for (int j = 0; j < assetNames.Length; j++)
                {
                    string assetPath = assetNames[j];
                    AssetBundleRequest request = ab.LoadAssetAsync(assetPath);
                    yield return request;
                    result.Add(request.asset);
                }

                if (action != null)
                {
                    action(result.ToArray());
                }

                bundleInfo.m_ReferencedCount++;
            }
        }
			
		IEnumerator OnLoadAsset(string abName, Type assetType)
		{
            AssetBundleInfo bundleInfo = GetLoadedAssetBundle(abName);
            if (bundleInfo == null)
			{
				yield return StartCoroutine(OnLoadAssetBundle(abName, assetType));

                bundleInfo = GetLoadedAssetBundle(abName);
                if (bundleInfo == null)
				{
                    Debug.LogError("OnLoadAsset--->>>" + abName);
                    yield break;
                }
            }
            List<LoadAssetRequest> list = null;
            if (!m_LoadRequests.TryGetValue(abName, out list))
			{
                m_LoadRequests.Remove(abName);
                yield break;
            }

            for (int i = 0; i < list.Count; i++)
			{
                string[] assetNames = list[i].assetNames;
                List<UObject> result = new List<UObject>();

                AssetBundle ab = bundleInfo.m_AssetBundle;
                for (int j = 0; j < assetNames.Length; j++)
				{
                    string assetPath = assetNames[j];
                    AssetBundleRequest request = ab.LoadAssetAsync(assetPath, list[i].assetType);
                    yield return request;
                    result.Add(request.asset);
                }
                if (list[i].sharpFunc != null)
				{
                    list[i].sharpFunc(result.ToArray());
                    list[i].sharpFunc = null;
                }
                if (list[i].luaFunc != null)
				{
                    list[i].luaFunc.Call((object)result.ToArray());
                    list[i].luaFunc.Dispose();
                    list[i].luaFunc = null;
                }
                bundleInfo.m_ReferencedCount++;
            }
        }

        IEnumerator OnLoadAssetBundle(string abName, Type type) {
            string url = m_BaseDownloadingURL + abName;

            WWW download = null;
			if (type == typeof(AssetBundleManifest))
			{
				download = new WWW (url);
			}
			else
			{
                string[] dependencies = m_AssetBundleManifest.GetAllDependencies(abName);
                if (dependencies.Length > 0) {
                    for (int i = 0; i < dependencies.Length; i++) {
                        string depName = dependencies[i];
                        AssetBundleInfo bundleInfo = null;
                        if (m_LoadedAssetBundles.TryGetValue(depName, out bundleInfo)) {
                            bundleInfo.m_ReferencedCount++;
                        } else if (!m_LoadRequests.ContainsKey(depName)) {
                            yield return StartCoroutine(OnLoadAssetBundle(depName, type));
                        }
                    }
                }
                download = WWW.LoadFromCacheOrDownload(url, m_AssetBundleManifest.GetAssetBundleHash(abName), 0);
            }
            yield return download;

            AssetBundle assetObj = download.assetBundle;
            if (assetObj != null) {
                m_LoadedAssetBundles.Add(abName, new AssetBundleInfo(assetObj));
            }
        }

        AssetBundleInfo GetLoadedAssetBundle(string abName) {
            AssetBundleInfo bundle = null;
            m_LoadedAssetBundles.TryGetValue(abName, out bundle);
            return bundle;
        }

        /// <summary>
        /// 此函数交给外部卸载专用，自己调整是否需要彻底清除AB
        /// </summary>
        /// <param name="abName"></param>
        /// <param name="isThorough"></param>

		public void UnloadAssetBundle(string abName)
		{
			abName = GetRealAssetPath (abName);
			//Debug.Log (m_LoadedAssetBundles.Count + " assetbundle(s) in memory before unloading " + abName);
			UnloadAssetBundleInternal (abName);
			UnloadDependencies (abName);
			//Debug.Log (m_LoadedAssetBundles.Count + " assetbundle(s) in memory after unloading " + abName);
		}

        void UnloadDependencies(string abName, bool isThorough = false)
		{
			string[] dependencies = m_AssetBundleManifest.GetAllDependencies(abName);

			foreach (var dependency in dependencies) {
                UnloadAssetBundleInternal(dependency, isThorough);
            }
        }

        void UnloadAssetBundleInternal(string abName, bool isThorough = false) {
            AssetBundleInfo bundle = GetLoadedAssetBundle(abName);
            if (bundle == null) return;

            if (--bundle.m_ReferencedCount <= 0) {
                bundle.m_AssetBundle.Unload(isThorough);
                m_LoadedAssetBundles.Remove(abName);
				//Debug.Log(abName + " has been unloaded successfully");
            }
        }
    }
}
