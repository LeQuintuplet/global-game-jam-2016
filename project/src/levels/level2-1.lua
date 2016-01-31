-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

local level2_1 = {} -- module

-- new level
level2_1.level = Level.new(5, 7) 

-- ############################################################################################## --
-- creating room
-- coridors
local coridor1 = Room.new("Coridor", true, true, false, false)
local coridor2 = Room.new("Coridor", false, false, true, true)
local coridor3 = Room.new("Coridor", true, false, true, false)
local coridor4 = Room.new("Coridor", true, true, true, false)
local coridor5 = Room.new("Coridor", false, true, false, true)
local coridor6 = Room.new("Coridor", true, false, true, false)
local coridor7 = Room.new("Coridor", false, true, false, true)
local coridor8 = Room.new("Coridor", true, true, true, true)

-- desks
local desk1 = Room.new("Office", false, false, false, true)
	Room.addActionSound(desk1, "sfx/fouille.ogg")

local desk2 = Room.new("Office", false, true, true, true)
	Room.addActionSound(desk2, "sfx/fouille.ogg")

local desk3 = Room.new("Office", true, true, false, true)
	Room.addActionSound(desk3, "sfx/fouille.ogg")

local desk4 = Room.new("Office", true, true, false, true)
	Room.addActionSound(desk4, "sfx/fouille.ogg")

local desk5 = Room.new("Office", false, true, true, true)
	Room.addActionSound(desk5, "sfx/fouille.ogg")

local desk6 = Room.new("Office", true, true, true, false)
	Room.addActionSound(desk6, "sfx/fouille.ogg")

local desk7 = Room.new("Office", false, true, false, true)
	Room.addActionSound(desk7, "sfx/fouille.ogg")

local desk8 = Room.new("Office", true, false, false, true)
	Room.addActionSound(desk8, "sfx/fouille.ogg")


--infimaries
local infirmary1 = Room.new("Infirmary", false, true, false, false)
	Room.addActionSound(infirmary1, "sfx/electrocardio.wav")

local infirmary2 = Room.new("Infirmary", true, false, true, true)
	Room.addActionSound(infirmary2, "sfx/electrocardio.wav")


--restaurant
local restaurant1 = Room.new("Office Restaurant", false, false, true, false)
	Room.addActionSound(restaurant1, "sfx/vaisselle.wav")

local restaurant2 = Room.new("Office Restaurant", true, false, false, false)
	Room.addActionSound(restaurant2, "sfx/vaisselle.wav")


--receptions
local reception1 = Room.new("Reception", false, true, true, false)
	Room.addActionSound(reception1, "sfx/sonnerietel.wav")

local reception2 = Room.new("Reception", true, true, false, true)
	Room.addActionSound(reception2, "sfx/sonnerietel.wav")

local reception3 = Room.new("Reception", false, true, true, true)
	Room.addActionSound(reception3, "sfx/sonnerietel.wav")

local reception4 = Room.new("Reception", true, false, true, true)
	Room.addActionSound(reception4, "sfx/sonnerietel.wav")


--rest rooms
local restroom1 = Room.new("Rest Room", false, false, true, true)
	Room.addActionSound(restroom1, "sfx/microwave.wav")

local restroom2 = Room.new("Rest Room", true, false, true, false)
	Room.addActionSound(restroom2, "sfx/microwave.wav")


--server rooms
local server1 = Room.new("Server Room", true, false, false, true)
	Room.addActionSound(server1, "sfx/bipinfo3.wav")

local server2 = Room.new("Server Room", true, true, false, false)
	Room.addActionSound(server2, "sfx/bipinfo3.wav")

--terrace
local terrace1 = Room.new("Terrace", false, true, false, false)
	Room.addActionSound(terrace1, "sfx/mouettes.wav")

local terrace2 = Room.new("Terrace", false, false, false, true)
	Room.addActionSound(terrace2, "sfx/mouettes.wav")


--toilet
local toilet1 = Room.new("Toilet", false, false, true, false)
	Room.addActionSound(toilet1, "sfx/robinet.wav")

local toilet2 = Room.new("Toilet", false, true, false, false)
	Room.addActionSound(toilet2, "sfx/hairdryer.wav")

-- ############################################################################################## --

-- set escape room
Room.setEscape(desk8)

-- set safe room
Room.setSafe(reception2)
Room.setSafe(coridor5)
Room.setSafe(coridor8)

-- audio render
Room.generateRender( toilet1 )
Room.generateRender( reception1 )
Room.generateRender( desk1 )
Room.generateRender( terrace1 )
Room.generateRender( desk2 )
Room.generateRender( desk3 )
Room.generateRender( reception2 )
Room.generateRender( restroom1 )
Room.generateRender( restaurant1 )
Room.generateRender( coridor1 )
Room.generateRender( coridor2 )
Room.generateRender( coridor3 )
Room.generateRender( coridor4 )
Room.generateRender( coridor5 )
Room.generateRender( reception3 )
Room.generateRender( desk4 )
Room.generateRender( desk5 )
Room.generateRender( server1 )
Room.generateRender( restroom2 )
Room.generateRender( toilet2 )
Room.generateRender( reception4 )
Room.generateRender( infirmary1 )
Room.generateRender( infirmary2 )
Room.generateRender( coridor6 )
Room.generateRender( desk6 )
Room.generateRender( coridor7 )
Room.generateRender( coridor8 )
Room.generateRender( terrace2 )
Room.generateRender( server2 )
Room.generateRender( desk7 )
Room.generateRender( desk8 )
Room.generateRender( restaurant2 )

-- add room to level
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