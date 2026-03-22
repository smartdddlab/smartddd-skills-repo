# uni-app 高级模式示例

本文档提供 uni-app 开发的高级模式和最佳实践示例。

## 状态管理模式

### 使用 Vuex 管理全局状态

#### 1. 创建 Store

```javascript
// store/index.js
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userInfo: null,
    token: uni.getStorageSync('token') || '',
    cartList: []
  },

  mutations: {
    SET_USER_INFO(state, userInfo) {
      state.userInfo = userInfo
    },

    SET_TOKEN(state, token) {
      state.token = token
      uni.setStorageSync('token', token)
    },

    ADD_TO_CART(state, product) {
      const existItem = state.cartList.find(item => item.id === product.id)
      if (existItem) {
        existItem.quantity += product.quantity || 1
      } else {
        state.cartList.push({
          ...product,
          quantity: product.quantity || 1
        })
      }
    },

    REMOVE_FROM_CART(state, productId) {
      const index = state.cartList.findIndex(item => item.id === productId)
      if (index > -1) {
        state.cartList.splice(index, 1)
      }
    },

    CLEAR_CART(state) {
      state.cartList = []
    }
  },

  actions: {
    // 登录
    async login({ commit }, { username, password }) {
      const res = await uni.request({
        url: 'https://api.example.com/login',
        method: 'POST',
        data: { username, password }
      })

      commit('SET_TOKEN', res.data.token)
      commit('SET_USER_INFO', res.data.userInfo)

      return res.data
    },

    // 获取用户信息
    async getUserInfo({ commit, state }) {
      if (!state.token) {
        throw new Error('未登录')
      }

      const res = await uni.request({
        url: 'https://api.example.com/user/info',
        header: {
          'Authorization': state.token
        }
      })

      commit('SET_USER_INFO', res.data)
      return res.data
    },

    // 退出登录
    logout({ commit }) {
      commit('SET_TOKEN', '')
      commit('SET_USER_INFO', null)
      uni.removeStorageSync('token')
    }
  },

  getters: {
    isLogin: state => !!state.token,
    cartTotal: state => state.cartList.reduce((sum, item) => sum + item.quantity, 0),
    cartAmount: state => state.cartList.reduce((sum, item) => sum + item.price * item.quantity, 0)
  }
})
```

#### 2. 在页面中使用

```vue
<template>
  <view class="container">
    <view v-if="isLogin">
      <text>欢迎，{{ userInfo.name }}</text>
      <text>购物车: {{ cartTotal }} 件</text>
    </view>
    <view v-else>
      <button @click="goLogin">登录</button>
    </view>
  </view>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex'

export default {
  computed: {
    ...mapState(['userInfo']),
    ...mapGetters(['isLogin', 'cartTotal'])
  },

  onLoad() {
    if (this.isLogin) {
      this.getUserInfo()
    }
  },

  methods: {
    ...mapActions(['getUserInfo']),

    goLogin() {
      uni.navigateTo({
        url: '/pages/login/login'
      })
    }
  }
}
</script>
```

## 组件通信模式

### 父子组件通信

```vue
<!-- 父组件 parent.vue -->
<template>
  <view class="parent">
    <child-component
      :title="parentTitle"
      :data="childData"
      @update="handleUpdate"
      @delete="handleDelete"
    />
  </view>
</template>

<script>
import ChildComponent from '@/components/child-component.vue'

export default {
  components: {
    ChildComponent
  },

  data() {
    return {
      parentTitle: '标题',
      childData: { id: 1, name: '测试' }
    }
  },

  methods: {
    handleUpdate(data) {
      console.log('子组件更新:', data)
      this.childData = data
    },

    handleDelete(id) {
      console.log('子组件删除:', id)
    }
  }
}
</script>
```

```vue
<!-- 子组件 child-component.vue -->
<template>
  <view class="child">
    <text>{{ title }}</text>
    <text>{{ data.name }}</text>
    <button @click="handleUpdate">更新</button>
    <button @click="handleDelete">删除</button>
  </view>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      required: true
    },
    data: {
      type: Object,
      default: () => ({})
    }
  },

  methods: {
    handleUpdate() {
      this.$emit('update', {
        ...this.data,
        name: '新名称'
      })
    },

    handleDelete() {
      this.$emit('delete', this.data.id)
    }
  }
}
</script>
```

### 兄弟组件通信（事件总线）

```javascript
// utils/event-bus.js
class EventBus {
  constructor() {
    this.events = {}
  }

  on(event, callback) {
    if (!this.events[event]) {
      this.events[event] = []
    }
    this.events[event].push(callback)
  }

  emit(event, ...args) {
    if (this.events[event]) {
      this.events[event].forEach(callback => {
        callback(...args)
      })
    }
  }

  off(event, callback) {
    if (this.events[event]) {
      this.events[event] = this.events[event].filter(cb => cb !== callback)
    }
  }
}

export default new EventBus()
```

```vue
<!-- 组件 A - 发送事件 -->
<script>
import EventBus from '@/utils/event-bus'

export default {
  methods: {
    sendData() {
      EventBus.emit('data-update', { id: 1, name: '数据' })
    }
  }
}
</script>
```

