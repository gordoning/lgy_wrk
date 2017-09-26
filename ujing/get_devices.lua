---获取设备的详情
--- Created by lgy.
--- DateTime: 2017/9/6 下午9:16
---


--./wrk -t2 -c2 -d1s --script='./ujing/get_devices.lua' http://it-wx-test.zhinengxiyifang.cn/api/Stores/593fb353eef9d1e463000002/devices?filter=%7B%22where%22:%7B%22isRemoved%22:false%7D,%22include%22:%7B%22deviceType%22:%22deviceWashModels%22%7D%7D
--./wrk -t2 -c20 -d20s --script='./ujing/get_devices.lua' http://it-wx-test.zhinengxiyifang.cn/api/Stores/593fb353eef9d1e463000002/devices?filter=%7B%22where%22:%7B%22isRemoved%22:false%7D,%22include%22:%7B%22deviceType%22:%22deviceWashModels%22%7D%7D


wrk.method = "GET"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"

--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]