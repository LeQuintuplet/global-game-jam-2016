local me = require("mapEngine")
local quadsBricks
local world1

function love.load()
  quadsBricks = me.TileSet:new('tileset.png', 32, 32) --Set up a new tileset object
  world1 = me.Map:new('map')
end

function love.draw()
  love.graphics.setBackgroundColor(0xc0, 0xc0, 0xc0)
  world1:draw(quadsBricks,32)
end