```vue
<!-- 组件 B - 接收事件 -->
<script>
import EventBus from '@/utils/event-bus'

export default {
  onLoad() {
    EventBus.on('data-update', this.handleDataUpdate)
  },

  onUnload() {
    EventBus.off('data-update', this.handleDataUpdate)
  },

  methods: {
    handleDataUpdate(data) {
      console.log('收到数据:', data)
    }
  }
}
</script>
```

## 权限控制模式

### 路由守卫

```javascript
// main.js
import Vue from 'vue'
import App from './App'

// 需要登录的页面列表
const authPages = [
  '/pages/cart/cart',
  '/pages/order/order',
  '/pages/user/user'
]

// 页面跳转拦截
const originalNavigateTo = uni.navigateTo
uni.navigateTo = function(options) {
  if (authPages.includes(options.url)) {
    const token = uni.getStorageSync('token')
    if (!token) {
      uni.showToast({
        title: '请先登录',
        icon: 'none'
      })
      setTimeout(() => {
        uni.navigateTo({
          url: '/pages/login/login'
        })
      }, 1500)
      return
    }
  }
  return originalNavigateTo.call(this, options)
}

const app = new Vue({
  ...App
})
app.$mount()
```

### 权限指令

```javascript
// directives/permission.js
export default {
  inserted(el, binding, vnode) {
    const { value } = binding
    const permissions = uni.getStorageSync('permissions') || []

    if (value && !permissions.includes(value)) {
      el.parentNode && el.parentNode.removeChild(el)
    }
  }
}

// main.js
import Vue from 'vue'
import permission from '@/directives/permission'

Vue.directive('permission', permission)
```

```vue
<!-- 使用权限指令 -->
<template>
  <view>
    <button v-permission="'user:delete'">删除用户</button>
    <button v-permission="'order:cancel'">取消订单</button>
  </view>
</template>
```

## 混合开发模式

### WebView 与原生通信

```vue
<template>
  <view>
    <web-view :src="webUrl" @message="handleMessage"></web-view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      webUrl: 'https://example.com/h5'
    }
  },

  onLoad(options) {
    // 传递参数给 H5
    if (options.token) {
      this.webUrl = `${this.webUrl}?token=${options.token}`
    }
  },

  methods: {
    // 接收 H5 发送的消息
    handleMessage(e) {
      const data = e.detail.data[0]
      console.log('收到 H5 消息:', data)

      switch (data.action) {
        case 'login':
          this.handleLogin(data)
          break
        case 'pay':
          this.handlePay(data)
          break
        case 'share':
          this.handleShare(data)
          break
      }
    },

    handleLogin(data) {
      // 处理登录
      uni.setStorageSync('token', data.token)
    },

    handlePay(data) {
      // 调用原生支付
      // ...
    },

    handleShare(data) {
      // 调用原生分享
      uni.share({
        provider: 'weixin',
        scene: 'WXSceneSession',
        type: 0,
        href: data.url,
        title: data.title,
        summary: data.desc,
        imageUrl: data.image
      })
    }
  }
}
</script>
```

### H5 页面发送消息

```html
<!-- H5 页面 -->
<script type="text/javascript">
  // 向原生发送消息
  function sendMessageToNative(action, data) {
    if (window.uni) {
      // uni-app 环境
      uni.postMessage({
        data: {
          action: action,
          ...data
        }
      })
    } else {
      // 普通浏览器环境
      console.log('不在 uni-app 环境中')
    }
  }

  // 示例：调用原生支付
  function callNativePay(orderId) {
    sendMessageToNative('pay', {
      orderId: orderId,
      amount: 100
    })
  }

  // 示例：调用原生分享
  function callNativeShare() {
    sendMessageToNative('share', {
      title: '分享标题',
      desc: '分享描述',
      url: 'https://example.com',
      image: 'https://example.com/share.png'
    })
  }
</script>
```

## 性能优化模式

### 虚拟列表

```vue
<template>
  <scroll-view
    scroll-y
    :style="{ height: windowHeight + 'px' }"
    @scroll="handleScroll"
  >
    <view :style="{ height: totalHeight + 'px', position: 'relative' }">
      <view
        v-for="item in visibleList"
        :key="item.id"
        :style="{
          position: 'absolute',
          top: item._top + 'px',
          width: '100%'
        }"
      >
        <view class="list-item">
          <text>{{ item.title }}</text>
          <text>{{ item.desc }}</text>
        </view>
      </view>
    </view>
  </scroll-view>
</template>

<script>
export default {
  data() {
    return {
      list: [],
      windowHeight: 0,
      itemHeight: 100,
      startIndex: 0,
      visibleCount: 10
    }
  },

  computed: {
    totalHeight() {
      return this.list.length * this.itemHeight
    },

    visibleList() {
      const endIndex = Math.min(
        this.startIndex + this.visibleCount,
        this.list.length
      )

      return this.list.slice(this.startIndex, endIndex).map((item, index) => {
        return {
          ...item,
          _top: (this.startIndex + index) * this.itemHeight
        }
      })
    }
  },

  onLoad() {
    this.windowHeight = uni.getSystemInfoSync().windowHeight
    this.visibleCount = Math.ceil(this.windowHeight / this.itemHeight) + 2
    this.loadData()
  },

  methods: {
    handleScroll(e) {
      const scrollTop = e.detail.scrollTop
      this.startIndex = Math.floor(scrollTop / this.itemHeight)
    },

    loadData() {
      // 加载数据
      this.list = Array.from({ length: 1000 }, (_, i) => ({
        id: i,
        title: `项目 ${i}`,
        desc: `描述 ${i}`
      }))
    }
  }
}
</script>

<style scoped>
.list-item {
  height: 100px;
  padding: 10px;
  border-bottom: 1px solid #eee;
}
</style>
```

