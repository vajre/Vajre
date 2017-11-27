NetClient = {}
local this = NetClient
local socket
local callID

function NetClient.Init()
    socket = SocketClient.New()
    socket:OnRegister()
    socket.OnMessage = socket.OnMessage + NetClient.OnMessage
    socket.OnEvent = socket.OnEvent + NetClient.OnEvent

    Event.AddListener(MessagerName.NET_CONNECTED,         this.OnNetConnected)
    Event.AddListener(MessagerName.NET_DISCONNECTED,      this.OnNetDisconnected)
    Event.AddListener(MessagerName.NET_CONNECT_FAILED,    this.OnNetConnectFailed)
end

function NetClient.Connect(ip, port)
    socket:Connect(ip, port)
end

function NetClient.Close()
    socket:Close()
end

function NetClient.Send(cmdID, data)
    local sendData = ""
    if PBTool[cmdID] ~= nil then
        sendData = data:SerializeToString();
    else
        sendData = protobuf.encode(CMD_Mapping[cmdID], data)
    end
    socket:SendMessage(cmdID / 256, cmdID % 256, 0, sendData)
end

function NetClient.OnMessage(msgID, buffer)
    if PBTool[msgID] then
        local t = PBTool[msgID]()
        t:ParseFromString(buffer);
        Event.Brocast(msgID, t)
    else
        local recvData = protobuf.decode(CMD_Mapping[msgID], buffer)
        Event.Brocast(msgID, recvData)
    end
end

function NetClient.OnEvent(eventID)
    if eventID == Protocal.SocketConnect then
        Event.Brocast(MessagerName.NET_CONNECTED)
    elseif eventID == Protocal.SocketDisconnect then
        Event.Brocast(MessagerName.NET_DISCONNECTED)
    elseif eventID == Protocal.SocketConnectFailed then
        Event.Brocast(MessagerName.NET_CONNECT_FAILED)
    end
end

function NetClient.OnNetConnected()
    log("OnNetConnected")
    callID = coroutine.start(function()
        while true do
            coroutine.wait(30)
            socket:SendHearbeat()
        end
    end)
end

function NetClient.OnNetConnectFailed()
    log("OnNetConnectFailed")
end

function NetClient.OnNetDisconnected()
    log("OnNetDisconnected")
    coroutine.stop(callID)
end

function NetClient.OnDestroy()
    socket:OnRemove()
    Event.RemoveListener(MessagerName.NET_CONNECTED,         this.OnNetConnected)
    Event.RemoveListener(MessagerName.NET_DISCONNECTED,      this.OnNetDisconnected)
    Event.RemoveListener(MessagerName.NET_CONNECT_FAILED,    this.OnNetConnectFailed)
end