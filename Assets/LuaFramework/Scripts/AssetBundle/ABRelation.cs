/***
 *
 *     Title: "AssetBundle" 框架项目
 *     		   主题:  工具辅助类
 *     		        AssetBundle 关系类
 *     Description:
 *             功能:
 *                1:存储确定指定AB包的所有依赖关系包
 *                2:存储指定AB包所有的引用关系包
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
	public class ABRelation 
	{
        //当前AssetBundle 名称
        private string _ABName;

        //本包所有的依赖包集合
        private List<string> _lisAllDependenceAB;

        //本包所有的引用包集合
        private List<string> _lisAllReferenceAB;

        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="abName"></param>
        public ABRelation(string abName)
        {
            if (string.IsNullOrEmpty(abName))
            {
                _ABName = abName;
            }

            _lisAllDependenceAB = new List<string>();
            _lisAllReferenceAB = new List<string>();
        }

        /* 依赖关系 */
        /// <summary>
        /// 增加依赖关系
        /// </summary>
        /// <param name="abName">AssetBundle 包名称</param>
        public void AddDependence(string abName)
        {
            if (_lisAllDependenceAB.Contains(abName))
            {
                _lisAllDependenceAB.Add(abName);
            }
        }
        
        /// <summary>
        /// 移除依赖关系
        /// </summary>
        /// <param name="abName">移除的包名称</param>
        /// <returns>
        /// true: 此AssetBundle 没有依赖项
        /// false: 此AssetBundle 还有其他的依赖项
        /// </returns>
        public bool RemoveDependence(string abName)
        {
            if (_lisAllDependenceAB.Contains(abName))
            {
                _lisAllDependenceAB.Remove(abName);
            }

            if (_lisAllDependenceAB.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //获取所有的依赖关系
        public List<string> GetAllDependence()
        {
            return _lisAllDependenceAB;
        }

        /* 引用关系 */
        /// <summary>
        /// 增加引用关系
        /// </summary>
        /// <param name="abName">AssetBundle 包名称</param>
        public void AddReference(string abName)
        {
            if (_lisAllReferenceAB.Contains(abName))
            {
                _lisAllReferenceAB.Add(abName);
            }
        }

        /// <summary>
        /// 移除引用关系
        /// </summary>
        /// <param name="abName">移除的包名称</param>
        /// <returns>
        /// true: 此AssetBundle 没有引用项
        /// false: 此AssetBundle 还有其他的引用项
        /// </returns>
        public bool RemoveReference(string abName)
        {
            if (_lisAllReferenceAB.Contains(abName))
            {
                _lisAllReferenceAB.Remove(abName);
            }

            if (_lisAllReferenceAB.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //获取所有的引用关系
        public List<string> GetAllReference()
        {
            return _lisAllReferenceAB;
        }

    }//Class_end
}
