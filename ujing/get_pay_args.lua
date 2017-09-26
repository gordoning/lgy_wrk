--美的付验签的接口
--./wrk -t2 -c2 -d1s --script='./ujing/get_pay_args.lua' http://it-wx-test.zhinengxiyifang.cn/api/Orders/3068/genPayArgs
--./wrk -t2 -c20 -d30s --script='./ujing/get_pay_args.lua' http://it-wx-test.zhinengxiyifang.cn/api/Orders/3070/genPayArgs



wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"
wrk.headers["Authorization"] = "sU5TTk6Ze52xKbLalD6NHsmfweNLEuSqpvEe0tBUj9bTECLkaie8vsuzERo4Kx9E"
wrk.body = '{"couponId":"","channel":2}'

--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]
