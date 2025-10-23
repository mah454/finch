package.path = "/opt/lua/?.lua;" .. package.path
local finch = require("finch")
local logger = require("finch.logger")

local function handle(_, resp)
	resp.header("name", "ali")
	resp.body("Hello dear")
end

finch.route("/", "GET", handle)

finch.start()
