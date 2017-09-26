--- 查看消息列表
-----./wrk -t2 -c2 -d1s --script='./ujing/messages.lua' http://it-wx-test.zhinengxiyifang.cn/api/LbUsers/178/messages?filter=%7B%22skip%22:0,%22limit%22:5,%22order%22:%22createTime+DESC%22%7D


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