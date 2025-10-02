ENABLE_DEBUG_LOG = false
-- get current variant
local variant = Tracker.ActiveVariantUID

-- check variant info
IS_PSEUDOTRACKING = variant:find("eventpseudotracking")

print("-- Pokemon Red/Blue Archipelago Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/watch.lua")
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/custom_items.lua")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/options.json")
Tracker:AddItems("items/dexsanity.json")
Tracker:AddItems("items/trainersanity.json")
Tracker:AddItems("items/events.json")

-- Maps
Tracker:AddMaps("maps/maps.json") 
   
-- Locations
Tracker:AddLocations("locations/locations.json")
Tracker:AddLocations("locations/encountertab.json")
Tracker:AddLocations("locations/pokedex.json")
Tracker:AddLocations("locations/submaps_singlechecks.json")
Tracker:AddLocations("locations/submaps_groupchecks.json")

-- Layout
Tracker:AddLayouts("layouts/items_main_1_full.json")
Tracker:AddLayouts("layouts/itemgrids.json")
Tracker:AddLayouts("layouts/eventgrid.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/settings_quick.json")
Tracker:AddLayouts("layouts/submaps.json")
Tracker:AddLayouts("layouts/tabs_single.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
ScriptHost:LoadScript("scripts/autotracking.lua")

-- Adds Watches for Item Grid Toggles
ScriptHost:AddWatchForCode("opt_cardkey", "opt_cardkey", toggle_itemgrid)
ScriptHost:AddWatchForCode("opt_stonesanity", "opt_stonesanity", toggle_itemgrid)
ScriptHost:AddWatchForCode("opt_extra_key_items", "opt_extra_key_items", toggle_maingrid)
ScriptHost:AddWatchForCode("opt_tea", "opt_tea", toggle_maingrid)

-- Adds Watches for Option Toggles
ScriptHost:AddWatchForCode("colormap", "colormap", toggle_grayscale)
ScriptHost:AddWatchForCode("splitmap", "splitmap", toggle_splitmap)

initialize_watch_items()

--for i = 1, 151 do
--    local obj = Tracker:FindObjectForCode("dexsanity_" .. i)
--    if obj then
--        obj.Active = true
--    end
--end