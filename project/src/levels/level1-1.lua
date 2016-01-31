-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

local level1_1 = {} -- module

-- new level
level1_1.level = Level.new(5, 4) 

-- creating room
local hall1 = Room.new("Hall", true, false, true, true)
local hall2 = Room.new("Hall", true, true, true, true)
local hall3 = Room.new("Hall", false, true, false, true)
local musicShop1 = Room.new("Music Shop", true, true, true, false)
local musicShop2 = Room.new("Music Shop", true, true, true, false)
local toyShop1 = Room.new("Toy Shop", false, false, true, true)
local toyShop2 = Room.new("Toy Shop", true, false, true, false)
local sportsHall1 = Room.new("Sports Hall", true, false, true, true)
local sportsHall2 = Room.new("Sports Hall", true, false, false, false)
local elecGoodsShop1 = Room.new("Electrical Goods Shop", true, true, false, false)
local elecGoodsShop2 = Room.new("Electrical Goods Shop", true, false, false, true)
local petShop1 = Room.new("Pet Shop", false, true, true, true)
local petShop2 = Room.new("Pet Shop", false, true, false, true)
local toilet = Room.new("Toilet", false, true, true, false)

-- set escape room
Room.setEscape(toyShop2)

-- adding room to level
Level.addRoom(level1_1.level, toilet, 1, 1)
Level.addRoom(level1_1.level, petShop1, 2, 1)
Level.addRoom(level1_1.level, petShop2, 3, 1)
Level.addRoom(level1_1.level, toyShop1, 4, 1)
Level.addRoom(level1_1.level, musicShop1, 1, 2)
Level.addRoom(level1_1.level, hall1, 2, 2)
Level.addRoom(level1_1.level, toyShop2, 4, 2)
Level.addRoom(level1_1.level, musicShop2, 1, 3)
Level.addRoom(level1_1.level, hall2, 2, 3)
Level.addRoom(level1_1.level, hall3, 3, 3)
Level.addRoom(level1_1.level, sportsHall1, 4, 3)
Level.addRoom(level1_1.level, elecGoodsShop1, 1, 4)
Level.addRoom(level1_1.level, elecGoodsShop2, 2, 4)
Level.addRoom(level1_1.level, sportsHall2, 4, 4)

return level1_1
