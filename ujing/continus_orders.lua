--启动洗衣/继续洗衣的接口
--./wrk -t2 -c2 -d5s --script='./ujing/continus_orders.lua' http://it-wx-test.zhinengxiyifang.cn/api/Orders/3088/continueWash



wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"
wrk.headers["Authorization"] = "sU5TTk6Ze52xKbLalD6NHsmfweNLEuSqpvEe0tBUj9bTECLkaie8vsuzERo4Kx9E"

--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]
