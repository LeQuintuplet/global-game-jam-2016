-- model
local Level = require "src.model.Level"
local Room = require "src.model.Room"

local mapTest = {}

mapTest.level = Level.new(5, 3)

local room1 = Room.new("Cuisine", false, true, true, false)
Room.addAmbiantSound( room1, "sfx/refregirateur.wav" )
--Room.addActionSound( room1, "sfx/fouille.ogg" )
--Room.addActionSound( room1, "sfx/avion.ogg" )

local room2 = Room.new("Salon", true, false, true, true)
Room.addAmbiantSound( room2, "sfx/wind.ogg" )

local room3 = Room.new("Toilette", true, false, false, true)
Room.setEscape(room3)
--Room.addAmbiantSound( room3, "sfx/wind.ogg" )

local room4 = Room.new("Chambre", true, true, false, false)
--Room.addAmbiantSound( room4, "sfx/" )

local room5 = Room.new("Salle de bain", false, true, true, false)
Room.addAmbiantSound( room5, "sfx/robinet.wav" )

local room6 = Room.new("Bureau", false, false, false, true)
Room.addAmbiantSound( room6, "music/wind.ogg" )

Room.generateRender( room1 )
Room.generateRender( room5 )
Room.generateRender( room6 )

Level.addRoom(mapTest.level, room1, 2, 1)
Level.addRoom(mapTest.level, room2, 2, 2)
Level.addRoom(mapTest.level, room3, 2, 3)
Level.addRoom(mapTest.level, room4, 1, 3)
Level.addRoom(mapTest.level, room5, 1, 2)
Level.addRoom(mapTest.level, room6, 3, 1)

return mapTest
