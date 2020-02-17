local M = {}

M.gamestates = {"DEFAULT", "PLAY", "PAUSE", "OVER", "MENU"}
M.current = "MENU"

function M.init(states)
	if states then
		assert(type(states) == "table", "You must provide `states` of type `table` to perform `init()`")
		M.gamestates = states
	end
	return M.gamestates
end

function M.set(state)
	assert(type(state) == "string", "State must be of the type string")
	local exists = false
	for i = 1, #M.gamestates do
		if M.gamestates[i] == state then
			M.current = state
			exists = true
			return M.current
		end
	end
	if not exists then
		assert(exists, "You must provide valid `state` of type `string` to perform `set()`")
	end
end

function M.get()
	return M.current
end

function M.is(state)
	assert(type(state) == "string", "You must provide `state` of type `string` to perform `is()`")
	return state == M.current
end 

return M