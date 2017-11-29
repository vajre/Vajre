using UnityEngine;
using LuaInterface;
using System.Collections.Generic;
using UnityEngine.UI;
using System.Text;

#if UNITY_EDITOR
using UnityEditor;
#endif

using UObject = UnityEngine.Object;

namespace LuaFramework
{
    public class LuaBehaviour : MonoBehaviour
    {
        public string luaPath;
        public string luaName;
        LuaTable mSelfTable;

        public List<Object> cache = new List<Object>();
        
        LuaFunction awake = null;
        LuaFunction start = null;
        LuaFunction on_enable = null;
        LuaFunction update = null;
        LuaFunction on_destroy = null;

        protected void Awake()
        {
            if (luaPath == "")
                Debug.LogError("### LuaBehaviour Error, Empty luaPath :" + name);

            if (luaName == "")
                Debug.LogError("### LuaBehaviour Error, Empty luaName :" + name);

            LuaManager luaMgr = AppFacade.Instance.GetManager<LuaManager>(ManagerName.Lua);
            object luaRet = luaMgr.DoFile<object>(luaPath);
            mSelfTable = luaRet as LuaTable;

            if (mSelfTable == null)
            {
                Debug.LogError("Lua must return a table " + luaPath);
            }
            awake = mSelfTable.GetLuaFunction("Awake");
            start = mSelfTable.GetLuaFunction("Start");
            on_enable = mSelfTable.GetLuaFunction("OnEnable");
            update = mSelfTable.GetLuaFunction("Update");
            on_destroy = mSelfTable.GetLuaFunction("OnDestroy");

            Util.CallLuaFunction(awake, mSelfTable, gameObject);

        }

        protected void Start()
        {
            Util.CallLuaFunction(start, mSelfTable);
        }

		protected void OnEnable()
        {
            Util.CallLuaFunction(on_enable, mSelfTable);
		}
			
        protected void Update()
        {
            Util.CallLuaFunction(update, mSelfTable);
        }

        protected void OnDestroy()
        {
            Util.CallLuaFunction(on_destroy, mSelfTable);
            Util.ClearMemory();
        }
   }
}


