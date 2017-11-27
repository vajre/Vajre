using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using UnityEngine;
public enum TCPStatusType
{
    OK_CONNECTED,           //已连接
    OK_CONNECTING,          //正在连接
    ERR_DISCONNECT,         //断开连接
    ERR_TIMEOUT,            //接收超时
    ERR_SEND_ERR,           //发送命令失败
    ERR_CMD_OVERFLOW,       //命令队列满了
    ERR_CMD_SIZE_ZERO,      //命令大小是0
    ERR_CMD_SIZE_OVERFLOW,  //命令大小超出BUFFSIZE

}

public class TCPRecvData
{
    public byte     MainType;
    public byte     SubType;
    public byte[]   Data;
}

public class NewTCPClient
{
    public class TCPConnectData
    {
        public Socket socket;
        public EndPoint endPoint;
        public uint connectTimeout;
        public volatile bool connected;
        public uint beginTime;
    }
    class TCPClientData
    {
        public TCPClientData(uint maxCount)
        {
            RecvList = new SafeArray<TCPRecvData>(maxCount);
            SendList = new SafeArray<byte[]>(maxCount);
        }
        public SafeArray<TCPRecvData> RecvList;
        public SafeArray<byte[]> SendList;

        public Socket Socket;
        public int BuffSize;
        public uint RecvTimeout;
        public uint HearbeatID;
        public volatile TCPStatusType Status;
        public TCPConnectData ConnectData;
    };
   
