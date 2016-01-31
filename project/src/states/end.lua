local gameOver = {} -- module start

local pics = {
	"img/game_over.jpg",
	"img/credits_0.jpg",
	"img/credits_0.jpg",
	"img/win.jpg",
	"img/credits_0.jpg",
}

local currentPic
local middleX
local state

function gameOver:enter()
	print("#> Current state : game Over")
	print("#> Game won : " .. tostring(g_gameWon))

	for i,v in ipairs(pics) do
		pics[i] = love.graphics.newImage( pics[i] )
	end

	state = 1
	if g_gameWon then
		state = 4
	end
	currentPic = pics.credits
	middleX = love.graphics.getDimensions()
	middleX = middleX/2

	love.graphics.setBackgroundColor(0, 0, 0)
end

function gameOver:update(dt)
	currentPic = pics[state]
end

function gameOver:draw()
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.draw( currentPic, middleX-(currentPic:getDimensions()/2) )
end

function gameOver:keypressed(key)
   if key == "space" then
       state = state + 1
   end
   if state > #pics then
       love.event.quit()
   end
   if state == 3 then
       love.event.quit()
   end
   if key == "escape" then
      love.event.quit()
   end
end

return gameOver
