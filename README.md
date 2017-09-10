
# Klass

Minimalistic class system for Lua.

## License

This program is free software released under a permissive license. You can
use it both in Free and closed source software. See `LICENSE.md` for details.

## Requirements

* [Lua][Lua] 5.1 to 5.3.

## API Documentation

The API documentation is generated using [LDoc][LDoc], and is available
[here][apidocs].

## Links

* Download development version: [`.zip`][devzip], [`.tar.gz`][devtgz].
* [Project page][repo] at Github.

## Examples

    local klass = require "klass"

    local Base = klass:extend("Base")

    Base.x = 1

    function Base:init(x)
        self.x = x
    end

    function Base:__tostring()
        return self.__name..": "..tostring(self.x)
    end

    local Derived = Base:extend("Derived")

    Derived.x = 3

    local t1 = Base()
    local t2 = Base(2)
    local t3 = Derived()
    local t4 = Derived(4)
    local t5 = Derived(t1)

    print(t1) --> Base: 1
    print(t2) --> Base: 2
    print(t3) --> Derived: 3
    print(t4) --> Derived: 4
    print(t5) --> Derived: Base: 1

    print(t5.x) --> Base: 1

[Lua]: http://lua.org
[LDoc]: https://github.com/stevedonovan/LDoc
[apidocs]: https://kaeza.github.io/luadocs/klass/
[devzip]: https://github.com/kaeza/lua-klass/archive/master.zip
[devtgz]: https://github.com/kaeza/lua-klass/archive/master.tar.gz
[repo]: https://github.com/kaeza/lua-klass
