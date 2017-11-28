using UnityEngine;
using LuaInterface;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEditor;
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

        private Dictionary<GameObject, LuaFunction> buttons = new Dictionary<GameObject, LuaFunction>();
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

            Debug.Log(PrefabUtility.GetPrefabType(gameObject));

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

        //-----------------------------------------------------------------
        protected void OnDestroy()
        {
            ClearClick();
            Util.CallLuaFunction(on_destroy, mSelfTable);
            Util.ClearMemory();
        }

		public void AddSliderListener(Slider slider, LuaFunction luafunc)
        {
			if (slider == null || luafunc == null) return;
			slider.onValueChanged.AddListener ((float value) => 
            {
				luafunc.Call(slider, value);
			});
		}

		public void AddClick(GameObject go, LuaFunction luafunc)
        {
            if (go == null || luafunc == null) return;
			buttons.Add(go, luafunc);
            go.GetComponent<Button>().onClick.AddListener(
                delegate()
                {
                    luafunc.Call(mSelfTable, go);
                }
            );
        }

        public void RemoveClick(GameObject go)
        {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (buttons.TryGetValue(go, out luafunc))
            {
				luafunc.Dispose();
                luafunc = null;
                buttons.Remove(go);
            }
        }

        public void ClearClick()
        {
            foreach (var de in buttons)
            {
                if (de.Value != null)
                    de.Value.Dispose();
            }
            buttons.Clear();
        }
    }
}