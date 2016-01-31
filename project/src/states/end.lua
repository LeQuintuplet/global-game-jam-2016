local gameOver = {} -- module start

function gameOver:enter()
	print("#> Current state : game Over")
	print("#> Game won : " .. tostring(g_gameWon))
end

function gameOver:draw()
end

return gameOver
