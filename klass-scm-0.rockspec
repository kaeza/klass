
package = "klass"
version = "scm-0"

source = {
   url = "git://github.com/kaeza/klass",
}

description = {
	summary = "Minimalistic class system.",
	homepage = "http://github.com/kaeza/klass",
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
