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

    -- CS.Tick.Start()
    -- this.LoadABPack("scene_3", "scene_3/prefabs.ab", function()
    --     local msec = CS.Tick.Stop()
    --     logError("load ok1", msec)

    --     CS.Tick.Start()
    --     this.LoadAsset("scene_3", "scene_3/prefabs2.ab", "_Eviroments.prefab", false, function(prefab)
    --         msec = CS.Tick.Stop()
    --         logError("load ok2", msec)
    --         CS.Tick.Start()
    --         local gameObj = CS.GameObject.Instantiate(prefab)
    --         msec = CS.Tick.Stop()
    --         logError("load ok3", msec)
    --         gameObj.name = "OK2"
    --     end)
    -- end)

    -- CS.Tick.Start()
    this.LoadAsset("scene_3", "scene_3/prefabs.ab", "_Eviroments.prefab", true, function(prefab)
        local msec = CS.Tick.Stop()
        local gameObj = CS.GameObject.Instantiate(prefab)
        msec = CS.Tick.Stop()
        gameObj.name = "OK2"
    end)
end

function Game.LoadABPack(scenesName, abName, func)
    CS.ResManager:LoadABPack(scenesName, abName, func)
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
