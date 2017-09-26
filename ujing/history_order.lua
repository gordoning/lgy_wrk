--获取历史订单
--http://it-wx-test.zhinengxiyifang.cn/api/LbUsers/178/historyOrders?filter=%7B%22include%22:%5B%7B%22relation%22:%22device%22,%22scope%22:%7B%22fields%22:%5B%22no%22,%22deviceTypeId%22%5D%7D%7D,%7B%22relation%22:%22store%22,%22scope%22:%7B%22fields%22:%5B%22address%22%5D%7D%7D,%7B%22relation%22:%22autoLaunchGear%22%7D%5D,%22skip%22:0,%22limit%22:4,%22order%22:%22movedAt+DESC%22,%22where%22:%7B%22isDelete%22:false%7D%7D
--./wrk -t2 -c40 -d30s --script='./ujing/history_order.lua' http://it-wx-test.zhinengxiyifang.cn/api/LbUsers/178/historyOrders?filter=%7B%22include%22:%5B%7B%22relation%22:%22device%22,%22scope%22:%7B%22fields%22:%5B%22no%22,%22deviceTypeId%22%5D%7D%7D,%7B%22relation%22:%22store%22,%22scope%22:%7B%22fields%22:%5B%22address%22%5D%7D%7D,%7B%22relation%22:%22autoLaunchGear%22%7D%5D,%22skip%22:0,%22limit%22:4,%22order%22:%22movedAt+DESC%22,%22where%22:%7B%22isDelete%22:false%7D%7D


wrk.method = "GET"
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
