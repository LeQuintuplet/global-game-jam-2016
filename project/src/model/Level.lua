local Level = {}

function Level.new( discoveryTime, height )
	local self = setmetatable({}, Level)

	self.playerPosX = 0
	self.playerPosY = 0
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

function Level:setPlayerPos(x, y)
	self.playerPosX, self.playerPosY = x, y
end

function Level:playerMoveAllowed( direction )
	local actualRoom = self.rooms[ self.playerPosY ][ self.playerPosX ]
	local roomGotDoor

	if direction == "up" then 
		roomGotDoor = actualRoom.doors[1]
	elseif direction == "right" then 
		roomGotDoor = actualRoom.doors[2]
	elseif direction == "down" then 
		roomGotDoor = actualRoom.doors[3]
	elseif direction == "left" then 
		roomGotDoor = actualRoom.doors[4]
	end

	return roomGotDoor
end

function Level:playerMove( direction )
	if direction == "up" then 
		self.playerPosY = self.playerPosY - 1
	elseif direction == "right" then 
		self.playerPosX = self.playerPosX + 1
	elseif direction == "down" then 
		self.playerPosY = self.playerPosY + 1
	elseif direction == "left" then 
		self.playerPosX = self.playerPosX - 1
	end
end

-- #### for debug purpose only ################################################################## --

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

	print("")
end

function Level:playerInfo()
	print("Player coordinate (" .. self.playerPosX .. ";" .. self. playerPosY .. ")")
	print("Player room : " .. self.rooms[ self.playerPosY ][ self.playerPosX ].name)
end

return Level
