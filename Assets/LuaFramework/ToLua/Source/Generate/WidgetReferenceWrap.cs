﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class WidgetReferenceWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(WidgetReference), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("SetAssetPath", SetAssetPath);
		L.RegFunction("Find", Find);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetAssetPath(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			WidgetReference obj = (WidgetReference)ToLua.CheckObject<WidgetReference>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			obj.SetAssetPath(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Find(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				WidgetReference obj = (WidgetReference)ToLua.CheckObject<WidgetReference>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				UnityEngine.GameObject o = obj.Find(arg0);
				ToLua.PushSealed(L, o);
				return 1;
			}
			else if (count == 3 && TypeChecker.CheckTypes<int>(L, 3))
			{
				WidgetReference obj = (WidgetReference)ToLua.CheckObject<WidgetReference>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				int arg1 = (int)LuaDLL.lua_tonumber(L, 3);
				UnityEngine.GameObject o = obj.Find(arg0, arg1);
				ToLua.PushSealed(L, o);
				return 1;
			}
			else if (count == 3 && TypeChecker.CheckTypes<string>(L, 3))
			{
				WidgetReference obj = (WidgetReference)ToLua.CheckObject<WidgetReference>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				string arg1 = ToLua.ToString(L, 3);
				UnityEngine.Component o = obj.Find(arg0, arg1);
				ToLua.Push(L, o);
				return 1;
			}
			else if (count == 4)
			{
				WidgetReference obj = (WidgetReference)ToLua.CheckObject<WidgetReference>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				string arg2 = ToLua.CheckString(L, 4);
				UnityEngine.Component o = obj.Find(arg0, arg1, arg2);
				ToLua.Push(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: WidgetReference.Find");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

