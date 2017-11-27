local EventLib = require "Eventlib"

Event = { m_IsPase = false , m_EvetList = {} }
local events = {}

function Event.Init()
	Event.queue = Queue:new()
end

function Event.AddCMDListener(event,handler)
	if not handler or type(handler) ~= "function" then
		logError("handler parameter in addlistener function has to be function, " .. type(handler) .. " not right")
	end

	if not events[event] then
		--create the Event with name
		events[event] = EventLib:new(event)
	end
	
	--conn this handler
	events[event]:connect(handler)
end

function Event.AddListener(event,handler)
	if not event or type(event) ~= "string" then
		error("event parameter in addlistener function has to be string, " .. type(event) .. " not right.")
	end

	if not handler or type(handler) ~= "function" then
		error("handler parameter in addlistener function has to be function, " .. type(handler) .. " not right")
	end

	if not events[event] then
		--create the Event with name
		events[event] = EventLib:new(event)
	end
	--conn this handler
	events[event]:connect(handler)
end

function Event.Brocast(event,...)
	Event.queue:pushFirst({
		m_event = event, 
		args = { ... }
	})
	Event.DoBrocast()
end

function Event.DoBrocast()
	while Event.m_IsPase == false and Event.queue:isEmpty() == false do
		local item = Event.queue:popLast()

		-- if type(item.m_event) == "number" then
		-- 	logError("brocast "..string.format("0x%06x",item.m_event))
		-- end

		if not events[item.m_event] then
			-- logError("brocast " .. item.m_event .. " has no event.")
		else			
			events[item.m_event]:fire(item.m_event, unpack(item.args))
		end
	end
end

function Event.Pause()
	Event.m_IsPase = true
end

function Event.Resume()
	Event.m_IsPase = false
	Event.DoBrocast()
end

function Event.RemoveListener(event,handler)
	if not events[event] then
		error("remove " .. event .. " has no event.")
	else
		events[event]:disconnect(handler)
	end
end

-- return Event