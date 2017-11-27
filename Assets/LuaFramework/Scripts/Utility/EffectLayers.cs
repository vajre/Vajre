using UnityEngine;
using System.Collections;

public class EffectLayers : MonoBehaviour {

	// Use this for initialization
    public int LayerOrder = 20000;
	void Start () {
        Renderer renderer = gameObject.GetComponent<Renderer>();
        if (renderer != null && renderer.sharedMaterial != null)
        {
            renderer.sortingLayerName = "ParsLayer";
            renderer.sortingOrder = LayerOrder;
        }
    }
	
	// Update is called once per frame
	void Update () {
        
    }
}
