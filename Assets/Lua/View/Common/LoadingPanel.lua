local transform
local gameObject

LoadingPanel = {}
local this = LoadingPanel

--启动事件--
function LoadingPanel.Awake(obj)
	gameObject = obj
	transform = obj.transform
end

function LoadingPanel.Start(obj)
end

function LoadingPanel.StartLoading()
	coroutine.start(this.OnLoadingBegin)	
end

function LoadingPanel.OnLoadingBegin()
	CommonCtrl.OnLoadingBegin()
end

function LoadingPanel.OnLoadingProcess(value)

end

function LoadingPanel.OnLoadingCompleted()
	coroutine.start(LoadingPanel.Hide)
end

function LoadingPanel.Hide()
	CommonCtrl.HideLoadingPanel()
end

function LoadingPanel.OnDestroy()

end

return LoadingPanel