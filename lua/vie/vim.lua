---@diagnostic disable

::get_selection::
--- get visual selected text
vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.api.nvim_get_mode().mode })
---NOTICE: at `nvim_create_user_command` `mode` always "n" so use this.
---NOTICE: **by the way** calling user_command by keymap determine `mode' correctly
vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("'>"), { type = "v" })

---NOTICE: if **nvim version < 0.10**
function getregion(pos1, pos2, opts)
	local lines = {}
	local start_row, start_col, end_row, end_col = pos1[2], pos1[3], pos2[2], pos2[3]
	local selection_mode = opts.type
	local text = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, true)
	end_row = end_row - start_row + 1
	start_row = 1
	if selection_mode == "v" then
		table.insert(lines, text[1]:sub(start_col))
		for i = start_row + 1, end_row do
			table.insert(lines, text[i])
		end
		lines[end_row] = lines[end_row]:sub(1, end_col)
	elseif selection_mode == "V" then
		for i = start_row, end_row do
			table.insert(lines, text[i])
		end
	elseif selection_mode == vim.api.nvim_replace_termcodes("<C-V>", true, true, true) then
		for i = start_row, end_row do
			table.insert(lines, text[i]:sub(start_col, end_col))
		end
	end
	return lines
end

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
