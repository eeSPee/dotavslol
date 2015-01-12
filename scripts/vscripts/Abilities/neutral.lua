function ApplyBlueBuff(keys)

	local target=keys.target
	if target==nil then
	target=keys.attacker
	end
	
	local ability=keys.ability
	
	target:RemoveModifierByName("BlueBuff")
	
	target:AddAbility("lol_BluePassive_dummy")
		
	local Zim=GetAbilityByName(target,"lol_BluePassive_dummy")
	if Zim~=nil then
		Zim:SetLevel(1)
	end
	target:RemoveModifierByName("DummyBlueBuff")
end

function ApplyRedBuff(keys)

	local target=keys.target
	if target==nil then
	target=keys.attacker
	end
	
	local ability=keys.ability
	
	target:RemoveModifierByName("RedBuff")
	
	local abilityname="lol_RedPassive_melee"
	if target:IsRangedAttacker()==true then
	abilityname="lol_RedPassive_ranged"	
	end
	
	target:AddAbility(abilityname)
	
	local Zim=GetAbilityByName(target,abilityname)
	if Zim~=nil then
		Zim:SetLevel(1)
		if target:GetLevel()>5 then
		Zim:SetLevel(2)
		elseif target:GetLevel()>10 then
		Zim:SetLevel(3)
		end
	end
	target:RemoveModifierByName("DummyRedBuff")
end

function GetAbilityByName(unit,name)
	
	local ability=nil
	for i=0,unit:GetAbilityCount() do
		local Zim=unit:GetAbilityByIndex(i)
		if Zim~=nil and Zim:GetAbilityName()==name then
			ability=Zim
		end
	end
	return ability
end