using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.UI;

public class ScrollLocationHelper : MonoBehaviour {

	[SerializeField]
	RectTransform r;

	public void ScrollTo(int pos, float time) {
		DOTween.To(() => r.anchoredPosition, x => r.anchoredPosition = x, new Vector2(0, pos), time);
	}
}
