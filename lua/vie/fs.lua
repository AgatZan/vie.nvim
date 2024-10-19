---@diagnostic disable
::os_sep::
local os_sep = vim.uv.os_uname().sysname == "Windows_NT" and "\\" or "/"

::exist::
if vim.uv.fs_stat(filepath) then
	--
end

::is_dir::
if vim.uv.fs_stat(filepath).type == "directory" then
	--
end

::scandir::
local files = {}
local next_dir = { directory }
repeat
	local current_dir = table.remove(next_dir, 1)
	local fd = vim.uv.fs_scandir(current_dir)
	if fd then
		while true do
			local name, typ = vim.uv.fs_scandir_next(fd)
			if name == nil then	break end
			local fullname = current_dir .. os_sep .. name
			---@cast typ uv.aliases.fs_types
			---| "directory"
			---| "file"
			---| "link"
			---| "fifo"
			---| "socket"
			---| "char"
			---| "block"
			---| "unknown"
			if typ == "directory" then
				table.insert(next_dir, fullname)
			else
				table.insert(files, fullname)
			end
		end
	end
until #next_dir == 0

::read_lines::
local fd, err = io.open(filename, "r")
if fd then
	local line = fd:read("*l")
	while line do
		
	end
	fd:close()
else
	print(err)
end

::read_lines_async::
---TODO: read async using vim.uv.fs_read
local fd, err = vim.uv.fs_open(filename, "r")
if fd then
	-- vim.uv.fs_read(fd, )
else
	print(err)
end

::read_file::
local fd, err = io.open(filename, "r")
if fd then
	local file = fd:read("*a")
	fd:close()
else
	print(err)
end

::read_file_async::
---PERF+TODO: check correctness because copy-paste from https://github.com/L3MON4D3/LuaSnip/blob/master/lua/luasnip/util/path.lua
vim.uv.fs_open(path, "r", tonumber("0666", 8), function(err, fd)
		assert(not err, err)
		uv.fs_fstat(fd, function(err, stat)
			assert(not err, err)
			uv.fs_read(fd, stat.size, 0, function(err, buffer)
				assert(not err, err)
				uv.fs_close(fd, function(err)
					assert(not err, err)
					callback(buffer)
				end)
			end)
		end)
	end)

::append::
local fd, err = io.open(filename, "a")
if fd then
	fd:write()
	fd:flush()
	fd:close()
else
	print(err)
end
