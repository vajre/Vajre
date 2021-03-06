﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class TCPStatusTypeWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(TCPStatusType));
		L.RegVar("OK_CONNECTED", get_OK_CONNECTED, null);
		L.RegVar("OK_CONNECTING", get_OK_CONNECTING, null);
		L.RegVar("ERR_DISCONNECT", get_ERR_DISCONNECT, null);
		L.RegVar("ERR_TIMEOUT", get_ERR_TIMEOUT, null);
		L.RegVar("ERR_SEND_ERR", get_ERR_SEND_ERR, null);
		L.RegVar("ERR_CMD_OVERFLOW", get_ERR_CMD_OVERFLOW, null);
		L.RegVar("ERR_CMD_SIZE_ZERO", get_ERR_CMD_SIZE_ZERO, null);
		L.RegVar("ERR_CMD_SIZE_OVERFLOW", get_ERR_CMD_SIZE_OVERFLOW, null);
		L.RegFunction("IntToEnum", IntToEnum);
		L.EndEnum();
		TypeTraits<TCPStatusType>.Check = CheckType;
		StackTraits<TCPStatusType>.Push = Push;
	}

	static void Push(IntPtr L, TCPStatusType arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(TCPStatusType), L, pos);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_OK_CONNECTED(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.OK_CONNECTED);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_OK_CONNECTING(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.OK_CONNECTING);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ERR_DISCONNECT(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.ERR_DISCONNECT);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ERR_TIMEOUT(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.ERR_TIMEOUT);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ERR_SEND_ERR(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.ERR_SEND_ERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ERR_CMD_OVERFLOW(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.ERR_CMD_OVERFLOW);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ERR_CMD_SIZE_ZERO(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.ERR_CMD_SIZE_ZERO);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ERR_CMD_SIZE_OVERFLOW(IntPtr L)
	{
		ToLua.Push(L, TCPStatusType.ERR_CMD_SIZE_OVERFLOW);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int IntToEnum(IntPtr L)
	{
		int arg0 = (int)LuaDLL.lua_tonumber(L, 1);
		TCPStatusType o = (TCPStatusType)arg0;
		ToLua.Push(L, o);
		return 1;
	}
}

