﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_ObjectPoolManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaFramework.ObjectPoolManager), typeof(Manager));
		L.RegFunction("RemovePool", RemovePool);
		L.RegFunction("CreatePool", CreatePool);
		L.RegFunction("PoolExist", PoolExist);
		L.RegFunction("GetPool", GetPool);
		L.RegFunction("Get", Get);
		L.RegFunction("Release", Release);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemovePool(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.ObjectPoolManager obj = (LuaFramework.ObjectPoolManager)ToLua.CheckObject<LuaFramework.ObjectPoolManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			obj.RemovePool(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CreatePool(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 5);
			LuaFramework.ObjectPoolManager obj = (LuaFramework.ObjectPoolManager)ToLua.CheckObject<LuaFramework.ObjectPoolManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
			int arg2 = (int)LuaDLL.luaL_checknumber(L, 4);
			UnityEngine.GameObject arg3 = (UnityEngine.GameObject)ToLua.CheckObject(L, 5, typeof(UnityEngine.GameObject));
			LuaFramework.GameObjectPool o = obj.CreatePool(arg0, arg1, arg2, arg3);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PoolExist(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.ObjectPoolManager obj = (LuaFramework.ObjectPoolManager)ToLua.CheckObject<LuaFramework.ObjectPoolManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			bool o = obj.PoolExist(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetPool(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.ObjectPoolManager obj = (LuaFramework.ObjectPoolManager)ToLua.CheckObject<LuaFramework.ObjectPoolManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			LuaFramework.GameObjectPool o = obj.GetPool(arg0);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Get(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.ObjectPoolManager obj = (LuaFramework.ObjectPoolManager)ToLua.CheckObject<LuaFramework.ObjectPoolManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			UnityEngine.GameObject o = obj.Get(arg0);
			ToLua.PushSealed(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Release(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.ObjectPoolManager obj = (LuaFramework.ObjectPoolManager)ToLua.CheckObject<LuaFramework.ObjectPoolManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			UnityEngine.GameObject arg1 = (UnityEngine.GameObject)ToLua.CheckObject(L, 3, typeof(UnityEngine.GameObject));
			obj.Release(arg0, arg1);
			return 0;
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

