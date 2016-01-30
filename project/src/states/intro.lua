local intro = {} -- module start

function intro:enter()
	print("Current state : intro")
	intro.gamepadConnected()
end

function intro:update(dt)
end

function intro:draw()
end

function intro.gamepadConnected()
	local joystick =  love.joystick.getJoysticks()
	g_gamepad = joystick[1]
	if g_gamepad then
		print("gamepad plugged, switching to state game")
		Gamestate.switch(gstate_game)
	else
		print("plug a gamePad please")
	end
end
return intro -- module end
