-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

-- globals
g_ignoreInput = 0
g_discoveryTime = 0
g_timeToHide = 20

local game = {} -- module start
local map

-- entré dans l'état
-- choix aléatoire map
-- position aléatoire du joueur
function game:enter()
	-- map
	local maps = { require "src/levels/mapTest",
				   require "src/levels/level1",
				   require "src/levels/mapTest",
				   require "src/levels/level1",
				}

	print("#> Current state : game")
	map = maps[love.math.random(4)]
	game.level = map.level
	Level.setPlayerPosAlea(game.level)
	g_discoveryTime = game.level.discoveryTime
end

function game:update(dt)

	-- empêche le joueur de bouger pour un certain temps
	if g_ignoreInput >= 0 then
		g_ignoreInput = g_ignoreInput - dt
	end

	-- discovery step
	if g_discoveryTime >= 0 then
		g_discoveryTime = g_discoveryTime - dt

	-- hidding step
	elseif g_discoveryTime < 0 and g_timeToHide >= 0 then
		g_timeToHide = g_timeToHide - dt

	-- player hidden when the beast is here
	elseif g_discoveryTime < 0 and g_timeToHide < 0 then
		if Level.getRoom(game.level).isSafe then
			g_discoveryTime = game.level.discoveryTime
			g_timeToHide = 10
			print("> nice one, keep it up")
		else
			print("> DED !")
			g_gameWon = false
			Gamestate.switch(gstate_over)
		end
	end

end

function game:draw()
end

function game:gamepadpressed( joystick, button )
	if g_ignoreInput < 0 then

		-- Movement
		local move
		if button == "dpup" then move = "up"
		elseif button == "dpright" then move = "right"
		elseif button == "dpdown" then move = "down"
		elseif button == "dpleft" then move = "left"
		end

		if move then
			print()
			if Level.playerMoveAllowed(game.level, move) then
				-- stop le son de la pièce
				Room.StopAudio( Level.getRoom(game.level) )
				-- change de pièce
				Level.playerMove(game.level, move)
				-- block move for simulating moving
				g_ignoreInput = 1
				-- démare le son de la pièce
				Room.StartAudio( Level.getRoom(game.level) )

				Level.playerInfo(game.level)
			else
				print("!! Déplacement impossible")
			end
		end

		-- Actions
		if button == "a" then 
			Room.shortAction( Level.getRoom(game.level) )
		elseif button == "b" then
			Room.longAction( Level.getRoom(game.level) )
		end

	else
		print("!! You're still moving")
	end

end

return game -- module end
