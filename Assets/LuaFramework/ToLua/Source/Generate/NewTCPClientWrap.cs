﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class NewTCPClientWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(NewTCPClient), typeof(System.Object));
		L.RegFunction("CreateSocket", CreateSocket);
		L.RegFunction("Update", Update);
		L.RegFunction("ConnectCoroutine", ConnectCoroutine);
		L.RegFunction("Connect", Connect);
		L.RegFunction("Shutdown", Shutdown);
		L.RegFunction("SendPack", SendPack);
		L.RegFunction("Send", Send);
		L.RegFunction("GetFirstCmd", GetFirstCmd);
		L.RegFunction("GetCmd", GetCmd);
		L.RegFunction("New", _CreateNewTCPClient);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegConstant("MAX_SOCKET_TIMEOUT", 6000000);
		L.RegConstant("CMD_HEADER_SIZE", 9);
		L.RegVar("Status", get_Status, null);
		L.RegVar("IsActive", get_IsActive, null);
		L.RegVar("IsConnected", get_IsConnected, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateNewTCPClient(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				NewTCPClient obj = new NewTCPClient();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: NewTCPClient.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CreateSocket(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Net.Sockets.AddressFamily arg0 = (System.Net.Sockets.AddressFamily)ToLua.CheckObject(L, 1, typeof(System.Net.Sockets.AddressFamily));
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 2);
			System.Net.Sockets.Socket o = NewTCPClient.CreateSocket(arg0, arg1);
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Update(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			obj.Update();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ConnectCoroutine(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 8);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			ushort arg1 = (ushort)LuaDLL.luaL_checknumber(L, 3);
			uint arg2 = (uint)LuaDLL.luaL_checknumber(L, 4);
			uint arg3 = (uint)LuaDLL.luaL_checknumber(L, 5);
			int arg4 = (int)LuaDLL.luaL_checknumber(L, 6);
			uint arg5 = (uint)LuaDLL.luaL_checknumber(L, 7);
			uint arg6 = (uint)LuaDLL.luaL_checknumber(L, 8);
			bool o = obj.ConnectCoroutine(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Connect(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 8);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			ushort arg1 = (ushort)LuaDLL.luaL_checknumber(L, 3);
			uint arg2 = (uint)LuaDLL.luaL_checknumber(L, 4);
			uint arg3 = (uint)LuaDLL.luaL_checknumber(L, 5);
			int arg4 = (int)LuaDLL.luaL_checknumber(L, 6);
			uint arg5 = (uint)LuaDLL.luaL_checknumber(L, 7);
			uint arg6 = (uint)LuaDLL.luaL_checknumber(L, 8);
			bool o = obj.Connect(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Shutdown(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			obj.Shutdown();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SendPack(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 5);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			byte arg0 = (byte)LuaDLL.luaL_checknumber(L, 2);
			byte arg1 = (byte)LuaDLL.luaL_checknumber(L, 3);
			uint arg2 = (uint)LuaDLL.luaL_checknumber(L, 4);
			byte[] arg3 = ToLua.CheckByteBuffer(L, 5);
			bool o = obj.SendPack(arg0, arg1, arg2, arg3);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Send(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			byte[] arg0 = ToLua.CheckByteBuffer(L, 2);
			bool o = obj.Send(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetFirstCmd(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			TCPRecvData o = obj.GetFirstCmd();
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetCmd(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			NewTCPClient obj = (NewTCPClient)ToLua.CheckObject<NewTCPClient>(L, 1);
			TCPRecvData[] o = obj.GetCmd();
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Status(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			NewTCPClient obj = (NewTCPClient)o;
			TCPStatusType ret = obj.Status;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Status on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_IsActive(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			NewTCPClient obj = (NewTCPClient)o;
			bool ret = obj.IsActive;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index IsActive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_IsConnected(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			NewTCPClient obj = (NewTCPClient)o;
			bool ret = obj.IsConnected;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index IsConnected on a nil value");
		}
	}
}

