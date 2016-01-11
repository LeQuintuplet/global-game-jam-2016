-- tile set loader
function setupQuadsTileset(tileFile)
  tileSet = love.graphics.newImage(tileFile) -- load the tileset as an image (need to be global for graphics.draw)
  local quadW, quadH = 32, 32 -- define the width and the height of each quad
  local tileSet_W, tileset_H = tileSet:getDimensions() -- get the height and the width

  local Quads = {} -- init empty Quad
  for j=0,tileSet_W-quadW,quadW do
    for i=0,tileSet_H-quadH,quadH do
      Quads[#Quads+1] = love.graphics.newQuad(i, j, quadW, quadH, tileSet_W, tileSet_H)
      -- add tileset to use it you must refer to your base tileset
      -- quad numbering is compatible with Tiled format \o/
    end
  end

  return Quads -- export the quad
end




-- Map module
Map = {height = 0 --[[in tile]], width = 0, data = {}}

-- create a new map
-- it load the map following a mapfile created with Tiled
function Map:new(mapFile)
  local locmap = require(mapFile) -- locmap should contain all the data of the mapFile in an array
  setmetatable({}, Map)

  self.height = locmap["height"] -- get the height from the file
  self.weight = locmap["width"]
  dataUnformated = locmap["layers"]["data"]
  data = {}
  n=1
  for i=1,self.height do
    data[i] = {}
    for j=1,self.weight do
      data[i][j]=dataUnformated[n]
      n=n+1
    end
  end
  self.data  = data

  return self
end

-- alter a tile on the map
function Map:alter(x,y,newValue)
  self.data[x][y] = newValue
  return self
end
