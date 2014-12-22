function GiveStack(keys)
	local caster=keys.caster
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)

	if DataCounter.CorkiMissiles~=8 then
		DataCounter.CorkiMissiles=DataCounter.CorkiMissiles+1
	end
end

function FireMissile(keys)
	local caster=keys.caster
	local abilite=keys.ability
	local pct=keys.target_points[1]
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	local ab=caster:FindAbilityByName("gyro_missile_small")
	
	if DataCounter.CorkiMissiles>=1 then
		if DataCounter.CorkiMissilesShot<4 then
			DataCounter.CorkiMissilesShot=DataCounter.CorkiMissilesShot+1			
			ab:SetLevel(abilite:GetLevel())
			caster:CastAbilityOnPosition(pct,ab,0)
		else
			DataCounter.CorkiMissilesShot=0
			ab=caster:FindAbilityByName("gyro_missile_big")			
			ab:SetLevel(abilite:GetLevel())
			caster:CastAbilityOnPosition(pct,ab,0)
		end	
		print(ab)
		
		DataCounter.CorkiMissiles=DataCounter.CorkiMissiles-1
	else
		abilite:RefundManaCost()
	end
end

function BulletCone(keys)
	local caster=keys.caster
	local abilite=keys.ability
	local pct=caster:GetForwardVector()
	
	print("boop")
	
	local info = 
	{
		Ability = keys.ability,
        	EffectName = keys.EffectName,
        	vSpawnOrigin = caster:GetAbsOrigin(),
        	fDistance = keys.FixedDistance,
        	fStartRadius = keys.StartRadius,
        	fEndRadius = keys.EndRadius,
        	Source = caster,
        	bHasFrontalCone = false,
        	bReplaceExisting = false,
        	iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        	iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
        	iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        	fExpireTime = GameRules:GetGameTime() + keys.FixedDistance/keys.MoveSpeed,
		bDeleteOnHit = false,
		vVelocity = caster:GetForwardVector() * keys.MoveSpeed,
		bProvidesVision = false
	}
	projectile = ProjectileManager:CreateLinearProjectile(info)
end