// ======= Copyright (c) 2003-2012, Unknown Worlds Entertainment, Inc. All rights reserved. =======
//
// lua\TechData.lua
//
//    Created by:   Charlie Cleveland (charlie@unknownworlds.com)
//
// A "database" of attributes for all units, abilities, structures, weapons, etc. in the game.
// Shared between client and server.
//
// ========= For more information, visit us at http://www.unknownworlds.com =====================

// Set up structure data for easy use by Server.lua and model classes
// Store whatever data is necessary here and use LookupTechData to access
// Store any data that needs to used on both client and server here
// Lookup by key with LookupTechData()
kTechDataId                             = "id"
// Localizable string describing tech node
kTechDataDisplayName                    = "displayname"
// Include and set to false if not meant to display on commander UI "enables: "
kTechIDShowEnables                      = "showenables"
kTechDataMapName                        = "mapname"
kTechDataModel                          = "model"
// TeamResources, resources or energy
kTechDataCostKey                        = "costkey"
kTechDataBuildTime                      = "buildtime"
// If an entity has this field, it's treated as a research node instead of a build node
kTechDataResearchTimeKey                = "researchTime"
kTechDataMaxHealth                      = "maxhealth"
kTechDataMaxArmor                       = "maxarmor"
kTechDataDamageType                     = "damagetype"
// Class that structure must be placed on top of (resource towers on resource points)
// If adding more attach classes, add them to GetIsAttachment(). When attaching entities
// to this attach class, ignore class.
kStructureAttachClass                   = "attachclass"
// Structure must be placed within kStructureAttachRange of this class, but it isn't actually attached.
// This can be a table of strings as well. Near class must have the same team number.
kStructureBuildNearClass                = "buildnearclass"
// Structure attaches to wall/roof
kStructureBuildOnWall                   = "buildonwall"
// If specified along with attach class, this entity can only be built within this range of an attach class (infantry portal near Command Station)
// If specified, you must also specify the tech id of the attach class.
// This can be a table of ids as well.
kStructureAttachRange                   = "attachrange"
// If specified, this entity can only be built if there is a powered attach class within kStructureAttachRange.
kStructureAttachRequiresPower           = "attachrequirespower"
// If specified, draw a range indicator for the commander when selected.
kVisualRange                            = "visualrange"
// set to true when attach structure is not required but optional
kTechDataAttachOptional                   = "attachoptional"
// The tech id of the attach class 
kStructureAttachId                      = "attachid"
// If specified, this tech is an alien class that can be gestated into
kTechDataGestateName                    = "gestateclass"
// If specified, how much time it takes to evolve into this class
kTechDataGestateTime                    = "gestatetime"
// If specified, object spawns this far off the ground
kTechDataSpawnHeightOffset              = "spawnheight"
// All player tech ids should have this, nothing else uses it. Pre-computed by looking at the min and max extents of the model, 
// adding their absolute values together and dividing by 2. 
kTechDataMaxExtents                     = "maxextents"
// If specified, is amount of energy structure starts with
kTechDataInitialEnergy                  = "initialenergy"
// If specified, is max energy structure can have
kTechDataMaxEnergy                      = "maxenergy"
// Menu priority. If more than one techId is specified for the same spot in a menu, use the one with the higher priority.
// If a tech doesn't specify a priority, treat as 0. If all priorities are tied, show none of them. This is how Starcraft works (see siege behavior).
kTechDataMenuPriority                   = "menupriority"
// if an alert with higher priority is trigger the interval should be ignored
kTechDataAlertPriority                  = "alertpriority"
// Indicates that the tech node is an upgrade of another tech node, so that the previous tech is still active (ie, if you upgrade a hive
// to an advanced hive, your team still has "hive" technology.
kTechDataUpgradeTech                    = "upgradetech"
// Set true if entity should be rotated before being placed
kTechDataSpecifyOrientation             = "specifyorientation"
// manipulate build coords in a custom function
kTechDataOverrideCoordsMethod           = "overridecoordsmethod"
// Point value for killing structure
kTechDataPointValue                     = "pointvalue"
// Set to false if not yet implemented, for displaying differently for not enabling
kTechDataImplemented                    = "implemented"
// Set to localizable string that will be added to end of description indicating date it went in. 
kTechDataNew                            = "new"
// For setting grow parameter on alien structures
kTechDataGrows                          = "grows"
// Commander hotkey. Not currently used.
kTechDataHotkey                         = "hotkey"
// Alert sound name
kTechDataAlertSound                     = "alertsound"
// Alert text for commander HUD
kTechDataAlertText                      = "alerttext"
// Alert type. These are the types in CommanderUI_GetDynamicMapBlips. "Request" alert types count as player alert requests and show up on the commander HUD as such.
kTechDataAlertType                      = "alerttype"
// Alert scope
kTechDataAlertTeam                      = "alertteam"
// Alert should ignore distance for triggering
kTechDataAlertIgnoreDistance            = "alertignoredistance"
// Alert should also trigger a team message.
kTechDataAlertSendTeamMessage           = "alertsendteammessage"
// Sound that plays for Comm and ordered players when given this order
kTechDataOrderSound                     = "ordersound"
// Don't send alert to originator of this alert 
kTechDataAlertOthersOnly                = "alertothers"
// Usage notes, caveats, etc. for use in commander tooltip (localizable)
kTechDataTooltipInfo                    = "tooltipinfo"
// Quite the same as tooltip, but shorter
kTechDataHint                           = "hintinfo"
// Indicate tech id that we're replicating
// Engagement distance - how close can unit get to it before it can repair or build it
kTechDataEngagementDistance             = "engagementdist"
// Can only be built on infestation
kTechDataRequiresInfestation            = "requiresinfestation"
// Cannot be built on infestation (cannot be specified with kTechDataRequiresInfestation)
kTechDataNotOnInfestation               = "notoninfestation"
// Special ghost-guide method. Called with commander as argument, returns a map of entities with ranges to lit up.
kTechDataGhostGuidesMethod               = "ghostguidesmethod"
// Special requirements for building. Called with techId, the origin and normal for building location and the commander. Returns true if the special requirement is met.
kTechDataBuildRequiresMethod            = "buildrequiresmethod"
// Allows dropping onto other entities
kTechDataAllowStacking                 = "allowstacking"
// will ignore other entities when searching for spawn position
kTechDataCollideWithWorldOnly          = "collidewithworldonly"
// the entity will be optionally attached if it passed the method check
kTechDataOptionalAttachToMethod        = "optionalattach"
// used for gorges
kTechDataMaxAmount = "maxstructureamount"
// requires power
kTechDataRequiresPower = "requirespower"
// for drawing ghost model, client
kTechDataGhostModelClass = "ghostmodelclass"
// for gorge build, can consume when dropping
kTechDataAllowConsumeDrop = "allowconsumedrop"
// true when the host structure requires to be mature
kTechDataRequiresMature = "requiresmature"
// only useable once every X seconds
kTechDataCooldown = "coldownduration"
// ignore any alert interval
kTechDataAlertIgnoreInterval = "ignorealertinterval"
// used for alien upgrades
kTechDataCategory = "techcategory"

