require "Common/Declare"
require "View/Declare"
require "Controller/Declare"
require "Network/Declare"
require "Logic/CtrlManager"
require "Logic/UserData"
require "Events"

--管理器--
Game = {}
local this = Game

function Game.OnInitOK()

    Event.Init()
    UserData.Init()
    Sound.Init()
    Network.Init()
    CtrlManager.Init()

    CS.ResManager:LoadABPack("scene_3", "scene_3/prefabs.ab", function()

        -- local obj = CS.ResManager:LoadAsset("scene_3", "scene_3/prefabs.ab", "_Eviroments.prefab", false)
        -- logError(obj)

        -- local obj2 = CS.ResManager:LoadAsset("scene_3", "scene_3/prefabs.ab", "_Eviroments.prefab", false)
        -- logError(obj)
        logError("load ok")
        CS.ResManager:LoadABPack("scene_3", "scene_3/prefabs2.ab", function()
            logError("load ok2")
        end)
    end)


end


--销毁--
function Game.OnDestroy()
    -- Network.OnDestroy()
end
