function memoize(f, count)
    local mem = {} -- 缓存化表
    setmetatable(mem, {__mode = "kv"}) -- 设为弱表
    if count == 1 then
        return function (x) -- ‘f’缓存化后的新版本
            local r = mem[x]
            if r == nil then --没有之前记录的结果？
                r = f(x) --调用原函数
                mem[x] = r --储存结果以备重用
            end
            return r
        end
    elseif count == 2 then
        return function (x,y) 
            local k = tostring(x).."_"..tostring(y)
            local r = mem[k]
            if r == nil then
                r = f(x,y)
                mem[k] = r
            end
            return r
        end
    end
end


bit={data64={}}  
for i=1,64 do  
    bit.data64[i]=2^(64-i)  
end  
-- 10 -- 2
function bit:d2b(arg)  
    local   tr={}  
    for i=1,64 do  
        if arg >= self.data64[i] then  
            tr[i]=1  
            arg=arg-self.data64[i]  
        else  
            tr[i]=0  
        end  
    end  
    return   tr  
end   --bit:d2b  

function   bit:b2d(arg)  
    local   nr=0  
    for i=1,64 do  
        if arg[i] ==1 then  
            nr=nr+2^(64-i)  
        end  
    end  
    return  nr  
end   --bit:b2d  

function    bit:_xor(a,b)  
    local   op1=self:d2b(a)  
    local   op2=self:d2b(b)  
    local   r={}  
    
    for i=1,64 do  
        if op1[i]==op2[i] then  
            r[i]=0  
        else  
            r[i]=1  
        end  
    end  
    return  self:b2d(r)  
end --bit:xor  

function    bit:_and(a,b)  
    local   op1=self:d2b(a)  
    local   op2=self:d2b(b)  
    local   r={}  
    
    for i=1,64 do  
        if op1[i]==1 and op2[i]==1  then  
            r[i]=1  
        else  
            r[i]=0  
        end  
    end  
    return  self:b2d(r)  
    
end --bit:_and  

function    bit:_or(a,b)  
    local   op1=self:d2b(a)  
    local   op2=self:d2b(b)  
    local   r={}  
    
    for i=1,64 do  
        if  op1[i]==1 or   op2[i]==1   then  
            r[i]=1  
        else  
            r[i]=0  
        end  
    end  
    return  self:b2d(r)  
end --bit:_or  

function bit:_not(a)  
    local   op1=self:d2b(a)  
    local   r={}  
    
    for i=1,64 do  
        if  op1[i]==1   then  
            r[i]=0  
        else  
            r[i]=1  
        end  
    end  
    return  self:b2d(r)  
end --bit:_not  

function    bit:_rshift(a,n)  
    local   op1=self:d2b(a)  
    local   r=self:d2b(0)  
    
    if n < 64 and n > 0 then  
        for i=1,n do  
            for i=63,1,-1 do  
                op1[i+1]=op1[i]  
            end  
            op1[1]=0  
        end  
        r=op1  
    end  
    return  self:b2d(r)  
end --bit:_rshift  

function    bit:_lshift(a,n)  
    local   op1=self:d2b(a)  
    local   r=self:d2b(0)  
    
    if n < 64 and n > 0 then  
        for i=1,n   do  
            for i=1,63 do  
                op1[i]=op1[i+1]  
            end  
            op1[64]=0  
        end  
        r=op1  
    end  
    return  self:b2d(r)  
end --bit:_lshift  


function   bit:print(ta)  
    local   sr=""  
    for i=1,64 do  
        sr=sr..ta[i]  
    end  
    print(sr)  
end  

bit.lshift = function(a,n)
    return bit:_lshift(a,n)
end
bit.lshift = memoize(bit.lshift, 2)


bit.rshift = function(a,n)
    return bit:_rshift(a,n)
end
bit.rshift = memoize(bit.rshift, 2)

bit.xand = function(a,n)
    return bit:_and(a,n)
end
bit.xand = memoize(bit.xand, 2)

bit.xor = function(a,n)
    return bit:_or(a,n)
end
bit.xor = memoize(bit.xor, 2)

bit.xnot = function(a)
    return bit:_not(a)
end
bit.xnot = memoize(bit.xnot, 1)


bit.xxor = function(a,n)
    f.error("bit:_xor")
    return bit:_xor(a,n)
end
bit.xxor = memoize(bit.xxor, 2)



