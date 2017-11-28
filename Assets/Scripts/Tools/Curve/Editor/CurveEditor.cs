using UnityEngine;
using UnityEditor;
using UObect = UnityEngine.Object;

[CustomEditor(typeof(Curve))]
[CanEditMultipleObjects]
public class CurveEditor : Editor
{
    SerializedProperty pointsProp;
    SerializedProperty smoothProp;
    SerializedProperty distanceProp;


    void OnEnable()
    {
        pointsProp = serializedObject.FindProperty("points");
        smoothProp = serializedObject.FindProperty("smooth");
        distanceProp = serializedObject.FindProperty("distance");
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        EditorGUILayout.IntSlider(smoothProp, 10, 20, new GUIContent("smooth"));

        distanceProp.floatValue = EditorGUILayout.FloatField("distance", distanceProp.floatValue);

        if (distanceProp.floatValue < 0.01f)
        {
            distanceProp.floatValue = 0.01f;
        }

        if (GUILayout.Button("Save"))
            Save();

        serializedObject.ApplyModifiedProperties();
    }

    void Save()
    {
        Curve c = target as Curve;
        if (PrefabUtility.GetPrefabType(c.gameObject) == PrefabType.PrefabInstance)
        {
            GameObject prefabObj = PrefabUtility.FindPrefabRoot(c.gameObject);
            UObect prefabParent = PrefabUtility.GetPrefabParent(prefabObj);
            PrefabUtility.ReplacePrefab(prefabObj, prefabParent, ReplacePrefabOptions.ConnectToPrefab);
        }
    }


}//Class_end
