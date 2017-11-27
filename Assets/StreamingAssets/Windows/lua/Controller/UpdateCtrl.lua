UpdateCtrl = class()
local this

function UpdateCtrl:OnDestory()
	local guiCamera = CS.GameObject.FindWithTag("GuiCamera")
	local obj = guiCamera.transform:Find("UpdatePanel")
	CS.GameObject.Destroy(obj.gameObject)
end