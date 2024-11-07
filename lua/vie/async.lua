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
		vim.schedule( --- if inside function not `api-fast`
			function()
				coroutine.resume(co, your_return)
			end
		)
	end
	---PERF: compare difference
	-- local choicer = function(your_return)
	-- 	coroutine.resume(co, your_return)
	-- end
	-- choicer = vim.schedule_wrap(choicer)
	vim.ui.select(choices, {}, choicer)
	return coroutine.yield()
	---#else
	---like you want
	-- return something
end

coroutine.wrap(function()
	local choice = selector(choices)
end)()
