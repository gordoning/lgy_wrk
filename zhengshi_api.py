import requests,json
from requests import HTTPError,Timeout
import time
import logging
'''
正式环境下的
'''

if __name__ == '__main__':

    # 设置log文件
    logging.basicConfig(filename='lgy_log.log', filemode="w", level=logging.INFO)

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

    # 手机号码列表
    # phones = [15637238987,17635456545,13616187656]
    phones_num = [{'phone':13616187656,'num':1},{'phone':13516352634,'num':3},{'phone':13616187656,'num':1}]

    #发起url的请求
    # resp_get = requests.get(url=getstore_device_url,headers=franchisees_header)
    # resp_post = requests.post(url=send_coupous_url,data=json.dumps(send_coupous_params),headers=franchisees_header)

    # # resp_post = None
    # print(phones_num[0]['phone'])
    # 发多张券
    for i in range(0,len(phones_num)):

        phone = phones_num[i]['phone']
        num = int(phones_num[i]['num'])
        for j in range(0,num):

            send_coupous_params = {"serviceSubjectId": 6, "value": "0.01", "expireAt": "2020-09-08",
                                   "phones": [phone]}
            try:
                resp_post = requests.post(url=send_coupous_url, data=json.dumps(send_coupous_params),
                                          headers=franchisees_header, timeout=3)
                # print(phone,resp_post.status_code,"第{0}次".format(j+1))
            except Timeout:
                print("!!异常号码:{0}，已成功次数:{1}".format(phone,j))
                logging.debug('This message should go to the log file')
                logging.info("!!!异常号码:{0}，已发券:{1}".format(phone,j))
                logging.warning('And this, too')
                break

        time.sleep(0.5)

        print("已操作号码:{0}".format(phone))
        logging.info("已操作号码:{0}".format(phone))


    #打印测试结果
    # print(resp_post.content.decode('utf-8'))
    # print(resp_post.status_code)

