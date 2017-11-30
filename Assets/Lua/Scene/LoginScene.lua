local LuaBaseScene = require "Common.Base.LuaBaseScene"
local LoginScene = class(LuaBaseScene)
local this = LoginScene

function LoginScene.BeginLoad()
    CS.ResManager:LoadABPack("scene_3/prefabs.ab", function()
        local fuck = CS.ResManager:LoadAsset("scene_3/prefabs.ab", "_Eviroments.prefab")
        CS.GameObject.Instantiate(fuck)
        CS.ResManager:UnLoadABPack("scene_3/prefabs.ab")
    end)

end

function LoginScene.BeginLoadAsync()
    local pack = CS.ScenePack.New()
    pack.sceneName = "loginscene"
    pack.abNames = {"loginscene/loginscene.u3d"}
    CS.ResManager:LoadScenePack({pack, pack2}, this.OnLoading, this.OnLoadCompleted)
end

function LoginScene.OnLoading(progress)
    logError(progress)
end

function LoginScene.OnLoadCompleted()
    logError("OnLoadCompleted")
end

return LoginScene