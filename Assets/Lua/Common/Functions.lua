--错误日志
function log(...)
	local str
	for k,v in ipairs({...}) do
		if k == 1 then
			-- body
			str = tostring(v)
		else
			str = str.." "..tostring(v)
		end
	end
	CS.Util.Log(str);
end

--错误日志
function logError(...)
	local str
	for k,v in ipairs({...}) do
		if k == 1 then
			-- body
			str = tostring(v)
		else
			str = str.." "..tostring(v)
		end
	end
	CS.Util.LogError(str);
end

--警告日志--
function logWarn(str) 
	CS.Util.LogWarning(str);
end

--查找对象--
function find(str)
	return GameObject.Find(str);
end


function child(str)
	return transform:FindChild(str);
end

function subGet(childNode, typeName)		
	return child(childNode):GetComponent(typeName);
end

function findPanel(str) 
	local obj = find(str);
	if obj == nil then
		error(str.." is null");
		return nil;
	end
	return obj:GetComponent("BaseLua");
end