function BuildTechData()
    
    local techData = { 
        
        // Ready room player is the default player, hence the ReadyRoomPlayer.kMapName
        { [kTechDataId] = kTechId.ReadyRoomPlayer,        [kTechDataDisplayName] = "READY_ROOM_PLAYER", [kTechDataMapName] = ReadyRoomPlayer.kMapName, [kTechDataModel] = SparkBasicPlayer.kModelName, [kTechDataMaxExtents] = Vector(Player.kXZExtents, Player.kYExtents, Player.kXZExtents) },
        
        // Spectators classes.
        { [kTechDataId] = kTechId.Spectator,              [kTechDataModel] = "" },
        
        // Menus
        { [kTechDataId] = kTechId.RootMenu,              [kTechDataDisplayName] = "SELECT", [kTechDataHotkey] = Move.B, [kTechDataTooltipInfo] = "SELECT_TOOLTIP"},
        { [kTechDataId] = kTechId.BuildMenu,             [kTechDataDisplayName] = "BUILD", [kTechDataHotkey] = Move.W, [kTechDataTooltipInfo] = "BUILD_TOOLTIP"},
        { [kTechDataId] = kTechId.AdvancedMenu,          [kTechDataDisplayName] = "ADVANCED", [kTechDataHotkey] = Move.E, [kTechDataTooltipInfo] = "ADVANCED_TOOLTIP"},
        { [kTechDataId] = kTechId.AssistMenu,            [kTechDataDisplayName] = "ASSIST", [kTechDataHotkey] = Move.R, [kTechDataTooltipInfo] = "ASSIST_TOOLTIP"},
        { [kTechDataId] = kTechId.MarkersMenu,           [kTechDataDisplayName] = "MARKERS", [kTechDataHotkey] = Move.M, [kTechDataTooltipInfo] = "PHEROMONE_TOOLTIP"},
        { [kTechDataId] = kTechId.UpgradesMenu,          [kTechDataDisplayName] = "UPGRADES", [kTechDataHotkey] = Move.U, [kTechDataTooltipInfo] = "TEAM_UPGRADES_TOOLTIP"},
        { [kTechDataId] = kTechId.WeaponsMenu,           [kTechDataDisplayName] = "WEAPONS_MENU", [kTechDataTooltipInfo] = "WEAPONS_MENU_TOOLTIP"},
        
        // Misc.
        { [kTechDataId] = kTechId.Door,                  [kTechDataDisplayName] = "DOOR", [kTechDataTooltipInfo] = "DOOR_TOOLTIP", [kTechDataMapName] = Door.kMapName, [kTechDataMaxHealth] = kDoorHealth, [kTechDataMaxArmor] = kDoorArmor, [kTechDataPointValue] = kDoorPointValue },
        { [kTechDataId] = kTechId.DoorOpen,              [kTechDataDisplayName] = "OPEN_DOOR", [kTechDataHotkey] = Move.O, [kTechDataTooltipInfo] = "OPEN_DOOR_TOOLTIP"},
        { [kTechDataId] = kTechId.DoorClose,             [kTechDataDisplayName] = "CLOSE_DOOR", [kTechDataHotkey] = Move.C, [kTechDataTooltipInfo] = "CLOSE_DOOR_TOOLTIP"},
        { [kTechDataId] = kTechId.DoorLock,              [kTechDataDisplayName] = "LOCK_DOOR", [kTechDataHotkey] = Move.L, [kTechDataTooltipInfo] = "LOCKED_DOOR_TOOLTIP"},
        { [kTechDataId] = kTechId.DoorUnlock,            [kTechDataDisplayName] = "UNLOCK_DOOR", [kTechDataHotkey] = Move.U, [kTechDataTooltipInfo] = "UNLOCK_DOOR_TOOLTIP"},

        { [kTechDataId] = kTechId.DeathTrigger,                                 [kTechDataDisplayName] = "DEATH_TRIGGER",                                   [kTechDataMapName] = DeathTrigger.kMapName, [kTechDataModel] = ""},

    }

    return techData

