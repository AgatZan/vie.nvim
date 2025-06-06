---@diagnostic disable
--- file systemm
::os_sep::
--- return current os separator ( if you really need it )
local os_sep = package.config:sub(1, 1) --- https://www.lua.org/manual/5.3/manual.html#pdf-package.config:~:text=The%20first%20line%20is%20the%20directory%20separator%20string.%20Default%20is%20%27%5C%27%20for%20Windows%20and%20%27/%27%20for%20all%20other%20systems.
-- OR
--- local os_sep = jit.os == "Windows" and "\\" or "/"
--- local os_sep = vim.uv.os_uname().sysname == "Windows_NT" and "\\" or "/"
--- local os_sep = vim.fn.has("win32") == 1  and "\\" or "/"
--- local os_sep = package.cpath:match("%p[\\|/]?%p(%a+)") == "dll" and "\\" or "/"

::exist::
--- check if `filepath` exist
---@param filepath string
if vim.uv.fs_stat(filepath) then
	--
end

::is_dir::
--- check if `filepath` is directory
---@param filepath string
if vim.uv.fs_stat(filepath).type == "directory" then
	--
end

::scandir::
--- find all files of directory and all subdirectory
---@param directory string
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
--- read `filepath` by line
---@param filename string
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
--- read `filepath` by line async
---TODO: read async using vim.uv.fs_read
local fd, err = vim.uv.fs_open(filename, "r")
if fd then
	-- vim.uv.fs_read(fd, )
else
	print(err)
end

::read_file::
--- read full file
---@param filename string
local fd, err = io.open(filename, "r")
if fd then
	local file = fd:read("*a")
	fd:close()
else
	print(err)
end

::read_file_async::
--- read full file async
---@credit: L3MON4D3
---@see: https://github.com/L3MON4D3/LuaSnip/blob/master/lua/luasnip/util/path.lua#L29-L44
---PERF: check because copy-pasted
---@param path string
---@param mode integer `mode_t` 8 number represets flags from 000 to 777 xrwxrwxrw `tonumber("0666", 8)`
vim.uv.fs_open(path, "r", mode, function(err, fd)
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
--- append something to `filepath` and save
---@param filename string
local fd, err = io.open(filename, "a")
if fd then
	fd:write()
	fd:flush()
	fd:close()
else
	print(err)
end
