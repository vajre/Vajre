using UnityEngine;
using System.Collections;
using System.Text.RegularExpressions;
using LuaFramework;

public class NativePlatformMessageManager : Manager
{
	bool update = false;

	public bool UpdateMode
	{ 
		get {
			return update;
		}
	}
		
	bool active = false;
	public bool Active
	{ 
		get {
			return active;
		}
	}

	void OnPlatformMessage(string msg)
	{	
		Util.CallMethod("LuaNativePlatform", "OnPlatformMessage", msg);
	}

	void OnPlatformConfig(string msg)
	{
		Debug.Log (msg);
	}

	public void PlatformOnlineConfigAppReview(string msg)
	{
		active = true;
		if (msg == "Off")
		{
			update = true;
		}
		else
		{
			update = false;
		}
	}
}