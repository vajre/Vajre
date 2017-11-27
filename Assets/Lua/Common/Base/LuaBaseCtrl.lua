LuaBaseCtrl = class()

local guiCamera = CS.GameObject.FindWithTag("GuiCamera")

function LuaBaseCtrl:Awake()
    self.m_abnames = {} --已加载的assetbundle
    self.m_panels = {}  --已加载的uipanel
    self.m_poolList = {}
    self.m = {}
end

---------------------------------------------------------------游戏资源加载
function LuaBaseCtrl:SetLoadingRes(panels, func)
    self.m_abnames = panels

    CS.LoadingManager:LoadCtrRes(panels, 
                                self.OnLoadingProcess,
                                function(prefabs)
                                    local array = {} 
                                    for i = 0, prefabs.Length - 1 do
                                        local go = CS.GameObject.Instantiate(prefabs[i])
                                        go.name = panels[i + 1]
                                        go.transform:SetParent(guiCamera.transform)
                                        go.transform.localScale = Vector3.one
                                        go.transform.localPosition = Vector3.zero
                                        array[#array+1] = go
                                    end
                                    func(array)
                                end)
end

function LuaBaseCtrl.OnLoadingProcess(current, total)
	CtrlManager.OnLoadingProcess(current/total)
end

function LuaBaseCtrl:Start(panels)
    for i = 1, #panels do
        self.m[panels[i].name] = {}
        self.m[panels[i].name].bloading = false
        self.m[panels[i].name].panel = panels[i]
        self.m_panels[#self.m_panels + 1] = panels[i]
	end
    CtrlManager.OnLoadingCompleted()
end

---------------------------------------------------------------显示一个UI 面板
function LuaBaseCtrl:ShowPanel(panelName)
    if self.m[panelName] and self.m[panelName].panel then
        self.m[panelName].panel:SetActive(true)
    else
        self:LoadPanel(panelName, function(panel)

            self.m_panels[#self.m_panels + 1] = panel
            self.m[panel.name].panel = panel
            self.m[panel.name].bloading = false
            self.m[panelName].panel:SetActive(true)
        end)
    end
end

function LuaBaseCtrl:HidePanel(panelName)
    if self.m[panelName].panel then
        self.m[panelName].panel:SetActive(false)
    end
end


------------------------------------------------------------对象池操作
function LuaBaseCtrl:CreatePool(poolname, min, max, prefab)
    if List.Contains(self.m_poolList, poolname)  == false then
        table.insert(self.m_poolList, poolname)
    end

    CS.ObjectPoolManager:CreatePool(poolname, min, max, prefab)
end

function LuaBaseCtrl:PoolExist(assetname)
    return CS.ObjectPoolManager:PoolExist(assetname)
end

function LuaBaseCtrl:ReleasePoolItem(poolname, obj)

    if obj.tag == "Enable" then
        obj.tag = "Disable"
        return CS.ObjectPoolManager:Release(poolname, obj);
    else
        logError("### ReleasePoolItem Error", obj, "已经被放回")
    end 
end

function LuaBaseCtrl:GetPoolItem(poolname, obj)
    local item = CS.ObjectPoolManager:Get(poolname)
    if obj ~= nil then
        item.transform:SetParent(obj.transform)
    end
    item.transform.localScale = Vector3.New(1, 1, 1) 
    item.transform.localPosition = Vector3.New(0, 0, 0)
    item.tag = "Enable"
    return item
end

function LuaBaseCtrl.RemovePool(poolname)
    CS.ObjectPoolManager:RemovePool(poolname)
end

------------------------------------------------------------资源回收
function LuaBaseCtrl:OnDestory()
    for i=1,#self.m_poolList do
        LuaBaseCtrl.RemovePool(self.m_poolList[i])
    end
    self.m_poollist = {}

    for i=1,#self.m_panels do
        CS.GameObject.Destroy(self.m_panels[i])
    end
    self.m_panels = {}

    CS.LoadingManager:UnloadAssetBundles(self.m_abnames)
    self.m_abnames = {}

    self.m = {}
end 
