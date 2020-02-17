local defsave = require "defsave.defsave"
local data = require "game.modules.data"

local M = {}

--file name of the save file
local FILE_NAME = "save"

function M.init()
	defsave.appname = "BitRiders"
	defsave.default_data = data.DATA
	defsave.load(FILE_NAME)	
end

function M.save()
	defsave.save(FILE_NAME, true)
end

function M.set()
	defsave.set(FILE_NAME, "data", data.DATA)
	M.save();
end

function M.load()
	--data.DATA = defsave.get(FILE_NAME, "data")
	--data.set_owned()
end

return M