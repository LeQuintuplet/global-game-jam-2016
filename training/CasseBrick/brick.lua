--- Brick Game Engine
-- @author Enzo Mallard
local Bricks = {}
local me = require("mapEngine")

--[[ GAME OBJECT ]]-------------------------------------------------------------
Bricks.Game = {bricks = {}, tileworld, tileset}

--- Initialize new game
-- @param map is the localtion of the map file
-- @param tileSet is the location of the tileset to use
-- @param tilseSize is the width/height of one tile
function Bricks.Game(map, tileSet, tileSize)
    tileSize = tileSize or 32
    local locmap = require(map)
    setmetatable({}, Game)
    dataUnformated = locmap["layers"][1]["data"]

    setMap = {}
    n=1
    for i=1, locmap["height"] do
        data[i] = {}
        for j=1, locmap["width"] do
            data[i][j] = Bricks.Brick((i-1)*32, (j-1)*32, dataUnformated[n])
            n=n+1
        end
    end

    self.bricks    = setMap
    self.tileworld = me.Map:new(map)
    self.tileset   = me.TileSet:new(tileSet, tileSize, tileSize)
    return self
end

--[[ PLATFORM OBJECT ]]---------------------------------------------------------
Bricks.Platform = {x=48, h=32, l=96}
function Bricks.Platform:new(xCoord, height, length)
    setmetatable({}, Platform)

    self.x = xCoord
    self.h = height
    self.l = length
    return self
end

function Bricks.Platform:move()
  x = love.mouse.getX()
  if x<(self.l/2) then
    self.x = 48
  elseif x>love.graphics.getWidth()-(self.l/2) then
    self.x = love.graphics.getWidth()-(self.l/2)
  else
    self.x = x
  end
end

function Bricks.Platform:
--[[ BALL OBJECT ]]-------------------------------------------------------------
--[[ BRICK OBJECT ]]------------------------------------------------------------
Bricks.Brick = {top = 0, left = 0, blockID=0}
-- Height and Width is always 32

function Bricks.Brick:new(top, left, id)
    setmetatable({}, Brick)
    id = id or 0
    self.top  = top
    self.left = left
    self.id   = id
    return self
end
