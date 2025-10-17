package.path = "/opt/lua/?.lua;" .. package.path
local finch = require("finch")

local function handleRootReq(_, resp)
	resp.header("name", "ali")
	resp.body("Hello dear")
end

finch.route("/", "GET", handleRootReq)

finch.start()
