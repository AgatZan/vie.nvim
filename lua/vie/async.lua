---@diagnostic disable
::choice::
--- Sync call ui.select
---See: [nvim-dap/lua/dap/ui.lua#55](https://github.com/mfussenegger/nvim-dap/blob/66d33b7585b42b7eac20559f1551524287ded353/lua/dap/ui.lua#L55)
local function selector(choices)
	---#if async
	local co = coroutine.running()
	local choicer = vim.schedule( --- if inside function not `api-fast`
		function()
			coroutine.resume(co, your_return)
		end
	)
	---PERF+TODO: compare difference
	-- local choicer = function()
	-- 	coroutine.resume(co, your_return)
	-- end
	-- choicer = vim.schedule_wrap(choicer)
	vim.ui.select(choices, {}, choicer)
	return coroutine.yield()
	---#else
	---like you want
end

coroutine.wrap(function()
	local choice = selector(choices)
end)()
