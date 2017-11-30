require "Common.Declare"
require "Network.Declare"
require "Manager/UserData"
require "Manager.SceneManager"
require "Manager.UIManager"
require "Events"

GameManager = {}
local this = GameManager

function GameManager.Init()
    Event.Init()
    UserData.Init()
    Sound.Init()
    Network.Init()
    SceneManager.Init()
    UIManager.Init()
    SceneManager.LoadScene("LoginScene")
end

function GameManager.LoadABPack(scenesName, abName, func)
    CS.ResManager:LoadABPack(scenesName, abName, func)
end

function GameManager.LoadAsset(scenesName, abName, assetName, isCache, func)
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
function GameManager.OnDestroy()
    -- Network.OnDestroy()
end
