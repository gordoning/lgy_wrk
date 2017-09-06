# 编译

直接在wrk目录下运行make命令即可。
编译完成后会在当前目录下生成一个wrk的命令。

# 使用方法举例

搜索附近洗衣房

```
./wrk -t5 -c200 -d180s --script=findnearstore.lua --latency http://u.zhinengxiyifang.cn:80/api/Stores/findNearStore
```

-t10 表示线程个数，一般不需要改动

-c200 表示TCP每秒并发连接的个数，上面是200，可以根据实际测试情况增大或减少，这个可以模拟同时在线的用户数量

-d180s 表示压力测试总共运行180秒的时间


--script=findnearstore.lua 指明需要运行的lua脚本路径

--latency 表示打印出统计的延时信息

最后跟要测试的http的url即可


# 具体使用参考连接

使用方法

简单的例子

```
wrk -t4 -c1000 -d30s -T30s --latency http://www.douban.com
```

上面这条命令的意思是用4个线程来模拟1000个并发连接，整个测试持续30秒，连接超时30秒，打印出请求的延迟统计信息。

需要注意的是 wrk 使用异步非阻塞的 io，并不是用线程去模拟并发连接，因此不需要设置很多的线程，一般根据 CPU 的核心数量设置即可。
另外 -c 参数设置的值必须大于 -t 参数的值。

输出的结果如下

```
Running 30s test @ http://www.douban.com
  4 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    18.50s   854.51ms  20.38s    66.21%
    Req/Sec    18.88     20.80    67.00     80.00%
  Latency Distribution
     50%   18.52s 
     75%   19.06s 
     90%   19.79s 
     99%   20.35s 
  367 requests in 30.09s, 167.73KB read
  Socket errors: connect 0, read 380, write 0, timeout 0
Requests/sec:     12.20 
Transfer/sec:     5.57KB

```
主要关注的几个数据是

Socket errors socket 错误的数量
Requests/sec 每秒请求数量，也就是并发能力
Latency 延迟情况及其分布

如果遇到 -c 参数设置得太大，导致出现 Too many open files，可以查看一下系统的配置

cat /proc/sys/fs/file-max
wrk 的使用方法也可以查看帮助信息

```
Usage: wrk <options> <url>                            
  Options:                                            
    -c, --connections <N>  Connections to keep open   
    -d, --duration    <T>  Duration of test           
    -t, --threads     <N>  Number of threads to use   
                                                      
    -s, --script      <S>  Load Lua script file       
    -H, --header      <H>  Add header to request      
        --latency          Print latency statistics   
        --timeout     <T>  Socket/request timeout     
    -v, --version          Print version details      
                                                      
  Numeric arguments may include a SI unit (1k, 1M, 1G)
  Time arguments may include a time unit (2s, 2m, 2h)

```
wrk 支持使用 lua 来写脚本，wrk 的代码中 scripts 文件夹中就给出了不少例子，例如 post.lua，可以根据需要来修改。

```
-- example HTTP POST script which demonstrates setting the
-- HTTP method, body, and adding a header
wrk.method = "POST"
wrk.body   = "foo=bar&baz=quux"
wrk.headers["Content-Type"] = "application/x-www-form-urlencoded"
```
可以这样来调用 script

```
wrk -t4 -c100 -d30s -T30s --script=post.lua --latency http://www.douban.com
```

# 用 lua 脚本测试复杂场景

wrk 提供了几个 hook 函数，可以用 lua 来编写一些复杂场景下的测试：

setup

这个函数在目标 IP 地址已经解析完，并且所有 thread 已经生成，但是还没有开始时被调用，每个线程执行一次这个函数。可以通过 thread:get(name)， thread:set(name, value) 设置线程级别的变量。

init

每次请求发送之前被调用。可以接受 wrk 命令行的额外参数，通过 – 指定。

delay

这个函数返回一个数值，在这次请求执行完以后延迟多长时间执行下一个请求，可以对应 thinking time 的场景。

request

通过这个函数可以每次请求之前修改本次请求的属性，返回一个字符串，这个函数要慎用， 会影响测试端性能。

response

每次请求返回以后被调用，可以根据响应内容做特殊处理，比如遇到特殊响应停止执行测试，或输出到控制台等等。

可以查看 scripts 文件夹下的例子，例如 delay.lua，实现的是每个请求前会有随机的延迟。

```
-- example script that demonstrates adding a random
-- 10-50ms delay before each request
function delay()
   return math.random(10, 50)
end

```



