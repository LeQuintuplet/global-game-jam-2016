-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

local level1_4 = {} -- module

-- new level
level1_4.level = Level.new(5, 4) 

-- creating room
local hall1 = Room.new("Hall", true, true, true, false)
	-- Room.addAmbiantSound(hall1, "sfx/")
	-- Room.addActionSound(hall1, "sfx/")

local hall2 = Room.new("Hall", true, true, true, true)
	-- Room.addAmbiantSound(hall2, "sfx/")
	-- Room.addActionSound(hall2, "sfx/")

local hall3 = Room.new("Hall", false, true, false, true)
	-- Room.addAmbiantSound(hall3, "sfx/")
	-- Room.addActionSound(hall3, "sfx/")

local musicShop1 = Room.new("Music Shop", false, false, true, true)
	-- Room.addAmbiantSound(musicShop1, "sfx/")
	-- Room.addActionSound(musicShop1, "sfx/")

local musicShop2 = Room.new("Music Shop", true, false, true, true)
	-- Room.addAmbiantSound(musicShop2, "sfx/")
	-- Room.addActionSound(musicShop2, "sfx/")

local toyShop1 = Room.new("Toy Shop", true, true, false, false)
	-- Room.addAmbiantSound(toyShop1, "sfx/")
	-- Room.addActionSound(toyShop1, "sfx/")

local toyShop2 = Room.new("Toy Shop", true, false, false, true)
	-- Room.addAmbiantSound(toyShop2, "sfx/")
	-- Room.addActionSound(toyShop2, "sfx/")

local sportsHall1 = Room.new("Sports Hall", false, true, false, true)
	-- Room.addAmbiantSound(sportsHall1, "sfx/")
	-- Room.addActionSound(sportsHall1, "sfx/")

local sportsHall2 = Room.new("Sports Hall", false, true, true, true)
	-- Room.addAmbiantSound(sportsHall2, "sfx/")
	-- Room.addActionSound(sportsHall2, "sfx/")

local elecGoodsShop1 = Room.new("Electrical Goods Shop", true, true, true, false)
	-- Room.addAmbiantSound(elecGoodsShop1, "sfx/")
	-- Room.addActionSound(elecGoodsShop1, "sfx/")

local elecGoodsShop2 = Room.new("Electrical Goods Shop", true, false, false, false)
	-- Room.addAmbiantSound(elecGoodsShop2, "sfx/")
	-- Room.addActionSound(elecGoodsShop2, "sfx/")

local petShop1 = Room.new("Pet Shop", false, true, true, false)
	-- Room.addAmbiantSound(petShop1, "sfx/")
	-- Room.addActionSound(petShop1, "sfx/")

local petShop2 = Room.new("Pet Shop", true, false, true, false)
	-- Room.addAmbiantSound(petShop2, "sfx/")
	-- Room.addActionSound(petShop2, "sfx/")

local toilet = Room.new("Toilet", true, false, true, true)
	-- Room.addAmbiantSound(toilet, "sfx/")
	-- Room.addActionSound(toilet, "sfx/")

-- set escape room
Room.setEscape(sportsHall2)

Level.addRoom(level1_4.level, petShop1, 1, 1)
Level.addRoom(level1_4.level, sportsHall1, 2, 1)
Level.addRoom(level1_4.level, sportsHall2, 3, 1)
Level.addRoom(level1_4.level, musicShop1, 4, 1)
Level.addRoom(level1_4.level, petShop2, 1, 2)
Level.addRoom(level1_4.level, hall1, 3, 2)
Level.addRoom(level1_4.level, musicShop2, 4, 2)
Level.addRoom(level1_4.level, elecGoodsShop1, 1, 3)
Level.addRoom(level1_4.level, hall2, 2, 3)
Level.addRoom(level1_4.level, hall3, 3, 3)
Level.addRoom(level1_4.level, toilet, 4, 3)
Level.addRoom(level1_4.level, elecGoodsShop2, 1, 4)
Level.addRoom(level1_4.level, toyShop1, 3, 4)
Level.addRoom(level1_4.level, toyShop2, 4, 4)

return level1_4
