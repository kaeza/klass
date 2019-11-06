
---
-- Minimalistic class system for Lua.
--
-- @classmod klass
-- @author Diego Martínez <https://github.com/kaeza>
-- @license MIT. See `LICENSE.md` for details.

local klass = { }
klass.__index = klass

---
-- Name of the class.
--
-- @tfield string __name
klass.__name = "klass"

---
-- Superclass of the instance or class.
--
-- @tfield klass __super
klass.__super = nil

---
-- Extend a class.
--
-- @tparam string name Name of the new class.
-- @treturn table New class table.
-- @usage
--  local sub = klass:extend("sub")
--  function sub:init(x, y)
--      -- constructor
--  end
--  function sub:dosomething()
--      -- do something here
--  end
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
-- Construct a new instance.
--
-- @tparam any ... Arguments to be passed to `init`.
-- @treturn table New instance.
-- @usage
--  local sub = klass:extend("sub")
--  function sub:init(x)
--      self.x = x
--  end
--  local inst = sub("foobar")
--  print(inst.x) --> foobar
function klass:__call(...)
	local inst = setmetatable({ }, self)
	inst:init(...)
	return inst
end

---
-- Test if this object is an instance of a class.
-- @tparam table c Class.
-- @treturn boolean True if it is an instance, false otherwise.
-- @usage
--  local sub = klass:extend("sub")
--  local klsinst = klass()
--  local subinst = sub()
--  print(subinst:isinstance(klass)) --> true
--  print(subinst:isinstance(sub))   --> true
--  print(klsinst:isinstance(klass)) --> true
--  print(klsinst:isinstance(sub))   --> false
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
-- Instance initializer.
--
-- The default implementation does nothing.
-- It should be overridden in subclasses to do something useful.
--
-- @param ... Arguments passed to `__call`.
function klass:init(...) -- luacheck: ignore
end

---
-- Get a string representation of this instance.
--
-- The default implementation returns "<NAME>".
-- It should be overridden in subclasses if more information is desired.
--
-- @treturn string String representation.
function klass:__tostring()
	return "<"..tostring(self.__name)..">"
end

return setmetatable(klass, { __call=klass.__call })
