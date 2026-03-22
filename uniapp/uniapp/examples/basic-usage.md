# uni-app 基础用法示例

本文档提供 uni-app 开发的常见用例和 API 使用示例。

## 页面开发示例

### 基础页面结构

```vue
<template>
  <view class="container">
    <text class="title">{{ title }}</text>
    <button @click="handleClick">点击我</button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'Hello uni-app'
    }
  },
  methods: {
    handleClick() {
      uni.showToast({
        title: '按钮被点击了',
        icon: 'success'
      })
    }
  }
}
</script>

<style scoped>
.container {
  padding: 20px;
  text-align: center;
}

.title {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
```

### 列表页面

```vue
<template>
  <view class="list-container">
    <view
      v-for="(item, index) in list"
      :key="item.id"
      class="list-item"
      @click="handleItemClick(item)"
    >
      <text class="item-title">{{ item.title }}</text>
      <text class="item-desc">{{ item.desc }}</text>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      list: [
        { id: 1, title: '项目 1', desc: '描述 1' },
        { id: 2, title: '项目 2', desc: '描述 2' },
        { id: 3, title: '项目 3', desc: '描述 3' }
      ]
    }
  },
  methods: {
    handleItemClick(item) {
      uni.navigateTo({
        url: `/pages/detail/detail?id=${item.id}&title=${item.title}`
      })
    }
  }
}
</script>

<style scoped>
.list-container {
  padding: 15px;
}

.list-item {
  padding: 15px;
  margin-bottom: 10px;
  background: #fff;
  border-radius: 8px;
}

.item-title {
  font-size: 16px;
  font-weight: bold;
  display: block;
  margin-bottom: 8px;
}

.item-desc {
  font-size: 14px;
  color: #666;
}
</style>
```

## 数据请求示例

### 封装请求方法

```javascript
// utils/request.js
export function request(options) {
  return new Promise((resolve, reject) => {
    uni.request({
      url: options.url,
      method: options.method || 'GET',
      data: options.data || {},
      header: {
        'Content-Type': 'application/json',
        'Authorization': uni.getStorageSync('token') || ''
      },
      success: (res) => {
        if (res.statusCode === 200) {
          resolve(res.data)
        } else {
          reject(res)
        }
      },
      fail: (err) => {
        uni.showToast({
          title: '网络请求失败',
          icon: 'none'
        })
        reject(err)
      }
    })
  })
}

// 使用示例
import { request } from '@/utils/request'

// GET 请求
export function getUserInfo(userId) {
  return request({
    url: `/api/user/${userId}`,
    method: 'GET'
  })
}

// POST 请求
export function login(username, password) {
  return request({
    url: '/api/login',
    method: 'POST',
    data: { username, password }
  })
}
```

### 页面中使用

```vue
<script>
import { getUserInfo } from '@/api/user'

export default {
  data() {
    return {
      userInfo: null,
      loading: false
    }
  },
  onLoad() {
    this.loadUserInfo()
  },
  methods: {
    async loadUserInfo() {
      this.loading = true
      try {
        const res = await getUserInfo(123)
        this.userInfo = res.data
      } catch (error) {
        console.error('加载失败', error)
      } finally {
        this.loading = false
      }
    }
  }
}
</script>
```

## 表单处理示例

### 登录表单

