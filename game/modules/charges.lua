local M = {}

M.CHARGES = {
	{
		name = "Wrong Lane",
		fine = 100,
	},
	{
		name = "Red Light",
		fine = 250
	}
}

function M.get_fines(type)
	for k,v in pairs(M.CHARGES) do
		if hash(v.name) == type then
			return v.fine
		end
	end
	return nil
end

return M