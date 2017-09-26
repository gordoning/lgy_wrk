---创建订单
--- http://it-wx-test.zhinengxiyifang.cn/api/AppUsers/46/createOrder
--./wrk -t2 -c2 -d1s --script='./ujing/create_order.lua' http://it-wx-test.zhinengxiyifang.cn/api/AppUsers/46/createOrder


wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"
wrk.headers["Authorization"] = "sU5TTk6Ze52xKbLalD6NHsmfweNLEuSqpvEe0tBUj9bTECLkaie8vsuzERo4Kx9E"
wrk.body = '{"payment":0,"deviceWashModelId":4,"storeId":"593fb353eef9d1e463000002","deviceTypeId":2}'

--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]