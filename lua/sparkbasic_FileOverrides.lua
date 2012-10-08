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
	// Neutral structures
	"lua/ResourcePoint.lua",
	"lua/ResourceTower.lua",
	"lua/Door.lua",
	"lua/Reverb.lua",
	"lua/Location.lua",
	"lua/Trigger.lua",
	"lua/Ladder.lua",
	"lua/MinimapExtents.lua",
	"lua/DeathTrigger.lua",
	"lua/TimedEmitter.lua",
	"lua/Gamerules.lua",
	"lua/NS2Gamerules.lua",
	"lua/TechPoint.lua",
	"lua/BaseSpawn.lua",
	"lua/ReadyRoomSpawn.lua",
	"lua/Pheromone.lua",
	"lua/Weapons/ViewModel.lua",
	
	// Marine structures
	"lua/MAC.lua",
	"lua/Mine.lua",
	"lua/Extractor.lua",
	"lua/Armory.lua",
	"lua/ArmsLab.lua",
	"lua/Observatory.lua",
	"lua/PhaseGate.lua",
	"lua/RoboticsFactory.lua",
	"lua/PrototypeLab.lua",
	"lua/CommandStructure.lua",
	"lua/CommandStation.lua",
	"lua/Sentry.lua",
	"lua/ARC.lua",
	"lua/InfantryPortal.lua",
	"lua/DropPack.lua",
	"lua/AmmoPack.lua",
	"lua/MedPack.lua",
	"lua/CatPack.lua",
	"lua/Effect.lua",
	"lua/AmbientSound.lua",
	"lua/Particles.lua",

	// Alien Comm Abilities
	"lua/CommAbilities/Alien/CragUmbra.lua",
	"lua/CommAbilities/Alien/CragBabblers.lua",
	"lua/Babbler.lua",
	"lua/CommAbilities/Alien/ShadeInk.lua",

	// Alien structures
	"lua/Harvester.lua",
	"lua/Infestation.lua",
	"lua/Hive.lua",
	"lua/Shell.lua",
	"lua/Crag.lua",
	"lua/WhipBomb.lua",
	"lua/Whip.lua",
	"lua/Veil.lua",
	"lua/Shift.lua",
	"lua/Spur.lua",
	"lua/Shade.lua",
	"lua/Hydra.lua",
	"lua/Clog.lua",
	"lua/Cyst.lua",
	"lua/Drifter.lua",
	"lua/Egg.lua",
	"lua/Embryo.lua",
	"lua/Hallucination.lua",

	// Base players
	"lua/AlienSpectator.lua",
	"lua/MarineSpectator.lua",
	"lua/MarineCommander.lua",
	"lua/AlienCommander.lua",

	// Character class behaviors
	"lua/Marine.lua",
	"lua/JetpackMarine.lua",
	"lua/Exosuit.lua", // pickupable version
	"lua/Exo.lua",
	"lua/Skulk.lua",
	"lua/Gorge.lua",
	"lua/Lerk.lua",
	"lua/Fade.lua",
	"lua/Onos.lua",

	// Weapons
	"lua/Weapons/Marine/ClipWeapon.lua",
	"lua/Weapons/Marine/Rifle.lua",
	"lua/Weapons/Marine/Pistol.lua",
	"lua/Weapons/Marine/Shotgun.lua",
	"lua/Weapons/Marine/Axe.lua",
	"lua/Weapons/Marine/Minigun.lua",
	"lua/Weapons/Marine/Claw.lua",
	"lua/Weapons/Marine/GrenadeLauncher.lua",
	"lua/Weapons/Marine/Flamethrower.lua",
	"lua/Weapons/Marine/LayMines.lua",
	"lua/Weapons/Marine/Welder.lua",
	"lua/Jetpack.lua",

	// Misc
	"lua/PowerPoint.lua",
	"lua/SentryBattery.lua",
	"lua/AlienTeamInfo.lua"
}

// Case matters here!
kSparkBasicEntityStubs = {
}

if #kSparkBasicFileRemovals > 0 then
	Shared.Message ("Registering file removals...")
end

for index, override in ipairs(kSparkBasicFileRemovals) do
	Shared.Message ("Removing source file " .. override)
	
	// Hook into the load tracker code to remove the file when we come across it.
	LoadTracker:BlockScriptLoad(override)
end

for index, stub in ipairs(kSparkBasicEntityStubs) do
	Shared.Message ("Stubbing the entity " .. stub)
	
	local result, error 
	result, error = loadstring(stub .. " = {}")
	pcall(result)
	
	result, error = loadstring(stub .. ".kModelName = \"\"")
	pcall(result)
	
	result, error = loadstring(stub .. ".kMapName = \"\"")
	pcall(result)
end 