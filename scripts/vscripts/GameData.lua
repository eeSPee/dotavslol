GameData = {}
GameData.Schema = {}

function GameData:AddSchema(schemaname, data)
	self.Schema[schemaname] = {
		Default = data,
		Entries = {}
	}
end

function GameData:For(schemaname, ent)
	local ret = self.Schema[schemaname].Entries[ent] or self:Assign(schemaname, ent)
	return ret
end

function GameData:Assign(schemaname, entobj)
	local data = self.Schema[schemaname].Default
	local bind = TableCopy(data)
	bind.Ent = entobj
	self.Schema[schemaname].Entries[entobj] = bind
	return self.Schema[schemaname].Entries[entobj] --better way?
end

function TableCopy(table)
	local ret = {}
	for k,v in pairs(table) do 
		ret[k] = v
	end
	return ret
end

PlayerDataCounter = {
	AbilityPower = 1000,	
	NuNuStacks = 0,	
	NunuUltiCharges = 0,	
	CorkiMissiles = 4,		
	CorkiMissilesShot = 0,		
	ChoGathStacks = 0,	
	ChoGathStackAbility = nil	
}

BrushData = {
	DireHeroes = false,
	RadiantHeroes = false,	
	BrushesInVicinity = {}	
}

GameData:AddSchema("DataCounter", PlayerDataCounter)
GameData:AddSchema("BrushData", BrushData)