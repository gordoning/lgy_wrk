---获取优惠券的接口
---http://it-wx-test.zhinengxiyifang.cn/api/Coupons?filter=%7B%22include%22:%5B%7B%22relation%22:%22store%22,%22scope%22:%7B%22include%22:%7B%22relation%22:%22serviceSubject%22%7D%7D%7D,%7B%22relation%22:%22serviceSubject%22%7D,%7B%22relation%22:%22couponCard%22,%22scope%22:%7B%22include%22:%7B%22relation%22:%22couponConfig%22,%22scope%22:%7B%22include%22:%22couponType%22%7D%7D%7D%7D%5D,%22where%22:%7B%22userId%22:178,%22expireAt%22:%7B%22gt%22:1504706565197%7D,%22usedTime%22:null%7D%7D

wrk.method = "GET"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"

--./wrk -t2 -c2 -d1s --script='./ujing/get_devices.lua' http://it-wx-test.zhinengxiyifang.cn/api/Coupons?filter=%7B%22include%22:%5B%7B%22relation%22:%22store%22,%22scope%22:%7B%22include%22:%7B%22relation%22:%22serviceSubject%22%7D%7D%7D,%7B%22relation%22:%22serviceSubject%22%7D,%7B%22relation%22:%22couponCard%22,%22scope%22:%7B%22include%22:%7B%22relation%22:%22couponConfig%22,%22scope%22:%7B%22include%22:%22couponType%22%7D%7D%7D%7D%5D,%22where%22:%7B%22userId%22:178,%22expireAt%22:%7B%22gt%22:1504706565197%7D,%22usedTime%22:null%7D%7D
--./wrk -t2 -c2 -d1s --script='./ujing/get_coupons.lua' http://it-wx-test.zhinengxiyifang.cn/api/Coupons?filter=%7B%22include%22:%5B%7B%22relation%22:%22store%22,%22scope%22:%7B%22include%22:%7B%22relation%22:%22serviceSubject%22%7D%7D%7D,%7B%22relation%22:%22serviceSubject%22%7D,%7B%22relation%22:%22couponCard%22,%22scope%22:%7B%22include%22:%7B%22relation%22:%22couponConfig%22,%22scope%22:%7B%22include%22:%22couponType%22%7D%7D%7D%7D%5D,%22where%22:%7B%22userId%22:178,%22expireAt%22:%7B%22gt%22:1504706565197%7D,%22usedTime%22:null%7D%7D



--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]