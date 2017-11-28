using UnityEngine;
using LuaInterface;
using System.Collections.Generic;
using UnityEngine.UI;
using System.Text;

#if UNITY_EDITOR
using UnityEditor;
#endif

using UObect = UnityEngine.Object;

namespace LuaFramework
{
    public class LuaBehaviour : MonoBehaviour
    {
        public string luaPath;
        public string luaName;
        LuaTable mSelfTable;

        [SerializeField]
        string assetPath;

        public List<Object> cache = new List<Object>();
        Dictionary<string, Component> components = new Dictionary<string, Component>();
        
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

#if UNITY_EDITOR
            //ResourceManager resMgr = AppFacade.Instance.GetManager<ResourceManager>(ManagerName.Resource);
            //string prefabPath = resMgr.GetRealAssetPath(luaName);
            //prefabPath = "Assets/Builds/Prefabs/" + prefabPath.Remove(prefabPath.Length - 8) + ".prefab";
            //WidgetReference w = GetComponent<WidgetReference>();
            //if (w != null)
            //    w.SetAssetPath(prefabPath);

            //Debug.Log(PrefabUtility.GetPrefabType(gameObject));

            //GameObject prefabObj = PrefabUtility.FindPrefabRoot(gameObject);
            //Debug.LogError(prefabObj);
            //UObect prefabParent = PrefabUtility.GetPrefabParent(prefabObj);
#endif

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

        //-------------------------------------------------------------Find
        public Component Find(string path, string compName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(path);
            sb.Append("_");
            sb.Append(compName);

            string key = sb.ToString();



            if (components[key] != null)
            {
                return components[key];
            }

            
            return null;
        }

    }
}