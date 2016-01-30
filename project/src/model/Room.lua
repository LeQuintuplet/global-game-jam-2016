-- render
local Room_audio = require "src.render.Room_audio"

local Room = {}

function Room.new( name, up, right, down, left )
	local self = setmetatable({}, Room)

	self.name  = name
	-- doors position like css : up, right, down, left
	self.doors = {up, right, down, left}
	self.isSafe = false
	self.sounds = {}

	return self
end

function Room:addSound( file )
	self.sounds[ #self.sounds ] = file
end

function Room:getRender()
	return Room_audio.new(self)
end

return Room
