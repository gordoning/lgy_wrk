--获取洗衣房的所有设备概况


--./wrk -t2 -c2 -d1s --script='./ujing/getstoredevice.lua' http://it-wx-test.zhinengxiyifang.cn/api/Stores/getStoreDevices?storeId=593fb353eef9d1e463000002
--./wrk -t2 -c40 -d20s --script='./ujing/getstoredevice.lua' http://it-wx-test.zhinengxiyifang.cn/api/Stores/getStoreDevices?storeId=593fb353eef9d1e463000002


wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"
wrk.body = '{}'
--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]