HMDModPlayer = {}
ClassHooker:Mixin("HMDModPlayer")
    
function HMDModPlayer:OnLoad()
    ClassHooker:SetClassCreatedIn("Player", "lua/Player.lua") 
    self:HookClassFunction("Player", "OnCreate", "OnCreate_BeforeHook")   
end

function HMDModPlayer:OnCreate_BeforeHook(self, player)    
	InitMixin(self, TrackerMixin)
end

HMDModPlayer:OnLoad()
