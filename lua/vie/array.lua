---@diagnostic disable
::have_array_part::
--- NOTICE: `arr` without holes
--- NOTICE: #arr == max_not_hole_idx
--                                                        is_empty
local have_arr_part = type(arr) == "table" and ( next( arr ) == nil or arr[1] ~= nil )

::map::
--- iterate through array
for i = 1, #arr do
	local v = arr[i]
end

::reverse::
--- reverse array
local t = {}
for i = #arr, 1, -1 do
	table.insert(t, arr[i])
end

::contain::
--- array contain element
local b = false
for i = 1, #arr do
	if arr[i] == val then
		b = true
		break
	end
end

::flat::
--- full flatten array
--- NOTICE: Drop `{ [string]:value }` part of `table`
local stack = {}
for i = #arr, 1, -1 do
	stack[i] = arr[i]
end

local res, lstack = {}, #stack
while lstack > 0 do
	lstack = lstack - 1
	local poped = table.remove(stack)
	if type(poped) ~= "table" then
		table.insert(res, poped)
	else
		local lpoped = #poped
		lstack = lstack + lpoped
		for i = lpoped, 1, -1 do
			table.insert(stack, 1, poped[i])
		end
	end
end

::flat_n::
--- flatten deep `n`
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
--- flatten deep `1`
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
