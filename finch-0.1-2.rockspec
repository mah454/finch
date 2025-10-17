package = "finch"
version = "0.1-2"
source = {
	url = "git+https://github.com/mah454/finch.git",
	branch = "main"
}

description = {
	summary = "A minimal and lightweight micro framework for Lua",
	detailed = [[
    Finch is a lightweight and developer-friendly framework for building RESTful APIs in pure Lua.
    It provides a simple routing mechanism and clean abstractions for handling HTTP requests and
    responses, making it easy to create fast and maintainable web services.
    
    Perfect for small projects, microservices, or embedding REST logic inside Nginx/OpenResty.
]],
	homepage = "https://github.com/mah454/finch",
	license = "GPLv3",
}

dependencies = {
	"lua >= 5.1",
}

build = {
	type = "builtin",
	modules = {
		["finch"] = "src/finch.lua",
		["finch.logger"] = "src/logger.lua",
	},
}
