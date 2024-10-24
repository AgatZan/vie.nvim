---@diagnostic disable

::get_selection::
--- get visual selected text
vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.api.nvim_get_mode().mode })
---NOTICE: at `nvim_create_user_command` `mode` always "n" so use this.
---NOTICE: **by the way** calling user_command by keymap determine `mode' correctly
vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("'>"), { type = "v" })

::start_insert::
--- into insert mode
---@credit: chrisgrieser
---@see: https://github.com/chrisgrieser/nvim-scissors/blob/ddbf5449910265dc352c8f8a677612b5b2d5300a/lua/scissors/edit-popup.lua#L276
vim.cmd("startinsert")
-- vim.defer_fn(vim.cmd.startinsert, 1)
vim.schedule(function()
	vim.cmd("startinsert")
end)

::config_vim_g_class::
--- if want to make class upon vim.g

local M = { a = "vie" }
M.__index = M -- absolute useless
function M:boo()
	print(self.a)
end
local class_copy = {}
for key, value in pairs(M) do
	class_copy[key] = value
end
class_copy.a = "vien"
vim.g.M = class_copy
vim.g.M:boo() --- vien
