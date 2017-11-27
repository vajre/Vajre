using UnityEngine;
using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Collections;
using System.Collections.Generic;
using LuaFramework;
using LuaInterface;

public class Protocal
{
    public const int Connect = 101;
    public const int Disconnect = 102;
    public const int ConnectFailed = 103;
}

public class SocketClient
{
    private TcpClient client = null;
    private NetworkStream outStream = null;
    private MemoryStream memStream;
    private BinaryReader reader;

    private const int MAX_READ = 8192;
    private byte[] byteBuffer = new byte[MAX_READ];

    public const int CMD_HEADER_SIZE = 9;

    public delegate void MessageHandler(int msgID, LuaByteBuffer data);
    public event MessageHandler OnMessage;
    public event MessageHandler OnEvent;

    // Use this for initialization
    public SocketClient()
    {
        
    }

    /// <summary>
    /// 注册代理
    /// </summary>
    public void OnRegister()
    {
        memStream = new MemoryStream();
        reader = new BinaryReader(memStream);
    }

    /// <summary>
    /// 移除代理
    /// </summary>
    public void OnRemove()
    {
        this.Close();
        reader.Close();
        memStream.Close();
    }

    /// <summary>
    /// 连接服务器
    /// </summary>
    void ConnectServer(string host, int port)
    {
        client = null;
        try
        {
            IPAddress[] address = Dns.GetHostAddresses(host);
            if (address.Length == 0)
            {
                Debug.Log("host invalid");
                return;
            }
            if (address[0].AddressFamily == AddressFamily.InterNetworkV6)
            {
                client = new TcpClient(AddressFamily.InterNetworkV6);
            }
            else
            {
                client = new TcpClient(AddressFamily.InterNetwork);
            }
            client.SendTimeout = 1000;
            client.ReceiveTimeout = 1000;
            client.NoDelay = true;
            client.BeginConnect(host, port, new AsyncCallback(OnConnect), null);
        }
        catch (Exception e)
        {
            Close(); 
            Debug.Log(e.Message);
        }
    }

    public bool Connected()
    {
        if (client != null)
        {
            return client.Connected;
        }

        return false;
    }

    /// <summary>
    /// 连接上服务器
    /// </summary>
    void OnConnect(IAsyncResult asr)
    {
        if (client.Connected)
        {
            outStream = client.GetStream();
            client.GetStream().BeginRead(byteBuffer, 0, MAX_READ, new AsyncCallback(OnRead), null);
            if (OnEvent != null)
            {
                LuaByteBuffer buffer = new LuaByteBuffer();
                NetworkManager.AddEvent(OnEvent, Protocal.Connect, ref buffer);
            }
        }
        else
        {
            Close();
            if (OnEvent != null)
            {
                LuaByteBuffer buffer = new LuaByteBuffer();
                NetworkManager.AddEvent(OnEvent, Protocal.ConnectFailed, ref buffer);
            }
        }
    }

    public void SendHearbeat()
    {
        SessionSend(BitConverter.GetBytes(0x7fffffff));
    }


    /// <summary>
    /// 写数据
    /// </summary>
    void WriteMessage(byte[] message)
    {
        MemoryStream ms = null;
        using (ms = new MemoryStream())
        {
            ms.Position = 0;
            BinaryWriter writer = new BinaryWriter(ms);
            //ushort msglen = (ushort)message.Length;
            //writer.Write(msglen);
            writer.Write(message);
            writer.Flush();
            if (client != null && client.Connected)
            {
                byte[] payload = ms.ToArray();
                outStream.BeginWrite(payload, 0, payload.Length, new AsyncCallback(OnWrite), null);
            }
            else
            {
                Debug.Log("client.connected----->>false");
            }
        }
    }

    /// <summary>
    /// 读取消息
    /// </summary>
    void OnRead(IAsyncResult asr)
    {
        int bytesRead = 0;
        try
        {
            //lock (client.GetStream())
            {         
                //读取字节流到缓冲区
                bytesRead = client.GetStream().EndRead(asr);
            }
            if (bytesRead < 1)
            {                
                //包尺寸有问题，断线处理
                OnDisconnected("bytesRead < 1");
                return;
            }
            OnReceive(byteBuffer, bytesRead);   //分析数据包内容，抛给逻辑层
            //lock (client.GetStream())
            {         
                //分析完，再次监听服务器发过来的新消息
                Array.Clear(byteBuffer, 0, byteBuffer.Length);   //清空数组
                client.GetStream().BeginRead(byteBuffer, 0, MAX_READ, new AsyncCallback(OnRead), null);
            }
        }
        catch (Exception ex)
        {
            //PrintBytes();
            OnDisconnected(ex.Message);
        }
    }

