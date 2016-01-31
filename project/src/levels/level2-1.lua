-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

local level2_1 = {} -- module

-- new level
level2_1.level = Level.new(120, 7) 

-- ############################################################################################## --
-- creating room
-- coridors
local coridor1 = Room.new("Coridor", true, true, false, false)
	Room.addAmbiantSound(coridor1, "sfx/")
	Room.addActionSound(coridor1, "sfx/")

local coridor2 = Room.new("Coridor", false, false, true, true)
	Room.addAmbiantSound(coridor2, "sfx/")
	Room.addActionSound(coridor2, "sfx/")

local coridor3 = Room.new("Coridor", true, false, true, false)
	Room.addAmbiantSound(coridor3, "sfx/")
	Room.addActionSound(coridor3, "sfx/")

local coridor4 = Room.new("Coridor", true, true, true, false)
	Room.addAmbiantSound(coridor4, "sfx/")
	Room.addActionSound(coridor4, "sfx/")

local coridor5 = Room.new("Coridor", false, true, false, true)
	--is a safe room
	Room.addAmbiantSound(coridor5, "sfx/")
	Room.addActionSound(coridor5, "sfx/")

local coridor6 = Room.new("Coridor", true, false, true, false)
	Room.addAmbiantSound(coridor6, "sfx/")
	Room.addActionSound(coridor6, "sfx/")

local coridor7 = Room.new("Coridor", false, true, false, true)
	Room.addAmbiantSound(coridor7, "sfx/")
	Room.addActionSound(coridor7, "sfx/")

local coridor8 = Room.new("Coridor", true, true, true, true)
	Room.addAmbiantSound(coridor8, "sfx/")
	Room.addActionSound(coridor8, "sfx/")


-- desks
local desk1 = Room.new("Office", false, false, false, true)
	Room.addAmbiantSound(desk1, "sfx/")
	Room.addActionSound(desk1, "sfx/")

local desk2 = Room.new("Office", false, true, true, true)
	Room.addAmbiantSound(desk2, "sfx/")
	Room.addActionSound(desk2, "sfx/")

local desk3 = Room.new("Office", true, true, false, true)
	Room.addAmbiantSound(desk3, "sfx/")
	Room.addActionSound(desk3, "sfx/")

local desk4 = Room.new("Office", true, true, false, true)
	Room.addAmbiantSound(desk4, "sfx/")
	Room.addActionSound(desk4, "sfx/")

local desk5 = Room.new("Office", false, true, true, true)
	Room.addAmbiantSound(desk5, "sfx/")
	Room.addActionSound(desk5, "sfx/")

local desk6 = Room.new("Office", true, true, true, false)
	Room.addAmbiantSound(desk6, "sfx/")
	Room.addActionSound(desk6, "sfx/")

local desk7 = Room.new("Office", false, true, false, true)
	Room.addAmbiantSound(desk7, "sfx/")
	Room.addActionSound(desk7, "sfx/")

local desk8 = Room.new("Office", true, false, false, true)
	Room.addAmbiantSound(desk8, "sfx/")
	Room.addActionSound(desk8, "sfx/")


--infimaries
local infirmary1 = Room.new("Infirmary", false, true, false, false)
	Room.addAmbiantSound(infirmary1, "sfx/")
	Room.addActionSound(infirmary1, "sfx/")

local infirmary2 = Room.new("Infirmary", true, false, true, true)
	Room.addAmbiantSound(infirmary2, "sfx/")
	Room.addActionSound(infirmary2, "sfx/")


--restaurant
local restaurant1 = Room.new("Office Restaurant", false, false, true, false)
	Room.addAmbiantSound(restaurant1, "sfx/")
	Room.addActionSound(restaurant1, "sfx/")

local restaurant2 = Room.new("Office Restaurant", true, false, false, false)
	Room.addAmbiantSound(restaurant2, "sfx/")
	Room.addActionSound(restaurant2, "sfx/")


--receptions
local reception1 = Room.new("Reception", false, true, true, false)
	Room.addAmbiantSound(reception1, "sfx/")
	Room.addActionSound(reception1, "sfx/")

local reception2 = Room.new("Reception", true, true, false, true)
	--is a safe room
	Room.addAmbiantSound(reception2, "sfx/")
	Room.addActionSound(reception2, "sfx/")