### 分包加载

```json
// pages.json
{
  "pages": [
    {
      "path": "pages/index/index",
      "style": {
        "navigationBarTitleText": "首页"
      }
    }
  ],
  "subPackages": [
    {
      "root": "pagesA",
      "pages": [
        {
          "path": "detail/detail",
          "style": {
            "navigationBarTitleText": "详情"
          }
        }
      ]
    },
    {
      "root": "pagesB",
      "pages": [
        {
          "path": "user/user",
          "style": {
            "navigationBarTitleText": "用户中心"
          }
        }
      ]
    }
  ],
  "preloadRule": {
    "pages/index/index": {
      "network": "all",
      "packages": ["pagesA"]
    }
  }
}
```

## 错误处理模式

### 全局错误处理

```javascript
// utils/error-handler.js
class ErrorHandler {
  constructor() {
    this.init()
  }

  init() {
    // 捕获 Promise 错误
    window.addEventListener('unhandledrejection', event => {
      console.error('Promise 错误:', event.reason)
      this.handleError(event.reason)
      event.preventDefault()
    })

    // 捕获全局错误
    window.addEventListener('error', event => {
      console.error('全局错误:', event.error)
      this.handleError(event.error)
    })
  }

  handleError(error) {
    // 上报错误
    this.reportError(error)

    // 显示提示
    uni.showToast({
      title: '程序出错了，请稍后重试',
      icon: 'none'
    })
  }

  reportError(error) {
    // 上报错误到服务器
    uni.request({
      url: 'https://api.example.com/error/report',
      method: 'POST',
      data: {
        message: error.message,
        stack: error.stack,
        url: window.location.href,
        time: new Date().toISOString()
      }
    })
  }
}

export default new ErrorHandler()
```

### 请求错误拦截

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
        'Authorization': uni.getStorageSync('token') || '',
        ...options.header
      },
      success: (res) => {
        // 处理 HTTP 错误
        if (res.statusCode !== 200) {
          const error = new Error(`HTTP ${res.statusCode}`)
          error.statusCode = res.statusCode
          error.data = res.data

          this.handleHttpError(error)
          reject(error)
          return
        }

        // 处理业务错误
        if (res.data.code !== 0) {
          const error = new Error(res.data.message)
          error.code = res.data.code

          this.handleBusinessError(error)
          reject(error)
          return
        }

        resolve(res.data.data)
      },
      fail: (err) => {
        this.handleNetworkError(err)
        reject(err)
      }
    })
  })
}

// HTTP 错误处理
function handleHttpError(error) {
  switch (error.statusCode) {
    case 401:
      uni.showToast({
        title: '未授权，请登录',
        icon: 'none'
      })
      setTimeout(() => {
        uni.navigateTo({
          url: '/pages/login/login'
        })
      }, 1500)
      break
    case 403:
      uni.showToast({
        title: '拒绝访问',
        icon: 'none'
      })
      break
    case 404:
      uni.showToast({
        title: '资源不存在',
        icon: 'none'
      })
      break
    case 500:
      uni.showToast({
        title: '服务器错误',
        icon: 'none'
      })
      break
    default:
      uni.showToast({
        title: `请求失败: ${error.statusCode}`,
        icon: 'none'
      })
  }
}

// 业务错误处理
function handleBusinessError(error) {
  uni.showToast({
    title: error.message || '操作失败',
    icon: 'none'
  })
}

// 网络错误处理
function handleNetworkError(error) {
  uni.showToast({
    title: '网络错误，请检查网络连接',
    icon: 'none'
  })
}
```

## 最佳实践总结

1. **状态管理**: 使用 Vuex 管理全局状态，避免组件间直接传递数据
2. **组件通信**: 父子组件用 props/emit，兄弟组件用事件总线
3. **权限控制**: 使用路由守卫和自定义指令统一管理权限
4. **混合开发**: WebView 与原生通信，实现 H5 和原生的无缝对接
5. **性能优化**: 使用虚拟列表、分包加载等技术优化性能
6. **错误处理**: 建立全局错误处理机制，统一处理和上报错误
7. **代码复用**: 将通用逻辑封装成 mixins 或工具函数
8. **类型安全**: 使用 TypeScript 提高代码质量和可维护性
