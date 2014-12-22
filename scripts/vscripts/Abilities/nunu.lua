function ActivatePassive(keys)    
    local caster = keys.caster	
	local ability = keys.ability	
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	
	if DataCounter.NuNuStacks==5 then
	ability:RefundManaCost()
	DataCounter.NuNuStacks=0
	else
	DataCounter.NuNuStacks=DataCounter.NuNuStacks+1
	end
	print(DataCounter.NuNuStacks)
end

function NunuBite(keys)    
    local caster = keys.caster	
	local ability = keys.ability	
	local target = keys.target	
	local nameit = target:GetUnitName()
	
	local abilityname="nope"
	
	if nameit=="npc_" then
		abilityname="nunu_passive_damage"	
	end
	
	if nameit=="npc_" then
		abilityname="nunu_passive_life"	
	end
	
	if nameit=="npc_" then
		abilityname="nunu_passive_speed"	
	end
	
	if abilityname~="nope" then
	caster:AddAbility(abilityname)
	local buffab=caster:FindAbilityByName(abilityname)
	buffab:SetLevel(ability:GetLevel())
	end
	
end

function damageofmaxHP(keys)
	local caster=keys.caster
	local targ=keys.target
	local ability=keys.ability
	
	local MAX=caster:GetMaxHealth()
	local Scale=1
	
	if caster:HasModifier("nunu_passive_life") then
	Scale=1.1
	end
		
	local DMJ = Scale*MAX/100	
	
	local damageTable = {
	victim = targ,
	attacker = caster,
	damage = DMJ,
	damage_type = DAMAGE_TYPE_MAGICAL,
	}
	ApplyDamage(damageTable)	
end

function NunuUltAddStack(keys)    
    local caster = keys.caster	
	local ability = keys.ability	
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	
	if DataCounter.NunuUltiCharges~=12 then
		DataCounter.NunuUltiCharges=DataCounter.NunuUltiCharges+1
	end
	print("Charging")
end

function NunuUltDamageEnd(keys)    
    local caster = keys.caster	
	local ability = keys.ability	
	local targ=keys.target
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)	
	local DamagePerStack=ability:GetLevelSpecialValueFor("damage",ability:GetLevel())/12
	local APPerStack=(2.5*DataCounter.AbilityPower)/12
	local DMJ=(DamagePerStack+APPerStack)*DataCounter.NunuUltiCharges
	
	local damageTable = {
	victim = targ,
	attacker = caster,
	damage = DMJ,
	damage_type = DAMAGE_TYPE_MAGICAL,
	}
	ApplyDamage(damageTable)
end

function NunuUltClearStacks(keys)    
    local caster = keys.caster	
	local ability = keys.ability	
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	
	DataCounter.NunuUltiCharges=0
end