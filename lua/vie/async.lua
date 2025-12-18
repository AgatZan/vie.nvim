---@diagnostic disable
--- something with coroutine
::choice::
--- async choice, especially for `vim.ui`
---@credit: FoamScience
---@see: https://github.com/mfussenegger/nvim-dap/blob/66d33b7585b42b7eac20559f1551524287ded353/lua/dap/ui.lua#L55
local function selector(choices)
	---#if async
	local co = coroutine.running()
	local choicer = function(your_return)
		--- if inside function not `api-fast` or to prevent blocking
		vim.schedule(
			function()
				coroutine.resume(co, your_return)
			end
		)
	end
	---PERF: compare difference
	-- local choicer = function(your_return)
	-- 	coroutine.resume(co, your_return)
	-- end
	vim.ui.select(choices, {}, choicer)
	return coroutine.yield()
	---#else
	---like you want
	-- return something
end

coroutine.wrap(function()
	local choice = selector(choices)
end)()
::non-blocking::
local co = coroutine.create(blocking_function)
local function step()
	vim.schedule(function()
		local status, res_or_error = coroutine.resume(co)
		--- error or coroutine is dead
		if not status then
			error(res_or_error)
		elseif condition_to_continue(res_or_error) then
			step()
		end
	end)
end
--- start execution
step()
