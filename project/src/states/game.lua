-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

-- globals
g_ignoreInput = 0
g_discoveryTime = 0
g_timeToHide = 5

-- local
local map
local level_blueprint = {
	"img/mapt2p1.png",
	"img/mapt2p2.png",
	"img/mapt2p3.png",
	"img/mapt2p4.png",
}
local blueprint_index = 0
local middleX
local beastComing = false

local game = {} -- module start

-- entré dans l'état
-- choix aléatoire map
-- position aléatoire du joueur
function game:enter()
	-- map
	local maps = { 
		require "src/levels/level2-1",
		require "src/levels/level2-1",
		require "src/levels/level2-1",
		require "src/levels/level2-1",
	}

	print("#> Current state : game")
	love.math.setRandomSeed( os.time() )
	map = maps[love.math.random(4)]
	-- init
	game.level = map.level
	Level.setPlayerPosAlea(game.level)
	g_discoveryTime = game.level.discoveryTime
	-- draw
	middleX = love.graphics.getWidth() / 2

	love.graphics.setBackgroundColor(220, 220, 220)

	for i,v in ipairs(level_blueprint) do
		level_blueprint[i] = love.graphics.newImage( level_blueprint[i] )
	end

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
		if beastComing == false then 
			beastComing = true
			s_beastComing:play()
		end

	-- player hidden when the beast is here
	elseif g_discoveryTime < 0 and g_timeToHide < 0 then
		s_beastComing:stop()
		
		if Level.getRoom(game.level).isSafe then
			g_discoveryTime = game.level.discoveryTime
			g_timeToHide = 10
			beastComing = false
			print("> nice one, keep it up")
		else
			print("> DED !")
			g_gameWon = false
			Gamestate.switch(gstate_over)
		end
	end

end

function game:draw()
	-- map
	love.graphics.setColor( 255, 255, 255 )
	local currentPic = level_blueprint[ (blueprint_index%4) + 1]
	local scale = (love.graphics.getHeight()-40) / currentPic:getHeight()
	love.graphics.draw( currentPic, middleX -(currentPic:getWidth()*scale/2), 20, 0, scale, scale  )
	-- text
	love.graphics.setColor( 0, 0, 0 )
	love.graphics.print( "Press left and right to show the other map", 20, 20)
	love.graphics.print( tostring((blueprint_index%4) + 1), 20, 40)
	if beastComing == true then
		love.graphics.print( "Something dangerous is comming ! Run to a safe zone", 20, 60)
	end
end

function game:keypressed( key, scancode, isrepeat )
	-- changement map
	if scancode == "left" then blueprint_index = blueprint_index - 1
	elseif scancode == "right" then blueprint_index = blueprint_index + 1
	end
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
				s_changeRoom:play()
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
