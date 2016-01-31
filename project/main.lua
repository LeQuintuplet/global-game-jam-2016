-- Libs
Gamestate = require "libs.hump.gamestate"

-- States
gstate_game = require "src.states.game"
gstate_intro = require "src.states.intro"
gstate_over = require "src.states.end"

-- globals
g_gameWon = false
g_levelPast = 0

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(gstate_intro)
end

function love.update(dt)

end

function love.draw()

end
