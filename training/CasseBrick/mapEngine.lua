--- MapEngine module
-- @author Enzo Mallard
local MapEngine = {}

--[[ TILESET OBJECT ]]----------------------------------------------------------
MapEngine.TileSet = {tileH = 32 --[[in pixel]], tileW = 32, quads = {}, tileSet}

--- Initialize new tileset
-- @param tileFile is the file where is located the tiles
-- @param quadW define the width of each quad
-- @param quadH define the height of each quad
function MapEngine.TileSet:new(tileFile, quadW, quadH)
  setmetatable({}, TileSet)
  local tileSet = love.graphics.newImage(tileFile) -- load the tileset as an image

  local tileSet_W, tileSet_H = tileSet:getWidth(), tileSet:getHeight() -- get the height and the width

  local quads = {} -- init empty Quad
  for j=0,tileSet_W-quadW,quadW do
    for i=0,tileSet_H-quadH,quadH do
      quads[#quads+1] = love.graphics.newQuad(i, j, quadW, quadH, tileSet_W, tileSet_H)
      -- create a quad for each square in the image (even if it's a black tile)
    end
  end

  self.tileH   = quadH
  self.tileW   = quadW
  self.quads   = quads   -- Contain the quads data
  self.set = tileSet -- Important for graphics.draw
  return self
end
--[[ END TILESET OBJECT ]]------------------------------------------------------


--[[ MAP OBJECT ]]--------------------------------------------------------------
MapEngine.Map = {height = 0 --[[in tile]], width = 0, data = {}}

--- Create a new map.
-- It load the map following a mapfile created with Tiled
-- @param mapFile where is located the .lua map file (without the extension !)
function MapEngine.Map:new(mapFile)
  local locmap = require(mapFile) -- locmap should contain all the data of the mapFile in an array
  setmetatable({}, Map)

  self.height = locmap["height"] -- get the height from the file
  self.width  = locmap["width"]
  dataUnformated = locmap["layers"][1]["data"] -- the [1] is for the 1st layer

  data = {}
  n=1
  for i=1,self.height do
    data[i] = {}
    for j=1,self.width do
      data[i][j]=dataUnformated[n]
      n=n+1
    end
  end
  self.data  = data

  return self
end

--- Alter a tile on the map.
-- @param x the x coordinate of the map to be alter
-- @param y the y coordinate of the map to be alter
-- @param newTile the tile value for the altered square
function MapEngine.Map:alter(x,y,newTile)
  self.data[x][y] = newValue
end

--- Draw the map.
-- @param tileset the tileset used to draw the map
-- @param yAjust is the relative ajustment, it's 0 by default
-- @param xAjust is the same as yAjust but the default is *centered*
-- @return nothing
function MapEngine.Map:draw(tileSet, yAjust, xAjust)
  yAjust = yAjust or 0
  xAjust = xAjust or (love.graphics.getWidth() - (self.width * tileSet.tileW))/2
  for rowIndex,row in ipairs(self.data) do
    for columnIndex,number in ipairs(row) do
      if number>0 then
        local x,y = (columnIndex-1)*tileSet.tileW+xAjust, (rowIndex-1)*tileSet.tileH+yAjust
        love.graphics.draw(tileSet.set, tileSet.quads[number], x, y)
      end
    end
  end

end
--[[ END MAP OBJECT ]]----------------------------------------------------------

return MapEngine
