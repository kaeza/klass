
-- This file is used if you want/need to have `klass` in a subdirectory
-- instead of as a plain Lua file.

-- Redirect to real module.
return require((...)..".klass")
