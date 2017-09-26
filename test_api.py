import requests,json

if __name__ == '__main__':

    # 用户端APP的头文件
    headers = {'authorization':'sU5TTk6Ze52xKbLalD6NHsmfweNLEuSqpvEe0tBUj9bTECLkaie8vsuzERo4Kx9E',"Content-Type":"application/json","Accept":"application/json"}

    # 加盟商app的头文件信息--测试环境
    franchisees_header = {'authorization':'j4w3t4DptEv0MDfwOTdSFbjMdH6pqTV4FDXtk1vujaBs77b6GRC4Nh5N46Yb9HC4',"Content-Type":"application/json","Accept":"application/json"}
    # franchisees_header = {'authorization':'bvTyyB7DkAZ3QEZkKfSu6wPBsJkGAlHzAVR9AgIScpoGXT2FCP1FNAUjITb7HsjD',"Content-Type":"application/json","Accept":"application/json"}


    # 搜索洗衣房的接口
    findstore_url = 'http://it-wx-test.zhinengxiyifang.cn/api/Stores/findNearStoreInc'
    findstore_params = {"lat": '31.514073', "lont": '120.3966',"skip":0,"limit":3}

    # 获取洗衣房的所有设备详情
    getstore_device_url = "http://it-wx-test.zhinengxiyifang.cn/api/Stores/593fb353eef9d1e463000002/devices?filter=%7B%22where%22:%7B%22isRemoved%22:false%7D,%22include%22:%7B%22deviceType%22:%22deviceWashModels%22%7D%7D"


    # 获取设备的详细

    # 获取支付的验签
    get_pay_args_url = 'http://it-wx-test.zhinengxiyifang.cn/api/Orders/3068/genPayArgs'
    get_pay_args_params = {"couponId":"","channel":2}


    # 加盟商发送优惠券--测试环境
    send_coupous_url = 'http://it-wx-test.zhinengxiyifang.cn/api/Franchisees/76/sendCoupon'
    send_coupous_params = {"serviceSubjectId":36,"value":"8","expireAt":"2020-09-08","phones":[18579106120]}
    # 17621778922,15961828736,17751522033,17770049131



    #发起加盟商的请求
    # resp_get = requests.get(url=getstore_device_url,headers=franchisees_header)
    resp_post = requests.post(url=send_coupous_url,data=json.dumps(send_coupous_params),headers=franchisees_header)

    #发多张券
    for i in range(1,5):
        resp_post = requests.post(url=send_coupous_url, data=json.dumps(send_coupous_params),
                                  headers=franchisees_header)

    #打印测试结果
    print(resp_post.content.decode('utf-8'))

