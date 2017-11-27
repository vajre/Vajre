using UnityEngine.EventSystems;
using System.Collections;
using UnityEngine;

public class OnButtonPressed : MonoBehaviour, IPointerDownHandler, IPointerUpHandler, IPointerExitHandler, IPointerEnterHandler
{
    public delegate void PointerEvent();
    public event PointerEvent EventOnPointerDown;
    public event PointerEvent EventOnPointerUp;
    public event PointerEvent EventOnPointerExit;
    public event PointerEvent EventOnPointerEnter;

    public void OnPointerDown(PointerEventData eventData)
    {
        if (EventOnPointerDown != null)
        {
            EventOnPointerDown();
        }
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        if (EventOnPointerUp != null)
        {
            EventOnPointerUp();
        }
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        if (EventOnPointerExit != null)
        {
            EventOnPointerExit();
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (EventOnPointerEnter != null)
        {
            EventOnPointerEnter();
        }
    }
}