--主入口函数。从这里开始lua逻辑
function Main()					
	-- 并不是很好用
	-- --添加调试代码
	-- local breakInfoFun = require("LuaDebug")("localhost", 7003)
	-- --添加断点监听函数
	-- local time = Timer.New(breakInfoFun, 0.5, -1, 1)
	-- time:Start();
end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end