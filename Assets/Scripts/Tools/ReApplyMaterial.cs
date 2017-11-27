using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReApplyMaterial : MonoBehaviour {

	[SerializeField]
	Renderer render;

	[SerializeField]
	Material mat;

	// Use this for initialization
	void Start () {
		render.material = mat;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
