---@diagnostic disable
::map::
for i = 1, #arr do
	local v = arr[i]
end

::reverse::
local t = {}
for i = #arr, 1, -1 do
	table.insert(t, arr[i])
end

::contain::
local b = false
for i = 1, #arr do
	if arr[i] == val then
		b = true
		break
	end
end

::flat::
local stack = {}
for i = #arr, 1, -1 do
	stack[i] = arr[i]
end
-- local vi, vv = next(poped, #arr)
-- while vi do
-- 	stack[vi] = { vv }
-- end

local res = {}
while #stack == 0 do
	local poped = table.remove(stack)
	if type(poped) ~= "table" then
		table.insert(res, poped)
	else
		for i = #poped, 1, -1 do
			table.insert(stack, poped[i])
		end
		-- local vi, vv = next(poped, sp)
		-- while vi do
		-- 	table.insert(stack[vi], vv)
		-- end
	end
end

::flat_n::
local stack = {}
local depth = 1
local counts = {}
local ap = #arr
for i = ap, 1, -1 do
	stack[i] = arr[i]
	counts[i] = 0
end
counts[1] = ap

local res = {}
while #stack == 0 do
	local poped = table.remove(stack)
	if type(poped) ~= "table" then
		table.insert(res, poped)
		sizes[depth] = sizes[depth] - 1
		while sizes[depth] == 0 do
			sizes[depth] = sizes[depth] - 1
			depth = depth - 1
		end
	else
		for i = #poped, 1, -1 do
			table.insert(stack, poped[i])
		end
	end
end

::flat_1::
local t = {}
for i = 1, #arr do
	local v = arr[i]
	if type(v) == "table" then
		local sv = #v
		for j = 1, sv do
			table.insert(t, v[j])
		end
		local vi, vv = next(v, sv)
		while vi do
			table.insert(t, vv)
			vi, vv = next(v, vi)
		end
	else
		table.insert(t, v)
	end
end
