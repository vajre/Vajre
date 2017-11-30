LoginCtrl = class(LuaBaseCtrl, "LoginCtrl")
local this = LoginCtrl

function LoginCtrl.Awake()
	this.super.Awake(this)
	this:SetLoadingRes({
		"LoginPanel",
	}, this.Start)
end

function LoginCtrl.Start(panels)
	panels[1]:SetActive(true)
	this.super.Start(this, panels)
end

function LoginCtrl.OnDestory()
	this.super.OnDestory(this)
end

return this