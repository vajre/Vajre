﻿/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   主题:  框架内部验证测试
 *     Description:
 *             功能:  专门验证 "SingABLoader" 类
 *
 *     Data: 2017
 *     Version: 0.1版本
 *     Modify Recoder:
 *
 *
 */


using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace LuaFramework
{
	public class TestClass_SingABLoader : MonoBehaviour
	{
        //引用类
        private SingleABLoader _LoadObj = null;

        /* 依赖AB包名称 */
        private string _ABDependName1 = "scene_1/textures.ab"; //贴图AB包
        private string _ABDependName2 = "scene_1/materials.ab";//材质AB包

        //AB包名称
        private string _ABName1 = "scene_1/prefabs.ab";

        //AB包中资源名称
        private string _AssetName1 = "TestCubePrefab.prefab";


        #region 简单（无依赖包）预设的加载
        //private void Start()
        //{
        //    _LoadObj = new SingleABLoader(_ABName1, LoadComplete);
        //    //加载AB包
        //    StartCoroutine(_LoadObj.LoadAssetBundle());
        //}


        //private void LoadComplete(string abName)
        //{
        //    //加载AB包中的资源
        //    UnityEngine.Object tmpObj = _LoadObj.LoadAsset(_AssetName1, false);
        //    Instantiate(tmpObj);
        //}

        //private void Update()
        //{

        //}

        #endregion

        private void Start()
        {
            SingleABLoader _LoadDependObj = new SingleABLoader(_ABDependName1, LoadDependComplete1);
            //加载AB依赖包
            StartCoroutine(_LoadDependObj.LoadAssetBundle());
        }

        //依赖回调函数1
        private void LoadDependComplete1(string abName)
        {
            Debug.Log("依赖包1(贴图宝)加载完毕，加载依赖包2(材质包)");

            SingleABLoader _LoadDependObj2 = new SingleABLoader(_ABDependName2, LoadDependComplete2);
            //加载AB依赖包
            StartCoroutine(_LoadDependObj2.LoadAssetBundle());
        }

        //依赖回调函数2
        private void LoadDependComplete2(string abName)
        {
            Debug.Log("依赖包2(材质包)加载完毕，开始正式加载预设包");
            _LoadObj = new SingleABLoader(_ABName1, LoadComplete);
            StartCoroutine(_LoadObj.LoadAssetBundle());
        }


        private void LoadComplete(string abName)
        {
            //加载AB包中的资源
            UnityEngine.Object tmpObj = _LoadObj.LoadAsset(_AssetName1, false);
            Instantiate(tmpObj);

            /* 查询包中的资源 */
            string[] strArray = _LoadObj.RetrivalAllAssetName();

            foreach (string str in strArray)
            {
                Debug.Log(str);
            }
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.A))
            {
                Debug.Log("释放资源");
                //_LoadObj.Dispose();//释放镜像内存资源
                _LoadObj.DisposeAll(); //释放镜像内存资源与内存资源
            }
        }

    }//Class_end
}
