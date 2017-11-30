CommonCtrl = class()
local this = CommonCtrl
local guiCamera = CS.GameObject.FindWithTag("GuiCamera")

function CommonCtrl.Init()
	this.m = {}
	this.m.loadingPanel = {}
	this.m.loadingPanel.load = false
	this.m.loadingPanel.obj = nil

	this.m.avoidTounchPanel = {}
	this.m.avoidTounchPanel.load = false
	this.m.avoidTounchPanel.obj = nil

	this.m.alertid = 0
	this.m.alertPanel = {}
	this.m.alertPanel.load = false
	this.m.alertPanel.obj = nil
end

-------------------------------------------  add panel and show hide panel
function CommonCtrl.CreatePanel(panel, panelname, onCreate)
	panel.load = true
	CS.LoadingManager:Load(panelname, {panelname}, function(prefabs)
        local go = CS.GameObject.Instantiate(prefabs[0])
        go.name = panelname
        go.transform:SetParent(guiCamera.transform)
        go.transform.localScale = Vector3.one
        go.transform.localPosition = Vector3.zero
		panel.obj = go
		if onCreate then
			go:SetActive(true)
			onCreate(go)
		end
    end, true);
end

function CommonCtrl.ShowPanel(panel, panelName, onCreate)
	if panel.load == false then
		this.CreatePanel(panel, panelName, onCreate)
	else
		if panel.obj then
			if onCreate then
				onCreate(panel.obj)
			end

			if panel.obj.activeSelf == false then
				panel.obj:SetActive(true)
			end
		end
	end
end

function CommonCtrl.HidePanel(panel)
	if panel.obj then
		panel.obj:SetActive(false)
	end
end

------------------------------------------- loading
--等待loading界面动态显示
function CommonCtrl.StartLoading(func, ...)
	this.ShowPanel(this.m.loadingPanel, "LoadingPanel")
	this.loadFunc = func
	this.loadFuncArg = ...
	LoadingPanel.StartLoading()
end

--开始loading
function CommonCtrl.OnLoadingBegin()
	this.loadFunc(this.loadFuncArg)
end

--loading 进度
function CommonCtrl.OnLoadingProcess(value)
	this.ShowPanel(this.m.loadingPanel, "LoadingPanel")
	LoadingPanel.OnLoadingProcess(value)
end

--loading 完成
function CommonCtrl.OnLoadingCompleted()
	LoadingPanel.OnLoadingCompleted()
end

function CommonCtrl.HideLoadingPanel()
	this.HidePanel(this.m.loadingPanel)
end

------------------------------------------- AvoidTounch
function CommonCtrl.ShowAvoidTounchPanel()
	this.ShowPanel(this.m.avoidTounchPanel, "AvoidTounchPanel")
end

function CommonCtrl.HideAvoidTounchPanel()
	this.HidePanel(this.m.avoidTounchPanel)
end


function CommonCtrl.ShowAlertPanel(time, prompt)
	this.ShowPanel(this.m.alertPanel, "AlertPanel", function(obj)
		local text_prompt = this.m.alertPanel.obj.transform:Find("Dynamic/content").gameObject:GetComponent("Text")
		text_prompt.text = prompt
		local length = tonumber(string.len(prompt))
		local frame = this.m.alertPanel.obj.transform:Find("Dynamic/frame").gameObject:GetComponent("RectTransform")
		frame.sizeDelta = Vector2.New(length * 12 + 30, 62)
	end)	

	this.m.alertid = coroutine.start(function()
		coroutine.wait(time)
		this.HideAlertPanel()
	end)
end

function CommonCtrl.HideAlertPanel()
	this.HidePanel(this.m.alertPanel)
	m_id = -1
end



