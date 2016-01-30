-- render
local Room_audio = require "src.render.Room_audio"

local Room = {}

function Room.new( name, up, right, down, left )
	local self = setmetatable({}, Room)

	self.name = name
	-- doors position like css : up, right, down, left
	self.doors = {up, right, down, left}
	self.isSafe = false
	self.sounds = {}

	return self
end

function Room:addSound( file )
	self.sounds[ #self.sounds + 1 ] = file
end

function Room:generateRender()
	self.audioRender = Room_audio.new(self)
end

function Room:StartAudio()
	print("playing sound")
	if self.audioRender then
		Room_audio.start( self.audioRender )
	end
end

function Room:StopAudio()
	if self.audioRender then
		Room_audio.stop( self.audioRender )
	end
end

return Room
