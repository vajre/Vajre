using UnityEngine;
using System.Collections;
using LuaInterface;
using System;
using UObject = UnityEngine.Object;

namespace LuaFramework
{
	public class LoadingManager : Manager
    {
        Queue queue = new Queue();
        IEnumerator QueueUpdate()
        {
			while (true)
            {
				yield return new WaitForEndOfFrame();

				if (queue.Count > 0)
                {
					QueueItem item = (QueueItem)queue.Dequeue ();

					switch (item.funcType)
                    {
					case FuncType.LoadAsset:
						yield return ResManager.LoadAssetInCoroutine(item.assetType, item.abName, item.assetNames, item.action);
                        break;
					case FuncType.LoadCtrRes:
						yield return ResManager.LoadCtrAsset(item.panelList, item.onLoading, item.loadOver);
						break;
					case FuncType.UnloadAssetBundles:
						foreach (string abName in item.abNames)
							ResManager.UnloadAssetBundle(abName);
						break;
					default:
						break;
					}
				}
			}
		}

       
		bool isQueueUpdateActive;
		[NoToLuaAttribute]
		public void ActiveQueueUpdate()
        {
			if (isQueueUpdateActive) return;
			isQueueUpdateActive = true;
			StartCoroutine (QueueUpdate());
		}

        public void Load(string abName, string[] assetNames, LuaFunction func, bool isPrefab)
        {
            if (isPrefab == false && AppConst.DebugMode == true)
            {
                return;
            }

            LoadAsset<UObject>(abName, assetNames, delegate (UObject[] objs)
            {
                if (func != null)
                {
                    func.Call((object)objs);
                    func.Dispose();
                }
            });
        }

		[NoToLuaAttribute]
		public void CSLoadPanel(string panelName, Action<UObject[]> action = null)
		{
			string assetName = panelName;
			string abName = assetName.ToLower() + AppConst.ExtName;
			LoadAsset<GameObject> (abName, new string[] {assetName}, action);
		}


		[NoToLuaAttribute]
		public void LoadAsset<T>(string abName, string[] assetNames, Action<UObject[]> action = null) where T : UObject
        {
			QueueItem item = new QueueItem ();
			item.funcType = FuncType.LoadAsset;
			item.assetType = typeof(T);
			item.abName = abName;
			item.assetNames = assetNames;
			item.action = action;
			queue.Enqueue(item);
		}

		public void LoadCtrRes(string[] panelList = null, LuaFunction onLoading = null, LuaFunction loadOver = null)
        {
			QueueItem item = new QueueItem ();
            item.funcType = FuncType.LoadCtrRes;
			item.panelList = panelList;
			item.onLoading = onLoading;
			item.loadOver = loadOver;
			queue.Enqueue(item);
		}
        			
		public void UnloadAssetBundles(string[] abNames)
        {
			QueueItem item = new QueueItem ();
			item.funcType = FuncType.UnloadAssetBundles;
			item.abNames = abNames;
			queue.Enqueue(item);
		}
	}
}

enum FuncType
{
	LoadCtrRes,
	LoadAsset,
	UnloadAssetBundles,
}

struct QueueItem
{
	public FuncType funcType;
	public Type assetType;
	public string abName;
	public string[] assetNames;
	public Action<UObject[]> action;
	public string[] panelList;
	public LuaFunction onLoading;
	public LuaFunction loadOver;
	public string[] abNames;
}