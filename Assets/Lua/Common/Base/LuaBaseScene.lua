local LuaBaseScene = class()

function LuaBaseScene.LoadABPack(scenesName, abName, onLoadCompleted)
    CS.ResManager:LoadABPack(scenesName, abName, onLoadCompleted)
end

return LuaBaseScene