-- Libs
Gamestate = require "libs.hump.gamestate"

-- States
gstate_game = require "src.states.game"
gstate_intro = require "src.states.intro"
gstate_over = require "src.states.end"

-- globals
g_gameWon = false
g_levelPast = 0

-- sounds
s_nope = love.audio.newSource("sfx/nope.ogg", "stream")
s_changeRoom = love.audio.newSource("sfx/changeRoom.ogg", "stream")
s_beastComing = love.audio.newSource("sfx/heartbeat.wav", "stream")
s_beastComing:setLooping(true)

maps = { 
	require "src/levels/level2-1",
	require "src/levels/level2-2",
	require "src/levels/level2-3",
	require "src/levels/level2-4",
}

print("game rdy")

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(gstate_intro)
end

function love.update(dt)

end

function love.draw()

end
