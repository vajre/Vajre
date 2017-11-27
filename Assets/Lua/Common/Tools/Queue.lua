Queue = {}
function Queue:new()
    o = o or {}
    setmetatable(o, Queue)
    self.__index = Queue

    local lst = {pre = nil, next = nil, value = nil}  
    self.first = nil  
    self.last = nil  
    self.size = 0  
    return o
end

--空返回 true   
function Queue:isEmpty()  
    if self.size == 0 and self.first == nil and self.last == nil then  
        return true  
    end  
    return false  
end  


function Queue:pushFirst(data)  
    local lst = {}  
    lst.pre = nil  
    lst.value = data  
    lst.next = nil  
    if self.first == nil then  
        self.first = lst  
        self.last = lst  
    else  
        lst.next = self.first  
        self.first.pre = lst  
        self.first = lst  
    end  
    self.size = self.size + 1  
end

function Queue:popLast()  
    if self:isEmpty() then  
        logError("list is isEmpty")  
        return  
    end  
  
    local popData = self.last  
  
    local temp = popData.pre  
    if temp then  
        temp.next = nil  
        self.last = temp  
    else  
        self.last = nil  
        self.first = nil  
    end  
    self.size = self.size - 1  
    return Queue:getQueueData(popData)  
end

function Queue:getQueueData(data)  
    return data.value  
end

function Queue:printEveryOne()  
    local temp = self.first  
    if not temp then  
        logError("lua Queue is empty")  
        return  
    end  
    while temp do  
        logError(temp.value)  
        temp = temp.next  
    end  
end  