function indexOf( t, object )
    if "table" == type( t ) then
        for i = 1, #t do
            if object == t[i] then
                return i
            end
        end
        return -1
    else
            error("table.indexOf expects table for first argument, " .. type(t) .. " given")
    end
end

function Init(keys)

	local BrushData = GameData:For("BrushData",keys.caster:GetEntityIndex())
		
	BrushData.DireHeroes=false
	BrushData.RadiantHeroes=false
	table.insert(BrushData.BrushesInVicinity,keys.caster:GetEntityIndex())
	
end

function Unite(keys)

	local Caster=keys.caster
	local Target=keys.target
		
	if Target:GetUnitName()=="LoL_dummyunit_brush" then		
		
		Merge(Caster:GetEntityIndex(),Target:GetEntityIndex())		
		
	end
end

function Merge( Caster, Target)
		
		local BrushData = GameData:For("BrushData",Caster)
		local BrushDataTwo = GameData:For("BrushData",Target)		
			
		if indexOf(Target,BrushData.BrushesInVicinity)==-1 then
		
			if indexOf(Caster,BrushData.BrushesInVicinity)==-1 then
			table.insert(BrushData.BrushesInVicinity,Caster)
			end 
			
			table.insert(BrushDataTwo.BrushesInVicinity,Target)
			
			for X = 0, table.getn(BrushData.BrushesInVicinity),1 do		
				if nil~=BrushData.BrushesInVicinity[X] and Target~=BrushData.BrushesInVicinity[X] and Caster~=BrushData.BrushesInVicinity[X] then
					Merge(Target,BrushData.BrushesInVicinity[X])
				end									
			end
			
		end
end



function Cleanse(keys)

	local BrushData = GameData:For("BrushData",keys.caster:GetEntityIndex())
		
	BrushData.DireHeroes=false
	BrushData.RadiantHeroes=false
	
	print(table.getn(BrushData.BrushesInVicinity))
end

function FindUnits(keys)

	local Caster=keys.caster
	local Target=keys.target
	local BrushData = GameData:For("BrushData",Caster:GetEntityIndex())
		
		
	if Target:GetUnitName()~="LoL_dummyunit_brush" and Target~=Caster then
	
		if Target:GetTeamNumber()==3 then								
			for i = 0, table.getn(BrushData.BrushesInVicinity),1 do
				if BrushData.BrushesInVicinity[i]~=nil then
				local BrushDataTwo = GameData:For("BrushData",BrushData.BrushesInVicinity[i])
				
				BrushDataTwo.DireHeroes=true
				end
			end		
		end
		
		if Target:GetTeamNumber()==2 then				
										
			for i = 0, table.getn(BrushData.BrushesInVicinity),1 do
				if BrushData.BrushesInVicinity[i]~=nil then
				local BrushDataTwo = GameData:For("BrushData",BrushData.BrushesInVicinity[i])
				
				BrushDataTwo.RadiantHeroes=true
				end
			end	
		end		
	end	

end

function RemoveModifiers(keys)
	local BrushData = GameData:For("BrushData",keys.caster:GetEntityIndex())
	local Target=keys.target
	
		if BrushData.RadiantHeroes==true and BrushData.DireHeroes==true then	
			Target:RemoveModifierByNameAndCaster("brush_invizabiliteh",keys.caster)
		end

end