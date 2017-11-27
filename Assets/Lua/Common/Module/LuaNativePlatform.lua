local json = require "cjson"
LuaNativePlatform = {}

-------------------------------Send
function LuaNativePlatform.JsonString(funcname, ...)
    local retTable = {}
    retTable["FuncName"] = funcname
    local args = {...}
    local aryDatas = {}
    for i,v in ipairs(args) do
        aryDatas[i] = v
    end
    retTable["Args"] = aryDatas
    return json.encode(retTable);
end

function LuaNativePlatform.SendPlatformMsg(funcname, ...)
    local jsonStr = LuaNativePlatform.JsonString(funcname, ...)
    return CrossPlatformInterface.Instance:SendPlatformMsg(jsonStr)
end

-------------------------------Recv
function LuaNativePlatform.OnPlatformMessage(msg)
    local obj = json.decode(msg);
    LuaNativePlatform[obj["FuncName"]](unpack(obj["Args"]))
end

function LuaNativePlatform.OnLoginWeChat(success, access_token, openid)
    Event.Brocast(MessagerName.Login_WeChatLoginResult, success, access_token, openid)
end

function LuaNativePlatform.OnSendAppContect(errCode)
    
end

function LuaNativePlatform.OnClickAppContect(openID, title, description, extInfo, dataStr, messageExt)
    
end

function LuaNativePlatform.HandleOpenURL(url)
    log("###", url)
end

function LuaNativePlatform.OnClickAppContect(dataStr)

end

function LuaNativePlatform.OnRecordingFinish(filePath)
    Event.Brocast(MessagerName.PlatformOnRecordingFinish, filePath)
end

function LuaNativePlatform.OnRecording(volume)
    Event.Brocast(MessagerName.PlatformOnRecording, volume)
end