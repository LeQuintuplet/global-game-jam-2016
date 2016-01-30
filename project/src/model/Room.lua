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

return Room
