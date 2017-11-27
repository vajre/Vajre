/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   主题:  框架内部验证测试 
 *     Description:
 *             功能:
 *                   框架整体验证测试脚本
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
    public class TestClass_ABToolFramework : MonoBehaviour
    {
        //场景名称
        private string _ScenesName = "scene_3";

        //AB包名称
        private string _AssetBundleName = "scene_3/prefabs.ab";

        //资源名称
        private string _AssetName = "_Eviroments.prefab";

        long msce;

        void Start()
        {
            msce = System.DateTime.Now.Ticks;

            Debug.Log("开始 ABFW 框架测试");
            //调用AB包(连锁智能调用AB包[集合])
            StartCoroutine(AssetBundleMgr.GetInstance().LoadAssetBundlePack(_ScenesName, _AssetBundleName, LoadAllABComplete));


        }


        //回调函数:所有的AB包都已经加载完毕了
        private void LoadAllABComplete(string abName)
        {

            Debug.Log("所有的AB包都已经加载完毕了");

            UnityEngine.Object tmpObj = null;

            //提取资源
            tmpObj = AssetBundleMgr.GetInstance().LoadAsset(_ScenesName, _AssetBundleName, _AssetName, false) as UnityEngine.Object;

            if (tmpObj != null)
            {
                Instantiate(tmpObj);

                double hm = (System.DateTime.Now.Ticks - msce) / 100000.0;
                Debug.LogError(hm);
            }

        }

        //测试销毁资源
        void Update()
        {
            if (Input.GetKeyDown(KeyCode.A))
            {
                Debug.Log(GetType() + "测试销毁资源");
                AssetBundleMgr.GetInstance().DisposeAllAsset(_ScenesName);
            }
        }

    }//Class_end
}
