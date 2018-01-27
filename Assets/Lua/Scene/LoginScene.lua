local LuaBaseScene = require "Common.Base.LuaBaseScene"
local LoginScene = class(LuaBaseScene)
local this = LoginScene

function LoginScene.LoadScene()
    -- CS.ResManager:LoadABPack("loginscene/prefabs.ab", function()
    --     local fuck = CS.ResManager:LoadAsset("loginscene/prefabs.ab", "s_0006_test.prefab")
    --     CS.GameObject.Instantiate(fuck)
    --     CS.ResManager:UnLoadABPack("scene_3/prefabs.ab")
    -- end)

    CS.ResManager:LoadABPack("loginscene/loginscene.u3d", function()
        --CS.SceneManager.LoadScene("Login");
    end)
end

function LoginScene.LoadSceneAsync()
    local pack = CS.ScenePack.New()
    pack.sceneName = "loginscene"
    pack.abNames = {"loginscene/loginscene.u3d"}
    CS.ResManager:LoadScenePack({pack}, this.OnLoading, this.OnLoadCompleted)
end

function LoginScene.OnLoading(progress)
    --logError(progress)
end

function LoginScene.OnLoadCompleted()
    logError("OnLoadCompleted")
    CS.ResManager:LoadAsset("loginscene/loginscene.u3d", "Login.unity")
    --CS.SceneManager.LoadScene("Login");
end

return LoginScene