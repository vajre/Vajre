VMath = {}

function VMath.Int2Bytes(num, endian, signed) --endian 大小端 --signed 有无符号
    if num<0 and not signed then num=-num print"warning, dropping sign from number converting to unsigned" end
    local res={}
    local n = math.ceil(select(2,math.frexp(num))/8) -- number of bytes to be used.
    if signed and num < 0 then
        num = num + 2^n
    end
    for k=n,1,-1 do -- 256 = 2^8 bits per char.
        local mul=2^(8*(k-1))
        res[k]=math.floor(num/mul)
        num=num-res[k]*mul
    end
    assert(num==0)
    if endian == "big" then
        local t={}
        for k=1,n do
            t[k]=res[n-k+1]
        end
        res=t
    end
    return res
    -- return string.char(unpack(res))
end

function VMath.Score(score)
    if score >= 100000000 then --亿
        local value = VMath.GetPreciseDecimal(score/100000000, 1)
        local a,b = math.modf(value)
        if b >= 0.1 then
            return string.format( "%0.1f亿", value)
        else
            return string.format( "%d亿", value)
        end
    elseif score >= 10000 then
        local value = VMath.GetPreciseDecimal(score/10000, 1)
        local a,b = math.modf(value)
        if b >= 0.1 then
            return string.format( "%0.1f万", value)
        else
            return string.format( "%d万", value)
        end
    else
        return tostring(score)
    end
end

function VMath.CustomScore(score)
    if score >= 100000000 then --亿
       
        local value = VMath.GetPreciseDecimal(score/100000000, 1)
        local a,b = math.modf(value)
        if b >= 0.1 then
            return string.format( "%0.1fY", value)
        else
            return string.format( "%dY", value)
        end
    elseif score >= 10000 then

        local value = VMath.GetPreciseDecimal(score/10000, 1)
        local a,b = math.modf(value)
        if b >= 0.1 then
            return string.format( "%0.1fW", value)
        else
            return string.format( "%dW", value)
        end
    else
        return tostring(score)
    end
end


function VMath.GetPreciseDecimal(nNum, n)
    if type(nNum) ~= "number" then
        return nNum;
    end
    n = n or 0;
    n = math.floor(n)
    if n < 0 then
        n = 0;
    end
    local nDecimal = 10 ^ n
    local nTemp = math.floor(nNum * nDecimal);
    local nRet = nTemp / nDecimal;
    return nRet;
end


function VMath.Split(szFullString, szSeparator)
    local nFindStartIndex = 1
    local nSplitIndex = 1
    local nSplitArray = {}
    while true do
    local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
    if not nFindLastIndex then
        nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
        break
    end
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
    nFindStartIndex = nFindLastIndex + string.len(szSeparator)
    nSplitIndex = nSplitIndex + 1
    end
    return nSplitArray
end