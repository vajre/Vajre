local LoginPanel = class(LuaBaseView)

function LoginPanel:Awake(obj)
    self.super.Awake(self, obj)
end

function LoginPanel:Start()
    self.m.vajre = self:Find("Btn")
    self:AddClick(self.m.vajre, self.OnClick)
end

function LoginPanel:OnClick(obj)
    CtrlManager.ToggleCtrl("HallCtrl")
    CommonCtrl.ShowAlertPanel(1, "爆你菊花")
end

function LoginPanel:Update()

end

function LoginPanel:OnDestroy()

end

return LoginPanel