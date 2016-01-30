-- Libs
Gamestate = require "libs.hump.gamestate"

-- States
local game = require "src.states.game"

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
end

function love.update(dt)
	
end

function love.draw()
	
end
