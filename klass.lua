
---
-- @classmod klass

local setmetatable, rawequal, pairs, tostring =
      setmetatable, rawequal, pairs, tostring

local klass = { }
klass.__index = klass
klass.__name = "klass"

---
-- @tparam string name
-- @treturn table
function klass:extend(name)
	local c = setmetatable({ }, self)
	for k, v in pairs(self) do
		c[k] = v
	end
	c.__name = name
	c.__index = c
	c.__super = self
	return c
end

---
-- @tparam any ...
-- @treturn table
function klass:__call(...)
	local inst = setmetatable({ }, self)
	inst:init(...)
	return inst
end

---
-- @tparam table c
-- @treturn boolean
function klass:isinstance(c)
	local mycls = self.__index
	while mycls do
		if rawequal(mycls, c) then
			return true
		end
		mycls = mycls.__super
	end
	return false
end

---
-- @treturn string
function klass:__tostring()
	return "<"..tostring(self.__name)..">"
end

return setmetatable(klass, { __call=klass.extend })
