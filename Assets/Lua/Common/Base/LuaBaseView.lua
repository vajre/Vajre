LuaBaseView = class()
local this = LuaBaseView

function LuaBaseView:Awake(obj)
    self.m = {}
    self.m_active = true
    self.m.gameObject = obj
    self.m.transform = obj.transform
    self.m.luaBehaviour = obj:GetComponent("LuaBehaviour")
    self.m.calls = {}
end

function LuaBaseView:AddSliderListener(obj, func)
    self.m.luaBehaviour:AddSliderListener(obj, func)
end

function LuaBaseView:AddClick(...)
    self.m.luaBehaviour:AddClick(...)
end

function LuaBaseView:RemoveClick(...)
    self.m.luaBehaviour:RemoveClick(...)
end

function LuaBaseView:OnDestroy()

    for i=1,#self.m.calls do
        coroutine.stop(self.m.calls[i])
    end

    self.m = {}
    self.m_active = false
end
