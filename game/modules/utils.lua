local M = {}

function M.clamp(number, min, max)
	if number > max then
		return max
	elseif number < min then
		return min
	end

	return number
end

function M.copy_vec3(from)
	local vec3 = vmath.vector3()
	vec3.x = from.x
	vec3.y = from.y
	vec3.z = from.z
	return vec3
end

function M.table_contains(table, element)
	for i = 1, #table do
		if table[i] == element then
			return true
		end
	end
	return false
end

return M