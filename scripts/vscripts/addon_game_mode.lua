if dotavslol == nil then
	dotavslol = class({})
end

-- Precache resources
function Precache( context )
	PrecacheResource( "particle_folder", "particles/frostivus_gameplay", context )
end

-- Actually make the game mode when we activate
function Activate()
	GameRules.addondotavslol = dotavslol()
	GameRules.addondotavslol:InitGameMode()
end


function dotavslol:InitGameMode()
	

	print("Hello World, My name is TrollsAndElves!")
	-- Hook into game events allowing reload of functions at run time
	ListenToGameEvent( "dota_item_purchased", Dynamic_Wrap( dotavslol, "UpdateAP" ), self )
end

--------------------------------------------------------------------------------


function dotavslol:UpdateAP(keys)
	local caster=EntIndexToHScript(PlayerResource:GetPlayer(keys.PlayerID))
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = 0

	if caster:HasItemInInventory("item_vitality_booster")==true then
	AP=AP+1000
	end
	
	Data.AbilityPower=AP
end
