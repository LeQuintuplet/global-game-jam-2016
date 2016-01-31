local intro = {} -- module start

local pics = {
	"img/credits_1.jpg",
	"img/oppening_0.jpg",
	"img/oppening_1.jpg",
	"img/oppening_2.jpg",
	"img/player_one_bis.jpg",
	"img/player_two_bis.jpg",
}

local currentPic
local middleX
local state

function intro:enter()
	print("#> Current state : intro")

	-- pics.credits = love.graphics.newImage( pics.credits )
	-- pics.gamePad = love.graphics.newImage( pics.gamePad )
	-- pics.instructions = love.graphics.newImage( pics.instructions )
	-- pics.menu = love.graphics.newImage( pics.menu )

	for i,v in ipairs(pics) do
		pics[i] = love.graphics.newImage( pics[i] )
	end

	state = 1
	currentPic = pics.credits
	middleX = love.graphics.getDimensions()
	middleX = middleX/2
end

function intro:update(dt)
	currentPic = pics[state]
end

function intro:draw()
	love.graphics.draw( currentPic, middleX-(currentPic:getDimensions()/2) )
end

function intro.gamepadConnected()
	local joystick =  love.joystick.getJoysticks()
	g_gamepad = joystick[1]
	if g_gamepad then
		print("gamepad plugged, loading game")
	else
		print("plug a gamePad please")
		state = 2
	end
end

function intro:keypressed(key)
   if key == "space" then
       state = state + 1
   end
   if state == 3 then
       intro.gamepadConnected()
   end
   if state > #pics then
       Gamestate.switch(gstate_game)
   end
   if key == "escape" then
      love.event.quit()
   end
end

return intro -- module end
