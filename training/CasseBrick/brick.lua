--- Brick Game Engine
-- @author Enzo Mallard
local Bricks = {}

--[[ GAME OBJECT ]]-------------------------------------------------------------
Bricks.Game = {bricks = {}}

function Bricks.Game(map)
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
    self.bricks = setMap
    return self
end


--[[ BRICK OBJECT ]]------------------------------------------------------------
Bricks.Brick = {top = 0, left = 0, blockID=0}
-- Height and Width is always 32

function Bricks.Brick:new(top, left, id)
    setmetatable({}, brick)

    self.top  = top
    self.left = left
    self.id   = id
    return self
end
