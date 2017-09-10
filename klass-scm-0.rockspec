
package = "klass"
version = "scm-0"

source = {
   url = "http://github.com/kaeza/lua-klass/archive/master.tar.gz",
}

description = {
	summary = "Minimalistic class system.",
	homepage = "http://github.com/kaeza/lua-klass",
	license = "MIT",
}

dependencies = {
	"lua >= 5.1, < 5.4",
}

build = {
	type = "builtin",
	modules = {
		["klass"] = "klass.lua",
	},
}
