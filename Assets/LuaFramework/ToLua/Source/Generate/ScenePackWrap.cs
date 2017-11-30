﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ScenePackWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(ScenePack), typeof(System.Object));
		L.RegFunction("New", _CreateScenePack);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("sceneName", get_sceneName, set_sceneName);
		L.RegVar("abNames", get_abNames, set_abNames);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateScenePack(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				ScenePack obj = new ScenePack();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: ScenePack.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_sceneName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			ScenePack obj = (ScenePack)o;
			string ret = obj.sceneName;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index sceneName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_abNames(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			ScenePack obj = (ScenePack)o;
			string[] ret = obj.abNames;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index abNames on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_sceneName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			ScenePack obj = (ScenePack)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.sceneName = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index sceneName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_abNames(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			ScenePack obj = (ScenePack)o;
			string[] arg0 = ToLua.CheckStringArray(L, 2);
			obj.abNames = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index abNames on a nil value");
		}
	}
}

