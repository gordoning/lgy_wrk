--
-- Created by IntelliJ IDEA.
-- User: lgy
-- Date: 2017/9/6
-- Time: 下午3:36
-- To change this template use File | Settings | File Templates.
--

wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.headers["Accept"] = "application/json"
wrk.body = '{"mobile":"13888888888","code":"8888"}'

--wrk.headers["Authorization"] = "fPxvZpWTHvdGwB8RHsXc8OlYcl4cRiMKDLK57vq34FN1FFHGbPhF3ESyoBv8rwqA"

response = function(status, headers, body)
   print(status)
   print(headers)
   print(body)
end