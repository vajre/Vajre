CtrlManager = {}
local this = CtrlManager

function CtrlManager.Init()
	this.InitCtrls()
	this.InitVariables()
	return this
end

function CtrlManager.InitCtrls()
	CommonCtrl.Init()

	this.m_CtrlList = {}
	this.m_CtrlList["UpdateCtrl"] = UpdateCtrl
	this.m_CtrlList["LoginCtrl"] = LoginCtrl
	this.m_CtrlList["HallCtrl"] = HallCtrl
end

function CtrlManager.InitVariables()
	this.m_CurrentCtrl = this.m_CtrlList["UpdateCtrl"]
	this.m_NextCtrl = nil
	this.m_IsToggling = false --判断是否正在跳转
	this.m_ToggleList = {}
end

------ CTR 跳转流程
function CtrlManager.ToggleCtrl(ctrlName)
	if this.m_CtrlList[ctrlName] == nil or this.m_CurrentCtrl.__cname == ctrlName then
		logError("ToggleCtrl error invalid ctrl name1", ctrlName)
		return
	end

	if this.m_NextCtrl then
		if this.m_NextCtrl.__cname == ctrlName then
			logError("ToggleCtrl error invalid ctrl name2", ctrlName)
			return
		end
	end
	
	if this.m_IsToggling == true then
		table.insert(this.m_ToggleList,ctrlName)
		return
	end

	Event.Pause()
	this.m_IsToggling = true
	this.m_NextCtrl = this.m_CtrlList[ctrlName]
	CommonCtrl.StartLoading(this.OnLoadingBegin)

end

function CtrlManager.OnLoadingBegin()
	if this.m_CurrentCtrl then
		this.m_CurrentCtrl.OnDestory()
	end
	this.m_NextCtrl.Awake()
	Event.Resume()
end

function CtrlManager.OnLoadingProcess(value)
	CommonCtrl.OnLoadingProcess(value)
end

function CtrlManager.OnLoadingCompleted()
	CommonCtrl.OnLoadingCompleted()
	this.m_CurrentCtrl = this.m_NextCtrl
	this.m_NextCtrl = nil

	this.m_IsToggling = false
	if #this.m_ToggleList > 0 then
		this.ToggleCtrl(this.m_ToggleList[1])
		table.remove(this.m_ToggleList, 1)
	end
end
