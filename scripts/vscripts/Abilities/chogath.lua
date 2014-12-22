function AddStack(keys)
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

function RemoveStacks(keys)
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

function UpdateStack(keys)
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

