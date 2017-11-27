using UnityEngine;
using UnityEditor;
using LuaFramework;

[CustomEditor(typeof(LuaBehaviour))]
public class LuaBehaviourEditor : Editor
{
    public override void OnInspectorGUI()
    {
        LuaBehaviour luab = (LuaBehaviour)target;
        luab.luaPath = EditorGUILayout.TextField("LuaPath", luab.luaPath);

        if (luab.luaPath != null && luab.luaPath != "")
        {
            string[] strs = luab.luaPath.Split('/');
            luab.luaName = strs[strs.Length - 1];
        }

        
        serializedObject.Update();
        SerializedProperty tps = serializedObject.FindProperty("cache");
        EditorGUI.BeginChangeCheck();
        EditorGUILayout.PropertyField(tps, true);
        
        if (EditorGUI.EndChangeCheck())
            serializedObject.ApplyModifiedProperties();
    }
}
