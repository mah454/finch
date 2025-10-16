local ngx = require("ngx")
local cjson = require("cjson")

ngx.say("Hello")

local headers = ngx.req.get_headers()

for k, v in pairs(headers) do
	ngx.say(k .. " : " .. v)
end
