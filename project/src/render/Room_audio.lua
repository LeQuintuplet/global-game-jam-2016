local Room_audio = {}

function Room_audio.new( room )
	local self = {}
	self.ambiant = {}
	self.action = {}

	for i,file in ipairs(room.ambiantSounds) do
		local tmp = love.audio.newSource(file, "stream")
		tmp:setLooping(true)
		self.ambiant[#self.ambiant + 1] = tmp
	end

	for i,file in ipairs(room.actionSounds) do
		local tmp = love.audio.newSource(file, "stream")
		tmp:setLooping(false)
		self.action[#self.action + 1] = tmp
	end

	return self
end

function Room_audio:start()
	for i,sound in ipairs(self.ambiant) do
		sound:play()
	end
end

function Room_audio:stop()
	for i,sound in ipairs(self.ambiant) do
		sound:stop()
	end
	
	for i,sound in ipairs(self.action) do
		sound:stop()
	end
end

function Room_audio:shortAction()
	if self.action[1] then self.action[1]:play() end
end

function Room_audio:longAction()
	if self.action[2] then self.action[2]:play() end
end

return Room_audio
