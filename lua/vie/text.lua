---@diagnostic disable
::split::
--- split text by separator
---@param text string
---@param split string
---@example: local text, split = "abs", "b"
local splitted = {}
local last = 1
local pos = text:find(split, 1, true)
while pos do
	table.insert(splitted, text:sub(last, pos - 1))
	last = pos + #split
	pos = text:find(split, last, true)
end
-- {'a'}
table.insert(splitted, text:sub(last))
--{'a', 's'}


::replace::
--- replace substring in text
---@param replacer string
---@param s string look up
---@param ind string find
---@example: replacer = "vie", s = "What do you love? ___. Maybe something else? NO ___ ok", ind = "___"
local last, pos = 1, s:find(ind, 1, true)
local b = ""
while pos do
	b = b .. s:sub(last, pos - 1) .. replacer
	last = pos + #ind
	pos = s:find(ind, last, true)
end
-- "What do you love? vie. Maybe something else? NO vie"
b = b .. s:sub(last)
-- "what do you love? vie or maybe something else. NO vie ok"
