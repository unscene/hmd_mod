kRequestProfiling = false

local function OnLoadComplete()
	StartPolling()
end

function StartPolling()
    startTime = Shared.GetTime()
	Shared.SendHTTPRequest("http://localhost:8080", "GET", {}, function(response)
    	StartPolling()
	end)
end


Event.Hook("LoadComplete", OnLoadComplete)
