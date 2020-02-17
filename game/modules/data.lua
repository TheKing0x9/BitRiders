local defsave = require "defsave.defsave"
local cars = require "game.modules.cars"
local areas = require "game.modules.areas"

local M = {}

--all the constants of player's data
local NAME = hash("name")
local SOUND = hash("sound")
local CURRENT_CAR = hash("current_car")
local SCREENSHOTS = hash("screenshots")

local SCORES = hash("scores")
local CARS = hash("cars")

M.DATA = {
	NAME = "DEFOLD",
	PASSWORD = "",

	FIRST_TIME = true,
	
	SOUND = true,
	CURRENT_CAR = 1,
	CURRENT_AREA = 1,
	COINS = 100000,
	CHARGES = 0,

	SCORES = {},
	CARS = {1},
	AREAS = {1},
	MISSIONS = {1, 2, 3},

	LAST_TIME = 0,
	DAYS = 0, 

	TIME_PLAYED = 0,

	SCREENSHOTS = 0,
	ZONE = 1,
}

function M.set_owned()
	local last_index = cars.get_index()
	for i = 1, last_index do
		for j = 1, #M.DATA.CARS do
			if cars.get_car(i) == M.DATA.CARS[j] then
				cars.buy(i)
			end
		end
	end

	last_index = areas.get_index()
	for i = 1, last_index do
		for j = 1, #M.DATA.AREAS do
			if areas.get_area(i) == M.DATA.AREAS[j] then
				areas.buy(j)
			end
		end
	end
end

function M.reset()
end

function M.has_car(index)
	for k, v in pairs(M.DATA.CARS) do
		if k == index then
			return true
		end
	end
end

function M.has_area(index)
	for k, v in pairs(M.DATA.AREAS) do
		if k == index then
			return true
		end
	end
end

return M