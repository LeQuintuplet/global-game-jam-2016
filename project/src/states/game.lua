-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

-- render
local Room_audio = require "src.render.Room_audio"

local game = {} -- module start

-- level config start
game.level = Level.new(120, 3)
local room1 = Room.new("Cuisine", false, true, true, false)
local room2 = Room.new("Salon", true, false, true, true)
local room3 = Room.new("Toilette", true, false, false, true)
local room4 = Room.new("Chambre", true, true, false, false)
local room5 = Room.new("Salle de bain", false, true, true, false)
local room6 = Room.new("Bureau", false, false, false, true)

local placeHolder = Room.new(" ", false, false, false, false)

Room.addAmbiantSound( room1, "music/wind.ogg" )
Room.addActionSound( room1, "sfx/fouille.ogg" )
Room.addActionSound( room1, "sfx/avion.ogg" )

Room.generateRender( room1 )

Level.addRoom(game.level, room1, 2, 1)
Level.addRoom(game.level, room2, 2, 2)
Level.addRoom(game.level, room3, 2, 3)
Level.addRoom(game.level, room4, 1, 3)
Level.addRoom(game.level, room5, 1, 2)
Level.addRoom(game.level, room6, 3, 1)

Level.addRoom(game.level, placeHolder, 1, 1)
Level.addRoom(game.level, placeHolder, 3, 2)
Level.addRoom(game.level, placeHolder, 3, 3)

Level.setPlayerPos(game.level, 2, 2)
-- level config end

function game:enter()
	print("Current state : game")
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
