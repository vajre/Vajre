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

    void OnEnable()
    {
        luaPathProp   = serializedObject.FindProperty("luaPath");
        luaNameProp   = serializedObject.FindProperty("luaName");
        cacheProp     = serializedObject.FindProperty("cache");
    }

    public override void OnInspectorGUI()
    {
        LuaBehaviour luab = (LuaBehaviour)target;
        serializedObject.Update();
        
        luaPathProp.stringValue = EditorGUILayout.TextField("LuaPath", luaPathProp.stringValue);

        if (!string.IsNullOrEmpty(luaPathProp.stringValue))
        {
            string[] strs = luaPathProp.stringValue.Split('/');
            luaNameProp.stringValue = strs[strs.Length - 1];
        }
        EditorGUILayout.LabelField("LuaName", luaNameProp.stringValue);
        EditorGUILayout.PropertyField(cacheProp, true);
        
        serializedObject.ApplyModifiedProperties();
    }
}
