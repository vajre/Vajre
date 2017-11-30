local LuaBaseScene = require "Common.Base.LuaBaseScene"
local LoginScene = class(LuaBaseScene)
local this = LoginScene

function LoginScene.BeginLoad()
    this.LoadABPack("loginscene", "loginscene/loginscene.u3d", function()
        CS.SceneManager.LoadScene("Login")
    end)
end

function LoginScene.BeginLoadAsync()
    


end

return LoginScene