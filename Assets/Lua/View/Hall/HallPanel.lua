local HallPanel = class(LuaBaseView)

function HallPanel:Awake(obj)
    self.super.Awake(self, obj)
end

function HallPanel:Start()
    self.m.vajre = self:Find("Btn")
    self:AddClick(self.m.vajre, self.OnClick)
end

function HallPanel:OnClick(obj)
    CtrlManager.ToggleCtrl("LoginCtrl")
end

function HallPanel.OnDestroy()

end

return HallPanel
