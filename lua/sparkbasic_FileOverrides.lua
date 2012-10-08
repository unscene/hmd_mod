//________________________________
//
//      SparkBasic
//	   by MCMLXXXIV, 2012
// Please feel free to reuse this file however you want! 
// If you use SparkBasic as the basis for your mod,
// please include MCMLXXXIV and fsfod for his ClassHooker work in the credits!
//________________________________


// sparkbasic_FileOverrides.lua

// Use this to remove files entirely from the loading process.

// Case doesn't matter here!
kSparkBasicFileRemovals = {
	"lua/NS2Gamerules.lua",
	"lua/MarineTeam.lua",
	"lua/Marine.lua",
	"lua/MarineSpectator.lua",
	"lua/AlienTeam.lua",
	"lua/Alien.lua",
	"lua/AlienSpectator.lua",
	"lua/ResourcePoint.lua",
	"lua/ResourceTower.lua"
}

// Case matters here!
kSparkBasicEntityStubs = {
}

if #kCombatFileRemovals > 0 then
	Shared.Message ("Registering file removals...")
end

for index, override in ipairs(kCombatFileRemovals) do
	Shared.Message ("Removing source file " .. override)
	
	// Hook into the load tracker code to remove the file when we come across it.
	LoadTracker:BlockScriptLoad(override)
end

for index, stub in ipairs(kCombatEntityStubs) do
	Shared.Message ("Stubbing the entity " .. stub)
	
	local result, error 
	result, error = loadstring(stub .. " = {}")
	pcall(result)
	
	result, error = loadstring(stub .. ".kModelName = \"\"")
	pcall(result)
	
	result, error = loadstring(stub .. ".kMapName = \"\"")
	pcall(result)
end 