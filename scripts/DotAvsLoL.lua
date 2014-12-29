if DotAvsLoL == nil then
    DotAvsLoL = {}
    DotAvsLoL.__index = DotAvsLoL
end

function DotAvsLoL:new (o)
    o = o or {}
    setmetatable(o, self)
    REFERENCE = o
    return o
end

function DotAvsLoL:InitGameMode()

	Msg("Hello World, My name is TrollsAndElves!")
	
	ListenToGameEvent("dota_item_purchased", Dynamic_Wrap(DotAvsLoL, "UpdateAP"), self)
       
end

function DotAvsLoL:UpdateAP(keys)
	local caster=EntIndexToHScript(PlayerResource:GetPlayer(keys.PlayerID))
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = 0

	if caster:HasItemInInventory("item_vitality_booster")==true then
	AP=AP+1000
	end
	
	Data.AbilityPower=AP
end