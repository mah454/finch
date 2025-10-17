package.path = "/opt/lua/?.lua;" .. package.path
local fw = require("framework")

local function handleRootReq(_, resp)
	resp.header("name", "ali")
	resp.body("Hello dear")
end

fw.route("/", "POST", handleRootReq)

fw.start()
