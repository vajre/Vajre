using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using LuaInterface;

#if UNITY_EDITOR
using UnityEditor;
#endif

public class WidgetReference : MonoBehaviour {
    
    


    [NoToLuaAttribute, SerializeField]
	List<Path2Component> cache = new List<Path2Component>();

    [NoToLuaAttribute]
	public string AssetPath = null;

    public void SetAssetPath(string _assetPath)
    {
#if UNITY_EDITOR
        if (AssetPath != _assetPath)
        {
            AssetPath = _assetPath;
            GameObject obj = AssetDatabase.LoadMainAssetAtPath(AssetPath) as GameObject;

            if (obj != null && obj != this)
            {
                AssetDatabase.OpenAsset(obj);
                AssetDatabase.StartAssetEditing();
                WidgetReference w = obj.GetComponent<WidgetReference>();
                if (w != null)
                {
                    w.AssetPath = AssetPath;
                }

                AssetDatabase.StopAssetEditing();
                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }
        }
#endif
    }



	private Transform _trans = null;
	protected Transform Trans {
		get {
			if (_trans==null) 
				_trans = this.transform;
			return _trans;
		}
	}

	public Component Find(string path, string compName) {
		return Find(path, 0, compName);
	}

	public Component Find(string path, int index, string compName) {
		Component comp = GetComponentInCache(path, index, compName);
		if(comp == null) {
			comp = TransformFind(path, index, compName);
		}
		return comp;
	}

	public GameObject Find(string path) {
		Component t = Find(path, "Transform");
		if(t != null) {
			return t.gameObject;
		}
		return null;
	}

	public GameObject Find(string path, int index) {
		Component t = Find(path, index, "Transform");
		if(t != null) {
			return t.gameObject;
		}
		return null;
	}

	private string Key(string path, int index, string compName, int cindex = 0) {
		StringBuilder sb = new StringBuilder();
		sb.Append(path);
		if(index > 0) {
			sb.Append("_");
			sb.Append(index.ToString());
		}
		sb.Append("_");
		sb.Append(compName);
		if(cindex > 0) {
			sb.Append("_");
			sb.Append(cindex.ToString());
		}
		return sb.ToString();
	}

	private GameObject FindGameObjectIndex(Transform t, string objName, int index) {
		if(index <= 0) {
			Transform tc = t.Find(objName);
			if(tc != null) {
				return tc.gameObject;
			}
			return null;
		}
		int same = 0;
		objName = objName.ToLower();
		GameObject tem = null;
		for (int j = 1; j <= t.childCount; j++) {
			tem = t.GetChild (j-1).gameObject;
			if (tem.name.ToLower().Equals (objName)&&(++same == index)) {
				break;
			} else {
				tem = null;
			}
		}
		return tem;
	}

	private Component FindComponentIndex(Transform t, string objName, int index, string compName, int cindex) {
		GameObject obj = FindGameObjectIndex(t, objName, index);
		if(obj != null) {
			Component c = null;
			if(cindex <= 0) {
				c = obj.GetComponent(compName);
				return c;
			}
			Component[] comps = obj.GetComponents (typeof(Component));
			int len = comps.Length;
			
			string[] str = null;
			string type = null;
			int same = 0;
			for(int i = 0; i < len; i++) {
				c = comps[i];
				str = (c.GetType().ToString ()).Split ('.');
				type = str[str.Length - 1];
				if(type.ToLower().Equals(compName.ToLower()) && (++same>=index)) {
					break;
				} else {
					c = null;
				}
			}
			return c;
		}
		return null;
	}
	
	private Component GetComponentInCache(string path, string compName) {
		return GetComponentInCache(path, 0, compName);
	}
	
	private Component GetComponentInCache(string path, int index, string compName, int cindex = 0) {
		int len = cache.Count;
		if(len > 0) {
			Path2Component pc = null;
			string key = Key(path,index,compName, cindex);
			
			for(int i=0; i<len; i++) {
				pc = cache[i];
				if(pc.path.Equals(key)) {
					if(pc.comp==null) {
						cache.RemoveAt(i);
						pc = null;
					}
					break;
				}
				pc = null;
			}
			
			if(pc != null) {
				return pc.comp;
			}
		}
		return null;
	}

	protected Component TransformFind(string path, int index, string compName, int cindex = 0, bool save = true) {
		Component comp = null;
		
		if (index <= 0) {
			comp = FindComponentIndex(Trans, path, index, compName, cindex);
		} else {
			Transform t = null;
			string[] sArray=path.Split(new char[1] {'/'}); 
			int len = sArray.Length;
			string objName = sArray[len-1];
			string parentpath = "";
			if (len > 1) {
				for(int i = 0; i < len - 1; i++) {
					parentpath = parentpath + sArray[i] + "/";
				}
				if(path.Length > 0) {
					parentpath = parentpath.Substring(0, parentpath.Length - 1);
				}
				t = Trans.Find(parentpath);
			} else {
				t = Trans;
			}
			
			comp = FindComponentIndex(t, objName, index, compName, cindex);
		}
		if (comp != null) {
			cache.Add(new Path2Component(Key(path, index, compName, cindex), comp));
			if (save)
				Save(path, index, compName, cindex);			
		}
		return comp;
	}

	private void Save(string path, int index, string compName, int cindex = 0) {	
		#if UNITY_EDITOR
		if(AssetPath == null)
			return;
		
		GameObject obj =  AssetDatabase.LoadMainAssetAtPath(AssetPath) as GameObject;//"Assets/Builds/MainLoad/Prefabs/Surface_MainLoad.prefab") as GameObject;
		
		if (obj != null && obj != this) {
			AssetDatabase.OpenAsset(obj);
			AssetDatabase.StartAssetEditing();
			WidgetReference w = obj.GetComponent<WidgetReference>();
			if (w == null) {
				w = obj.AddComponent<WidgetReference>();
			}
			w.DoFind(path, index, compName, cindex);
			AssetDatabase.StopAssetEditing();
			AssetDatabase.SaveAssets();
			AssetDatabase.Refresh();
		}
		#endif
	}

	[NoToLuaAttribute]
	void DoFind(string path, int index, string compName, int cindex = 0){
		Component comp = GetComponentInCache(path, index, compName,cindex);
		if(comp == null) {
			comp = TransformFind(path, index, compName,cindex,false);
		}
	}
}

[System.Serializable]
public class Path2Component {
	public Path2Component(string p, Component c){
		this.path = p;
		this.comp = c;
	}
	public string path;
	public Component comp;
}
