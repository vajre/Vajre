using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class UIParticleScale : MonoBehaviour
{
	private ScaleData scale = null;
    
    void Awake()
    {
        ParticleSystem p = gameObject.GetComponent<ParticleSystem>();
        if (p != null)
        {
            scale = new ScaleData() { transform = p.transform, beginScale = p.transform.localScale };
        }
	}

	void Start ()
    {
        ApplyScale();
    }

    void ApplyScale()
    {
        float designWidth = 1280;
        float designHeight = 720;

        float designScale = designWidth / designHeight;
        float scaleRate = (float)Screen.width / (float)Screen.height;


        if (scale != null)
        {
            float scaleFactor = scaleRate / designScale;
            scale.transform.localScale = scale.beginScale * scaleFactor;
        }
    }

    
    void Update()
    {
        #if UNITY_EDITOR
        ApplyScale();
        #endif
    }

    class ScaleData
	{
		public Transform transform;
		public Vector3 beginScale = Vector3.one;
	}
}