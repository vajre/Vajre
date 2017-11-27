using UnityEngine;
using System.Collections;
using LuaInterface;
using System;


[Serializable]
public class PlatformMsg
{
    public string FuncName;
}

public class CrossPlatformInterface
{
    private CrossPlatform mCrossPlatForm = null;
    private static CrossPlatformInterface instance = null;
    public static CrossPlatformInterface Instance
    {
        get
        {
            if (instance == null)
                instance = new CrossPlatformInterface();
            return instance;
        }
    }

    public CrossPlatformInterface()
    {
        switch (Application.platform)
        {
            case RuntimePlatform.Android:
                mCrossPlatForm = new AndroidCrossPlatform();
                break;
            case RuntimePlatform.IPhonePlayer:
                mCrossPlatForm = new IosCrossPlatform();
                break;
            default:
                mCrossPlatForm = new CrossPlatform();
                break;
        }
    }

    public string SendPlatformMsg(string msg)
    {
        return mCrossPlatForm.SendPlatformMsg(msg);
    }
}