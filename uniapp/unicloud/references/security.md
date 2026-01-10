# Unicloud - Security

**Pages:** 1

---

## 外部服务器如何与uniCloud安全通讯 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cloud-s2s.html

**Contents:**
- # 外部服务器如何与uniCloud安全通讯
- # 使用connectCode进行安全通讯
  - # 配置
  - # 安全策略
- # 使用数据签名进行安全通讯
  - # 配置
  - # 安全策略
- # 云函数API
  - # 获取安全请求头
  - # 校验http请求是否有效

开发业务时时常遇到外部服务器需要和uniCloud云函数通讯的场景，无论是服务器请求云函数还是云函数请求服务器，接口暴露在外网就可能被非法的调用，因此请求接收方需要一个验证请求来源是否合法。

常见的验证请求来源是否合法的方式有以下两种：

uni-cloud-s2s模块就是为了统一校验、生成验证信息方法，减少重复逻辑，后续官方提供的需要服务器和云函数通讯的云函数及模块均会依赖此模块进行安全通讯。s2s同时有server-to-space和space-to-server的意思。uni-cloud-s2s插件地址：uni-cloud-s2s

上述两种安全通讯方式在uni-cloud-s2s内均有实现：

uni-cloud-s2s仅能在云函数内使用，开发者需要按照uni-cloud-s2s的规范在服务器上进行生成安全请求头、验证请求方法

本模块相关配置需在uni-config-center 内进行配置，配置文件位于uniCloud/cloudfunctions/common/uni-config-center/uni-cloud-s2s/config.json。

以下配置示例为标准的json，注释仅为进行说明，如果拷贝示例内容到项目内务必移除注释。

示例源码如下，请查看 pre > code 标签中的内容

接收方仅要求请求方在请求头的Unicloud-S2s-Authorization内携带CONNECTCODE ${connectCode}，其中connectCode为配置文件内的connectCode值。

如果请求发起方是uniCloud云函数，可以调用uni-cloud-s2s提供的getSecureHeaders方法传入数据直接获取安全请求头信息。如果请求接收方是uniCloud云函数，可以调用uni-cloud-s2s提供的verifyHttpInfo方法传入云函数收到的httpInfo信息直接获取验证结果。

示例源码如下，请查看 pre > code 标签中的内容

本模块相关配置需在uni-config-center 内进行配置，配置文件位于uniCloud/cloudfunctions/common/uni-config-center/uni-cloud-s2s/config.json。

以下配置示例为标准的json，注释仅为进行说明，如果拷贝示例内容到项目内务必移除注释。

示例源码如下，请查看 pre > code 标签中的内容

请求发起方需要在请求头内生成合法的Unicloud-S2s-Timestamp（生成签名的时间戳）和Unicloud-S2s-Signature（签名），以通过请求接收方校验

如果请求发起方是uniCloud云函数，可以调用uni-cloud-s2s提供的getSecureHeaders方法传入数据直接获取签名后的请求头信息。如果请求接收方是uniCloud云函数，可以调用uni-cloud-s2s提供的verifyHttpInfo方法传入云函数收到的httpInfo信息直接获取验证结果。

对于非云函数场景，请求发起方需要按如下规则进行签名，接收方也需要按照如下规则重新生成签名以验证签名真伪。

GET方法url为a=1&b=2对应的签名数据为

示例源码如下，请查看 pre > code 标签中的内容

POST方法body内url串为a=1&b=2对应的签名数据为

示例源码如下，请查看 pre > code 标签中的内容

POST方法body内的json串为{"num": 1, "str": "abc", "bool": true, "arr": [1,2,3]}对应的签名数据为

示例源码如下，请查看 pre > code 标签中的内容

将签名数据的key按照升序排序拼接为key1=value1&key2=value2的字符串暂记为payloadStr

配置文件内配置的signKey暂记为signKey

如果配置的hashMethod为md5、sha1或sha256，直接使用上述哈希方法对字符串timestamp+'\n'+payloadStr+'\n'+signKey生成hex格式摘要即可。各语言生成hash摘要方法请参考：createHash

如果配置的hashMethod为hmac-sha256，需要以signKey为key对字符串timestamp+'\n'+payloadStr生成hex格式摘要即可。各语言生成hmac摘要方法请参考：createHmac

至此签名生成完成，发起方将时间戳及签名分别放在请求头的Unicloud-S2s-Timestamp和Unicloud-S2s-Signature内即可发送请求。接收方直接判断生成的签名是否和请求头内一致即可，如果有需求也可以额外判断一下请求头内的时间戳是否是近期时间。

示例源码如下，请查看 pre > code 标签中的内容

传入要签名的数据，获取请求头信息。请求发送方进行请求签名时需使用此方法。

示例源码如下，请查看 pre > code 标签中的内容

getSecureHeaders根据配置的安全策略不同返回不同的安全请求头信息。实际使用时仅需将此方法返回的值放到请求头内即可

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

传入http请求数据，校验本次请求是否合法。请求接收方调用此方法进行验证。校验未通过时，verifyHttpInfo方法会抛出错误。详细错误列表见：错误码

示例源码如下，请查看 pre > code 标签中的内容

如需捕获此方法验证失败/未通过的错误需要使用try-catch

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述数据使用不同签名方法获取的签名串分别如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

云函数校验安全请求头，需要在自有服务器完成获取安全请求头逻辑

示例源码如下，请查看 pre > code 标签中的内容

云函数内获取安全请求头，需要在自有服务器完成校验逻辑。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
  "type": "connectCode",
  "connectCode": "" // 一个较长的字符串即可，不可包含中文，请求方将请求头Unicloud-S2s-Authorization设为`CONNECTCODE + ' ' + 此值`即可通过接收方方校验
}
```

Example 2 (json):
```json
{
  "type": "connectCode",
  "connectCode": "" // 一个较长的字符串即可，不可包含中文，请求方将请求头Unicloud-S2s-Authorization设为`CONNECTCODE + ' ' + 此值`即可通过接收方方校验
}
```

Example 3 (json):
```json
{
  "type": "connectCode",
  "connectCode": "" // 一个较长的字符串即可，不可包含中文，请求方将请求头Unicloud-S2s-Authorization设为`CONNECTCODE + ' ' + 此值`即可通过接收方方校验
}
```

Example 4 (json):
```json
{
  "type": "connectCode",
  "connectCode": "" // 一个较长的字符串即可，不可包含中文，请求方将请求头Unicloud-S2s-Authorization设为`CONNECTCODE + ' ' + 此值`即可通过接收方方校验
}
```

---