    /// <summary>
    /// 丢失链接
    /// </summary>
    void OnDisconnected(string msg)
    {
        Close();   //关掉客户端链接
        if (OnEvent != null)
        {
            LuaByteBuffer buffer = new LuaByteBuffer();
            NetworkManager.AddEvent(OnEvent, Protocal.Disconnect, ref buffer);
        }
        Debug.Log("Connection was closed by the server:>" + msg);
    }

    /// <summary>
    /// 打印字节
    /// </summary>
    /// <param name="bytes"></param>
    void PrintBytes()
    {
        string returnStr = string.Empty;
        for (int i = 0; i < byteBuffer.Length; i++)
        {
            returnStr += byteBuffer[i].ToString("X2");
        }
        Debug.Log(returnStr);
    }

    /// <summary>
    /// 向链接写入数据流
    /// </summary>
    void OnWrite(IAsyncResult r)
    {
        try
        {
            outStream.EndWrite(r);
        }
        catch (Exception ex)
        {
            Debug.Log("OnWrite--->>>" + ex.Message);
        }
    }

    /// <summary>
    /// 接收到消息
    /// </summary>
    void OnReceive(byte[] bytes, int length)
    {
        memStream.Seek(0, SeekOrigin.End);
        memStream.Write(bytes, 0, length);
        //Reset to beginning
        memStream.Seek(0, SeekOrigin.Begin);
        while (RemainingBytes() > CMD_HEADER_SIZE)
        {
            //ushort messageLen = reader.ReadUInt16();
            int messageLen = reader.ReadInt32();
            if (messageLen == 0x7fffffff)
            {
                //去掉心跳包
                continue;
            }

            messageLen = messageLen - CMD_HEADER_SIZE;
            int msgID = reader.ReadByte();
            byte[] gateID = reader.ReadBytes(4);

            if (RemainingBytes() >= messageLen)
            {
                MemoryStream ms = new MemoryStream();
                BinaryWriter writer = new BinaryWriter(ms);
                writer.Write(reader.ReadBytes(messageLen));
                ms.Seek(0, SeekOrigin.Begin);
                OnReceivedMessage(msgID, ms);
            }
            else
            {
                //Back up the position two bytes
                memStream.Position = memStream.Position - CMD_HEADER_SIZE;
                break;
            }
        }
        //Create a new stream with any leftover bytes
        byte[] leftover = reader.ReadBytes((int)RemainingBytes());
        memStream.SetLength(0);     //Clear
        memStream.Write(leftover, 0, leftover.Length);
    }

    /// <summary>
    /// 剩余的字节
    /// </summary>
    private long RemainingBytes()
    {
        return memStream.Length - memStream.Position;
    }

    /// <summary>
    /// 接收到消息
    /// </summary>
    /// <param name="ms"></param>
    void OnReceivedMessage(int msgID, MemoryStream ms)
    {
        BinaryReader r = new BinaryReader(ms);
        byte[] message = r.ReadBytes((int)(ms.Length - ms.Position));
        LuaByteBuffer buffer = new LuaByteBuffer(message);
        if (OnMessage != null)
        {
            NetworkManager.AddEvent(OnMessage, msgID, ref buffer);
        }
    }


    /// <summary>
    /// 会话发送
    /// </summary>
    void SessionSend(byte[] bytes)
    {
        WriteMessage(bytes);
    }

    /// <summary>
    /// 关闭链接
    /// </summary>
    public void Close()
    {
        if (client != null)
        {
            if (client.Connected) client.Close();
            client = null;
        }
    }

    /// <summary>
    /// 发送连接请求
    /// </summary>
    public void Connect(string host, int port)
    {
        ConnectServer(host, port);
    }

    /// <summary>
    /// 发送消息
    /// </summary>
	public void SendMessage(byte mainType, byte subType, uint playerID, byte[] arr)
    {
		int size    = CMD_HEADER_SIZE + arr.Length;
		byte[] data = new byte[size];

		data[0] = (byte)(size       >> 0);
		data[1] = (byte)(size       >> 8);
		data[2] = (byte)(size       >> 16);
		data[3] = (byte)(size       >> 24);

		// data[4] = mainType;
		data[4] = subType;

		data[5] = (byte)(playerID   >> 0);
		data[6] = (byte)(playerID   >> 8);
		data[7] = (byte)(playerID   >> 16);
		data[8] = (byte)(playerID   >> 24);

		Array.Copy(arr, 0, data, CMD_HEADER_SIZE, arr.Length);
        SessionSend(data);
    }
}
