local M = {}

local CARS = {
	{
		name = "cochesOGArtc_01",
		price = 1000,
		bought = false,
	},
	{
		name = "cochesOGArtc_02",
		price = 3000,
		bought = false,
	},
	{
		name = "cochesOGArtc_04",
		price = 5000,
		bought = false,
	},
	{
		name = "cochesOGArtc_05",
		price = 7000,
		bought = false,
	},
	{
		name = "cochesOGArtc_06",
		price = 9000,
		bought = false,
	},
	{
		name = "cochesOGArtc_09",
		price = 11000,
		bought = false,
	},
	{
		name = "cochesOGArtc_10",
		price = 13000,
		bought = false,
	},
	{
		name = "cochesOGArtc_11",
		price = 15000,
		bought = false,
	},
	{
		name = "cochesOGArtc_12",
		price = 17000,
		bought = false,
	},
	{
		name = "cochesOGArtc_13",
		price = 19000,
		bought = false,
	},
	{
		name = "cochesOGArtc_14",
		price = 21000,
		bought = false,
	},
	{
		name = "cochesOGArtc_16",
		price = 23000,
		bought = false,
	},
	{
		name = "cochesOGArtc_17",
		price = 25000,
		bought = false,
	},
	{
		name = "cochesOGArtc_18",
		price = 27000,
		bought = false,
	},
	{
		name = "cochesOGArtc_19",
		price = 29000,
		bought = false,
	},
	{
		name = "cochesOGArtc_30",
		price = 35000,
		bought = false,
	},
}

function M.get_car(index)
	return CARS[index]
end

function M.get_index()
	return #CARS
end

function M.buy(index)
	CARS[index].bought = true
end

function M.is_bought(index)
	return CARS[index].bought
end

return M