local Level = {}

function Level.new( discoveryTime, height )
	local self = setmetatable({}, Level)

	self.timer = 0
	self.discoveryTime = discoveryTime
	self.rooms = {}

	for y=1,height do
		self.rooms[y] = {}
	end

	return self
end

function Level:addRoom( room, x, y )
	self.rooms[y][x] = room
end

-- for debug purpose only
function Level:display()
	local row

	for y,vy in ipairs(self.rooms) do
		-- room top
		row = ""
		for x,vx in ipairs(vy) do
			row = row .. "┌─────────────┐"
		end
		print(row)

		-- room value
		row = ""
		for x,vx in ipairs(vy) do
			-- missing space
			local missingSpace = ""
			for i=1,(13 - #vx.name) do
				missingSpace = missingSpace .. " "
			end
			row = row .. "│" .. vx.name .. missingSpace .. "│"
		end
		print(row)

		-- room bot
		row = ""
		for x,vx in ipairs(vy) do
			row = row .. "└─────────────┘"
		end
		print(row)
	end
end

return Level
