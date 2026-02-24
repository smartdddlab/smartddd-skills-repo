# 数据持久化规范

## 规则 ID

`state-02-data-persistence`

## 规则说明

UniApp 提供多种数据存储方案，根据数据特点选择合适的存储方式。

## 存储方案对比

| 方案 | 容量 | 持久性 | 适用场景 |
|------|------|--------|----------|
| uni.setStorage | 10MB+ | 持久 | 小量数据、配置 |
| SQLite | 无限制 | 持久 | 结构化数据 |
| 本地文件 | 无限制 | 持久 | 大文件、图片 |
| vuex/pinia | 内存 | 会话级 | 临时状态 |

## uni.setStorage

### 同步存储

```typescript
// 存储
uni.setStorageSync('token', 'your-token')
uni.setStorageSync('userInfo', { name: '张三', age: 25 })

// 读取
const token = uni.getStorageSync('token')
const userInfo = uni.getStorageSync('userInfo')

// 删除
uni.removeStorageSync('token')

// 清空
uni.clearStorageSync()
```

### 异步存储

```typescript
// 存储
await uni.setStorage({
  key: 'token',
  data: 'your-token'
})

// 读取
const { data } = await uni.getStorage({ key: 'token' })

// 删除
await uni.removeStorage({ key: 'token' })

// 清空
await uni.clearStorage()
```

### 封装存储工具

```typescript
// utils/storage.ts
class Storage {
  /**
   * 存储数据
   */
  set<T>(key: string, value: T): void {
    try {
      uni.setStorageSync(key, JSON.stringify(value))
    } catch (error) {
      console.error('存储失败', error)
    }
  }

  /**
   * 读取数据
   */
  get<T>(key: string, defaultValue?: T): T | undefined {
    try {
      const value = uni.getStorageSync(key)
      if (value) {
        return JSON.parse(value) as T
      }
      return defaultValue
    } catch (error) {
      console.error('读取失败', error)
      return defaultValue
    }
  }

  /**
   * 删除数据
   */
  remove(key: string): void {
    try {
      uni.removeStorageSync(key)
    } catch (error) {
      console.error('删除失败', error)
    }
  }

  /**
   * 获取存储信息
   */
  getInfo(): UniApp.GetStorageInfoRes {
    return uni.getStorageInfoSync()
  }

  /**
   * 清空所有存储
   */
  clear(): void {
    uni.clearStorageSync()
  }
}

export const storage = new Storage()
```

### 使用示例

```typescript
import { storage } from '@/utils/storage'

// 存储用户信息
interface UserInfo {
  id: number
  name: string
  avatar: string
}

storage.set<UserInfo>('userInfo', {
  id: 1,
  name: '张三',
  avatar: '/static/avatar.png'
})

// 读取用户信息
const userInfo = storage.get<UserInfo>('userInfo')

// 带默认值读取
const theme = storage.get<string>('theme', 'light')
```

## 带过期时间的存储

```typescript
// utils/expirable-storage.ts
interface ExpirableData<T> {
  value: T
  expireAt: number
}

class ExpirableStorage {
  /**
   * 存储带过期时间的数据
   * @param key 键名
   * @param value 值
   * @param ttl 过期时间（毫秒）
   */
  set<T>(key: string, value: T, ttl: number): void {
    const data: ExpirableData<T> = {
      value,
      expireAt: Date.now() + ttl
    }
    uni.setStorageSync(key, JSON.stringify(data))
  }

  /**
   * 读取数据，过期则返回 undefined
   */
  get<T>(key: string): T | undefined {
    try {
      const raw = uni.getStorageSync(key)
      if (!raw) return undefined

      const data: ExpirableData<T> = JSON.parse(raw)

      // 检查是否过期
      if (data.expireAt < Date.now()) {
        uni.removeStorageSync(key)
        return undefined
      }

      return data.value
    } catch {
      return undefined
    }
  }
}

export const expirableStorage = new ExpirableStorage()
```

### 使用示例

```typescript
import { expirableStorage } from '@/utils/expirable-storage'

// 缓存数据 1 小时
expirableStorage.set('cacheData', responseData, 60 * 60 * 1000)

// 读取缓存
const cached = expirableStorage.get('cacheData')
if (cached) {
  // 使用缓存数据
} else {
  // 缓存过期，重新请求
}
```

## SQLite 数据库

App 端支持 SQLite，适合存储结构化数据。

```typescript
// utils/sqlite.ts
class Database {
  private dbName = '__APP_DATABASE__'

  /**
   * 打开数据库
   */
  async open(): Promise<void> {
    return new Promise((resolve, reject) => {
      plus.sqlite.openDatabase({
        name: this.dbName,
        path: '_doc/app.db',
        success: () => resolve(),
        fail: (e) => reject(e)
      })
    })
  }

  /**
   * 执行 SQL
   */
  async execute(sql: string): Promise<void> {
    return new Promise((resolve, reject) => {
      plus.sqlite.executeSql({
        name: this.dbName,
        sql,
        success: () => resolve(),
        fail: (e) => reject(e)
      })
    })
  }

  /**
   * 查询数据
   */
  async query<T>(sql: string): Promise<T[]> {
    return new Promise((resolve, reject) => {
      plus.sqlite.selectSql({
        name: this.dbName,
        sql,
        success: (data) => resolve(data as T[]),
        fail: (e) => reject(e)
      })
    })
  }

  /**
   * 关闭数据库
   */
  async close(): Promise<void> {
    return new Promise((resolve, reject) => {
      plus.sqlite.closeDatabase({
        name: this.dbName,
        success: () => resolve(),
        fail: (e) => reject(e)
      })
    })
  }
}

export const db = new Database()
```

### 使用示例

```typescript
// #ifdef APP-PLUS
import { db } from '@/utils/sqlite'

// 初始化表
await db.open()
await db.execute(`
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT
  )
`)

// 插入数据
await db.execute(`INSERT INTO users (name, email) VALUES ('张三', 'test@example.com')`)

// 查询数据
const users = await db.query<UserInfo>('SELECT * FROM users')
// #endif
```

## 安全存储

敏感数据（如 token）应加密存储：

```typescript
// utils/secure-storage.ts
import CryptoJS from 'crypto-js'

const SECRET_KEY = 'your-secret-key'

class SecureStorage {
  private encrypt(text: string): string {
    return CryptoJS.AES.encrypt(text, SECRET_KEY).toString()
  }

  private decrypt(ciphertext: string): string {
    const bytes = CryptoJS.AES.decrypt(ciphertext, SECRET_KEY)
    return bytes.toString(CryptoJS.enc.Utf8)
  }

  set(key: string, value: any): void {
    const encrypted = this.encrypt(JSON.stringify(value))
    uni.setStorageSync(key, encrypted)
  }

  get<T>(key: string): T | undefined {
    const encrypted = uni.getStorageSync(key)
    if (!encrypted) return undefined

    try {
      const decrypted = this.decrypt(encrypted)
      return JSON.parse(decrypted) as T
    } catch {
      return undefined
    }
  }
}

export const secureStorage = new SecureStorage()
```

## 相关规则

- [state-01-pinia-integration](./01-pinia-integration.md)
