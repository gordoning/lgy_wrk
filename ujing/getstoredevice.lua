wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"

--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]
