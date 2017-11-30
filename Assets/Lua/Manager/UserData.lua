require "Manager/UserDataEnum"

--管理器--
UserData = {}
local this = UserData

function UserData.Init()
    this.InitVariables()
end

function UserData.InitVariables()
    this.m = {}
    this.m.userData = {}
    this.m.initRoomData = {}
    this.m.playerData = {}  --变化玩家列表
    this.m.messageData = {}
end

function UserData.SetUserData(key, value)
    this.m.userData[key] = value
end

function UserData.GetUserData(key)
    return this.m.userData[key]
end

function UserData.ClearUserData()
    this.m.userData = {}
end

function UserData.DelPlayerByID(roleID)
    for i, item in ipairs(this.m.playerData) do
        if item.u32RoleID == roleID then 
            table.remove(this.m.playerData, i)
            return
        end
    end
end

function UserData.SetPlayerData(data) --
    local roleID = data.u32RoleID
    for i, item in pairs(this.m.playerData) do
        if item.u32RoleID == roleID then 
            for k,v in pairs(data) do
                item[k] = v
            end
            return
        end
    end

    table.insert(this.m.playerData, data)
    logError(#this.m.playerData)
end

function UserData.GetPlayerDataByRoleId(roleId)
    for k,v in ipairs(this.m.playerData) do
        if v.u32RoleID == roleId then
            return v
        end
    end
end

function UserData.GetPlayerData() --tagNCMJRoleItem
    return this.m.playerData
end

function UserData.ClearPlayerData()
    this.m.playerData = {}
end

function UserData.SetMessageData(id, data)
    this.m.messageData[id] = data
end

function UserData.GetMessageData(id)
    return this.m.messageData[id]
end

function UserData.ClearMessageData()
    this.m.messageData = {}
end
