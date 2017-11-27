﻿using UnityEngine;
using System.Collections.Generic;
using System.Reflection;
using LuaInterface;
using System;

namespace LuaFramework {
    public static class LuaHelper {

        /// <summary>
        /// getType
        /// </summary>
        /// <param name="classname"></param>
        /// <returns></returns>
        public static System.Type GetType(string classname) 
		{
            Assembly assb = Assembly.GetExecutingAssembly();  //.GetExecutingAssembly();
            System.Type t = null;
            t = assb.GetType(classname); ;
            if (t == null)
			{
                t = assb.GetType(classname);
            }
            return t;
        }

        public static GameManager GetGameManager()
        {
            return AppFacade.Instance.GetManager<GameManager>(ManagerName.Game);
        }


		/// <summary>
		/// 对象池管理器
		/// </summary>
		public static ObjectPoolManager GetObjectPoolManager()
		{
			return AppFacade.Instance.GetManager<ObjectPoolManager> (ManagerName.ObjectPool);
		}

		/// <summary>
		/// 资源加载管理器
		/// </summary>
		public static LoadingManager GetLoadingManager()
		{
			return AppFacade.Instance.GetManager<LoadingManager>(ManagerName.Loading); 
		}

        /// <summary>
        /// 资源管理器
        /// </summary>
        public static ResourceManager GetResManager()
		{
            return AppFacade.Instance.GetManager<ResourceManager>(ManagerName.Resource);
        }


        /// <summary>
        /// 音乐管理器
        /// </summary>
        public static SoundManager GetSoundManager()
		{
            return AppFacade.Instance.GetManager<SoundManager>(ManagerName.Sound);
        }


        /// <summary>
        /// pbc/pblua函数回调
        /// </summary>
        /// <param name="func"></param>
        public static void OnCallLuaFunc(LuaByteBuffer data, LuaFunction func)
		{
            if (func != null) func.Call(data);
            Debug.LogWarning("OnCallLuaFunc length:>>" + data.buffer.Length);
        }

        /// <summary>
        /// cjson函数回调
        /// </summary>
        /// <param name="data"></param>
        /// <param name="func"></param>
        public static void OnJsonCallFunc(string data, LuaFunction func) 
		{
            Debug.LogWarning("OnJsonCallback data:>>" + data + " lenght:>>" + data.Length);
            if (func != null) func.Call(data);
        }
    }
}