function AddAPCDR(keys)
	local caster=keys.caster
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local ability=keys.ability
	
	local AP = ability:GetLevelSpecialValueFor("APbonus",ability:GetLevel()) or 0
	local CDR = ability:GetLevelSpecialValueFor("CDbonus",ability:GetLevel()) or 0

	Data.CDRpercent=Data.CDRpercent+CDR/100
	Data.AbilityPower=Data.AbilityPower+AP
end

function RemoveAPCDR(keys)
	local caster=keys.caster
	local ability=keys.ability
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = ability:GetLevelSpecialValueFor("APbonus",ability:GetLevel()) or 0
	local CDR = ability:GetLevelSpecialValueFor("CDbonus",ability:GetLevel()) or 0

	Data.CDRpercent=Data.CDRpercent-CDR/100
	Data.AbilityPower=Data.AbilityPower-AP
	
	if Data.CDRpercent<0 then
	Data.CDRpercent=0
	end
	if Data.AbilityPower<0 then
	Data.AbilityPower=0
	end
end

function HandleCDR(keys)
	local caster=keys.caster
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local ability=keys.ability
	local CDR = Data.CDRpercent
	if CDR>0.4 then
	CDR=0.4
	end
	
	local Time=ability:GetCooldown(ability:GetLevel())*(1-CDR)
	
	ability:EndCooldown()	
	ability:StartCooldown(Time)	
end