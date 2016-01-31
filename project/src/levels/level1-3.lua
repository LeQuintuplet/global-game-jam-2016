-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

local level1_3 = {} -- module

-- new level
level1_3.level = Level.new(5, 4) 

-- creating room
local hall1 = Room.new("Hall", true, false, true, true)
	-- Room.addAmbiantSound(hall1, "sfx/")
	-- Room.addActionSound(hall1, "sfx/")

local hall2 = Room.new("Hall", true, true, false, true)
	-- Room.addAmbiantSound(hall2, "sfx/")
	-- Room.addActionSound(hall2, "sfx/")

local hall3 = Room.new("Hall", false, true, true, true)
	-- Room.addAmbiantSound(hall3, "sfx/")
	-- Room.addActionSound(hall3, "sfx/")

local musicShop1 = Room.new("Music Shop", true, true, false, false)
	-- Room.addAmbiantSound(musicShop1, "sfx/")
	-- Room.addActionSound(musicShop1, "sfx/")

local musicShop2 = Room.new("Music Shop", true, false, false, true)
	-- Room.addAmbiantSound(musicShop2, "sfx/")
	-- Room.addActionSound(musicShop2, "sfx/")

local toyShop1 = Room.new("Toy Shop", false, true, true, true)
	-- Room.addAmbiantSound(toyShop1, "sfx/")
	-- Room.addActionSound(toyShop1, "sfx/")

local toyShop2 = Room.new("Toy Shop", false, true, false, true)
	-- Room.addAmbiantSound(toyShop2, "sfx/")
	-- Room.addActionSound(toyShop2, "sfx/")

local sportsHall1 = Room.new("Sports Hall", true, true, true, false)
	-- Room.addAmbiantSound(sportsHall1, "sfx/")
	-- Room.addActionSound(sportsHall1, "sfx/")

local sportsHall2 = Room.new("Sports Hall", true, false, false, false)
	-- Room.addAmbiantSound(sportsHall2, "sfx/")
	-- Room.addActionSound(sportsHall2, "sfx/")

local elecGoodsShop1 = Room.new("Electrical Goods Shop", false, false, true, true)
	-- Room.addAmbiantSound(elecGoodsShop1, "sfx/")
	-- Room.addActionSound(elecGoodsShop1, "sfx/")

local elecGoodsShop2 = Room.new("Electrical Goods Shop", true, false, true, false)
	-- Room.addAmbiantSound(elecGoodsShop2, "sfx/")
	-- Room.addActionSound(elecGoodsShop2, "sfx/")

local petShop1 = Room.new("Pet Shop", false, true, true, false)
	-- Room.addAmbiantSound(petShop1, "sfx/")
	-- Room.addActionSound(petShop1, "sfx/")

local petShop2 = Room.new("Pet Shop", true, true, true, false)
	-- Room.addAmbiantSound(petShop2, "sfx/")
	-- Room.addActionSound(petShop2, "sfx/")

local toilet = Room.new("Toilet", true, false, true, true)
	-- Room.addAmbiantSound(toilet, "sfx/")
	-- Room.addActionSound(toilet, "sfx/")

-- set escape room
Room.setEscape(toilet)

-- adding room to level
Level.addRoom(level1_3.level, petShop1, 1, 1)
Level.addRoom(level1_3.level, toyShop1, 2, 1)
Level.addRoom(level1_3.level, toyShop2, 3, 1)
Level.addRoom(level1_3.level, elecGoodsShop1, 4, 1)
Level.addRoom(level1_3.level, petShop2, 1, 2)
Level.addRoom(level1_3.level, hall1, 2, 2)
Level.addRoom(level1_3.level, elecGoodsShop2, 4, 2)
Level.addRoom(level1_3.level, sportsHall1, 1, 3)
Level.addRoom(level1_3.level, hall2, 2, 3)
Level.addRoom(level1_3.level, hall3, 3, 3)
Level.addRoom(level1_3.level, toilet, 4, 3)
Level.addRoom(level1_3.level, sportsHall2, 1, 4)
Level.addRoom(level1_3.level, musicShop1, 3, 4)
Level.addRoom(level1_3.level, musicShop2, 4, 4)

return level1_3
