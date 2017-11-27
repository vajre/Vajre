require "3rd/pbc/protobuf"
PBRegister = {}
local this = PBRegister

function PBRegister.Init()
    this.path = this.GetPath()
    this.Register("MessageCommon.pb")
    this.Register("MessageClient.pb")
end

function PBRegister.GetPath()
    local path = ""

    if CS.AppConst.DebugMode and CS.AppConst.UpdateMode == false then
        path = AppConst.FrameworkRoot.."/Lua"
    else
        if CS.AppConst.UpdateMode  then
            path = CS.Util.DataPath.."lua"
        else
            path = CS.Util.LocalPath.."lua"
        end
    end
    return path
end

function PBRegister.Register(pbName)

    local path = this.path.."/3rd/pbc/pb/"..pbName;
    local addr = io.open(path, "rb")
    local buffer = addr:read "*a"
    addr:close()
    protobuf.register(buffer)
end
