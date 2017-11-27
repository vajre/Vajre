local guiCamera = CS.GameObject.FindWithTag("GuiCamera")

---------------------------------------------------------------加载一个uobject
function LuaBaseCtrl:Load(assetbundle, assetname, func, isPrefab)
    table.insert(self.m_abnames, assetbundle)
    CS.LoadingManager:Load(assetbundle, assetname, func, isPrefab)
end

---------------------------------------------------------------加载一个panel
function LuaBaseCtrl:LoadPanel(panelname, func)

    if self.m[panelName] then
        if self.m[panelName].bloading then
            logError("LoadPanel: "..panelName.." loading")
        else
            logError("LoadPanel: "..panelName.." has already existed")
        end
        
        return
    end

    self.m[panelname] = {}
    self.m[panelname].bloading = true

    CS.LoadingManager:Load(panelname, {panelname}, function(prefabs)
        local go = CS.GameObject.Instantiate(prefabs[0])
        go.name = panelname
        go.transform:SetParent(guiCamera.transform)
        go.transform.localScale = Vector3.one
        go.transform.localPosition = Vector3.zero
        func(go)
    end, true);
end

function LuaBaseCtrl:LoadPrefab(assetbundle, assetname, func)
    table.insert(self.m_abnames, assetbundle)
    CS.LoadingManager:Load(assetbundle, assetname, func, true)
end


function LuaBaseCtrl:LoadAsset(assetbundle, assetname, func)
    table.insert(self.m_abnames, assetbundle)
    CS.LoadingManager:Load(assetbundle, assetname, func, false)
end