```vue
<template>
  <view class="login-form">
    <view class="form-item">
      <input
        v-model="form.mobile"
        type="number"
        placeholder="请输入手机号"
        maxlength="11"
      />
    </view>

    <view class="form-item">
      <input
        v-model="form.password"
        type="password"
        placeholder="请输入密码"
        maxlength="20"
      />
    </view>

    <button type="primary" @click="handleLogin" :loading="loading">
      登录
    </button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      form: {
        mobile: '',
        password: ''
      },
      loading: false
    }
  },
  methods: {
    async handleLogin() {
      // 验证
      if (!this.validateForm()) {
        return
      }

      this.loading = true
      try {
        // 调用登录接口
        const res = await this.login(this.form)

        // 存储token
        uni.setStorageSync('token', res.token)

        // 跳转到首页
        uni.switchTab({
          url: '/pages/index/index'
        })

        uni.showToast({
          title: '登录成功',
          icon: 'success'
        })
      } catch (error) {
        uni.showToast({
          title: error.message || '登录失败',
          icon: 'none'
        })
      } finally {
        this.loading = false
      }
    },

    validateForm() {
      if (!this.form.mobile) {
        uni.showToast({
          title: '请输入手机号',
          icon: 'none'
        })
        return false
      }

      if (!/^1[3-9]\d{9}$/.test(this.form.mobile)) {
        uni.showToast({
          title: '手机号格式错误',
          icon: 'none'
        })
        return false
      }

      if (!this.form.password) {
        uni.showToast({
          title: '请输入密码',
          icon: 'none'
        })
        return false
      }

      return true
    },

    login(data) {
      return new Promise((resolve, reject) => {
        uni.request({
          url: 'https://api.example.com/login',
          method: 'POST',
          data: data,
          success: (res) => {
            if (res.statusCode === 200) {
              resolve(res.data)
            } else {
              reject(new Error(res.data.message))
            }
          },
          fail: (err) => {
            reject(new Error('网络错误'))
          }
        })
      })
    }
  }
}
</script>

<style scoped>
.login-form {
  padding: 20px;
}

.form-item {
  margin-bottom: 15px;
}

.form-item input {
  width: 100%;
  height: 44px;
  padding: 0 15px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

button {
  margin-top: 20px;
}
</style>
```

## 图片上传示例

### 选择并上传图片

```vue
<template>
  <view class="upload-container">
    <view class="image-list">
      <view
        v-for="(img, index) in imageList"
        :key="index"
        class="image-item"
      >
        <image :src="img" mode="aspectFill" @click="previewImage(index)" />
        <view class="delete-btn" @click="deleteImage(index)">×</view>
      </view>

      <view v-if="imageList.length < maxCount" class="add-btn" @click="chooseImage">
        <text>+</text>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      imageList: [],
      maxCount: 9
    }
  },
  methods: {
    chooseImage() {
      uni.chooseImage({
        count: this.maxCount - this.imageList.length,
        sizeType: ['compressed'],
        sourceType: ['album', 'camera'],
        success: async (res) => {
          const tempFilePaths = res.tempFilePaths

          // 显示加载
          uni.showLoading({
            title: '上传中...'
          })

          try {
            // 上传所有图片
            for (let filePath of tempFilePaths) {
              const url = await this.uploadImage(filePath)
              this.imageList.push(url)
            }

            uni.hideLoading()
            uni.showToast({
              title: '上传成功',
              icon: 'success'
            })
          } catch (error) {
            uni.hideLoading()
            uni.showToast({
              title: '上传失败',
              icon: 'none'
            })
          }
        }
      })
    },

    uploadImage(filePath) {
      return new Promise((resolve, reject) => {
        uni.uploadFile({
          url: 'https://api.example.com/upload',
          filePath: filePath,
          name: 'file',
          header: {
            'Authorization': uni.getStorageSync('token')
          },
          success: (res) => {
            if (res.statusCode === 200) {
              const data = JSON.parse(res.data)
              resolve(data.url)
            } else {
              reject(new Error('上传失败'))
            }
          },
          fail: (err) => {
            reject(err)
          }
        })
      })
    },

    previewImage(index) {
      uni.previewImage({
        current: index,
        urls: this.imageList
      })
    },

    deleteImage(index) {
      uni.showModal({
        title: '提示',
        content: '确定要删除这张图片吗？',
        success: (res) => {
          if (res.confirm) {
            this.imageList.splice(index, 1)
          }
        }
      })
    }
  }
}
</script>

<style scoped>
.image-list {
  display: flex;
  flex-wrap: wrap;
  padding: 10px;
}

.image-item {
  position: relative;
  width: 100px;
  height: 100px;
  margin: 5px;
}

.image-item image {
  width: 100%;
  height: 100%;
  border-radius: 4px;
}

.delete-btn {
  position: absolute;
  top: -5px;
  right: -5px;
  width: 20px;
  height: 20px;
  background: #ff0000;
  color: #fff;
  border-radius: 50%;
  text-align: center;
  line-height: 20px;
  font-size: 16px;
}

.add-btn {
  width: 100px;
  height: 100px;
  margin: 5px;
  border: 1px dashed #ddd;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
  color: #999;
}
</style>
```

