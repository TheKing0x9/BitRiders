local data = require "game.modules.data"

local M = {}

local SOUND = hash("sound")

local function check_sound()
	return data.DATA.SOUND
end

function M.game_over()
	if check_sound() then
		msg.post("controller:/sounds#game_over", "play_sound")
	end
end

function M.coin()
	if check_sound() then
		msg.post("controller:/sounds#coin", "play_sound")
	end
end

function M.hit()
	if check_sound() then
		msg.post("controller:/sounds#hit", "play_sound")
	end
end

function M.explode()
	if check_sound() then
		msg.post("controller:/sounds#explode", "play_sound")
	end
end

return M