-- lua table mutating shit starts here
local function locate(lookup, value)
	for i = 1, #lookup do
		if lookup[i] == value then
			return true
		end
	end
	return false
end

HOME = os.getenv("HOME")
