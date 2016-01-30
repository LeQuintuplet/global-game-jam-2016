-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

local game = {} -- module start
local map

function game:enter()
	-- map
	local maps = { require "src/levels/mapTest",
				   require "src/levels/level1",
				   require "src/levels/mapTest",
				   require "src/levels/level1",
				}

	print("Current state : game")
	map = maps[love.math.random(4)]
	game.level = map.level
	Level.setPlayerPosAlea(game.level)
end

function game:update(dt)
end

function game:draw()
end

function game:gamepadpressed( joystick, button )
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
			Room.StopAudio( Level.getRoom(game.level) )
			Level.playerMove(game.level, move)
			Room.StartAudio( Level.getRoom(game.level) )
			Level.playerInfo(game.level)
		else
			print("!! Déplacement impossible")
		end
	end

	-- Action
	if button == "a" then 
		Room.shortAction( Level.getRoom(game.level) )
	elseif button == "b" then
		Room.longAction( Level.getRoom(game.level) )
	end
end

return game -- module end