## 下拉刷新和上拉加载

### 页面配置

```json
// pages.json
{
  "pages": [
    {
      "path": "pages/list/list",
      "style": {
        "navigationBarTitleText": "列表页面",
        "enablePullDownRefresh": true,
        "onReachBottomDistance": 50
      }
    }
  ],
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "uni-app",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8"
  }
}
```

### 页面实现

```vue
<script>
export default {
  data() {
    return {
      list: [],
      page: 1,
      pageSize: 10,
      hasMore: true,
      loading: false
    }
  },
  onLoad() {
    this.loadData()
  },
  // 下拉刷新
  onPullDownRefresh() {
    this.page = 1
    this.hasMore = true
    this.loadData().then(() => {
      uni.stopPullDownRefresh()
    })
  },
  // 上拉加载
  onReachBottom() {
    if (this.hasMore && !this.loading) {
      this.page++
      this.loadData()
    }
  },
  methods: {
    async loadData() {
      if (this.loading) return

      this.loading = true

      try {
        const res = await this.fetchList(this.page, this.pageSize)

        if (this.page === 1) {
          this.list = res.data
        } else {
          this.list = [...this.list, ...res.data]
        }

        // 判断是否还有更多数据
        this.hasMore = res.data.length >= this.pageSize
      } catch (error) {
        uni.showToast({
          title: '加载失败',
          icon: 'none'
        })
      } finally {
        this.loading = false
      }
    },

    fetchList(page, pageSize) {
      return new Promise((resolve, reject) => {
        uni.request({
          url: 'https://api.example.com/list',
          method: 'GET',
          data: { page, pageSize },
          success: (res) => {
            if (res.statusCode === 200) {
              resolve(res.data)
            } else {
              reject(new Error('请求失败'))
            }
          },
          fail: reject
        })
      })
    }
  }
}
</script>
```

## 支付功能示例

### 微信支付

```javascript
// 发起微信支付
export function wxPay(orderId) {
  return new Promise((resolve, reject) => {
    // 1. 获取支付参数
    uni.request({
      url: 'https://api.example.com/pay/wx',
      method: 'POST',
      data: { orderId },
      success: (res) => {
        if (res.statusCode === 200) {
          const payData = res.data

          // 2. 调用微信支付
          uni.requestPayment({
            provider: 'wxpay',
            timeStamp: payData.timeStamp,
            nonceStr: payData.nonceStr,
            package: payData.package,
            signType: payData.signType,
            paySign: payData.paySign,
            success: () => {
              resolve()
            },
            fail: (err) => {
              reject(new Error('支付取消或失败'))
            }
          })
        } else {
          reject(new Error('获取支付参数失败'))
        }
      },
      fail: () => {
        reject(new Error('网络错误'))
      }
    })
  })
}

// 使用示例
async function handlePay() {
  try {
    await wxPay('ORDER_123456')
    uni.showToast({
      title: '支付成功',
      icon: 'success'
    })
    // 跳转到支付成功页
    uni.redirectTo({
      url: '/pages/pay-success/pay-success'
    })
  } catch (error) {
    uni.showToast({
      title: error.message,
      icon: 'none'
    })
  }
}
```

## 分享功能

### 配置分享

```vue
<script>
export default {
  // 分享给朋友
  onShareAppMessage() {
    return {
      title: '分享标题',
      path: '/pages/index/index?id=123',
      imageUrl: '/static/share.png'
    }
  },
  // 分享到朋友圈
  onShareTimeline() {
    return {
      title: '分享标题',
      query: 'id=123',
      imageUrl: '/static/share.png'
    }
  }
}
</script>
```

## 注意事项

1. **平台差异**: 注意不同平台的 API 差异，使用条件编译处理
2. **性能优化**: 避免频繁的 setData，使用虚拟列表处理长列表
3. **错误处理**: 统一处理网络错误和业务错误
4. **用户体验**: 添加加载状态和错误提示
5. **安全性**: 敏感数据不要存储在本地，使用后端加密
