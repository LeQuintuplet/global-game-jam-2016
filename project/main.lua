-- Libs
Gamestate = require "libs.hump.gamestate"

-- States
gstate_game = require "src.states.game"
gstate_intro = require "src.states.intro"

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(gstate_intro)
end

function love.update(dt)

end

function love.draw()

end
