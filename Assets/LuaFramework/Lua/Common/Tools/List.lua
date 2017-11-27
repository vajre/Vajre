List = {}

function List.New()
    -- body
    local o = {}
    setmetatable(o, {__index = List})
end

function List.Contains(list, item)
    -- body
    local value = false
    for i,v in ipairs(list) do
        if v == item then
            -- body
            value = true
        end
    end
    return value
end