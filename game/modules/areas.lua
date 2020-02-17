local M = {}

local AREAS = {
	{
		name = "SPRING",
		price = 10000,
		anim = hash("Season_collection (2)"),
		theme = vmath.vector4(82/255, 200/255, 100/255, 1),
		text = vmath.vector4(1),
		bought = true,
	},
	{
		name = "AUTUMN",
		price = 10000,
		anim = hash("autum"),
		theme = vmath.vector4(255/255, 208/255, 87/255, 1),
		text = vmath.vector4(1),
		bought = false,
	},
	{
		name = "SUMMER",
		price = 30000,
		anim = hash("rains"),
		theme = vmath.vector4(0, 133/255, 248/255, 1),
		text = vmath.vector4(1),
		bought = false,
	},
	{
		name = "WINTER",
		price = 50000,
		anim = hash("winter"),
		theme = vmath.vector4(186/255, 235/255, 1, 1),
		text = vmath.vector4(1),
		bought = false,
	},
}

function M.get_area(index)
	return AREAS[index]
end

function M.get_index()
	return #AREAS
end

function M.buy(index)
	AREAS[index].bought = true
end

function M.is_bought(index)
	return AREAS[index].bought
end

return M