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
    -- CtrlManager.ToggleCtrl("LoginCtrl")
end

--销毁--
function Game.OnDestroy()
    -- Network.OnDestroy()
end
