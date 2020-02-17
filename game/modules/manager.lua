--[[local defsave = require "defsave.defsave"
local data = require "game.modules.data"
local utils = require "game.modules.utils"

local M = {}

M.FILENAME = "17560"
M.DATA_PATH = ""
M.UPDATE_FREQUENCY = 1
M.AUTO_CHECK = true

M.timer = 0
M.achievements = {}
M.stats = {}

M.ENCRYPT = true
M.ENCRYPTION_KEY = "RandomVarHere"

-- encrypt the data
function M.encrypt(input, key)
	if not M.ENCRYPT then return end
	key = key or M.ENCRYPTION_KEY
	local output = ""
	local key_iterator = 1

	local input_length = #input
	local key_length = #key

	for i = 1, input_length do
		local character = string.byte(input:sub(i, i))

		if key_iterator >= key_length + 1 then key_iterator = 1 end -- cycle
		local key_byte = string.byte(key:sub(key_iterator,key_iterator))
		output = output .. string.char(bit.bxor( character , key_byte))

		key_iterator = key_iterator + 1
	end

	return output
end

local function decompress(buffer)
	if buffer == nil then return {} end
	buffer = zlib.inflate(buffer)
	buffer = obfuscate(buffer, M.obfuscation_key)
	buffer = json.decode(buffer)
	return buffer
end

local function compress(buffer)
	buffer = json.encode(buffer)
	buffer = obfuscate(buffer, M.obfuscation_key)
	buffer = zlib.deflate(buffer)
	return buffer
end

function M.init(self)
	M.feat_data = assert(loadstring(sys.load_resource(M.DATA_PATH)))()
	if not defsave.is_loaded(M.FILENAME) then
		if sys.get_save_file("BitRiders", M.FILENAME) then
			defsave.load(M.FILENAME)
		end
	end

	M.setup()

--	M.achievements = decompress(defsave.get(M.FILENAME, "achievements"))
--	M.stats = decompress(defsave.get(M.FILENAME, "stats"))
end

function M.reset()
	defsave.reset_to_default(M.defsave_filename)
end


function M.update(dt)
	if M.AUTO_CHECK == true then
		M.timer = M.timer + dt
		if M.timer > M.UPDATE_FREQUENCY then
			M.timer = M.timer - M.UPDATE_FREQUENCY
			M.check_data()
		end
	end
end

function M.check_data()
	local j = 1
	for i,v in pairs(M.achievements) do
		if utils.table_contains(data.DATA.MISSIONS, j) then
			if v.stat ~= nil then
				if v.unlocked == false and M.check_stat(v.stat, v.stat_amount, v.start) then
					M.unlock_achievement(i)
				elseif v.unlocked == true and not M.check_stat(v.stat, v.stat_amount, v.start) then
					M.lock_achievement(i)
				end
			end
		end
	end
end

function M.check_stat(stat, value, start)
	if not start then
		if M.stats[stat].value >= value then return true else return false end
	else
		if M.stats[stat].value > start and M.stats[stat].value  >= value then return true else return false end
	end
end

function M.get_stat(stat)
	return M.stats[stat].value
end

function M.save()
--	M.update_defsave()
	defsave.save_all()	
end

function M.update_defsave()
	defsave.set(M.defsave_filename, "achievements", compress(M.achievements))
	defsave.set(M.defsave_filename, "stats", compress(M.stats))	
end

function M.final()
	M.save()
end

function M.setup()
	for i,v in pairs(M.feat_data.achievements) do
		if M.achievements[i] == nil then
			M.create_achievement(i, v.stat, v.stat_amount, v.start or nil)
		end
	end
	for i,v in pairs(M.feat_data.stats) do
		if M.stats[i] == nil then
			M.create_stat(i, v)
		end
	end	
end

function M.create_stat(stat, value)
	M.stats[stat] = {}
	M.stats[stat].id = stat
	M.stats[stat].value = value
end

function M.modify_stat(stat, value)
	if M.stats[stat] == nil then M.create_stat(stat, value) return end
	M.stats[stat].value = M.stats[stat].value + value
end

function M.set_stat(stat, value)
	if M.stats[stat] == nil then M.create_stat(stat, value) return end
	M.stats[stat].value = value
end

function M.create_achievement(achievement, stat, stat_amount, start)
	--if M.verbose == true then print("Feat: Creating achievement " .. achievement) end
	if stat ~= nil then
		M.achievements[achievement] = {}
		M.achievements[achievement].id = achievement
		M.achievements[achievement].stat = stat
		M.achievements[achievement].stat_amount = stat_amount
		M.achievements[achievement].unlocked = false
		M.achievements[achievement].start = start
	else
		M.achievements[achievement] = {}
		M.achievements[achievement].id = achievement
		M.achievements[achievement].unlocked = false
		M.achievements[achievement].start = start
	end
end

function M.assign_next_achievement(achievement)
	local index = #data.DATA.MISSIONS
	local i = 1

	table.sort(data.DATA.MISSIONS)
	table.insert(data.DATA.MISSIONS, data.DATA.MISSIONS[index] + 1)
	for k, v in pairs(M.achievements) do
		if v.id == achievement then
			table.remove(data.DATA.MISSIONS, i)
		end
		i = i+1
	end
end

-- manually unlock an achivement
function M.unlock_achievement(achievement)
	print("Unlock "..achievement)
	if M.achievements[achievement] == nil then M.create_achievement(achievement) end
	if M.achievements[achievement].unlocked == true then return end
	M.achievements[achievement].unlocked = true

	M.assign_next_achievement(achievement)
end

-- manually lock the achievement
function M.lock_achievement(achievement)
	if M.achievements[achievement] == nil then M.create_achievement(achievement) end
	if M.achievements[achievement].unlocked == false then return end
	M.achievements[achievement].unlocked = false
end

function M.get_acheivement_status()
	return M.achievements
end

return M--]]