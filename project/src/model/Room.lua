-- render
local Room_audio = require "src.render.Room_audio"

local Room = {}

-- constructor
function Room.new( name, up, right, down, left )
	local self = setmetatable({}, Room)

	self.name = name
	-- doors position like css : up, right, down, left
	self.doors = {up, right, down, left}

	self.isSafe = false
	self.escape = false

	self.ambiantSounds = {}
	self.actionSounds = {}

	return self
end

function Room:setEscape()
	self.escape = true
end

function Room:setSafe()
	self.isSafe = true
end

-- sound
function Room:addAmbiantSound( file )
	self.ambiantSounds[ #self.ambiantSounds + 1 ] = file
end

function Room:addActionSound( file )
	self.actionSounds[ #self.actionSounds + 1 ] = file
end

function Room:generateRender()
	self.audioRender = Room_audio.new(self)
end

function Room:StartAudio()
	if self.audioRender then
		Room_audio.start( self.audioRender )
	end
end

function Room:StopAudio()
	if self.audioRender then
		Room_audio.stop( self.audioRender )
	end
end

function Room:shortAction()
	if self.audioRender then
		Room_audio.shortAction( self.audioRender )
	end
end

function Room:longAction()
	if self.audioRender then
		Room_audio.longAction( self.audioRender )
	end
	-- if room is escape
	if self.escape then
		g_levelPast = g_levelPast + 1
		if g_levelPast >= 2 then
			g_gameWon = true
			Gamestate.switch(gstate_over)
		else	
			print("#> level clear")
			Gamestate.switch(gstate_game)
		end
	end
end

return Room
