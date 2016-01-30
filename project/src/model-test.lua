local Level = require "model.Level"
local Room = require "model.Room"

local levelTest = Level.new(120, 3)

local roomTest1 = Room.new("Cuisine", false, true, true, false)
local roomTest2 = Room.new("Salon", true, false, true, true)
local roomTest3 = Room.new("Toilette", true, false, false, true)
local roomTest4 = Room.new("Chambre", true, true, false, false)
local roomTest5 = Room.new("Salle de bain", false, true, true, false)
local roomTest6 = Room.new("Bureau", false, false, false, true)

local placeHolder = Room.new(" ", false, false, false, false)

Level.addRoom(levelTest, roomTest1, 2, 1)
Level.addRoom(levelTest, roomTest2, 2, 2)
Level.addRoom(levelTest, roomTest3, 2, 3)
Level.addRoom(levelTest, roomTest4, 1, 3)
Level.addRoom(levelTest, roomTest5, 1, 2)
Level.addRoom(levelTest, roomTest6, 3, 1)

Level.addRoom(levelTest, placeHolder, 1, 1)
Level.addRoom(levelTest, placeHolder, 3, 2)
Level.addRoom(levelTest, placeHolder, 3, 3)

Level.setPlayerPos(levelTest, 2, 2)
Level.playerMove(levelTest, "up")

Level.display(levelTest)
Level.playerInfo(levelTest)

-- print( Level.playerMoveAllowed(levelTest, "up") )
-- print( Level.playerMoveAllowed(levelTest, "right") )
