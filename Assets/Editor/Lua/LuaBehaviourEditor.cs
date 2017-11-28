using UnityEngine;
using UnityEditor;
using LuaFramework;
using UObect = UnityEngine.Object;

[CustomEditor(typeof(LuaBehaviour))]
public class LuaBehaviourEditor : Editor
{
    SerializedProperty luaPathProp;
    SerializedProperty luaNameProp;
    SerializedProperty cacheProp;
    SerializedProperty assetPathProp;


    void OnEnable()
    {
        luaPathProp   = serializedObject.FindProperty("luaPath");
        luaNameProp   = serializedObject.FindProperty("luaName");
        cacheProp     = serializedObject.FindProperty("cache");
        assetPathProp = serializedObject.FindProperty("assetPath");
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        luaPathProp.stringValue = EditorGUILayout.TextField("LuaPath", luaPathProp.stringValue);

        if (!string.IsNullOrEmpty(luaPathProp.stringValue))
        {
            string[] strs = luaPathProp.stringValue.Split('/');
            luaNameProp.stringValue = strs[strs.Length - 1];
        }
        EditorGUILayout.LabelField("LuaName", luaNameProp.stringValue);


        EditorGUILayout.TextField("AssetPath", assetPathProp.stringValue);

        SerializedProperty tps = serializedObject.FindProperty("cache");
        EditorGUI.BeginChangeCheck();
        EditorGUILayout.PropertyField(tps, true);


        if (GUILayout.Button("Apply (Auto Set Asset Path)"))
            Apply();

        serializedObject.ApplyModifiedProperties();
    }

    void Apply()
    {
        LuaBehaviour luab = (LuaBehaviour)target;
        if (PrefabUtility.GetPrefabType(luab.gameObject) == PrefabType.PrefabInstance)
        {
            GameObject prefabObj = PrefabUtility.FindPrefabRoot(luab.gameObject);
            UObect prefabParent = PrefabUtility.GetPrefabParent(prefabObj);
            string path = AssetDatabase.GetAssetPath(prefabParent);
            assetPathProp.stringValue = path;
            EditorGUILayout.TextField("AssetPath", assetPathProp.stringValue);
            PrefabUtility.ReplacePrefab(prefabObj, prefabParent, ReplacePrefabOptions.ConnectToPrefab);
        }
    }
}
