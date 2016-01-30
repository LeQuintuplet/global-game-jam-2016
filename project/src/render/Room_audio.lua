local Room_audio = {}

function Room_audio.new( room )
	local self = {}
	for i,file in ipairs(room.sounds) do
		local tmp = love.audio.newSource(file, "stream")
		tmp:setLooping(true)
		self[#self]
	end
	return self
end

function Room_audio:start()
	for i,sound in ipairs(self) do
		sound:play()
	end
end

function Room_audio:stop()
	for i,sound in ipairs(self) do
		sound:stop()
	end
end

return Room_audio
