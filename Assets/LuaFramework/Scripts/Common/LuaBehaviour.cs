using UnityEngine;
using LuaInterface;
using System.Collections.Generic;

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
            object luaRet = luaMgr.Require<object>(luaPath);
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
            Util.CallLuaFunction(start, name);
        }

		protected void OnEnable()
        {
            Util.CallLuaFunction(on_enable, name);
		}
			
        protected void Update()
        {
            Util.CallLuaFunction(update, name);
        }

        protected void OnDestroy()
        {
            Util.CallLuaFunction(on_destroy, name);
            Util.ClearMemory();
        }
   }
}


