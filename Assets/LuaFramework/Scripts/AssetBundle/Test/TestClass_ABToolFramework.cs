///***
// *
// *     Title: "AssetBundle" 框架项目
// *     		   主题:  框架内部验证测试 
// *     Description:
// *             功能:
// *                   框架整体验证测试脚本
// *     Data: 2017
// *     Version: 0.1版本
// *     Modify Recoder:
// *
// *
// */


//using System.Collections;
//using System.Collections.Generic;
//using UnityEngine;

//namespace LuaFramework
//{
//    public class TestClass_ABToolFramework : MonoBehaviour
//    {
//        //场景名称
//        private string _ScenesName = "scene_3";

//        //AB包名称
//        private string _AssetBundleName = "scene_3/prefabs.ab";

//        //资源名称
//        private string _AssetName = "_Eviroments.prefab";

//        long msce;

        

//        void Start()
//        {
//            Debug.Log("开始 ABFW 框架测试");


//            StartCoroutine(ABManifestLoader.GetInstance().LoadManifestFile(delegate() {

//                msce = System.DateTime.Now.Ticks;
//                StartCoroutine(AssetBundleMgr.GetInstance().LoadAssetBundlePack("scene_3", "scene_3/prefabs.ab", (string abName) =>
//                {
//                    Debug.LogError(abName);
//                    LoadAllABComplete(abName);
//                }));
//            }));
            
//        }


//        //回调函数:所有的AB包都已经加载完毕了
//        private void LoadAllABComplete(string abName)
//        {
//            double hm = (System.DateTime.Now.Ticks - msce) / 100000.0;
//            Debug.LogError("所有的AB包都已经加载完毕了" + hm);
//            UnityEngine.Object tmpObj = null;
//            //提取资源

//            msce = System.DateTime.Now.Ticks;
//            tmpObj = AssetBundleMgr.GetInstance().LoadAsset(_ScenesName, _AssetBundleName, _AssetName, false) as UnityEngine.Object;

//            hm = (System.DateTime.Now.Ticks - msce) / 100000.0;

//            Debug.LogError("提取资源" + hm);
//            if (tmpObj != null)
//            {

//                for (int i = 0; i < 2; i++)
//                {
//                    msce = System.DateTime.Now.Ticks;
//                    GameObject obj = Instantiate(tmpObj) as GameObject;
//                    hm = (System.DateTime.Now.Ticks - msce) / 100000.0;
//                    Debug.LogError("物体实例化:" + hm);

//                    msce = System.DateTime.Now.Ticks;
//                    GameObject obj2 = Instantiate(obj);
//                    hm = (System.DateTime.Now.Ticks - msce) / 100000.0;
//                    Debug.LogError("物体实例化2:" + hm);

//                    //hm = (System.DateTime.Now.Ticks - msce) / 100000.0;
//                    //Debug.LogError("物体实例化" + hm);
//                }

//            }

//        }

//        //测试销毁资源
//        void Update()
//        {
//            if (Input.GetKeyDown(KeyCode.A))
//            {
//                Debug.Log(GetType() + "测试销毁资源");
//                AssetBundleMgr.GetInstance().DisposeAllAsset(_ScenesName);
//            }
//        }

//    }//Class_end
//}
