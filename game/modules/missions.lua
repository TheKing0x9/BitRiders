--[[local data = require "game.modules.data"

local M = {}

-- types of missions
local COLLECT = hash("collect")
local NEAR_MISS = hash("near_miss")
local CHARGES = hash("charges")
local BUY = hash("buy")
local REACH = hash("reach")

--collectibles
local COIN = hash("coins")
local NITRO = hash("nitro")
local DESTROY = hash("destroy")
local DOUBLE_COINS = hash("double_coins")
local DOUBLE_SCORE = hash("double_score")
local EXPLODE = hash("explode")
local SLOW = hash("slow")
local TANK = hash("tank")					--changes vehicle into a tank
local FLY = hash("fly")						--changes car into a plane
local MAGNET = hash("magnet")				--magnet
local POLICE = hash("police")				--avoids police for some time

--Reach types
local ZONE = hash("zone")
local DISTANCE = hash("distance")

M.achievements = {
	ACH_COINS = {stat = "coins", stat_amount = 100}
}

M.stats = {
	coins = 0,
	nitro = 0,
	destroy = 0,
	double_coins = 0,
	double_score = 0,
	charge = 0,
	distance = 0, 
	time_played = 0,
	cars = 0,
	areas = 0,
	zone = 0,
}	

return M--]]