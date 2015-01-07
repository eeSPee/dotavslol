if dotavslol == nil then
	dotavslol = class({})
end

require("GameData")

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = dotavslol()
	GameRules.AddonTemplate:InitGameMode()
end

function dotavslol:InitGameMode()

	print( "dotavslol addon is loaded." )	
	ListenToGameEvent("dota_item_purchased", Dynamic_Wrap(dotavslol, "UpdateAP"), self)
end

--------------------------------------------------------------------------------


function dotavslol:UpdateAP(keys)
	print("Dotavslol: updatedap")
	
	local player = PlayerResource:GetPlayer(keys.PlayerID)
	local caster = player:GetAssignedHero()
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = 0
	local CDR = 0

	if caster:HasItemInInventory("item_vitality_booster")==true then
	AP=AP+1000
	CDR=0.4
	end
	
	Data.AbilityPower=AP
	Data.CDRpercent=CDR	

end

