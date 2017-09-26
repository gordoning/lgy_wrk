import requests,json

'''
正式环境下的
'''

if __name__ == '__main__':

    # 用户端APP的头文件

    # 加盟商app的头文件信息
    franchisees_header = {'authorization':'bvTyyB7DkAZ3QEZkKfSu6wPBsJkGAlHzAVR9AgIScpoGXT2FCP1FNAUjITb7HsjD',"Content-Type":"application/json","Accept":"application/json"}


    # 搜索洗衣房的接口
    # findstore_url = 'http://u.zhinengxiyifang.cn/api/Stores/findNearStoreInc'
    # findstore_params = {"lat": '31.514073', "lont": '120.3966',"skip":0,"limit":3}

    # 获取洗衣房的所有设备详情
    # getstore_device_url = "http://u.zhinengxiyifang.cn/api/Stores/593fb353eef9d1e463000002/devices?filter=%7B%22where%22:%7B%22isRemoved%22:false%7D,%22include%22:%7B%22deviceType%22:%22deviceWashModels%22%7D%7D"


    # 获取设备的详细

    # 获取支付的验签
    # get_pay_args_url = 'http://it-wx-test.zhinengxiyifang.cn/api/Orders/3068/genPayArgs'
    # get_pay_args_params = {"couponId":"","channel":2}



    # 加盟商发送优惠券
    send_coupous_url = 'https://u.zhinengxiyifang.cn/api/Franchisees/6/sendCoupon'
    send_coupous_params = {"serviceSubjectId": 6, "value": "0.01", "expireAt": "2020-09-08", "phones": [18579106120]}
    # 17621778922,15961828736,17751522033,17770049131



    #发起url的请求
    # resp_get = requests.get(url=getstore_device_url,headers=franchisees_header)
    resp_post = requests.post(url=send_coupous_url,data=json.dumps(send_coupous_params),headers=franchisees_header)

    #发多张券
    for i in range(1,9):
        resp_post = requests.post(url=send_coupous_url, data=json.dumps(send_coupous_params),
                                  headers=franchisees_header)

    #打印测试结果
    print(resp_post.content.decode('utf-8'))

