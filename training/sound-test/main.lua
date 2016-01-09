local mesure, bpm
local x_mid, y_mid, jim
local alpha

function love.load()
	x_mid = love.graphics.getWidth() / 2
	y_mid = love.graphics.getHeight() / 2
	jim = love.graphics.newImage( "jim-carrey.jpg")

	alpha = 0

	sound = love.audio.newSource("song.wav", "static")
	sound:setLooping(true)
	sound:play()
	math.randomseed( os.time() )

	mesure = 0
	bpm = 60/128
end

function love.update(dt)
	if mesure > (bpm) then
		mesure = mesure + dt - (bpm)
		love.graphics.setBackgroundColor( math.random(0,255), math.random(0,255), math.random(0,255) )
	else
		mesure = mesure + dt
	end

	if alpha < 255 then 
		alpha = alpha + 0.4
	end
end

function love.draw()
	love.graphics.setColor( 255, 255, 255, alpha)
	love.graphics.draw(jim, x_mid - jim:getWidth() / 2, y_mid - jim:getHeight() / 2 )
end
