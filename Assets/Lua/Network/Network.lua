Network = {}
local this = Network

function Network.Init()
    NetClient.Init()
end

function Network.OnDestroy()
    NetClient.OnDestroy()
end