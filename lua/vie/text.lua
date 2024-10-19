---@diagnostic disable
::split::
local text = "abs"
local replace = "b"

local splitted = {}
local last = 1
local pos = text:find(replace)
while pos do
	table.insert(splitted, text:sub(last, pos - 1))
	last = pos + #replace
	pos = a:find(replace, last)
end
-- {'a'}
table.insert(splitted, text:sub(last))
--{'a', 'b'}

::replace::
local replacer = "vie"
local s = "What do you love? ___. Maybe something else? NO ___ ok"
local ind = "___"

local last, pos = 1, s:find(ind)
local b = ""
while pos do
	b = b .. s:sub(last, pos - 1) .. replacer
	last = pos + #ind
	pos = s:find(ind, last)
end
-- "What do you love? vie. Maybe something else? NO vie"
b = b .. s:sub(last)
-- "what do you love? vie or maybe something else. NO vie ok"
