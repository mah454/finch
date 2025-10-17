local ngx = require("ngx")
local logger = require("finch.logger")

local finch = {
	routes = {},
}

function finch.route(path, method, callback)
	finch.routes[method .. "#" .. path] = {
		path = path,
		method = method,
		callback = callback,
	}
end

function finch.start()
	local _path = ngx.var.uri
	local _method = ngx.req.get_method()
	ngx.req.read_body()

	local req = {
		headers = function()
			return ngx.req.get_headers()
		end,
		params = function()
			return ngx.req.get_uri_args()
		end,
		body = function()
			return ngx.req.get_body_data()
		end,
	}

	local resp = {
		header = function(k, v)
			ngx.header[k] = v
		end,
		body = function(v)
			ngx.say(v)
		end,
	}

	local route = finch.routes[_method .. "#" .. _path]
	if route then
		route.callback(req, resp)
		return
	else
		logger.warn("No matching route found")
		ngx.status = 404
	end
end

return finch
