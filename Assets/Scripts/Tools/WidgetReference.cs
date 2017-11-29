using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using LuaInterface;

#if UNITY_EDITOR
using UnityEditor;
#endif

using UObject = UnityEngine.Object;

public class WidgetReference : MonoBehaviour
{
    [SerializeField]
    List<Path2Comp> components = new List<Path2Comp>();

    [SerializeField]
    string assetPath;


    //-------------------------------------------------------------Find
    public UObject Find(string path, string compName = null)
    {
        string key = string.Empty;
        if (!string.IsNullOrEmpty(compName))
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(path);
            sb.Append("_");
            sb.Append(compName);
            key = sb.ToString();
        }
        else
        {
            key = path;
        }

        UObject obj = GetComp(key);
        if (obj != null)
        {
            return obj;
        }

        if (string.IsNullOrEmpty(compName))
            obj = transform.Find(path).gameObject;
        else
            obj = transform.Find(path).gameObject.GetComponent(compName);

#if UNITY_EDITOR
        Save(key, obj);
#endif
        return obj;
    }

    private void Save(string key, UObject value)
    {
        components.Add(new Path2Comp(key, value));
        PrefabUtility.CreatePrefab(assetPath, gameObject, ReplacePrefabOptions.ConnectToPrefab);
    }

    private UObject GetComp(string key)
    {
        for (int i = 0; i < components.Count; i++)
        {
            if (components[i].path.Equals(key))
            {
                if (components[i].comp == null)
                {
                    components.RemoveAt(i);
                    return null;
                }
                else
                {
                    return components[i].comp;
                }
            }
        }
        return null;
    }

    [NoToLua]
    public void ClearComponents()
    {
        components.Clear();
    }
}

[System.Serializable]
public class Path2Comp
{
    public Path2Comp(string p, UObject c)
    {
        path = p;
        comp = c;
    }
    public string path;
    public UObject comp;
}
