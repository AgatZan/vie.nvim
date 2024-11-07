---@diagnostic disable
--- and classes

::class::

local class = {}
class.__index = class
function class.new(fields)
	local new_instance = {}
	return setmetatable(new_instance, { __index = class }) -- or just class
end

function class:method() end

local private_method = function(self) end

function class.static_method(not_self) end
