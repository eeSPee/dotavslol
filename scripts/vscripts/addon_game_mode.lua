if dotavslol == nil then
	dotavslol = class({})
end

require("GameData")

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = dotavslol()
	GameRules.AddonTemplate:InitGameMode()
end

function dotavslol:InitGameMode()

	print( "dotavslol addon is loaded." )	
	
end

--------------------------------------------------------------------------------



