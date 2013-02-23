Script.Load("lua/FunctionContracts.lua")
Script.Load("lua/MixinUtility.lua")

TrackerMixin = CreateMixin(TrackerMixin)
TrackerMixin.type = 'HMDTracker'

function TrackerMixin:__initmixin()    
	if Client then
		self:PollForTrackerUpdates()
	end
end

function TrackerMixin:PollForTrackerUpdates() 
    Shared.SendHTTPRequest("http://localhost:8081", "GET", {}, function(response)     	
        local response = StringSplit(response, " ")           
        local newAngles = Angles(tonumber(response[1]), tonumber(response[2]),0)        

        self:SetLastTrackedAngles(newAngles)
        self:PollForTrackerUpdates()
    end)
end

function TrackerMixin:GetLastTrackedAngles()
	return self.lastTrackedAngles
end

function TrackerMixin:SetLastTrackedAngles(angles)
	self.lastTrackedAngles = angles    
end

AddFunctionContract(TrackerMixin.SetLastTrackedAngles, { Arguments = { "Angles" }, Returns = { } })

function TrackerMixin:OverrideInput(input)
    local angles = self:GetLastTrackedAngles()    
    //need to diff the angles instead
    if angles then
        input.pitch = angles.pitch
        input.yaw = angles.yaw
    end
    Player.OverrideInput(self, input)
end

