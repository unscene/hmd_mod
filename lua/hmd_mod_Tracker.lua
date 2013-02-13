local function OnLoadComplete()
	Shared.SendHTTPRequest("http://www.google.com", "GET", {}, function(response)
    	Shared.Message("http works")        
	end)
end

Event.Hook("LoadComplete", OnLoadComplete)