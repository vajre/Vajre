using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using LuaInterface;
using UObject = UnityEngine.Object;
//using LuaFramework;

#if UNITY_EDITOR
using UnityEditor;
#endif

namespace LuaFramework
{
    public class ResourceManager : Manager
    {
		public void Initialize(bool isLocal, string manifestName, Action initOK)
		{
            StartCoroutine(LuaFramework.ABManifestLoader.GetInstance().LoadManifestFile(initOK));

            //LoadingManager.ActiveQueueUpdate ();
            //if (isLocal)
            //	m_BaseDownloadingURL = "file://" + Util.LocalPath;
            //else 
            //	m_BaseDownloadingURL = "file://" + Util.DataPath;

            //LoadingManager.LoadAsset<AssetBundleManifest>(manifestName, new string[] { "AssetBundleManifest" }, delegate(UObject[] objs) {
            //	if (objs.Length > 0) {
            //		m_AssetBundleManifest = objs[0] as AssetBundleManifest;
            //		m_AllManifest = m_AssetBundleManifest.GetAllAssetBundles();
            //	}
            //	if (initOK != null) initOK();
            //});
        }

    }//Class_end
}