local reception3 = Room.new("Reception", false, true, true, true)
	Room.addAmbiantSound(reception3, "sfx/")
	Room.addActionSound(reception3, "sfx/")

local reception4 = Room.new("Reception", true, false, true, true)
	Room.addAmbiantSound(reception4, "sfx/")
	Room.addActionSound(reception4, "sfx/")


--rest rooms
local restroom1 = Room.new("Rest Room", false, false, true, true)
	Room.addAmbiantSound(restroom1, "sfx/")
	Room.addActionSound(restroom1, "sfx/")

local restroom2 = Room.new("Rest Room", true, false, true, false)
	Room.addAmbiantSound(restroom2, "sfx/")
	Room.addActionSound(restroom2, "sfx/")


--server rooms
local server1 = Room.new("Server Room", true, false, false, true)
	Room.addAmbiantSound(server1, "sfx/")
	Room.addActionSound(server1, "sfx/")

local server2 = Room.new("Server Room", true, true, false, false)
	Room.addAmbiantSound(server2, "sfx/")
	Room.addActionSound(server2, "sfx/")

--terrace
local terrace1 = Room.new("Terrace", false, true, false, false)
	Room.addAmbiantSound(terrace1, "sfx/")
	Room.addActionSound(terrace1, "sfx/")

local terrace2 = Room.new("Terrace", false, false, false, true)
	Room.addAmbiantSound(terrace2, "sfx/")
	Room.addActionSound(terrace2, "sfx/")


--toilet
local toilet1 = Room.new("Toilet", false, false, true, false)
	Room.addAmbiantSound(toilet1, "sfx/")
	Room.addActionSound(toilet1, "sfx/")

local toilet2 = Room.new("Toilet", false, true, false, false)
	Room.addAmbiantSound(toilet2, "sfx/")
	Room.addActionSound(toilet2, "sfx/")

-- ############################################################################################## --

-- set escape room
Room.setEscape(desk8)

-- set safe room
Room.setSafe(reception2)
Room.setSafe(coridor5)
Room.setSafe(coridor8)

Level.addRoom(level2_1.level, toilet1, 4, 1)
Level.addRoom(level2_1.level, reception1, 5, 1)
Level.addRoom(level2_1.level, desk1, 6, 1)
Level.addRoom(level2_1.level, terrace1, 2, 2)
Level.addRoom(level2_1.level, desk2, 3, 2)
Level.addRoom(level2_1.level, desk3, 4, 2)
Level.addRoom(level2_1.level, reception2, 5, 2)
Level.addRoom(level2_1.level, restroom1, 6, 2)
Level.addRoom(level2_1.level, restaurant1, 1, 3)
Level.addRoom(level2_1.level, coridor1, 3, 3)
Level.addRoom(level2_1.level, coridor2, 4, 3)
Level.addRoom(level2_1.level, coridor3, 6, 3)
Level.addRoom(level2_1.level, coridor4, 1, 4)
Level.addRoom(level2_1.level, coridor5, 2, 4)
Level.addRoom(level2_1.level, reception3, 3, 4)
Level.addRoom(level2_1.level, desk4, 4, 4)
Level.addRoom(level2_1.level, desk5, 5, 4)
Level.addRoom(level2_1.level, server1, 6, 4)
Level.addRoom(level2_1.level, restroom2, 1, 5)
Level.addRoom(level2_1.level, toilet2, 2, 5)
Level.addRoom(level2_1.level, reception4, 3, 5)
Level.addRoom(level2_1.level, infirmary1, 4, 5)
Level.addRoom(level2_1.level, infirmary2, 5, 5)
Level.addRoom(level2_1.level, coridor6, 1, 6)
Level.addRoom(level2_1.level, desk6, 3, 6)
Level.addRoom(level2_1.level, coridor7, 4, 6)
Level.addRoom(level2_1.level, coridor8, 5, 6)
Level.addRoom(level2_1.level, terrace2, 6, 6)
Level.addRoom(level2_1.level, server2, 1, 7)
Level.addRoom(level2_1.level, desk7, 2, 7)
Level.addRoom(level2_1.level, desk8, 3, 7)
Level.addRoom(level2_1.level, restaurant2, 5, 7)

return level2_1