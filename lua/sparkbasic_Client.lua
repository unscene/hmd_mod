//________________________________
//
//   	NS2 Combat Mod     
//	Made by JimWest and MCMLXXXIV, 2012
//
//________________________________

// Load the script from fsfod that we can hook some functions
Script.Load("lua/PathUtil.lua")
Script.Load("lua/fsfod_scripts.lua")

// Register the files we don't want to ever load.
// Seems to work well but not compatible with the ModSwitcher class yet.
Script.Load("lua/sparkbasic_FileOverrides.lua")

// Load network messages here.

// Loading the Hook classes

// Load the normal Ns2 Server Scripts
Script.Load("lua/Client.lua")

// new functions and classes with no hooks

// Tell the class hooker that we've fully loaded.
ClassHooker:OnLuaFullyLoaded()
