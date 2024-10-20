---@diagnostic disable
::get_selection::
vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.api.nvim_get_mode().mode })

::start_insert::
--- Inspired: https://github.com/chrisgrieser/nvim-scissors/blob/ddbf5449910265dc352c8f8a677612b5b2d5300a/lua/scissors/edit-popup.lua#L276

vim.cmd("startinsert")
-- vim.defer_fn(vim.cmd.startinsert, 1)
vim.schedule(function()
	vim.cmd("startinsert")
end)
