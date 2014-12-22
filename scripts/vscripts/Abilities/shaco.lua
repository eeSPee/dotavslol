function MakeClone(keys)
	local caster=keys.caster
	local playerowner = caster.GetPlayerOwner(caster)
	
	local isTrue = caster:IsIllusion()
	local hasAbility = caster:FindAbilityByName("jester_isclone")
			if (isTrue==true and hasAbility~=nil) then
				AddAbility("jester_isclone")
				local nAbility=unit:FindAbilityByName("jester_isclone")
				nAbility:SetLevel(1)	
			end
	
end

function BackStab(keys)
	local caster=keys.caster
	local tarhet=keys.target
	
	if tarhet~=nil then
		
		local angleO=caster:EyeAngles()
		local angleT=tarhet:EyeAngles()
		local angleMAX=angleT.y+90
		local angleMIN=angleT.y-90	
		
		if angleMAX>=360 then
		angleMAX=angleMAX-360
		end
		if angleMIN<0 then
		angleMIN=angleMIN+360
		end
		
		local ability = keys.ability	
		local DMJ = (caster:GetAttackDamage())*ability:GetLevelSpecialValueFor("damagemult",ability:GetLevel())

		print("facing " .. tostring(angleT.y) .. " but needs " .. tostring(angleMIN) .. " or " .. tostring(angleMAX))
		print(angleO.y>=angleMIN and angleO.y<=angleMAX and angleMIN<angleMAX)
		print(angleO.y>=0 and angleO.y<angleMAX and angleMIN>angleMAX)
		print(angleO.y<=360 and angleO.y>angleMIN and angleMIN>angleMAX)
		
		if (angleO.y>=angleMIN and angleO.y<=angleMAX and angleMIN<angleMAX) or (angleO.y>=0 and angleO.y<angleMAX and angleMIN>angleMAX) or (angleO.y<=360 and angleO.y>angleMIN and angleMIN>angleMAX) then
			local damageTable = {
			victim = tarhet,
			attacker = caster,
			damage  = DMJ,
			damage_type = DAMAGE_TYPE_PHYSICAL,
			}
			ApplyDamage(damageTable)
		end
	
	print(DMJ)
	end
end

function PassiveBlind(keys)
	local caster=keys.caster
	local tarhet=keys.target
	
	if tarhet~=nil then
		local booleaqn=tarhet:IsRealHero()
		
		if booleaqn==true then
		tarhet:RemoveModifierByName("modifier_shiv_blind")
		end
	end
end
