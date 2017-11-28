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
        logError("load ok1")
        local obj1 = CS.ResManager:LoadAsset("scene_3", "scene_3/prefabs.ab", "_Eviroments.prefab", false)
        local gameObj = CS.GameObject.Instantiate(obj1)
        gameObj.name = "OK1"
    end)

    this.LoadAsset("scene_3", "scene_3/prefabs2.ab", "_Eviroments.prefab", false, function(prefab)
        logError("load ok2")
        local gameObj = CS.GameObject.Instantiate(prefab)
        gameObj.name = "OK2"
    end)

    -- CS.ResManager:LoadABPack("scene_3", "scene_3/prefabs2.ab", function()
    --     logError("load ok2")
    --     local obj2 = CS.ResManager:LoadAsset("scene_3", "scene_3/prefabs2.ab", "_Eviroments.prefab", false)
    --     local gameObj = CS.GameObject.Instantiate(obj2)
    --     gameObj.name = "OK2"
    -- end)
end

function Game.LoadAsset(scenesName, abName, assetName, isCache, func)
    if CS.ResManager:IsABPackLoaded(scenesName, abName) then
        local obj2 = CS.ResManager:LoadAsset(scenesName, abName, assetName, isCache)
        func(obj2)
    else
        CS.ResManager:LoadABPack(scenesName, abName, function()
            local obj2 = CS.ResManager:LoadAsset(scenesName, abName, assetName, isCache)
            func(obj2)
        end)
    end
end

--销毁--
function Game.OnDestroy()
    -- Network.OnDestroy()
end
