HallCtrl = class(LuaBaseCtrl, "HallCtrl")
local this = HallCtrl

function HallCtrl.Awake()
	this.super.Awake(this)
	this:SetLoadingRes({
		"HallPanel",
	}, this.Start)
end

function HallCtrl.Start(panels)
	panels[1]:SetActive(true)
	this.super.Start(this, panels)
end

function HallCtrl.OnDestory()
	this.super.OnDestory(this)
end