end

kTechData = nil

function LookupTechId(fieldData, fieldName)

    // Initialize table if necessary
    if(kTechData == nil) then
    
        kTechData = BuildTechData()
        
    end
    
    if fieldName == nil or fieldName == "" then
    
        Print("LookupTechId(%s, %s) called improperly.", tostring(fieldData), tostring(fieldName))
        return kTechId.None
        
    end

    for index,record in ipairs(kTechData) do 
    
        local currentField = record[fieldName]
        
        if(fieldData == currentField) then
        
            return record[kTechDataId]
            
        end

    end
    
    //Print("LookupTechId(%s, %s) returned kTechId.None", fieldData, fieldName)
    
    return kTechId.None

end

// Table of fieldName tables. Each fieldName table is indexed by techId and returns data.
local cachedTechData = {}

function ClearCachedTechData()
    cachedTechData = {}
end

// Returns true or false. If true, return output in "data"
function GetCachedTechData(techId, fieldName)
    
    local entry = cachedTechData[fieldName]
    
    if entry ~= nil then
    
        return entry[techId]
        
    end
        
    return nil
    
end

function SetCachedTechData(techId, fieldName, data)

    local inserted = false
    
    local entry = cachedTechData[fieldName]
    
    if entry == nil then
    
        cachedTechData[fieldName] = {}
        entry = cachedTechData[fieldName]
        
    end
    
    if entry[techId] == nil then
    
        entry[techId] = data
        inserted = true
        
    end
    
    return inserted
    
end

// Call with techId and fieldname (returns nil if field not found). Pass optional
// third parameter to use as default if not found.
function LookupTechData(techId, fieldName, default)

    // Initialize table if necessary
    if(kTechData == nil) then
    
        kTechData = BuildTechData()
        
    end
    
    if techId == nil or techId == 0 or fieldName == nil or fieldName == "" then
    
        /*    
        local techIdString = ""
        if type(tonumber(techId)) == "number" then            
            techIdString = EnumToString(kTechId, techId)
        end
        
        Print("LookupTechData(%s, %s, %s) called improperly.", tostring(techIdString), tostring(fieldName), tostring(default))
        */
        
        return default
        
    end

    local data = GetCachedTechData(techId, fieldName)
    
    if data == nil then
    
        for index,record in ipairs(kTechData) do 
        
            local currentid = record[kTechDataId]

            if(techId == currentid and record[fieldName] ~= nil) then
            
                data = record[fieldName]
                
                break
                
            end
            
        end        
        
        if data == nil then
            data = default
        end
        
        if not SetCachedTechData(techId, fieldName, data) then
            //Print("Didn't insert anything when calling SetCachedTechData(%d, %s, %s)", techId, fieldName, tostring(data))
        else
            //Print("Inserted new field with SetCachedTechData(%d, %s, %s)", techId, fieldName, tostring(data))
        end
    
    end
    
    return data

end

// Returns true if specified class name is used to attach objects to
function GetIsAttachment(className)
    return (className == "TechPoint") or (className == "ResourcePoint")
end

function GetRecycleAmount(techId, upgradeLevel)

    local amount = GetCachedTechData(techId, kTechDataCostKey)
    if techId == kTechId.AdvancedArmory then
        amount = GetCachedTechData(kTechId.Armory, kTechDataCostKey, 0) + GetCachedTechData(kTechId.AdvancedArmoryUpgrade, kTechDataCostKey, 0)
    end

    return amount
    
end
