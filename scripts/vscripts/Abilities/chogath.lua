function AddStack(keys)
	local caster=keys.ability:GetCaster()
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)

	if DataCounter.ChoGathStacks~=6 then
		DataCounter.ChoGathStacks=DataCounter.ChoGathStacks+1
	end
	
	local ability = keys.ability
	local level = ability:GetLevel()
		
	caster:SetModifierStackCount("modifier_feast_bonus",nil,DataCounter.ChoGathStacks)
		
	local scale=(100+ability:GetLevelSpecialValueFor("stack_scale",level)*DataCounter.ChoGathStacks)/100
	caster:SetModelScale(scale)	
end

function RemoveStacks(keys)
	local caster=keys.caster
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	
	if DataCounter.ChoGathStacks~=0 then
	
	DataCounter.ChoGathStacks=math.ceil(DataCounter.ChoGathStacks/2-1)
	
	local ability = keys.ability
	local level = ability:GetLevel()
		
	caster:SetModifierStackCount("modifier_feast_bonus",nil,DataCounter.ChoGathStacks)
	
	local scale=(100+ability:GetLevelSpecialValueFor("stack_scale",level)*DataCounter.ChoGathStacks)/100
	caster:SetModelScale(scale)
		if DataCounter.ChoGathStacks==0 then
		caster:SetModifierStackCount("modifier_feast_bonus",nil,0)	
		caster:RemoveModifierByName("modifier_feast_bonus")
		end
	end			
end


function UpdateStack(keys)
	local caster=keys.caster
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	local ability = keys.ability
	
	if DataCounter.ChoGathStacks~=0 then
		
	local ability = keys.ability
	local level = ability:GetLevel()
		
	caster:SetModifierStackCount("modifier_feast_bonus",nil,DataCounter.ChoGathStacks)
	
	local scale=(100+ability:GetLevelSpecialValueFor("stack_scale",level)*DataCounter.ChoGathStacks)/100
	caster:SetModelScale(scale)
	else
	caster:SetModifierStackCount("modifier_feast_bonus",nil,0)	
	caster:RemoveModifierByName("modifier_feast_bonus")
	end	
	
end

function AddStackOld(keys)
	local caster=keys.caster
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)

	if DataCounter.ChoGathStacks~=6 then
		DataCounter.ChoGathStacks=DataCounter.ChoGathStacks+1
	end
	
	local ability = keys.ability
	local level = ability:GetLevel()
	
	local dummyab = "greenterror_HP" .. tostring(level)
	
	if DataCounter.ChoGathStackAbility~=dummyab then
	caster:RemoveAbility(DataCounter.ChoGathStackAbility)
	caster:RemoveModifierByName("modifier_feast_bonus")
	caster:AddAbility(dummyab)	
	DataCounter.ChoGathStackAbility=dummyab	
	end
	
	local abilite=caster:FindAbilityByName(dummyab)
	abilite:SetLevel(DataCounter.ChoGathStacks)	
	
	local scale=(100+abilite:GetLevelSpecialValueFor("stack_scale",DataCounter.ChoGathStacks))/100
	caster:SetModelScale(scale)	
end

function OldRemoveStacks(keys)
	local caster=keys.caster
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	
	if DataCounter.ChoGathStacks~=0 then
	
	DataCounter.ChoGathStacks=math.ceil(DataCounter.ChoGathStacks/2)
	
	local ability = keys.ability
	local level = ability:GetLevel()
	
	local dummyab = "greenterror_HP" .. tostring(level)
	
	if DataCounter.ChoGathStackAbility~=dummyab then
	caster:RemoveAbility(DataCounter.ChoGathStackAbility)
	caster:RemoveModifierByName("modifier_feast_bonus")
	caster:AddAbility(dummyab)	
	DataCounter.ChoGathStackAbility=dummyab	
	end
	
	local abilite=caster:FindAbilityByName(dummyab)
	abilite:SetLevel(DataCounter.ChoGathStacks)		
	
	local scale=(100+abilite:GetLevelSpecialValueFor("stack_scale",DataCounter.ChoGathStacks))/100
	caster:SetModelScale(scale)			
	end			
end

function OldUpdateStack(keys)
	local caster=keys.caster
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	local ability = keys.ability
	
	if DataCounter.ChoGathStacks~=0 then
	
	local ability = keys.ability
	local level = ability:GetLevel()
	
	local dummyab = "greenterror_HP" .. tostring(level)
		
	if DataCounter.ChoGathStackAbility~=dummyab then
	caster:RemoveAbility(DataCounter.ChoGathStackAbility)
	caster:RemoveModifierByName("modifier_feast_bonus")
	caster:AddAbility(dummyab)	
	DataCounter.ChoGathStackAbility=dummyab	
	end
		
	local abilite=caster:FindAbilityByName(dummyab)
	abilite:SetLevel(DataCounter.ChoGathStacks)		
	
	local scale=(100+abilite:GetLevelSpecialValueFor("stack_scale",DataCounter.ChoGathStacks))/100
	caster:SetModelScale(scale)	
	
	end
	
end

function Bite(keys)
	local caster=keys.caster
	local tarhet=keys.target
	local ability=keys.ability
	
	if tarhet~=nil then
		
		local DMJ=keys.Damage
		
		if (tarhet:IsHero()~=true) then
			DMJ=1000
			local Time=ability:GetCooldownTimeRemaining()/2				
			ability:EndCooldown()	
			ability:StartCooldown(Time)	
			caster:GiveMana(ability:GetManaCost(ability:GetLevel())/2);
		end
		local damageTable = {
			victim = tarhet,
			attacker = caster,
			damage  = DMJ,
			damage_type = DAMAGE_TYPE_PURE,
			}
			ApplyDamage(damageTable)
	end
end