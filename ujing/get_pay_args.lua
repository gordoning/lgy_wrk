wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"
wrk.headers["Authorization"] = "fMDRSum949ztwslSQtoaomeOft0iS1cMQmucaMQQQatjGQIit9b2grm11IohJzBu"
wrk.body = '{"couponId": "", "channel": 2}'

--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]