    public const int MAX_SOCKET_TIMEOUT = 1000 * 60 * 100;//100分钟超时时间,具体时间由Connect决定。
    public const int CMD_HEADER_SIZE = 9;
    public static Socket CreateSocket(AddressFamily af, int buffSize)
    {
        Socket s;
        s = new Socket(af, SocketType.Stream, ProtocolType.Tcp);
        s.ExclusiveAddressUse = false;
        s.LingerState = new LingerOption(true, 1);
        s.NoDelay = true;
        s.SetSocketOption(SocketOptionLevel.Tcp, SocketOptionName.NoDelay, 1);
       
        s.ExclusiveAddressUse   = false;
        s.ReceiveBufferSize     = buffSize;
        s.SendBufferSize        = buffSize;
        s.ReceiveTimeout        = MAX_SOCKET_TIMEOUT;
        s.SendTimeout           = MAX_SOCKET_TIMEOUT;
        s.Blocking              = true;
        return s;
    }
    void ThreadConnect(object obj)
    {
        try
        {
            TCPConnectData cd = (TCPConnectData)obj;
            cd.socket.Connect(cd.endPoint);
            cd.connected = cd.socket.Connected;
        }
        catch
        {

        }
    }
    uint GetTickCount()
    {
        return (uint)(DateTime.Now.Ticks / 10000);
    }
    public void Update()
    {
        if (m_ClientData == null || m_ClientData.ConnectData == null)
            return;

        TCPConnectData cd = m_ClientData.ConnectData;
        uint tick = GetTickCount();

        if (tick - cd.beginTime < cd.connectTimeout && cd.connected == false)
        {
            return;
        }
        if (cd.socket.Connected == false)
        {
            Debug.Log("TCP Connect Timeout.");
            m_ClientData.Status = TCPStatusType.ERR_TIMEOUT;  //连接超时
            CloseSocket(cd.socket);
        }
        else
        {
            Debug.Log("TCP Connected.");
            m_ClientData.Status = TCPStatusType.OK_CONNECTED;//已连接
            cd.socket.Blocking = false;
            m_ClientData.ConnectData = null;
            Thread th = new Thread(new ParameterizedThreadStart(_ThreadRecv));
            th.Start(m_ClientData);
            th = new Thread(new ParameterizedThreadStart(_ThreadSend));
            th.Start(m_ClientData);
        }
    }
    public bool ConnectCoroutine(string ip, ushort port, uint connectTimeout, uint recvTimeout, int buffSize, uint maxCmdCount, uint hearbeatID)
    {
        if (IsActive)
        {
            return false;
        }
        Shutdown();
        AddressFamily newaf = AddressFamily.InterNetwork;
        Socket socket = CreateSocket(newaf, buffSize);
        IPEndPoint endpoit  = new IPEndPoint(IPAddress.Parse(ip), port);
        TCPConnectData cd   = new TCPConnectData();
        cd.endPoint         = endpoit;
        cd.socket           = socket;
        cd.connected        = false;
        cd.connectTimeout   = connectTimeout;
        cd.beginTime        = GetTickCount();
        Thread th = new Thread(new ParameterizedThreadStart(ThreadConnect));
        th.Start(cd);

        m_ClientData = new TCPClientData(maxCmdCount);
        m_ClientData.Status         = TCPStatusType.OK_CONNECTING; //正在连接
        m_ClientData.Socket         = socket;
        m_ClientData.BuffSize       = buffSize;
        m_ClientData.RecvTimeout    = recvTimeout;
        m_ClientData.HearbeatID     = hearbeatID;
        m_ClientData.ConnectData    = cd;

        return true;
    }
    public bool Connect(string ip, ushort port, uint connectTimeout, uint recvTimeout, int buffSize, uint maxCmdCount, uint hearbeatID)
    {
        if(IsActive)
        {
            return false;
        }
        Shutdown();
        AddressFamily newaf = AddressFamily.InterNetwork;
        Socket socket = CreateSocket(newaf, buffSize);
        IPEndPoint endpoit = new IPEndPoint(IPAddress.Parse(ip), port);
        TCPConnectData cd = new TCPConnectData();
        cd.endPoint = endpoit;
        cd.socket = socket;
        cd.connected = false;
        cd.connectTimeout = connectTimeout;
        Thread th = new Thread(new ParameterizedThreadStart(ThreadConnect));
        th.Start(cd);
        uint tick = GetTickCount();
        while (GetTickCount() - tick < connectTimeout && cd.connected == false)
        {
            Thread.Sleep(50);
        }
        if (socket.Connected == false)
        {
            Debug.Log("Connect Timeout:" + (GetTickCount() - tick)+", Set:" + connectTimeout);
            socket.Close();
            return false;
        }
        m_ClientData                = new TCPClientData(maxCmdCount);
        m_ClientData.Status        = TCPStatusType.OK_CONNECTED;
        m_ClientData.Socket         = socket;
        m_ClientData.BuffSize       = buffSize;
        m_ClientData.RecvTimeout    = recvTimeout;
        m_ClientData.HearbeatID     = hearbeatID;
        
        socket.Blocking = false;
        th = new Thread(new ParameterizedThreadStart(_ThreadRecv));
        th.Start(m_ClientData);
        th = new Thread(new ParameterizedThreadStart(_ThreadSend));
        th.Start(m_ClientData);
        Debug.Log("TCP Connected2.");
        return true;
    }
	//关闭连接
	public void	Shutdown()
    {
        if(m_ClientData != null)
        {
            Debug.Log("TCPClient Shutdown.");
            m_ClientData.Status = TCPStatusType.ERR_DISCONNECT;
            CloseSocket(m_ClientData.Socket);
            m_ClientData = null;
        }
    }
    public bool SendPack(byte mainType, byte subType, uint playerID, byte[] arr)
    {
        //Debug.Log("SendCmdPack:" + mainType + ", sub:" + subType);
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
        return Send(data);
    }
	//发送命令
	public bool	Send(byte[] cmd)
    {
        if(IsConnected)
        {
            if (m_ClientData.SendList.HasSpace())
            {
                m_ClientData.SendList.AddItem(cmd);
                return true;
            }
            else
            {
                Debug.Log("发送队列已满");
            }
        }
        return false;
    }
    public TCPStatusType Status
    {
        get
        {
            if (m_ClientData != null)
                return m_ClientData.Status;
            else
                return TCPStatusType.ERR_DISCONNECT;
        }
    }
    public bool IsActive
    {
        get
        {
            if (m_ClientData != null)
                return m_ClientData.Status == TCPStatusType.OK_CONNECTED || m_ClientData.Status == TCPStatusType.OK_CONNECTING;
            else
                return false;
        }
    }
	//是否连接状态
	public bool	IsConnected
    {
        get
        {
            return m_ClientData != null && m_ClientData.Status == TCPStatusType.OK_CONNECTED;
        }
    }
    public TCPRecvData  GetFirstCmd()
    {
        if (m_ClientData != null && m_ClientData.RecvList.HasItem())
            return m_ClientData.RecvList.GetItem();
        else
            return null;
    }
    public TCPRecvData[] GetCmd()
    {
        List<TCPRecvData> cmdList = null;
        if(m_ClientData != null)
        {
            cmdList = new List<TCPRecvData>();
            while (m_ClientData.RecvList.HasItem())
                cmdList.Add(m_ClientData.RecvList.GetItem());
            return cmdList.ToArray();
        }
        return null;
    }
    //-----------------------------------------------
    TCPRecvData ConvertRecvData(int cmdSize, byte[] data, int offset)
    {
        TCPRecvData trd = new TCPRecvData();
       // trd.MainType    = data[offset + 4];
        trd.SubType     = data[offset + 4];
        trd.Data        = new byte[cmdSize - CMD_HEADER_SIZE];
        Array.Copy(data, offset + CMD_HEADER_SIZE, trd.Data, 0, trd.Data.Length);
        return trd;
    }
    bool RecvData(ref int recvSize, ref int offset, byte[] buff, TCPClientData pclient)
    {
	    while (recvSize >= 4)
	    {
		    uint recvID = BitConverter.ToUInt32(buff, offset);
            if (recvID == pclient.HearbeatID)
		    {
			    offset += 4;
			    recvSize -= 4;
		    }
            else if (recvSize >= CMD_HEADER_SIZE)
		    {
                int cmdSize = (int)recvID;
                if (cmdSize == 0)
			    {
                    pclient.Status = TCPStatusType.ERR_CMD_SIZE_ZERO;     //命令长度为0
				    return false;
			    }
                if (cmdSize > pclient.BuffSize)
			    {
                    pclient.Status = TCPStatusType.ERR_CMD_SIZE_OVERFLOW; //命令长度大于buffsize;
				    return false;
			    }
                if (recvSize >= cmdSize)
			    {
                   // Debug.Log("Inner Recv Cmd Count:" + pclient.RecvList.Count());
				    if (pclient.RecvList.HasSpace())
				    {
                        TCPRecvData trd = ConvertRecvData(cmdSize, buff, offset);
                        //byte[] cmd = new byte[cmdSize];
                        //Array.Copy(cmd, 0, buff, offset, cmdSize);
                        pclient.RecvList.AddItem(trd);
					    offset += cmdSize;
					    recvSize -= cmdSize;
				    }
				    else
				    {
                        Debug.Log("接收队列已经满了:" + pclient.RecvList.Count()+", " + DateTime.Now.ToLongTimeString());
                        pclient.Status = TCPStatusType.ERR_CMD_OVERFLOW;//命令队列已满
					    return false;
				    }
			    }
			    else
				    break;
		    }
		    else
			    break;
	    }
	    int freeBuffSize = pclient.BuffSize - (offset + recvSize);
	    if (freeBuffSize < 128)
	    {
		    if (recvSize > 0)
                System.Array.Copy(buff, offset, buff, 0, recvSize);
		    offset = 0;
	    }
	    return true;
    }
	void	_ThreadRecv(object obj)
    {
        TCPClientData pclient = (TCPClientData)obj;
        uint recvTick = GetTickCount();
        int offset = 0;
        int recvSize = 0;
        byte[] buff = new byte[pclient.BuffSize];
        Socket socket = pclient.Socket;
        while(pclient.Status == TCPStatusType.OK_CONNECTED)
        {
		    int curPos = offset + recvSize;
            int ret = 0;
            try
            {
                ret = socket.Receive(buff, curPos, buff.Length - curPos, SocketFlags.None);
            }
            catch
            {
                if (socket.Connected == false)
                {
                    pclient.Status = TCPStatusType.ERR_DISCONNECT;
                    Debug.Log("<连接断开3>" + DateTime.Now.ToString());
                    break;
                }
            }
            uint tick = GetTickCount();
            if (ret > 0)
            {
                recvSize += ret;
                if (!RecvData(ref recvSize, ref offset, buff, pclient))
                {
                    if (pclient.Status == TCPStatusType.OK_CONNECTED)
                    {
                        pclient.Status = TCPStatusType.ERR_DISCONNECT;
                        Debug.Log("<接收错误1>");
                    }
                    break;
                }
                recvTick = tick;
            }
            else if(tick - recvTick > pclient.RecvTimeout)
            {
                pclient.Status = TCPStatusType.ERR_TIMEOUT;
                Debug.Log("<网络接收超时2>");
                break;
            }
		    Thread.Sleep(5);
        }
        Debug.Log("断开:" + pclient.Status);
        CloseSocket(socket);
    }
    void _ThreadSend(object obj)
    {
        TCPClientData pdata = (TCPClientData)obj;
        uint halfTimeout = pdata.RecvTimeout >> 1;
	    byte[] hearbeat = BitConverter.GetBytes(pdata.HearbeatID);
        Socket socket = pdata.Socket;
        uint sendTick = GetTickCount();
        uint sendErrorCount = 0;
	    while (pdata.Status == TCPStatusType.OK_CONNECTED)
	    {
            uint tick = GetTickCount();
		    if (pdata.SendList.HasItem())
		    {
			    byte[] cmd = pdata.SendList.GetItemNoRemove();
			    int ret = socket.Send(cmd, cmd.Length, SocketFlags.None);
			    if (ret == cmd.Length)
			    {
				    pdata.SendList.GetItem();
				    sendTick = tick;
				    sendErrorCount = 0;
			    }
			    else
			    {
				    if (++sendErrorCount >= 10)
				    {
                        pdata.Status = TCPStatusType.ERR_SEND_ERR;
                        Debug.Log("<发送错误3>");
                        break;
				    }
			    }
		    }
            else if (tick - sendTick > halfTimeout)
		    {
                int ret = socket.Send(hearbeat, 4, SocketFlags.None);
			    if (ret == 4)
				    sendTick = tick;

                //Debug.LogError("这是一个心跳包" + DateTime.Now.ToString());
		    }
            Thread.Sleep(5);
	    }
    }
    void    CloseSocket(Socket s)
    {
        try
        {
            s.Close();
        }
        catch
        {

        }
    }
    TCPClientData m_ClientData;
};