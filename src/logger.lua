local ngx = require("ngx")
local logger = {}

local function log(level, text)
	local datetime = os.date("%Y-%m-%d %H:%M:%S")
	local msg = datetime
		.. " ["
		.. level
		.. "] "
		.. ngx.var.server_addr
		.. ":"
		.. ngx.var.server_port
		.. " "
		.. ngx.var.remote_addr
		.. ":"
		.. ngx.var.remote_port
		.. " "
		.. ngx.req.get_method()
		.. " "
		.. ngx.var.scheme
		.. " ["
		.. ngx.var.uri
		.. "] "
		.. text
		.. "\n"

	io.stdout:write(msg)
end

function logger.info(text)
	log("INFO ", text)
end

function logger.warn(text)
	log("WARN ", text)
end

function logger.debug(text)
	log("DEBUG", text)
end

function logger.error(text)
	log("ERROR", text)
end

return logger
