using System;
using UnityEngine;

public class AndroidCrossPlatform : CrossPlatform
{
    private static AndroidJavaObject mUnitedPlatform = null;
    private static AndroidJavaObject UnitedPlatform
    {
        get
        {
            if (mUnitedPlatform == null)
            {
                try
                {
                    AndroidJavaClass jc = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
                    AndroidJavaObject jo = jc.GetStatic<AndroidJavaObject>("currentActivity");
                    mUnitedPlatform = jo;
                }
                catch (Exception e)
                {
                    mUnitedPlatform = null;
                    Debug.LogError(e);
                }
            }
            return mUnitedPlatform;
        }
    }

    public override string SendPlatformMsg(string msg)
    {
        return UnitedPlatform.Call<string>("OnPlatformMsg", msg);
    }
}