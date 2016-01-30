local intro = {} -- module start

local pics = {
	credits = "img/firstFrame.png",
	gamePad = "img/secondFrame.png",
	instructions = "img/thirdFrame.png",
}

local currentPic
local middleX
local state
function intro:enter()
	print("Current state : intro")
	pics.credits = love.graphics.newImage( pics.credits )
	pics.gamePad = love.graphics.newImage( pics.gamePad )
	pics.instructions = love.graphics.newImage( pics.instructions )
	currentPic = pics.credits
	timer = 0
	middleX = love.graphics.getDimensions()
	middleX = middleX/2
	state = 0
end

function intro:update(dt)
	if state == 1 then
		currentPic = pics.instructions
	end
	if state == 2 then
		currentPic = pics.gamePad
        end
end

function intro:draw()
	love.graphics.draw( currentPic, middleX-(currentPic:getDimensions()/2) )
end

function intro.gamepadConnected()
	local joystick =  love.joystick.getJoysticks()
	g_gamepad = joystick[1]
	if g_gamepad then
		print("gamepad plugged, loading game")
		Gamestate.switch(gstate_game)
	else
		print("plug a gamePad please")
	end
end

function intro:keypressed(key)
   if key == "space" then
       state = state + 1
   end
   if state > 2 then
       intro.gamepadConnected()
   end
   if key == "escape" then
      love.event.quit()
   end
end

return intro -- module end
