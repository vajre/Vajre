using UnityEngine;
using HedgehogTeam.EasyTouch;

public class EasyTouchSetting : MonoBehaviour
{
    void Start()
    {
        EasyTouch.instance.enableUIMode = false;
        EasyTouch.instance.autoUpdatePickedObject = true;
        EasyTouch.Set3DPickableLayer(LayerMask.GetMask("Object"));
    }
}
