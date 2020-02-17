local M = {}

local height = 540
local width = 960

local zoom = 2

function M.get_height()
	return height
end

function M.get_width()
	return width
end

function M.get()
	return height, width
end

return M