--搜索附近洗衣房
--curl 'http://it-wx-test.zhinengxiyifang.cn/api/Stores/findNearStoreInc'
--13888888888的认证信息，ACaYZFbQOFlpuGP9jGU0MhBnbujFNAweEPetWlhnPtTqA5uTA7ACTpFO2c49m21U
--./wrk -t2 -c40 -d30s --script='./ujing/findnearstore.lua' http://it-wx-test.zhinengxiyifang.cn/api/Stores/findNearStoreInc

wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"
wrk.body = '{"lat": 31.514073, "lont": 120.3966,"skip":0,"limit":3}'


--[[
response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end

--]]

---H 'authorization: A7PWcYPajF4odk6GlRveKYt2xTshbkJD6q9VfCqK8Q1axnPwUE3rR8d1VzMeYOjk'
---H 'Origin: http://localhost:3002' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6' -H 'User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Referer: http://localhost:3002/' -H 'Connection: keep-alive'
--data-binary '{"lat":"31.514073","lont":"120.39660","skip":0,"limit":3}' --compressed
