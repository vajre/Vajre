using UnityEngine;
using UnityEditor;
using LuaFramework;
using UObect = UnityEngine.Object;

[CustomEditor(typeof(WidgetReference))]
public class WidgetReferenceEditor : Editor
{
    SerializedProperty assetPathProp;
    SerializedProperty componentsProp;

    void OnEnable()
    {
        assetPathProp = serializedObject.FindProperty("assetPath");
        componentsProp = serializedObject.FindProperty("components");
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        EditorGUILayout.TextField("AssetPath", assetPathProp.stringValue);
        EditorGUILayout.PropertyField(componentsProp, true);

        if (GUILayout.Button("Clear Components"))
        {
            Clear();
        }

        if (GUILayout.Button("Apply (Auto Set Asset Path)"))
            Apply();


        serializedObject.ApplyModifiedProperties();
    }

    void Clear()
    {
        WidgetReference w = (WidgetReference)target;
        w.ClearComponents();
        Apply();
    }

    void Apply()
    {
        WidgetReference w = (WidgetReference)target;
        if (PrefabUtility.GetPrefabType(w.gameObject) == PrefabType.PrefabInstance)
        {
            GameObject prefabObj = PrefabUtility.FindPrefabRoot(w.gameObject);
            UObect prefabParent = PrefabUtility.GetPrefabParent(prefabObj);
            string path = AssetDatabase.GetAssetPath(prefabParent);
            assetPathProp.stringValue = path;
            EditorGUILayout.TextField("AssetPath", assetPathProp.stringValue);
            PrefabUtility.ReplacePrefab(prefabObj, prefabParent, ReplacePrefabOptions.ConnectToPrefab);
        }
    }

}//Class_end
