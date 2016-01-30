-- Libs
Gamestate = require "libs.hump.gamestate"

-- States
local game = require "src.states.game"
local intro = require "src.states.intro"

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(intro)
end

function love.update(dt)

end

function love.draw()

end
