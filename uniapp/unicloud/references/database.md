# Unicloud - Database

**Pages:** 74

---

## 业务开通@open | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-mongodb/service.html

**Contents:**
- # 业务开通
- # 服务协议

登录uniCloud web控制台 或直接进入扩展数据库首页

如果是先进控制台首页，则点击左上方服务空间，切换到扩展数据库，如下图所示，首次进入后，需要点击同意用户协议

阿里云提供了服务等级协议（SLA），以阿里云官网标准协议为准。

云数据库MongoDB版服务等级协议：https://terms.aliyun.com/legal-agreement/terms/suit_bu1_ali_cloud/suit_bu1_ali_cloud201803051033_42307.html

用户协议：https://terms.aliyun.com/legal-agreement/terms/suit_bu1_ali_cloud/suit_bu1_ali_cloud201712130944_39600.html

隐私政策：https://terms.aliyun.com/legal-agreement/terms/suit_bu1_ali_cloud/suit_bu1_ali_cloud202107091605_49213.html

如果您购买了阿里云版的uniCloud扩展数据库的，且阿里云未满足其承诺的服务标准，则可以索赔。

DCloud将负责为您协调阿里云的赔偿。赔偿标准和相关规定见上述服务等级协议。

---

## 云数据库操作符@dbcmd | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database-dbcmd.html

**Contents:**
- # 云数据库操作符
- # 查询·逻辑操作符
  - # and
    - # 使用说明
    - # 调用风格
  - # or
    - # 字段值的或操作
    - # 跨字段的或操作
    - # 调用风格
  - # not

查询操作符，用于表示逻辑 "与" 的关系，表示需同时满足多个查询筛选条件

此时需传入多个查询条件，表示需同时满足提供的多个完整查询条件

示例源码如下，请查看 pre > code 标签中的内容

但以上用 and 组成的查询条件是不必要的，因为传入的对象的各字段隐式组成了 “与” 的关系，上述条件等价于下方更简洁的写法：

示例源码如下，请查看 pre > code 标签中的内容

通常需要显示使用 and 是用在有跨字段或操作的时候

需传入多个查询操作符或常量，表示字段需满足或匹配给定的条件。

如以下用前置写法的方式表示 "progress 字段值大于 50 且小于 100"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 Command 默认也可以直接链式调用其他 Command，默认表示多个 Command 的与操作，因此上述代码还可以精简为：

示例源码如下，请查看 pre > code 标签中的内容

方法接收两种传参方式，一是传入一个数组参数，二是传入多个参数，效果一样。

示例源码如下，请查看 pre > code 标签中的内容

查询操作符，用于表示逻辑 "或" 的关系，表示需同时满足多个查询筛选条件。或指令有两种用法，一是可以进行字段值的 “或” 操作，二是也可以进行跨字段的 “或” 操作。

字段值的 “或” 操作指的是指定一个字段值为多个值之一即可。

如筛选出进度大于 80 或小于 20 的 todo：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

跨字段的 “或” 操作指条件 “或”，相当于可以传入多个 where 语句，满足其中一个即可。

如筛选出进度大于 80 或已标为已完成的 todo：

示例源码如下，请查看 pre > code 标签中的内容

方法接收两种传参方式，一是传入一个数组参数，二是传入多个参数，效果一样。

示例源码如下，请查看 pre > code 标签中的内容

查询操作符，用于表示逻辑 "非" 的关系，表示需不满足指定的条件。

示例源码如下，请查看 pre > code 标签中的内容

not 也可搭配其他逻辑指令使用，包括 and, or, nor, not，如 or：

示例源码如下，请查看 pre > code 标签中的内容

查询操作符，用于表示逻辑 "都不" 的关系，表示需不满足指定的所有条件。如果记录中没有对应的字段，则默认满足条件。

筛选出进度既不小于20又不大于80的 todo ：

示例源码如下，请查看 pre > code 标签中的内容

以上同时会筛选出不存在 progress 字段的记录，如果要要求 progress 字段存在，可以用 exists 指令：

示例源码如下，请查看 pre > code 标签中的内容

筛选出 progress 不小于 20 且 tags 数组不包含 miniprogram 字符串的记录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

方法接收两种传参方式，一是传入一个数组参数，二是传入多个参数，效果一样。

示例源码如下，请查看 pre > code 标签中的内容

查询筛选条件，表示字段等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array, Date。

比如筛选出所有自己发表的文章，除了用传对象的方式：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 eq 指令比对象的方式有更大的灵活性，可以用于表示字段等于某个对象的情况，比如：

示例源码如下，请查看 pre > code 标签中的内容

查询筛选条件，表示字段不等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array, Date。

查询筛选操作符，表示需小于指定值。可以传入 Date 对象用于进行日期比较。

示例源码如下，请查看 pre > code 标签中的内容

查询筛选操作符，表示需小于或等于指定值。可以传入 Date 对象用于进行日期比较。

示例源码如下，请查看 pre > code 标签中的内容

查询筛选操作符，表示需大于指定值。可以传入 Date 对象用于进行日期比较。

示例源码如下，请查看 pre > code 标签中的内容

查询筛选操作符，表示需大于或等于指定值。可以传入 Date 对象用于进行日期比较。

示例源码如下，请查看 pre > code 标签中的内容

查询筛选操作符，表示要求值在给定的数组内。

示例源码如下，请查看 pre > code 标签中的内容

查询筛选操作符，表示要求值不在给定的数组内。

找出进度不是 0 或 100 的 todo

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

查询筛选操作符，给定除数 divisor 和余数 remainder，要求字段作为被除数时 value % divisor = remainder。

示例源码如下，请查看 pre > code 标签中的内容

数组查询操作符。用于数组字段的查询筛选条件，要求数组字段中包含给定数组的所有元素。

找出 tags 数组字段同时包含 cloud 和 database 的记录

示例源码如下，请查看 pre > code 标签中的内容

如果数组元素是对象，则可以用 dbCmd.elemMatch 匹配对象的部分字段

示例源码如下，请查看 pre > code 标签中的内容

找出数组字段中至少同时包含一个满足 “area 大于 100 且 age 小于 2” 的元素和一个满足 “type 为 mall 且 age 大于 5” 的元素

示例源码如下，请查看 pre > code 标签中的内容

用于数组字段的查询筛选条件，要求数组中包含至少一个满足 elemMatch 给定的所有条件的元素

示例源码如下，请查看 pre > code 标签中的内容

找出 places 数组字段中至少同时包含一个满足 “area 大于 100 且 age 小于 2” 的元素

示例源码如下，请查看 pre > code 标签中的内容

注意*：如果不使用 elemMatch 而直接如下指定条件，则表示的是 places 数组字段中至少有一个元素的 area 字段大于 100 且 places 数组字段中至少有一个元素的 age 字段小于 2：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

找出 scores 数组字段中至少同时包含一个满足 “大于 80 且小于 100” 的元素

示例源码如下，请查看 pre > code 标签中的内容

更新操作符，用于数组字段的查询筛选条件，要求数组长度为给定值

找出 tags 数组字段长度为 2 的所有记录

示例源码如下，请查看 pre > code 标签中的内容

按从近到远的顺序，找出字段值在给定点的附近的记录。

找出离给定位置 1 公里到 5 公里范围内的记录

示例源码如下，请查看 pre > code 标签中的内容

找出字段值在指定区域内的记录，无排序。指定的区域必须是多边形（Polygon）或多边形集合（MultiPolygon）。

示例源码如下，请查看 pre > code 标签中的内容

可以不用 geometry 而用 centerSphere 构建一个圆形。

centerSphere 对应的值的定义是：[ [经度, 纬度], 半径 ]

半径需以弧度计，比如需要 10km 的半径，则用距离除以地球半径 6378.1km 得出的数字。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

查询操作符，用于在查询语句中使用聚合表达式，方法接收一个参数，该参数必须为聚合表达式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设价格小于等于 10 的打 8 折，大于 10 的打 5 折，让数据库查询返回打折后价格小于等于 8 的记录：

示例源码如下，请查看 pre > code 标签中的内容

这种方法相比传入纯 JS 对象的好处是能够指定字段等于一个对象

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

多个用户同时写，对数据库来说都是将字段自增，不会有后来者覆写前者的情况

示例源码如下，请查看 pre > code 标签中的内容

更新操作符，原子操作，用于指示字段自乘某个值

多个用户同时写，对数据库来说都是将字段自乘，不会有后来者覆写前者的情况

示例源码如下，请查看 pre > code 标签中的内容

更新操作符，给定一个值，只有该值小于字段当前值才进行更新。

如果字段 progress > 50，则更新到 50

示例源码如下，请查看 pre > code 标签中的内容

更新操作符，给定一个值，只有该值大于字段当前值才进行更新。

如果字段 progress < 50，则更新到 50

示例源码如下，请查看 pre > code 标签中的内容

更新操作符，字段重命名。如果需要对嵌套深层的字段做重命名，需要用点路径表示法。不能对嵌套在数组里的对象的字段进行重命名。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

数组更新操作符。对一个值为数组的字段，往数组添加一个或多个值。或字段原为空，则创建该字段并设数组为传入值。

非负数代表从数组开始位置数的位置，从 0 开始计。如果数值大于等于数组长度，则视为在尾部添加。负数代表从数组尾部倒数的位置，比如 -1 就代表倒数第二个元素的位置。如果负数数值的绝对值大于等于数组长度，则视为从数组头部添加。

要求必须同时有 each 参数存在。给定 1 代表升序，-1 代表降序。

如果数组元素是记录，则用 { <字段>: 1 | -1 } 的格式表示根据记录中的什么字段做升降序排序。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果字段是对象数组，可以如下根据元素对象里的字段进行排序：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

数组更新操作符，对一个值为数组的字段，将数组尾部元素删除，仅可以删除末尾一个

示例源码如下，请查看 pre > code 标签中的内容

数组更新操作符，对一个值为数组的字段，往数组头部添加一个或多个值。或字段原为空，则创建该字段并设数组为传入值。

示例源码如下，请查看 pre > code 标签中的内容

数组更新操作符，对一个值为数组的字段，将数组头部元素删除。

示例源码如下，请查看 pre > code 标签中的内容

数组更新操作符。给定一个值或一个查询条件，将数组中所有匹配给定值或查询条件的元素都移除掉。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设有字段 places 数组中的元素结构如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设有字段 cities 数组中的元素结构如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可用 elemMatch 匹配嵌套在对象数组里面的对象数组字段 places

示例源码如下，请查看 pre > code 标签中的内容

数组更新操作符。给定一个值或一个查询条件，将数组中所有匹配给定值的元素都移除掉。跟 pull 的差别在于只能指定常量值、传入的是数组。

从 tags 中移除所有 database 和 cloud 字符串

示例源码如下，请查看 pre > code 标签中的内容

数组更新操作符。原子操作。给定一个或多个元素，除非数组中已存在该元素，否则添加进数组。

如果 tags 数组中不包含 database，添加进去

示例源码如下，请查看 pre > code 标签中的内容

需传入一个对象，其中有一个字段 each，其值为数组，每个元素就是要添加的元素

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const dbCmd = db.command
let res = await db.collection('todo').where(dbCmd.and([
  {
    progress: dbCmd.gt(50)
  },
  {
    tags: 'cloud'
  }
])).get()
```

Example 2 (javascript):
```javascript
const dbCmd = db.command
let res = await db.collection('todo').where(dbCmd.and([
  {
    progress: dbCmd.gt(50)
  },
  {
    tags: 'cloud'
  }
])).get()
```

Example 3 (javascript):
```javascript
const dbCmd = db.command
let res = await db.collection('todo').where(dbCmd.and([
  {
    progress: dbCmd.gt(50)
  },
  {
    tags: 'cloud'
  }
])).get()
```

Example 4 (javascript):
```javascript
const dbCmd = db.command
let res = await db.collection('todo').where(dbCmd.and([
  {
    progress: dbCmd.gt(50)
  },
  {
    tags: 'cloud'
  }
])).get()
```

---

## JQL数据库操作 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql?id=lookup-with-temp

**Contents:**
- # JQL数据库操作
    - # jql的诞生背景
- # JQL流程图解
- # JQL包含的模块
- # JQL的使用场景
  - # 不同场景的区别
- # JQL的限制
- # JQL方法使用限制
  - # 单表查询
  - # 联表查询

JQL，全称 javascript query language，是一种js方式操作数据库的规范。

传统的数据库查询，有sql和nosql两种查询语法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

sql写法，对js工程师而言有学习成本，而且无法处理非关系型的MongoDB数据库，以及sql的联表查询inner join、left join也并不易于学习。

而nosql的写法，实在过于复杂。比如如下3个例子：

比如一个简单的查询，取field1>0，则需要如下复杂写法

示例源码如下，请查看 pre > code 标签中的内容

如果要表达或关系，需要用or方法，写法更复杂

示例源码如下，请查看 pre > code 标签中的内容

sql的inner join、left join已经够乱了，而nosql的代码无论写法还是可读性，都更“令人发指”。比如这个联表查询：

示例源码如下，请查看 pre > code 标签中的内容

这些问题竖起一堵墙，让后端开发难度加大，成为一个“专业领域”。但其实这堵墙是完全可以推倒的。

jql将解决这些问题，让js工程师没有难操作的数据库。

示例源码如下，请查看 pre > code 标签中的内容

下图包括clientDB及云函数内使用jql扩展库的调用流程

这里选择以使用了JQL完整功能clientDB为例，JQL操作数据库的流程如下。不同使用场景的区别请参考： JQL的使用场景

上述场景在新增、修改数据时都会执行数据校验，但是关于权限校验及action部分稍有不同

下面这些方法必须严格按照下面的顺序进行调用，其他方法需要在这些方法之后调用（不限制顺序）

示例源码如下，请查看 pre > code 标签中的内容

临时表可以使用以下方法（需按照下面的顺序调用）

示例源码如下，请查看 pre > code 标签中的内容

虚拟联表可以使用以下方法（需按照下面的顺序调用）

示例源码如下，请查看 pre > code 标签中的内容

仅允许collection().add()这样的形式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如需自定义返回的err对象，可以在clientDB中挂一个action云函数，在action云函数的after内用js修改返回结果，传入after内的result不带code和message。

示例源码如下，请查看 pre > code 标签中的内容

使用jql查询语法时，可以直接使用students=='wang'作为查询条件来查询students内包含wang的记录。

示例源码如下，请查看 pre > code 标签中的内容

如果使用unicloud-db组件写法如下

示例源码如下，请查看 pre > code 标签中的内容

上面的示例中使用了正则修饰符i，用于表示忽略大小写

JQL于2021年4月28日优化了联表查询策略，详情参考：联表查询策略调整

JQL提供了更简单的联表查询方案。不需要学习join、lookup等复杂方法。

只需在db schema中，将两个表的关联字段建立映射关系，就可以把2个表当做一个虚拟联表来直接查询。

示例源码如下，请查看 pre > code 标签中的内容

上面两种写法最终结果一致，但是第二种写法性能更好。第一种写法会先将所有数据进行关联，如果数据量很大这一步会消耗很多时间。详细示例见下方说明

通过HBuilderX提供的JQL数据库管理功能方便的查看联表查询时返回数据的结构

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

比如有以下两个表，book表，存放书籍商品；order表存放书籍销售订单记录。

book表内有以下数据，title为书名、author为作者：

示例源码如下，请查看 pre > code 标签中的内容

order表内有以下数据，book_id字段为book表的书籍_id，quantity为该订单销售了多少本书：

示例源码如下，请查看 pre > code 标签中的内容

如果我们要对这2个表联表查询，在订单记录中同时显示书籍名称和作者，那么首先要建立两个表中关联字段book的映射关系。

即，在order表的db schema中，配置字段 book_id 的foreignKey，指向 book 表的 _id 字段，如下

示例源码如下，请查看 pre > code 标签中的内容

book表的DB Schema也要保持正确

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，即使用JQL查询。查询表设为order和book这2个表名后，即可自动按照一个合并虚拟联表来查询，field、where等设置均按合并虚拟联表来设置。

示例源码如下，请查看 pre > code 标签中的内容

上面的写法是jql语法，如果不使用jql的话，使用传统MongoDB写法，需要写很长并且不太容易看懂的代码，大致如下

示例源码如下，请查看 pre > code 标签中的内容

上述查询会返回如下结果，可以看到书籍信息被嵌入到order表的book_id字段下，成为子节点。同时根据where条件设置，只返回书名为三国演义的订单记录。

示例源码如下，请查看 pre > code 标签中的内容

二维关系型数据库做不到这种设计。jql充分利用了json文档型数据库的特点，动态嵌套数据，实现了这个简化的联表查询方案。

不止是2个表，3个、4个表也可以通过这种方式查询，多表场景下只能使用副表与主表之间的关联关系（foreignKey），不可使用副表与副表之间的关联关系。

不止js，<unicloud-db>组件也支持所有jql功能，包括联表查询。

在前端页面调试JQL联表查询且不过滤字段时会受权限影响，导致调试比较困难。可以通过HBuilderX提供的JQL数据库管理功能方便的查看联表查询时的虚拟联表结构。

如上述查询可以直接在JQL文件中执行以下代码查看完整的返回字段

示例源码如下，请查看 pre > code 标签中的内容

在此之前JQL联表查询只能直接使用虚拟联表，而不能先对主表、副表过滤再生成虚拟联表。由于生成虚拟联表时需要整个主表和副表进行联表，在数据量大的情况下性能会很差。

使用临时表进行联表查询，可以先对主表或者副表进行过滤，然后在处理后的临时表的基础上生成虚拟联表。

仍以上面article、comment两个表为例

获取article_id为'1'的文章及其评论的数据库操作，在直接联表查询和使用临时表联表查询时写法分别如下

示例源码如下，请查看 pre > code 标签中的内容

直接使用虚拟联表联表查询，在第一步生成虚拟联表时会以主表所有数据和副表进行联表查询，如果主表数据量很大，这一步会浪费相当多的时间。先过滤主表则没有这个问题，过滤之后仅有一条数据和副表进行联表查询。

方法调用必须严格按照顺序，比如field不能放在where之前

示例源码如下，请查看 pre > code 标签中的内容

临时表内如果使用field进行字段过滤需要保留关联字段

示例源码如下，请查看 pre > code 标签中的内容

方法调用必须严格按照顺序，比如foreignKey不能放在where之后

示例源码如下，请查看 pre > code 标签中的内容

一般情况下不需要再对虚拟联表额外处理，因为数据在临时表内已经进行了过滤排序等操作。以下代码仅供演示，并无实际意义

示例源码如下，请查看 pre > code 标签中的内容

要求组成虚拟联表的各个临时表都要满足权限限制，即权限校验不会计算组合成虚拟联表之后使用的where、field

以下为一个订单表（order）和书籍表（book）的schema示例

示例源码如下，请查看 pre > code 标签中的内容

如果先对主表进行过滤where('uid==$cloudEnv_uid')，则能满足权限限制（order表的"doc.uid==auth.uid"）

示例源码如下，请查看 pre > code 标签中的内容

如果不对主表过滤，而是对虚拟联表（联表结果）进行过滤，则无法满足权限限制（order表的"doc.uid==auth.uid"）

示例源码如下，请查看 pre > code 标签中的内容

联表查询时也可以在field内对字段进行重命名，写法和简单查询时别名写法类似，原字段名 as 新字段名即可。简单查询时的字段别名

仍以上述order、book两个表为例，以下查询将联表查询时order表的quantity字段重命名为order_quantity，将book表的title重命名为book_title、author重命名为book_author

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果存在多个foreignKey且只希望部分生效，可以使用foreignKey来指定要使用的foreignKey

2021年4月28日10点前此方法仅用于兼容JQL联表查询策略调整前后的写法，在此日期后更新的clientDB（上传schema、uni-id均会触发更新）才会有指定foreignKey的功能，关于此次调整请参考：联表查询策略调整

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

2021年4月28日之前的JQL只支持主表的foreignKey，把副表内容嵌入主表的foreignKey字段下面。不支持处理副本的foreignKey。

2021年4月28日调整后，新版支持副表foreignKey联查。副表的数据以数组的方式嵌入到主表中作为一个虚拟联表使用。

通过HBuilderX提供的JQL数据库管理功能方便的查看联表查询时返回数据的结构

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下查询使用comment表的article字段对应的foreignKey进行关联查询

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如需对上述查询的副表字段进行过滤，需要注意多插入的一层副表表名

示例源码如下，请查看 pre > code 标签中的内容

副表内的字段也可以使用as进行重命名，例如上述查询中如果希望将副表的content重命名为value可以使用如下写法

HBuilderX 3.3.7及以上版本支持getTemp内使用as

示例源码如下，请查看 pre > code 标签中的内容

jql对查询条件进行了简化，开发者可以使用where('a==1||b==2')来表示字段a等于1或字段b等于2。如果不使用jql语法，上述条件需要写成下面这种形式

示例源码如下，请查看 pre > code 标签中的内容

两种用法性能上并没有太大差距，可以视场景选择合适的写法。

jql支持两种类型的查询条件，以下内容有助于理解两种的区别，实际书写的时候无需过于关心是简单查询条件还是复杂查询条件，JQL会自动进行选择

where内还支持使用云端环境变量，详情参考：云端环境变量

在 unicloud-db 组件中使用where查询 参考

简单查询条件包括以下几种，对应着db.command下的各种操作符 以及不使用操作符的查询如where({a:1})。

这里的test方法比较强大，格式为：正则规则.test(fieldname)。

具体到这个正则 /abc/.test(content)，类似于sql中的content like '%abc%'，即查询所有字段content包含abc的数据记录。

简单查询条件内要求二元运算符两侧不可均为数据库内的字段

上述写法的查询语句可以在权限校验阶段与schema内配置的permission进行一次对比校验，如果校验通过则不会再查库进行权限校验。

复杂查询内可以使用数据库运算方法。需要注意的是，与云函数内使用数据库运算方法不同jql内对数据库运算方法的用法进行了简化。

示例源码如下，请查看 pre > code 标签中的内容

使用如下写法可以筛选语文数学总分大于150的数据

示例源码如下，请查看 pre > code 标签中的内容

另外与简单查询条件相比，复杂查询条件可以比较数据库内的两个字段，简单查询条件则要求二元运算符两侧不可均为数据库内的字段，JQL会自动判断要使用简单查询还是复杂查询条件。

例：仍以上面的数据为例，以下查询语句可以查询数学得分比语文高的记录

示例源码如下，请查看 pre > code 标签中的内容

在查询条件时也可以使用new Date()来获取一个日期对象。

示例源码如下，请查看 pre > code 标签中的内容

使用下面的写法可以查询deadline小于当前时间（云函数内的时间）的字段

示例源码如下，请查看 pre > code 标签中的内容

可以通过skip+limit来进行分页查询

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db>组件提供了更简单的分页方法，包括两种模式：

详见：https://doc.dcloud.net.cn/uniCloud/unicloud-db?id=page

查询时可以使用field方法指定返回字段。不使用field方法时会返回所有字段

field可以指定字符串，也可以指定一个对象。

如果数据库里的数据结构是嵌套json，比如book表有个价格字段，包括普通价格和vip用户价格，数据如下：

示例源码如下，请查看 pre > code 标签中的内容

那么使用db.collection('book').field("price.vip").get()，就可以只返回vip价格，而不返回普通价格。查询结果如下：

示例源码如下，请查看 pre > code 标签中的内容

对于联表查询，副表的数据嵌入到了主表的关联字段下面，此时在filed里通过{}来定义副表字段。比如之前联表查询章节举过的例子，book表和order表联表查询：

示例源码如下，请查看 pre > code 标签中的内容

field方法内可以不使用{}进行副表字段过滤，以上面示例为例可以写为

示例源码如下，请查看 pre > code 标签中的内容

自2020-11-20起JQL支持字段别名，主要用于在前端需要的字段名和数据库字段名称不一致的情况下对字段进行重命名。

用法形如：author as book_author，意思是将数据库的author字段重命名为book_author。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

_id是比较特殊的字段，如果对_id设置别名会同时返回_id和设置的别名字段

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

副表字段使用别名需要注意，如果写成.field('book_id.title as book_id.book_title,book_id.author,quantity as order_quantity') book_title将会是由book_id下每一项的title组成的数组，这点和mongoDB内数组表现一致

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，JQL支持在云端数据库对字段进行一定的操作运算之后再返回，详细可用的方法列表请参考：数据库常用运算方法

需要注意的是，为方便书写，JQL内将数据库运算方法的用法进行了简化（相对于云函数内使用数据库运算方法而言）。用法请参考上述链接

示例源码如下，请查看 pre > code 标签中的内容

如下写法可以由grade计算得到一个isTopGrade来表示是否为最高年级

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

传统的MongoDB的排序参数是json格式，jql支持类sql的字符串格式，书写更为简单。

sort方法和orderBy方法内可以传入一个字符串来指定排序规则。

orderBy允许进行多个字段排序，以逗号分隔。每个字段可以指定 asc(升序)、desc(降序)。默认是升序。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用limit方法，可以查询有限条数的数据记录。

比如查询销量top10的书籍，或者查价格最高的一本书。

示例源码如下，请查看 pre > code 标签中的内容

limit默认值是100，即不设置的情况下，默认返回100条数据。limit最大值为1000。

一般情况下不应该给前端一次性返回过多数据，数据库查询也慢、网络返回也慢。可以通过分页的方式分批返回数据。

在查询的result里，有一个affectedDocs。但affectedDocs和limit略有区别。affectedDocs小于等于limit。

比如book表里只有2本书，limit虽然设了10，但查询结果只能返回2条记录，affectedDocs为2。

使用JQL的API方式时，可以在get方法内传入参数getOne:true来返回一条数据。

getOne其实等价于上一节的limit(1)。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果使用uniCloud-db组件，则在组件的属性上增加一个 getone。详见

统计符合查询条件的记录数，是数据库层面的概念。

在查询的result里，有一个affectedDocs。但affectedDocs和count计数不是一回事。

例如book表里有110本书，不写任何where、limit等条件，但写了count方法或getCount参数，那么result会变成如下：

示例源码如下，请查看 pre > code 标签中的内容

也就是数据库查到了110条记录，通过count返回；而网络侧只给前端返回了100条数据，通过affectedDocs表示。

使用count()方法，如db.collection('order').count()

可以继续加where等条件进行数据记录过滤。

使用JQL的API方式时，可以在get方法内传入参数getCount:true来同时返回总数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果使用uniCloud-db组件，则在组件的属性上增加一个 getcount。详见

HBuilderX 3.0.3+起，JQL支持在get方法内传入getTree参数查询树状结构数据。（HBuilderX 3.0.5+ unicloud-db组件开始支持，之前版本只能通过js方式使用）

树形数据，在数据库里一般不会按照tree的层次来存储，因为按tree结构通过json对象的方式存储不同层级的数据，不利于对tree上的某个节点单独做增删改查。

一般存储树形数据，tree上的每个节点都是一条单独的数据表记录，然后通过类似parent_id来表达父子关系。

如部门的数据表，里面有2条数据，一条数据记录是“总部”，parent_id为空；另一条数据记录“一级部门A”，parent_id为总部的_id

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

虽然存储格式是分条记录的，但查询反馈到前端的数据仍然需要是树形的。这种转换在过去比较复杂。

JQL提供了一种简单、优雅的方案，在DB Schema里配置parentKey来表达父子关系，然后查询时声明使用Tree查询，就可以直接查出树形数据。

department部门表的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey字段将数据表不同记录的父子关系描述了出来。查询就可以直接写了。

注意：一个表的一次查询中只能有一个父子关系。如果一个表的schema里多个字段均设为了parentKey，那么需要在JQL中通过parentKey()方法指定某个要使用的parentKey字段。

schema里描述好后，查询就变的特别简单。

查询树形数据，分为 查询所有子节点 和 查询父级路径 这2种需求。

指定符合条件的记录，然后查询它的所有子节点，并且可以指定层级，返回的结果是以符合条件的记录为一级节点的所有子节点数据，并以树形方式嵌套呈现。

只需要在JQL的get方法中增加getTree参数，如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以看出，每个子节点，被嵌套在父节点的"children"下，这个"children"是一个固定的格式。

如果不指定getTree的参数，会把department表的所有数据都查出来，从总部开始到10级部门，以树形结构提供给客户端。

如果有多个总部，即多行记录的parent_id为空，则多个总部会分别作为一级节点，把它们下面的所有children一级一级拉出来。如下：

示例源码如下，请查看 pre > code 标签中的内容

如果觉得返回的parent_id字段多余，也可以指定.field("_id,name")，过滤掉该字段。

getTree的参数limitLevel的说明

limitLevel表示查询返回的树的最大层级。超过设定层级的节点不会返回。

getTree的参数startWith的说明

如果只需要查“总部”的子部门，不需要“总部2”，可以在startWith里指定（getTree: {"startWith":"name=='总部'"}）。

使用中请注意startWith和where的区别。where用于描述对所有层级的生效的条件（包括第一层级）。而startWith用于描述从哪个或哪些节点开始查询树。

startWith不填时，默认的条件是 'parent_id==null||parent_id==""'，即schema配置parentKey的字段为null（即不存在）或值为空字符串时，这样的节点被默认视为根节点。

示例源码如下，请查看 pre > code 标签中的内容

以下查询语句指定startWith为_id=="1"、where条件为status==0，查询总部下所有status为0的子节点。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

需要注意的是where内的条件也会对第一级数据生效，例如将上面的查询改成如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过parentKey方法指定某个parentKey

如果表的schema中有多个字段都配置了parentKey，但查询时其实只能有一个字段的parentKey关系可以生效，那么此时就需要通过parentKey()方法来指定这次查询需要的哪个parentKey关系生效。

parentKey()方法的参数是字段名。

示例源码如下，请查看 pre > code 标签中的内容

插件市场有一个 家谱 的示例，可以参阅：https://ext.dcloud.net.cn/plugin?id=3798

如果tree的数据量较大，则不建议一次性把所有的树形数据返回给客户端。建议分层查询，即懒加载。

比如地区选择的场景，全国的省市区数据量很大，一次性查询所有数据返回给客户端非常耗时和耗流量。可以先查省，然后根据选择的省再查市，以此类推。

getTree是查询子节点，而getTreePath，则是查询父节点。

get方法内传入getTreePath参数对包含父子关系的表查询返回树状结构数据某节点路径。

示例源码如下，请查看 pre > code 标签中的内容

查询返回的结果为，从“一级部门A”起向上找10级，找到最终节点后，以该节点为根，向下嵌套children，一直到达“一级部门A”。

返回结果只包括“一级部门A”的直系父，其父节点的兄弟节点不会返回。所以每一层数据均只有一个节点。

仍以上面department的表结构和数据为例

示例源码如下，请查看 pre > code 标签中的内容

从根节点“总部”开始，返回到“一级部门A”。“总部2”等节点不会返回。

示例源码如下，请查看 pre > code 标签中的内容

如果startWith指定的节点没有父节点，则返回自身。

如果startWith匹配的节点不止一个，则以数组的方式，返回每个节点的treepath。

例如“总部”和“总部2”下面都有一个部门的名称叫“销售部”，且 "startWith": "name=='销售部'"，则会返回“总部”和“总部2”两条treepath，如下

示例源码如下，请查看 pre > code 标签中的内容

本地调试支持：HBuilderX 3.1.0+；云端支持：2021-1-26日后更新一次云端 DB Schema 生效

数据分组统计，即根据某个字段进行分组（groupBy），然后对其他字段分组后的值进行求和、求数量、求均值。

比如统计每日新增用户数，就是按时间进行分组，对每日的用户记录进行count运算。

分组统计有groupBy和groupField。和传统sql略有不同，传统sql没有单独的groupField。

JQL的groupField里不能直接写field字段，只能使用分组运算方法来处理字段，常见的累积器计算符包括：count(*)、sum(字段名称)、avg(字段名称)。更多分组运算方法详见

示例源码如下，请查看 pre > code 标签中的内容

如果额外还在groupBy之前使用了field方法，那么此field的含义并不是最终返回的字段，而是用于对字段预处理，然后将预处理的字段传给groupBy和groupField使用。

与field不同，使用groupField时返回结果不会默认包含_id字段。同时开发者也不应该在groupBy和groupField里使用_id字段，_id是唯一的，没有统一意义。

举例： 如果数据库score表为某次比赛统计的分数数据，每条记录为一个学生的分数。学生有所在的年级（grade）、班级（class）、姓名（name）、分数（score）等字段属性。

示例源码如下，请查看 pre > code 标签中的内容

接下来我们对这批数据进行分组统计，分别演示如何使用求和、求均值和计数。

groupBy内也可以使用数据库运算方法对数据进行处理，为方便书写，clientDB内将数据库运算方法的用法进行了简化（相对于云函数内使用数据库运算方法而言）。用法请参考：数据库运算方法

groupField内可以使用分组运算方法对分组结果进行统计，所有可用的累积方法请参考分组运算方法，下面以sum（求和）和avg（求均值）为例介绍如何使用

使用sum方法可以对数据进行求和统计。以上述数据为例，如下写法对不同班级进行分数统计

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

1年级A班、1年级B班、2年级A班，3个班级的总分分别是20、40、60。

求均值方法与求和类似，将上面sum方法换成avg方法即可

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果额外还在groupBy之前使用了field方法，此field用于决定将哪些数据传给groupBy和groupField使用

示例源码如下，请查看 pre > code 标签中的内容

如下field写法将上面的score数组求和之后传递给groupBy和groupField使用。在field内没出现的字段（比如name），在后面的方法里面不能使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用count方法可以对记录数量进行统计。以上述数据为例，如下写法对不同班级统计参赛人数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按时间段统计是常见的需求，而时间段统计会用到日期运算符。

假设要统计uni-id-users 表的每日新增注册用户数量。表内有以下数据：

示例源码如下，请查看 pre > code 标签中的内容

由于register_date字段是时间戳格式，含有时分秒信息。但统计每日新增注册用户时是需要忽略时分秒的。

add操作符的用法为add(值1,值2)。add(new Date(0),register_date)表示给字段register_date + 0，这个运算没有改变具体的时间，但把register_date的格式从时间戳转为了日期类型。

dateToString操作符的用法为dateToString(日期对象,格式化字符串,时区)。具体如下：dateToString(add(new Date(0),register_date),"%Y-%m-%d","+0800")

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

完整数据库运算方法列表请参考：JQL内可使用的数据库运算方法

在使用普通的累积器操作符，如sum、avg时，权限控制与常规的权限控制并无不同。

但使用count时，可以单独配置表级的count权限。

请不要轻率的把uni-id-users 表的count权限设为true，即任何人都可以count。这意味着游客将可以获取到你的用户总数量。

通过.distinct()方法，对数据查询结果中重复的记录进行去重。

distinct方法将按照field方法指定的字段进行去重（如果field内未指定_id，不会按照_id去重）

本地调试支持：HBuilderX 3.1.0+；云端支持：2021-1-26日后更新一次云端 DB Schema生效

示例源码如下，请查看 pre > code 标签中的内容

例：如果数据库score表为某次比赛统计的分数数据，每条记录为一个学生的分数

示例源码如下，请查看 pre > code 标签中的内容

以下代码可以按照grade、class两字段去重，获取所有参赛班级

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

geoNear可用于查询位置在给定点一定距离内的数据库记录。此方法必须紧跟在collection方法或aggregate方法后。

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

用于匹配某字段和另一个表的字段相等的记录，类似sql语句中的in+子查询的写法，只能在where方法内使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

in的这种用法底层使用了lookup方法，在数据量很大时效率不高，推荐在使用时尽量在in之外的条件内筛选出尽量小的数据集。以上述示例中register_date > 1670000000000 && company_id in ${companyFilter}查询条件为例，register_date > 1670000000000这部分条件应筛选出尽量小的结果集以便查询能更高效。

获取到db的表对象后，通过add方法新增数据记录。

方法：collection.add(data)

data支持一条记录，也支持多条记录一并新增到集合中。

data中不需要包括_id字段，数据库会自动维护该字段。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果上述代码执行成功，则res的值将包括inserted:3，代表插入3条数据，同时在ids里返回3条记录的_id。

如果新增记录失败，会抛出异常，以下代码示例为捕获异常：

示例源码如下，请查看 pre > code 标签中的内容

获取到db的表对象，然后指定要删除的记录，通过remove方法删除。

注意：如果是非admin账户删除数据，需要在数据库中待操作表的db schema中要配置permission权限，赋予delete允许用户操作的权限。

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很多的情况下这种方式删除会超时，但是数据仍会全部删除掉

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

获取到db的表对象，然后指定要更新的记录，通过update方法更新。

注意：如果是非admin账户修改数据，需要在数据库中待操作表的db schema中要配置permission权限，赋予update为true。

collection.doc().update(Object data)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，以数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.1.22及以上版本支持

在实际业务中通常会遇到一个页面需要查询多次的情况，比如应用首页需要查询轮播图列表、公告列表、首页商品列表等。如果分开请求需要发送很多次网络请求，这样会影响性能。使用multiSend可以将多个数据库请求合并成一个发送。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件也支持使用getTemp方法，结合multiSend可以与其他数据库请求一起发送

示例源码如下，请查看 pre > code 标签中的内容

JQL API 支持事务操作，与 uniCloud.database() 的事务操作类似，事务操作可以将多条增删改操作合并成一个原子操作，要么全部成功，要么全部失败。

示例源码如下，请查看 pre > code 标签中的内容

JQL API支持使用聚合操作读取数据，关于聚合操作请参考聚合操作

示例源码如下，请查看 pre > code 标签中的内容

新增于 HBuilderX 3.5.1，JQL数据库管理支持使用更新操作符

更新操作符可以在执行更新时使用。比如对字段重命名（rename）、删除字段（remove）等。适用于表结构变更后，使用 HBuilderX 的 JQL管理器进行数据变更。

db.command.rename重命名字段：

示例源码如下，请查看 pre > code 标签中的内容

db.command.remove删除字段：

示例源码如下，请查看 pre > code 标签中的内容

DB Schema是基于 JSON 格式定义的数据结构的规范。

这些工具大幅减少了开发者的开发工作量和重复劳动。

DB Schema是JQL紧密相关的配套，掌握JQL离不开详读DB Schema文档。

**下面示例中使用了注释，实际使用时schema是一个标准的json文件不可使用注释。**完整属性参考schema字段

示例源码如下，请查看 pre > code 标签中的内容

DB Schema中的数据权限配置功能非常强大，请详读DB Schema的数据权限控制

在配置好DB Schema的权限后，JQL的查询写法，尤其是非JQL的聚合查询写法有些限制，具体如下：

schema内permission配置示例

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在进行数据库操作之前，JQL会使用permission内配置的规则对客户端操作进行一次校验，如果本次校验不通过还会通过数据库查询再进行一次校验

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此时客户端条件里面只有doc._id == 1，schema内又限制的doc.user_id == auth.uid，所以第一次预校验无法通过，会进行一次查库校验判断是否有权限进行操作。发现auth.uid确实和doc.user_id一致，上面的数据库操作允许执行。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。以下内容仅为向下兼容保留

action的作用是在执行前端发起的数据库操作时，额外触发一段云函数逻辑。它是一个可选模块。action是运行于云函数内的，可以使用云函数内的所有接口。

当一个前端操作数据库的方式不能完全满足需求，仍然同时需要在云端再执行一些云函数时，就在前端发起数据库操作时，通过db.action("someactionname")方式要求云端同时执行这个叫someactionname的action。还可以在权限规则内指定某些操作必须使用指定的action，比如"action in ['action-a','action-b']"，来达到更灵活的权限控制。

注意action方法是db对象的方法，只能跟在db后面，不能跟在collection()后面

尽量不要在action中使用全局变量，如果一定要用请务必确保自己已经阅读并理解了云函数的启动模式

如果使用<unicloud-db>组件，该组件也有action属性，设置action="someactionname"即可。

示例源码如下，请查看 pre > code 标签中的内容

action支持一次使用多个，比如使用db.action("action-a,action-b")，其执行流程为action-a.before->action-b.before->执行数据库操作->action-b.after->action-a.after。在任一before环节抛出错误直接进入after流程，在after流程内抛出的错误会被传到下一个after流程。

action是一种特殊的云函数，它不占用服务空间的云函数数量。

每个action在uni-clientDB-actions目录下存放一个以action名称命名的js文件。

在这个js文件的代码里，包括before和after两部分，分别代表JQL具体操作数据库前和后。

before在数据库操作执行前触发，before里的代码执行完毕后再开始操作数据库。before的常用用途：

after在数据库操作执行后触发，JQL操作数据库后触发after里的代码。after的常用用途：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关文档移至：schema扩展依赖公共模块和扩展库

**Examples:**

Example 1 (sql):
```sql
select * from table1 where field1="value1"
```

Example 2 (sql):
```sql
select * from table1 where field1="value1"
```

Example 3 (sql):
```sql
select * from table1 where field1="value1"
```

Example 4 (sql):
```sql
select * from table1 where field1="value1"
```

---

## unicloud-map 云端一体组件 uni-app | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

**Contents:**
- # unicloud-map 云端一体组件 uni-app
  - # 介绍
  - # 用法示例
    - # 简易示例
    - # 渲染静态POI
    - # 渲染动态POI
  - # 地图Key配置
  - # 组件属性
  - # loadtime
  - # 组件方法

该组件依赖 uni-map-common 公共模块

本文档适用于客户端为 uni-app 的版本，若客户端为 uni-app x 则请访问：unicloud-map x 文档

基于地图的位置服务，是移动应用的特色场景，但过去开发一个地图类应用非常麻烦。需要对接地图厂商的客户端API、服务器API，再编写自己的业务逻辑。

unicloud的MongoDB数据库，对地理位置查询，提供了比传统数据库更方便的GEO查询方案，比如可以直接查询附近的POI信息。（Point of Interest，地图上的兴趣点）

DCloud之前已推出各种云端一体组件，基于datacom规范 ，组件在客户端可以直接连数据库。

现在进一步封装了地图的datacom组件，将前端地图组件和云端数据库连起来，只需写一个<unicloud-map>组件，就可以直接从数据库里拉出附近的POI信息，并显示在地图上。

在uni-admin中，还提供了POI编辑插件，可以在管理端可视化的标记POI。标记的结果存入opendb表，客户端的<unicloud-map>组件可以自动直接拉取。

本文是<unicloud-map>组件的文档，admin插件文档另见

unicloud-map云端一体组件，主要用于显示数据库里的自定义POI，渲染在地图上。具体可以实现如下功能：

插件市场地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

注意：由于组件是读取数据库表opendb-poi 进行查询，若表不存在或表内没有POI数据，则不会显示POI，可以通过unicloud-map-admin插件管理POI信息

示例源码如下，请查看 pre > code 标签中的内容

注意：此代码如果运行在APP中，需要使用nvue模式

示例源码如下，请查看 pre > code 标签中的内容

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

注意：此代码如果运行在APP中，需要使用nvue模式

示例源码如下，请查看 pre > code 标签中的内容

地图Key需要在两个地方进行配置：前端配置和云端配置（必须都配置）。

在 manifest.json 文件中点击 Web 配置，选择并配置腾讯地图或高德地图中的任意一个即可。

在 uni-config-center/uni-map/config.js 中进行配置。（没有配置文件和目录就新建目录和文件）

示例源码如下，请查看 pre > code 标签中的内容

使用这些方法前，需要在组件先声明 ref="map"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置组件内的markers，用法与内置组件的map一致，点击查看详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置组件内的polyline，用法与内置组件的map一致，点击查看详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置组件内的circles ，用法与内置组件的map一致，点击查看详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置组件内的controls，用法与内置组件的map一致，点击查看详情

示例源码如下，请查看 pre > code 标签中的内容

unicloud-map需要创建以下表后才能正常运行，可以右键插件database目录下的opendb-poi.schema.json上传Schema

unicloud-map是免费的，但高德、腾讯、百度等地图的使用需向地图厂商采购商业授权。DCloud与地图厂商达成合作，可更优惠的给开发者提供地图服务。详见

**Examples:**

Example 1 (vue):
```vue
<template>
	<view>

		<unicloud-map
			ref="map"
			:where="where"
			:width="700"
			:height="900"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>

	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			},
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			]
		}
	}
}
</script>
```

Example 2 (vue):
```vue
<template>
	<view>

		<unicloud-map
			ref="map"
			:where="where"
			:width="700"
			:height="900"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>

	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			},
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			]
		}
	}
}
</script>
```

Example 3 (vue):
```vue
<template>
	<view>

		<unicloud-map
			ref="map"
			:where="where"
			:width="700"
			:height="900"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>

	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			},
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			]
		}
	}
}
</script>
```

Example 4 (vue):
```vue
<template>
	<view>

		<unicloud-map
			ref="map"
			:where="where"
			:width="700"
			:height="900"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>

	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			},
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			]
		}
	}
}
</script>
```

---

## 什么是索引 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/db-index.html

**Contents:**
- # 什么是索引
- # 添加索引
  - # uniCloud web控制台添加
  - # 在{表名}.index.json内配置集合索引
  - # 支付宝云索引配置类型
    - # 字段大小限制
- # 单字段索引
- # 组合索引
  - # 地理位置索引
  - # TTL索引

所有数据库都支持索引，索引文件通过额外占用磁盘空间，提供了一个快速查询记录的方案。查询时先查询索引文件，根据索引文件的指示再去查询真实的数据，在数据量较大时有明显的性能优势。

如果您的查询操作包含了过滤条件（包含等值测试和范围过滤）或者是排序功能，或者需要唯一性，则要考虑给集合的相关字段添加索引。通常来说需要为以下方法/属性内用到的字段添加索引where、match、orderBy、sort，还包括clientDB内getTree和getTreePath的startWith属性。

如果相关字段没有设为索引，当数据表的记录数量变大后，查询会变慢甚至超时报错。这点尤其需要注意。已经有一些开发者遭遇线上故障。开发时没有配索引，因为数据量小而没有性能问题。上线后数据量越来越大，查询越来越慢，直到超时，引发线上事故。

如数据表名为table-abc，则可以在项目uniCloud的database目录下创建table-abc.index.json，索引文件内写法如下：

示例源码如下，请查看 pre > code 标签中的内容

支付宝云在配置索引时，配置索引的数据表字段存储类型需与索引类型匹配，比如数据表table中的name字段存储的是字符串，那么设置索引时的Type必须是varchar，否则会对数据插入及查询有影响。 array类型索引只能单独创建，不能和其他字段创建联合索引。

您可以为查询条件对应的字段创建单字段索引，如果该字段是嵌套字段，可以使用"点表示法" 。例如对如下格式的记录中的color字段进行索引时，可以用style.color表示。

示例源码如下，请查看 pre > code 标签中的内容

在设置单字段索引时，可任意指定索引的排序为升序或降序，数据库总能在对索引字段的排序查询中，进行正确的排序。

组合索引即一个索引包含多个字段。当查询条件使用的字段包含在索引定义的所有字段或前缀字段里时，会命中索引，优化查询性能。

索引前缀即组合索引的字段中定义的前 1 到多个字段，例如对集合 students 中 name, age, score 三个字段按顺序定义了组合索引，那么该索引的前缀包含

示例源码如下，请查看 pre > code 标签中的内容

例如定义组合索引分别为 name, age 与 age, name 是不同的。当组合索引为 name, age 时，其索引前缀为 name, 对字段 name 的查询可以命中 name, age 索引, 而对字段 age 的查询无法命中该索引，因为 age 不属于 name, age 的前缀（反之字段 age 能命中 age, name 索引）。

云数据库目前支持建立平面几何的地理位置索引，使用地理位置查询功能时，必须为地理位置数据的字段建立地理位置索引。

例如对含地理位置字段 point 的集合建立地理位置索引：

示例源码如下，请查看 pre > code 标签中的内容

ttl索引用于设置数据过期时间，并在数据过期后进行删除。仅阿里云支持

创建索引时，索引属性选择唯一，即可添加唯一性限制。此限制会要求集合中索引字段对应的值不能重复。

例如，某个集合内建立了索引字段 foo，且属性为“唯一”，那么在这个集合内，要求不能存在 foo 字段相同的文档。

假如记录中不存在某个字段，则对索引字段来说其值默认为 null。如果索引有唯一性限制，则不允许存在两个或以上的该字段为空 / 不存在该字段的记录。

针对上述问题，阿里云支持将索引设置为稀疏索引，腾讯云暂不支持稀疏索引。

稀疏索引适用于需要某个字段唯一，但是这个字段又可能为空的场景。以用户表为例，用户可能是通过邮箱注册、也可能是通过手机号注册，所以需要保证邮箱、手机号唯一且允许为空，这时候就可以分别将邮箱、手机号的索引设置为稀疏索引来处理这种场景。注意uni-id内支持多应用用户隔离（同一个手机号、邮箱等可以在不同应用注册账号），手机号、邮箱等都不可设置唯一索引

支付宝云索引字段的值限制不能超过255字节

即不要对大段的文字（例如新闻的内容）设置索引

每个英文字母(不分大小写)占一字节的空间，每个中文汉字占两字节的空间。

**Examples:**

Example 1 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

Example 2 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

Example 3 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

Example 4 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

---

## 费用说明 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-mongodb/price.html

**Contents:**
- # 费用说明
  - # 包年包月套餐
    - # 通用型规格
    - # 独享型规格
- # 注意事项

以下套餐均为阿里云云数据库MongoDB副本集3节点套餐，拥有主备节点和隐藏节点，具备高可用性。

下方的价格可能会随阿里云官网价格变动而变动，同时购买时选择的存储空间越大，费用也越贵，具体请以uniCloud控制台购买扩展数据库时显示的价格为准。

不知道如何选套餐版本？欢迎进入扩展数据库技术交流群

通用型规格独享被分配的内存和存储空间，共享CPU，SSD本地盘共享I/O，云盘独享I/O，因此理论上通用型规格存在一定的资源争抢风险；独享型不存在资源争抢情况。

但是通用型规格可通过资源复用换取利用率最大化，性价比较高，享受规模红利。

省成本小技巧： 因为一台扩展数据库可以绑定多个空间（不限制数量），因此如果10个空间使用同一台扩展数据库（在数据库自身可以承载这10个空间的并发量时），则等于每个空间的成本只有总价的十分之一

独享型不存在资源争抢情况，适合想要更高稳定性和更高性能的用户选择。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database

**Contents:**
- # 获取集合的引用
  - # 集合 Collection
  - # 记录 Record / Document
  - # 查询筛选指令 Query Command
  - # 字段更新指令 Update Command
- # 新增文档
- # 查询文档
  - # 添加查询条件
  - # 获取查询数量
  - # 设置记录数量

云函数中支持对云数据库的全部功能的操作。本章节主要讲解如何在云函数内通过传统api操作数据库，如需在云函数内使用JQL语法操作数据库，请参考：云函数内使用JQL语法

示例源码如下，请查看 pre > code 标签中的内容

通过 db.collection(name) 可以获取指定集合的引用，在集合上可以进行以下操作

查询及更新指令用于在 where 中指定字段需满足的条件，指令可通过 db.command 对象取得。

通过 db.collection(collectionName).doc(docId) 可以获取指定集合上指定 _id 的记录的引用，在记录上可以进行以下操作

doc(docId)方法的参数只能是字符串，即数据库默认的_id字段。

如需要匹配多个_id的记录，应使用where方法。可以在where方法里用in指令匹配一个包含_id的数组。

新增文档时数据库会自动生成_id字段，也可以自行将_id设置为其他值

如果你熟悉SQL，可查询mongodb与sql语句对照表 进行学习。

方法1： collection.add(data)

示例源码如下，请查看 pre > code 标签中的内容

方法2： collection.doc().set(data)

也可通过 set 方法新增一个文档，需先取得文档引用再调用 set 方法。 如果文档不存在，set 方法会创建一个新文档。

示例源码如下，请查看 pre > code 标签中的内容

支持 where()、limit()、skip()、orderBy()、get()、field()、count() 等操作。

只有当调用get()时才会真正发送查询请求。

limit，即返回记录的最大数量，默认值为100，也就是不设置limit的情况下默认返回100条数据。limit最大为1000条。

如果使用JQL语法传入getTree参数以返回树形数据也受上面的规则限制，不过此时limit方法仅对根节点生效（大量数据建议使用分层加载，不要使用getTree一次返回所有数据）

支付宝云中，使用where查询时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

注意： 聚合操作中不能使用where，需使用match，关于聚合操作的更多介绍，详见

设置过滤条件，where 可接收对象作为参数，表示筛选出拥有和传入对象相同的 key-value 的文档。比如筛选出所有类型为计算机的、内存为 8g 的商品：

示例源码如下，请查看 pre > code 标签中的内容

如果要表达更复杂的查询，可使用高级查询指令，比如筛选出所有内存大于 8g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

where 还可以使用正则表达式来查询文档，比如一下示例查询所有name字段以ABC开头的用户

示例源码如下，请查看 pre > code 标签中的内容

mongoDB内按照数组内的值查询可以使用多种写法，以下面的数据为例

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内第一个元素的name为item-1的记录可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内某个元素的name为item-1的记录（可以是数组内的任意一条name为item-1）可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.skip(value)

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很大的情况下，skip性能会很差，尽量使用其他方式替代，参考：skip性能优化

collection.orderBy(field, orderType)

如果需要对嵌套字段排序，需要用 "点表示法" 连接嵌套字段，比如 style.color 表示字段 style 里的嵌套字段 color。

同时也支持按多个字段排序，多次调用 orderBy 即可，多字段排序时的顺序会按照 orderBy 调用顺序先后对多个字段排序

示例源码如下，请查看 pre > code 标签中的内容

从查询结果中，过滤掉不需要的字段，或者指定要返回的字段。

示例源码如下，请查看 pre > code 标签中的内容

查询指令以dbCmd.开头，包括等于、不等于、大于、大于等于、小于、小于等于、in、nin、and、or。

示例源码如下，请查看 pre > code 标签中的内容

表示字段等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

事实上在uniCloud的数据库中，等于有两种写法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 eq 指令有更大的灵活性，可以用于表示字段等于某个对象的情况，比如：

示例源码如下，请查看 pre > code 标签中的内容

字段不等于。neq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存为 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存不是 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

如筛选出内存大于 4g 小于 32g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表示需满足所有指定条件中的至少一个。如筛选出价格小于 4000 或在 6000-8000 之间的计算机：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果要跨字段 “或” 操作：(如筛选出内存 8g 或 cpu 3.2 ghz 的计算机)

示例源码如下，请查看 pre > code 标签中的内容

例如下面可以筛选出 version 字段开头是 "数字+s" 的记录，并且忽略大小写：

示例源码如下，请查看 pre > code 标签中的内容

假设数据表class内有以下数据，可以使用下面两种方式查询数组内包含指定值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

使用腾讯云时更新方法必须搭配doc、where方法使用，db.collection('test').update()会报如下错误：param should have required property 'query'

collection.doc().update(Object data)

未使用set、remove更新操作符的情况下，此方法不会删除字段，仅将更新数据和已有数据合并。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，已数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc().set()

此方法会覆写已有字段，需注意与update表现不同，比如以下示例执行set之后follow字段会被删除

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口仅会操作一条数据，有多条数据匹配的情况下会只更新匹配的第一条并返回

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：只可确定数组内只会被匹配到一个的时候使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于设定字段等于指定值。这种方法相比传入纯 JS 对象的好处是能够指定字段等于一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于指示字段自增某个值，这是个原子操作，使用这个操作指令而不是先读数据、再加、再写回的好处是：

在文章阅读数+1、收藏+1等很多场景会用到它。如给收藏的商品数量加一：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意并没有直接提供减法操作符，如果要实现减法，仍通过inc实现。比如上述字段减1，

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意没有直接提供除法操作符，如果要实现除法，仍通过mul实现。比如上述字段除以10，

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于表示删除某个字段。如某人删除了自己一条商品评价中的评分：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组尾部追加元素，支持传入单个元素或数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组头部添加元素，支持传入单个元素或数组。使用同push

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果需要对类型为地理位置的字段进行搜索，一定要建立地理位置索引。

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

按从近到远的顺序，找出字段值在给定点的附近的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

找出字段值在指定 Polygon / MultiPolygon 内的记录，无排序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

事务通常用来在某个数据库操作失败之后进行回滚。

事务因为要锁行，是有时间限制的。从事务开始到事务提交/回滚，时间不可超过10秒。另外注意：如果多条事务同时处理同一行数据，可能存在写冲突，进而导致失败。

阿里云不支持此用法，请换成startTransaction以使用事务

发起事务。与startTransaction作用类似，接收参数类型不同

runTransaction 的形式如下：

示例源码如下，请查看 pre > code 标签中的内容

runTransaction返回一个Promise，此Promise.resolve的结果为callback事务执行函数的返回值，reject 的结果为事务执行过程中抛出的异常或者是 transaction.rollback 传入的值

事务执行函数由开发者传入，函数接收一个参数 transaction，其上提供 collection 方法和 rollback 方法。collection 方法用于取数据库集合记录引用进行操作，rollback 方法用于在不想继续执行事务时终止并回滚事务。

事务执行函数必须为 async 异步函数或返回 Promise 的函数，当事务执行函数返回时，uniCloud 会认为用户逻辑已完成，自动提交（commit）事务，因此务必确保用户事务逻辑完成后才在 async 异步函数中返回或 resolve Promise。

事务执行函数可能会被执行多次，在内部发现事务冲突时会自动重复执行，如果超过设定的执行次数上限，会报错退出。

在事务执行函数中发生的错误，都会认为事务执行失败而抛错。

事务执行函数返回的值会作为 runTransaction 返回的 Promise resolve 的值，在函数中抛出的异常会作为 runTransaction 返回的 Promise reject 的值，如果事务执行函数中调用了 transaction.rollback，则传入 rollback 函数的值会作为 runTransaction 返回的 Promise reject 的值。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

发起事务。与runTransaction作用类似，接收参数类型不同

startTransaction 形式如下

示例源码如下，请查看 pre > code 标签中的内容

返回一个Promise，此Promise resolve的结果为事务操作对象（注意这里与runTransaction的区别），其上可通过 collection API 操作数据库，通过 commit（使用startTransaction需要主动commit） 或 rollback 来结束或终止事务。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 2 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 3 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 4 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database?id=export

**Contents:**
- # 获取集合的引用
  - # 集合 Collection
  - # 记录 Record / Document
  - # 查询筛选指令 Query Command
  - # 字段更新指令 Update Command
- # 新增文档
- # 查询文档
  - # 添加查询条件
  - # 获取查询数量
  - # 设置记录数量

云函数中支持对云数据库的全部功能的操作。本章节主要讲解如何在云函数内通过传统api操作数据库，如需在云函数内使用JQL语法操作数据库，请参考：云函数内使用JQL语法

示例源码如下，请查看 pre > code 标签中的内容

通过 db.collection(name) 可以获取指定集合的引用，在集合上可以进行以下操作

查询及更新指令用于在 where 中指定字段需满足的条件，指令可通过 db.command 对象取得。

通过 db.collection(collectionName).doc(docId) 可以获取指定集合上指定 _id 的记录的引用，在记录上可以进行以下操作

doc(docId)方法的参数只能是字符串，即数据库默认的_id字段。

如需要匹配多个_id的记录，应使用where方法。可以在where方法里用in指令匹配一个包含_id的数组。

新增文档时数据库会自动生成_id字段，也可以自行将_id设置为其他值

如果你熟悉SQL，可查询mongodb与sql语句对照表 进行学习。

方法1： collection.add(data)

示例源码如下，请查看 pre > code 标签中的内容

方法2： collection.doc().set(data)

也可通过 set 方法新增一个文档，需先取得文档引用再调用 set 方法。 如果文档不存在，set 方法会创建一个新文档。

示例源码如下，请查看 pre > code 标签中的内容

支持 where()、limit()、skip()、orderBy()、get()、field()、count() 等操作。

只有当调用get()时才会真正发送查询请求。

limit，即返回记录的最大数量，默认值为100，也就是不设置limit的情况下默认返回100条数据。limit最大为1000条。

如果使用JQL语法传入getTree参数以返回树形数据也受上面的规则限制，不过此时limit方法仅对根节点生效（大量数据建议使用分层加载，不要使用getTree一次返回所有数据）

支付宝云中，使用where查询时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

注意： 聚合操作中不能使用where，需使用match，关于聚合操作的更多介绍，详见

设置过滤条件，where 可接收对象作为参数，表示筛选出拥有和传入对象相同的 key-value 的文档。比如筛选出所有类型为计算机的、内存为 8g 的商品：

示例源码如下，请查看 pre > code 标签中的内容

如果要表达更复杂的查询，可使用高级查询指令，比如筛选出所有内存大于 8g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

where 还可以使用正则表达式来查询文档，比如一下示例查询所有name字段以ABC开头的用户

示例源码如下，请查看 pre > code 标签中的内容

mongoDB内按照数组内的值查询可以使用多种写法，以下面的数据为例

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内第一个元素的name为item-1的记录可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内某个元素的name为item-1的记录（可以是数组内的任意一条name为item-1）可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.skip(value)

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很大的情况下，skip性能会很差，尽量使用其他方式替代，参考：skip性能优化

collection.orderBy(field, orderType)

如果需要对嵌套字段排序，需要用 "点表示法" 连接嵌套字段，比如 style.color 表示字段 style 里的嵌套字段 color。

同时也支持按多个字段排序，多次调用 orderBy 即可，多字段排序时的顺序会按照 orderBy 调用顺序先后对多个字段排序

示例源码如下，请查看 pre > code 标签中的内容

从查询结果中，过滤掉不需要的字段，或者指定要返回的字段。

示例源码如下，请查看 pre > code 标签中的内容

查询指令以dbCmd.开头，包括等于、不等于、大于、大于等于、小于、小于等于、in、nin、and、or。

示例源码如下，请查看 pre > code 标签中的内容

表示字段等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

事实上在uniCloud的数据库中，等于有两种写法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 eq 指令有更大的灵活性，可以用于表示字段等于某个对象的情况，比如：

示例源码如下，请查看 pre > code 标签中的内容

字段不等于。neq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存为 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存不是 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

如筛选出内存大于 4g 小于 32g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表示需满足所有指定条件中的至少一个。如筛选出价格小于 4000 或在 6000-8000 之间的计算机：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果要跨字段 “或” 操作：(如筛选出内存 8g 或 cpu 3.2 ghz 的计算机)

示例源码如下，请查看 pre > code 标签中的内容

例如下面可以筛选出 version 字段开头是 "数字+s" 的记录，并且忽略大小写：

示例源码如下，请查看 pre > code 标签中的内容

假设数据表class内有以下数据，可以使用下面两种方式查询数组内包含指定值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

使用腾讯云时更新方法必须搭配doc、where方法使用，db.collection('test').update()会报如下错误：param should have required property 'query'

collection.doc().update(Object data)

未使用set、remove更新操作符的情况下，此方法不会删除字段，仅将更新数据和已有数据合并。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，已数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc().set()

此方法会覆写已有字段，需注意与update表现不同，比如以下示例执行set之后follow字段会被删除

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口仅会操作一条数据，有多条数据匹配的情况下会只更新匹配的第一条并返回

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：只可确定数组内只会被匹配到一个的时候使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于设定字段等于指定值。这种方法相比传入纯 JS 对象的好处是能够指定字段等于一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于指示字段自增某个值，这是个原子操作，使用这个操作指令而不是先读数据、再加、再写回的好处是：

在文章阅读数+1、收藏+1等很多场景会用到它。如给收藏的商品数量加一：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意并没有直接提供减法操作符，如果要实现减法，仍通过inc实现。比如上述字段减1，

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意没有直接提供除法操作符，如果要实现除法，仍通过mul实现。比如上述字段除以10，

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于表示删除某个字段。如某人删除了自己一条商品评价中的评分：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组尾部追加元素，支持传入单个元素或数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组头部添加元素，支持传入单个元素或数组。使用同push

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果需要对类型为地理位置的字段进行搜索，一定要建立地理位置索引。

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

按从近到远的顺序，找出字段值在给定点的附近的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

找出字段值在指定 Polygon / MultiPolygon 内的记录，无排序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

事务通常用来在某个数据库操作失败之后进行回滚。

事务因为要锁行，是有时间限制的。从事务开始到事务提交/回滚，时间不可超过10秒。另外注意：如果多条事务同时处理同一行数据，可能存在写冲突，进而导致失败。

阿里云不支持此用法，请换成startTransaction以使用事务

发起事务。与startTransaction作用类似，接收参数类型不同

runTransaction 的形式如下：

示例源码如下，请查看 pre > code 标签中的内容

runTransaction返回一个Promise，此Promise.resolve的结果为callback事务执行函数的返回值，reject 的结果为事务执行过程中抛出的异常或者是 transaction.rollback 传入的值

事务执行函数由开发者传入，函数接收一个参数 transaction，其上提供 collection 方法和 rollback 方法。collection 方法用于取数据库集合记录引用进行操作，rollback 方法用于在不想继续执行事务时终止并回滚事务。

事务执行函数必须为 async 异步函数或返回 Promise 的函数，当事务执行函数返回时，uniCloud 会认为用户逻辑已完成，自动提交（commit）事务，因此务必确保用户事务逻辑完成后才在 async 异步函数中返回或 resolve Promise。

事务执行函数可能会被执行多次，在内部发现事务冲突时会自动重复执行，如果超过设定的执行次数上限，会报错退出。

在事务执行函数中发生的错误，都会认为事务执行失败而抛错。

事务执行函数返回的值会作为 runTransaction 返回的 Promise resolve 的值，在函数中抛出的异常会作为 runTransaction 返回的 Promise reject 的值，如果事务执行函数中调用了 transaction.rollback，则传入 rollback 函数的值会作为 runTransaction 返回的 Promise reject 的值。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

发起事务。与runTransaction作用类似，接收参数类型不同

startTransaction 形式如下

示例源码如下，请查看 pre > code 标签中的内容

返回一个Promise，此Promise resolve的结果为事务操作对象（注意这里与runTransaction的区别），其上可通过 collection API 操作数据库，通过 commit（使用startTransaction需要主动commit） 或 rollback 来结束或终止事务。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 2 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 3 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 4 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/summary

**Contents:**
- # 需求背景
- # uni-id 的价值
- # 功能清单
- # 组成结构
- # 快速上手
- # 云端配置config.json的说明
  - # 密码强度
  - # 登录方式及配置说明
  - # 用户注册时设置默认角色uni-id-pages 1.1.6+
- # token令牌

本文档适用于uni-id 4.0.0及以上版本，需 HBuilderX 3.5.0 及以上版本。旧版本文档请访问：uni-id 3.x.x 文档

99%的应用，都要开发用户注册、登录、发送短信验证码、修改密码、密码加密保存、密码防探测、token管理、页面访问权限、注册用户统计等众多功能，从前端到后端都需要。

为什么不能有一个开源的通用项目，避免大家的重复开发呢？

uni-id为uniCloud开发者提供了开源、易用、安全、丰富、可扩展的用户管理框架。

clientDB、DB Schema、uni-starter 、uni-admin，这些产品都基于uni-id的账户体系。可以说uni-id是uniCloud不可或缺的基础能力。

一个应用，往往需要集成多个功能模块。比如一个电商应用，需要一个基本电商模板，还需要客服聊天模板、统计看板模板。

在插件市场，每类模板插件都能找到，但他们如果不是基于同一套用户体系设计，就很难整合。

所有uniCloud的标准应用，都基于uni-id来做。uni-id-common公共模块自动内置在每个服务空间里的。

有了统一的账户规范，并且围绕这套账户规范，有各种各样插件，那么开发者可以随意整合这些插件，让数据互通。

规范，还可以让上下游充分协同。插件市场会出现各种数据迁移插件，比如把从discuz里把用户迁移到uni-id中的插件，相信围绕这套规范的产业链会非常活跃。

目前插件市场上各种优秀的uniCloud轮子，几乎都是基于uni-id的。

由于三方登录很多，DCloud没有精力全部实现，在uni-id-co中留下了空实现，欢迎开发者自行补充、提交pr或发布扩展插件，共同完善uni-id。。

后续计划：DCloud未来将内置 微信扫码登录和公众号登录、邮箱验证集成、facebook等海外主流社交账户登录、活体检测。

其他方面，各种常见开源项目如discuz、wordPress、ecshop的用户导入插件，不属于uni-id主工程，欢迎开发者单独提交插件到插件市场。

uni-id贯穿了uni-app前端到uniCloud后端的各个环节。

数据库是一个系统的核心，uni-id首先规范化了十几张用户相关的opendb数据表，

主表为uni-id-users表，保存用户的基本信息。扩展字段有很多，如实名认证数据、工作履历数据。由于MongoDB的特性，开发者可以自由扩展字段。

所有uni-id的数据表，不管在HBuilderX中新建 DB Schema 还是在 uniCloud web控制台新建表的界面上，都可以选择模板直接建好。

uni-id-common公共模块包含了账户体系服务端的核心权限、token管理，内置在每个uniCloud服务空间里。

如开发者需要在自己的云函数/云对象里校验前端用户token，则需要引用uni-id-common公共模块。

uniCloud众多功能（如DB Schema的权限、uni-id-co）也都依赖 uni-id-common。

uni-id在云端有很多配置，比如密码加密秘钥、短信和微信登录的appsecret等等。在uni-config-center下的uni-id目录下的config.json里存放着这些配置。

uni-app与uniCloud搭配且使用uni-id，登录后自动下发token、网络传输层自动传输token（uni-app 2.7.13+版本）、token临近过期会自动续期（uni-app 3.4.13 +版本），也就是说开发者无需自己管理token了。

uni-app客户端还有一批uni-id相关的内置API：

基于uni-id-common，DCloud还提供了一组完整的前端页面和后端云对象 ，合称uni-id-pages。

uni-id-pages的功能包括：用户注册（含用户协议、隐私协议）、退出、修改密码、忘记密码等各种功能，同时适配PC宽屏和各种手机平台（App、H5、小程序）。

此外，DCloud的其他产品也为uni-id提供了众多支持：

在HBuilderX 3.5之前，DCloud提供了一个公共模块uni-id （注意不叫uni-id-common）和一个示例性云函数uni-id-cf（集成在uni-starter和uni-admin中）。

老的公共模块uni-id是一个大而全的账户管理公共模块，体积太大，不适合被其他云函数引用。比如某个业务云函数需要校验用户token，引用的uni-id公共模块还包含了忘记密码的代码，很浪费资源。

在云对象发布之前，DCloud基于云函数方式提供了uni-id-cf。但在HBuilderX 3.5 以后，推荐使用基于云对象的uni-id-pages，代码更简单清晰。

从HBuilder 3.5起，uni-id 和uni-id-cf都将被淘汰，不再更新。老的公共模块uni-id被拆开，变成了uni-id-common公共模块和uni-id-co云对象。

uni-id-common很精简，只包括token和权限，适合被所有云函数引用。

uni-id-co则是一个更加比uni-id-cf更完善和规范的用户管理的云对象。

uni-id-common的插件市场地址为：uni-id-common插件 。但一般不需要单独下载这个插件，但更新uni-id-common公共模块时需要从这里下载更新。

一般推荐直接使用uni-starter项目模板来开始开发，或者在新项目里导入uni-id-pages页面模板来使用。

uni-id云端的配置是依赖uni-config-center公用模块的，在工程目录uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json。（如未安装uni-config-center需安装，如缺少目录需手动创建）

uni-id云端同时依赖了公共模块uni-captcha ，这个功能模块负责生成和校验验证码，进行人机验证。

体验uni-id需保证uniCloud服务空间至少有数据表uni-id-users、opendb-verify-codes（验证码表）

你的应用采用什么方式注册登录？比如用户名密码、手机号+短信验证码、或者微信登录。

很多登录方式涉及三方服务，需要开通短信验证码服务、开通App一键登录、或者向微信等申请登录的appid和appsecret信息。

申请开通相关服务后，需要把配置信息填写在云端配置文件config.json中。

账户如果涉及密码，那么需要配置passwordSecret，账户的密码会根据passwordSecret使用sha1摘要加密算法以不可逆的方式存储在数据库中。

配置tokenSecret是为了防止token被第三方解密，模拟用户身份。

千万不要使用默认的passwordSecret和tokenSecret，会造成系统安全隐患。

云端的config.json还有各种配置，详见下个章节。前端的配置请参考uni-id-pages的文档。

uni-id的云端配置文件在uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json中。

！！！重要！！！ passwordSecret与tokenSecret十分重要，切记妥善保存（不要直接使用下面示例中的passwordSecret与tokenSecret）。修改passwordSecret会导致老用户使用密码无法登录，修改tokenSecret会导致所有已经下发的token失效。如果重新导入uni-id切勿直接覆盖config.json相关配置

示例源码如下，请查看 pre > code 标签中的内容

新增于uni-id-pages 1.0.8

passwordStrength配置项支持以下四种内置规则

示例源码如下，请查看 pre > code 标签中的内容

uni-id-co 与 uni-id-pages 内的前端页面均支持这四个内置规则

默认情况下，用户注册后不会关联任何角色，如果需要用户在注册后关联角色，可以通过此配置项开启。

配置项userRegisterDefaultRole的值类型为Array，每个元素为角色ID(role_id)， 例如：

示例源码如下，请查看 pre > code 标签中的内容

如需保持活跃客户端的登录状态，请勿将token有效期设置一个很大的值，具体如何实现请参考：保持客户端登录状态

首先解释下token的概念。token是服务器颁发给客户端的一个令牌。

用户在客户端登录时，云端通过登录接口对用户的用户名+密码，或者手机号+验证码进行校验，校验通过后服务器会给客户端下发一个token（就是根据tokenSecret生成的一串加密字符串），并同时给出有效期。

客户端把这个token保存在storage中，然后每次联网请求服务器时，都带上这个token。服务器解密这个token，通过这个token认定客户端的身份。

这样就避免了客户端每次请求服务器，都需要再传输一次用户名和密码。

在传统开发下，客户端和服务器各自需要为了token做很多事情。在uni云端一体下，开发者无需操心，只需要在uni-id云端config.json中配置好token的secret和有效期即可。剩余的工作都被自动处理了。

uni-id云端会在login方法成功后自动返回token，uni-app前端框架会自动识别并保存这个token在storage中（uni_id_token），在前端每次连接uniCloud（不管是clientDB、callfunction、云对象调用），都会自动带上这个token。

云函数和云对象都提供了获取和校验token的方法，在uni-id相关业务中，校验token的代码都已经写好。

包括token快到期时的自动续期，开发者只需在config.json中配置好临近多久自动续期，续期的代码也无需开发者编写，框架已经内置。

注：不同平台的token有效期一般不一样，app有效期较长，web有效期较短。每个平台的有效期都可以单独在config.json里配置。

uni-id基于经典的RBAC模型实现了角色权限系统。

RBAC：Role-Based Access Control，基于角色的访问控制。

其基本思想：对系统操作的各种权限不是直接授予具体的用户，而是在用户集合与权限集合之间建立一个角色集合。每一种角色对应一组相应的权限。一旦用户被分配了适当的角色后，该用户就拥有此角色的所有权限。

这样做的好处是，增强系统管理的扩展性，对于批量用户的权限变更，仅需变更该批用户角色对应权限即可，而无需对该批每个用户变更权限。

这个模型有三个关键名词：用户、角色、权限：

用户、角色、权限都存在数据库了，都可以动态创建和修改。当权限对应的代码实现完成后，用户的新入、退出、角色升迁都无需再修改代码，在uni-admin后台的web界面可以由运维人员可视化的给每个用户调整角色、给每个角色调整权限。

用户信息存储在uni-id-users表中，然后通过role字段保存该用户所拥有的所有角色ID，角色ID即角色表（uni-id-roles表）中的role_id字段，注意不是_id字段。

示例源码如下，请查看 pre > code 标签中的内容

Tips：将用户角色设计为用户表的字段，而没有新建用户角色关联表的原因：避免mongodb在跨表查询时的性能开销

角色信息存储在uni-id-roles表中

示例源码如下，请查看 pre > code 标签中的内容

如下是角色在clientDB中的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

Tips1：uni-id中admin为超级管理员角色，uni-clientDB也基于同样的策略；如果用户角色包含admin，则该用户就拥有所有数据表的全部权限。

Tips2：出厂时可内置常用角色，也可上线后由运营人员动态创建角色。

权限信息在uni-id-permissions表中，表结构定义如下：

其中，permission_id为权限标志，全局唯一，可用于clientDB中的权限配置，建议按照语义化命名，例如：USER_DEL、BRANCH_ADD。权限总数量不得超过500

示例源码如下，请查看 pre > code 标签中的内容

如下是权限在clientDB中的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

Tips1：建议代码交付时内置所有权限，方便clientDB中的权限配置和调整。

uni-id将用户的角色权限缓存在token内。详情参考：缓存角色权限。

示例源码如下，请查看 pre > code 标签中的内容

注意： 在uniCloud admin中，封装了可视化的用户、权限、角色的管理，新增删除修改均支持，无需自己维护。详见

uni-id的所有数据表，都在opendb规范中。

在unicloud web控制台 新建数据表时，可以从uni-id的模板分类里找到下面的表，并一键创建这些表。HBuilderX 3.4.11起新建 DB Schema 也有模板可选择。

opendb中uni-id-users表1.0.0调整为下面的结构，uni-id-co使用此标准。如何处理旧数据请参考：自uni-id升级为uni-id-co+uni-id-common

opendb中uni-id-users表1.0.0调整为下面的结构，uni-id-co使用此标准。如何处理旧数据请参考：自uni-id升级为uni-id-co+uni-id-common

realNameAuth 扩展字段定义 该字段存储实名认证信息，子节点说明如下。

注意：该字段是在前端注册用户时记录的前端环境信息。如果是管理员在云端调用uni-id的addUser添加的用户则无此字段

示例源码如下，请查看 pre > code 标签中的内容

目前 opendb 内提供的 uni-id-users表 包含完整的索引，数据库在索引量多且频繁更新的情况下可能会出现写入缓慢的情况，因此推荐开发者在使用 uni-id-users表 时可以删除没有用到的索引。

例：项目内只使用了微信登录，不使用其他登录方式，可以只保留wx_unionid、wx_openid.mp这些账号相关的索引，删除其他登录方式的索引（比如username、mobile）

表名：opendb-verify-codes

该表的前缀不是uni-id，意味着该表的设计用途是通用的，不管是uni-id的手机号验证码，或者支付等关键业务需要验证码，都使用此表。

每条验证信息，都记录在本表中。uni-id不会自动删除本表的历史数据，数据保留有效期需要开发者自行管理，可以在云函数中设置一个定时运行来清理过期数据。

表名：uni-id-permissions

还有更多uni-id的配套数据表，可以在uniCloud web控制台 新建表时选择相应模板。此处不再详述，仅罗列清单：

对应uni-id-users表的status字段

对应opendb-verify-codes表短信、邮箱验证码相关记录的的scene字段

对应opendb-verify-codes表图形验证码相关记录的scene字段

uniIdRouter 是一个运行在前端的、对前端页面访问权限路由进行控制的方案。

大多数应用，都会指定某些页面需要登录才能访问。以往开发者需要写不少代码。

现在，只需在项目的pages.json内配置登录页路径、需要登录才能访问的页面等信息，uni-app框架的路由跳转，会自动在需要登录且客户端登录状态过期或未登录时跳转到登录页面。

结合以下代码及注释了解如何使用uniIdRouter

示例源码如下，请查看 pre > code 标签中的内容

以上代码，指定了登录页为首页index，然后将list页面和detail目录下的所有页面，设为需要登录才能访问。那么访问list页面和detail目录下的页面时，如果客户端未登录或登录状态过期（也就是uni_id_token失效），那么会自动跳转到index页面来登录。

与此功能对应的有两个uniCloud客户端api，uniCloud.onNeedLogin()和uniCloud.offNeedLogin()，开发者在监听onNeedLogin事件后，框架就不再自动跳转到登录页面，而是由开发者在onNeedLogin事件内自行处理。详情参考：uniCloud.onNeedLogin

自动跳转到登录页面时会携带uniIdRedirectUrl参数，其值为encodeURIComponent(${跳转前的页面（包含路径和参数的完整页面地址）})，如果希望用户登录后跳转回之前的页面，可以使用此参数实现。

以下为登录页面跳转到之前访问页面的简单示例：

pages/login/login.vue

示例源码如下，请查看 pre > code 标签中的内容

云对象抛出uni-id token过期或token无效错误码时，会触发客户端自动跳转配置的登录页面，以下代码为一个简单示例

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

有些系统由多个子应用组成，且没有各自独立服务空间，而是需要共享一个服务空间。此时就涉及一个问题，多个应用注册的账户都在uni-id-user表中，如何有效隔离。

比如一个打车软件，有乘客端、司机端、管理端，都要注册账户。它们也都有自己的DCloud appID（manifest.json里第一个配置）

uni-id-user表中有一个数组型字段dcloud_appid，可以存贮这个用户有权登陆哪个应用。

比如乘客端的appid是__uni_111111，司机端appid是__uni_222222，那么2个appid都存入dcloud_appid，即表示这个用户有权登录这2个应用。

uni-id 3.3.0版本起用户注册时会自动在用户表的记录内标记为注册应用对应的用户，如果没有单独授权登录其他应用的话则只能登录这个应用。即在乘客端应用注册的，默认只能在乘客端应用登录。

如何授权登录其他应用请参考：授权、禁止用户在特定客户端应用登录

需要注意的是客户端APPID信息是由端上传上来的，并非完全可信，尽量在入口处进行校验。例：

示例源码如下，请查看 pre > code 标签中的内容

DCloud Appid是一个很重要的配置，如无必要请勿随意更换。

不同端用户数据通过用户表的dcloud_appid字段隔离，同一个手机号、微信号也可以同时注册管理端和用户端，绑定账号同理。

uni-id的config.json支持配置为数组，每项都是一个完整的配置，对不同的配置使用dcloudAppid字段进行区分（此字段与项目内的manifest.json里面的DCloud AppId一致）， uni-id会自动根据客户端的appid来判断该使用哪套配置。

需要注意的是客户端APPID信息是由端上传上来的，并非完全可信，尽量在入口处进行校验。例：

示例源码如下，请查看 pre > code 标签中的内容

数组每一项都是一个完整的配置文件，全部选项请参考：uni-id 配置

注意：如果允许同一账号在不同端使用相同的账号+密码登录需要将不同端的passwordSecret设置成一样的

示例源码如下，请查看 pre > code 标签中的内容

一般来说token的有效期不会无限长，示例配置内web端token有效期为2小时，微信小程序为3天，app端为30天。你可以回忆一下你所用的软件，只要每天都打开就一直不需要重新登录，这样就牵扯到保持客户端的登录状态的问题。

uni-id使用了判断token剩余有效时间小于一定的阈值（配置文件内的tokenExpiresThreshold）但是大于0时自动下发新token的逻辑来保证活跃客户端一直处于登录状态，返回新token的逻辑由checkToken方法实现。具体该将token有效期和token刷新阈值设置为多少，需要根据多数用户软件使用频率来确定。

举个例子，开发者配置的token有效期（tokenExpiresIn）为1天，token刷新阈值（tokenExpiresThreshold）为8小时。用户在0点0分0秒获取了token，如果用户在16点后（token有效期已小于8小时）调用接口时执行了checkToken方法则会返回新token。

在config.json（uniCloud/cloudfuntions/common/uni-config-center/uni-id/config.json，以下config.json均指此文件）内配置了autoSetInviteCode: true则在用户注册时会自动给设置不重复的6位邀请码

在config.json内配置了forceInviteCode: true则只有使用邀请码才可以注册。

uni-id-co在会产生注册行为的接口均添加了inviteCode参数，用于传递邀请码使注册用户接受邀请

注意：通常情况下设定好passwordSecret之后不需要再进行修改，使用此功能时请务必小心谨慎

在config.json内修改passwordSecret会导致历史用户无法通过密码登录。但是某些情况下有些应用有修改passwordSecret的需求，例如刚开始使用uni-id时没有自定义passwordSecret，后续需要修改，此时可以使用uni-id 2.0.1版本新增的修改passwordSecret功能。（注意：2.0.1版本验证码表名调整为了opendb-verify-codes）

下面以将passwordSecret从passwordSecret-demo修改为qwertyasdfgh为例介绍如何使用

示例源码如下，请查看 pre > code 标签中的内容

如果在上面基础上再修改passwordSecret为1q2w3e4r5t,config.json调整如下

!!!注意只有在数据库内完全没有使用某个版本（password_secret_version字段表示了用户密钥版本）密钥的用户才可以将此密钥从config.json内去除。没有password_secret_version的用户使用的是最旧版本的passwordSecret，如果存在这样的用户对应的passwordSecret也不可去除。

示例源码如下，请查看 pre > code 标签中的内容

uni-id-users表内存储的password字段为使用hmac-sha1生成的hash值，此值不可逆向推出用户真实密码。所以直接修改passwordSecret会导致老用户无法使用密码登录。

上述修改通过密钥版本号区分新旧密钥，用户登录时如果密钥版本小于当前最新版本，会为用户更新数据库内存储的password字段，并记录当前使用的密钥版本。

用户对应的数据库记录内没有密钥版本的话会使用最低版本密钥进行密码校验，校验通过后为用户更新为最新版密钥对应的password并记录版本号。

由于是不可逆加密，理论上passwordSecret泄露不会造成用户的真实密码被泄露，自定义passwordSecret只是进一步加强安全性。

使用uni-id-common时，token内会缓存用户的角色权限。

为什么要在token缓存角色权限？token校验是高频操作，云数据库是按照读写次数来收取费用的，并且读写数据库会拖慢接口响应速度。

比较经济的做法就是在token里缓存角色权限。更好的方案是在redis里缓存角色权限，只是redis需要付费开通。

uni-id-common支持在token内缓存用户的角色权限。但是某些情况下开发者可能还希望缓存一些别的东西，以便在客户端能方便的访问（注意：不可缓存机密信息到token内）。

在uni-config-center模块内的uni-id插件内创建custom-token.js内容如下：

示例源码如下，请查看 pre > code 标签中的内容

uni-id会自动加载custom-token.js进行处理，在所有生成token的操作（包括：登录、注册、token过期自动刷新、开发者自行调用createToken）执行时自动获取新token信息，并生成token。

在cloudfunctions/common/uni-config-center/uni-id/lang/目录下创建index.js，内容示例如下：

示例源码如下，请查看 pre > code 标签中的内容

uni-id会自动进行语言匹配，无需额外配置

uni-id-co在微信、QQ登录或注册时会自动保存用户的sessionKey、accessToken信息。

在uni-id-pages 1.0.8之前，uni-id-co直接将这些信息保存在了用户表（uni-id-users）的third_party字段下，仅按照平台区分没有按照不同应用区分。具体结构如下

示例源码如下，请查看 pre > code 标签中的内容

此结构无法满足多应用同一平台关联同一服务空间且允许用户跨应用登录的场景。因此在uni-id-pages 1.0.8及更高版本对此做出了调整，改为使用uni-open-bridge-common存储用户在三方平台的凭据信息。同时为了兼容旧版本上述third_party字段仍存有这些信息。

目前被uni-id-co保存的三方凭据有以下几种：

开发者如需获取某用户对应的openid，可以在用户使用相应的登录操作之后自行读取用户记录获取。代码示例如下：

示例源码如下，请查看 pre > code 标签中的内容

新增于 uni-id-pages 1.0.8

uni-id-co是一个完整的云对象，里面注册登录等流程都已完全实现，开发者不方便进行修改。例如要实现注册时为某端用户统一添加一个角色的功能，只能去修改uni-id-co的代码。因此uni-id-co提供了通过钩子干涉内置逻辑的功能

uni-id钩子函数需要在uni-config-center内配置。在uni-config-center/uni-id下创建hooks目录并在其内创建index.js内容如下

示例源码如下，请查看 pre > code 标签中的内容

beforeRegister在注册用户记录入库前触发。钩子会接收到如下参数，需要返回处理后的用户记录用以入库存储

以为__UNI_123123这个应用注册的用户添加"teacher"角色为例，beforeRegister钩子示例如下

示例源码如下，请查看 pre > code 标签中的内容

uni-id 默认使用了 hmac-sha1 加密算法对密码进行加密，自 uni-id-pages@1.0.28 版本起新增了 hmac-sha256 加密算法，开发者可以自己需求选择不同的算法，推荐使用 hmac-sha256算法。

在 uni-config-center/uni-id/config.json 中配置， uni-id/config.json说明

示例源码如下，请查看 pre > code 标签中的内容

适用于 uni-id-pages@1.0.28 以下版本， 首先确认 uni-config-center/uni-id/config.json 中 passwordSecret 字段类型

passwordSecret 字段可能是string或者array类型，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

如果 passwordSecret 是字符串类型，修改为数组类型后，在 passwordSecret 中添加 hmac-256 算法，同时 version 加 1

示例源码如下，请查看 pre > code 标签中的内容

如果内置的加密算法无法满足业务需求，可以自定义加密规则。

首先在 uni-config-center/uni-id/config.json 中增加自定义密码类型 custom

示例源码如下，请查看 pre > code 标签中的内容

在 uni-config-center/uni-id/custom-password.js文件（没有请手动创建）中创建加密与验证方法即可。

示例源码如下，请查看 pre > code 标签中的内容

如果你想将自己系统内的用户导入至 uni-id，请按照以下步骤操作

uni-id 默认使用了 hmac-256 密码加密算法，可能与你的加密算法不同，所以在迁移前需要自定义你的密码加密函数。 当用户第一次在 uni-id 中进行登录时，会先使用自定义验证密码(verifyPassword)函数进行验证，这样用户用之前的密码依旧能够登录，不需要用户重置密码。 在用户第一次登录成功后用户密码的加密算法规则将升级为配置文件中最新的算法规则。

首先在uni-config-center/uni-id/config.json文件中创建自定义类型的paswordSecret，如下：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-config-center/uni-id/custom-password.js 文件（不存在请手动创建）中创建 verifyPassword 函数验证之前用户密码。

示例源码如下，请查看 pre > code 标签中的内容

如果配置文件中passwordSecret最新版本的 type 是 custom，那么所有用户的加密及校验都会使用自定义算法规则。

如果仅是为了迁移使用，请另外在 passwordSecret 中添加 hmac-sha256 类型算法，用于其他用户的加密与校验。

这样只有之前的用户才会使用 custom 自定义规则，其他用户或者迁移后的新注册的用户会使用 hmac-sha256 算法规则。

示例源码如下，请查看 pre > code 标签中的内容

导出文件大小最大不超过 50MB，超过 50MB 请导出多个json文件

如果存在表A关联表B的字段的场景需要保证关联字段在A、B内是一致的（特别需要注意的是各种与_id关联的字段）

请将用户数据导出为json格式文件，注意json文件不是标准的json文件，请按照以下格式每行是一个json格式的用户记录导出：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-id 中 userId 是系统自动创建的 _id，如果想保留之前用户的userId，可以将用户的 userId 映射为 _id，如果不保留 userId 建议删除 userId 字段，在数据导入中会创建 _id。

注意password_secret_version字段，字段值需要修改为自定义密码类型的 version

导入到 uni-id 之前，需要处理用户数据与 uni-id 字段的映射关系，见下方 uni-id 字段及说明：

在 uniCloud 控制台 ，找到 uni-id 所在的服务空间，在云数据库中选中 uni-id-users 表，点击导入按钮，上传用户数据json文件即可。

实人认证相关功能建议或问题，可以加入uni-im交流群进行讨论，点此加入

基于uni实人认证服务实现，可以实现用户刷脸核验真实身份，完成实名认证。

uni-id-pages / uni-id-pages-x 中内置了实名认证页面

如没有实名认证需求，可以将实名认证相关页面注释：

实名认证相关配置项如下，配置文件路径uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json，详细的uni-id配置文件参考

用户的姓名、身份证号、实人认证照片属于用户隐私信息，为了防止隐私信息泄露，在数据存储上使用了对称加密aes-256-cbc算法对数据进行加密。 在前端页面需要使用时，例如”获取用户实名信息“接口，只会返回脱敏后的数据，减少暴露风险，提高安全性。

由于加密密钥sensitiveInfoEncryptSecret来源于config.json配置文件，强烈建议更换为自定义的字符串，不要使用默认的密钥。 密钥长度需要是32位的字符串。

实人认证照片将会上传至云存储中，阿里云与腾讯云存储路径如下：

**Examples:**

Example 1 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

Example 2 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

Example 3 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

Example 4 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database?id=dbcmd

**Contents:**
- # 获取集合的引用
  - # 集合 Collection
  - # 记录 Record / Document
  - # 查询筛选指令 Query Command
  - # 字段更新指令 Update Command
- # 新增文档
- # 查询文档
  - # 添加查询条件
  - # 获取查询数量
  - # 设置记录数量

云函数中支持对云数据库的全部功能的操作。本章节主要讲解如何在云函数内通过传统api操作数据库，如需在云函数内使用JQL语法操作数据库，请参考：云函数内使用JQL语法

示例源码如下，请查看 pre > code 标签中的内容

通过 db.collection(name) 可以获取指定集合的引用，在集合上可以进行以下操作

查询及更新指令用于在 where 中指定字段需满足的条件，指令可通过 db.command 对象取得。

通过 db.collection(collectionName).doc(docId) 可以获取指定集合上指定 _id 的记录的引用，在记录上可以进行以下操作

doc(docId)方法的参数只能是字符串，即数据库默认的_id字段。

如需要匹配多个_id的记录，应使用where方法。可以在where方法里用in指令匹配一个包含_id的数组。

新增文档时数据库会自动生成_id字段，也可以自行将_id设置为其他值

如果你熟悉SQL，可查询mongodb与sql语句对照表 进行学习。

方法1： collection.add(data)

示例源码如下，请查看 pre > code 标签中的内容

方法2： collection.doc().set(data)

也可通过 set 方法新增一个文档，需先取得文档引用再调用 set 方法。 如果文档不存在，set 方法会创建一个新文档。

示例源码如下，请查看 pre > code 标签中的内容

支持 where()、limit()、skip()、orderBy()、get()、field()、count() 等操作。

只有当调用get()时才会真正发送查询请求。

limit，即返回记录的最大数量，默认值为100，也就是不设置limit的情况下默认返回100条数据。limit最大为1000条。

如果使用JQL语法传入getTree参数以返回树形数据也受上面的规则限制，不过此时limit方法仅对根节点生效（大量数据建议使用分层加载，不要使用getTree一次返回所有数据）

支付宝云中，使用where查询时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

注意： 聚合操作中不能使用where，需使用match，关于聚合操作的更多介绍，详见

设置过滤条件，where 可接收对象作为参数，表示筛选出拥有和传入对象相同的 key-value 的文档。比如筛选出所有类型为计算机的、内存为 8g 的商品：

示例源码如下，请查看 pre > code 标签中的内容

如果要表达更复杂的查询，可使用高级查询指令，比如筛选出所有内存大于 8g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

where 还可以使用正则表达式来查询文档，比如一下示例查询所有name字段以ABC开头的用户

示例源码如下，请查看 pre > code 标签中的内容

mongoDB内按照数组内的值查询可以使用多种写法，以下面的数据为例

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内第一个元素的name为item-1的记录可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内某个元素的name为item-1的记录（可以是数组内的任意一条name为item-1）可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.skip(value)

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很大的情况下，skip性能会很差，尽量使用其他方式替代，参考：skip性能优化

collection.orderBy(field, orderType)

如果需要对嵌套字段排序，需要用 "点表示法" 连接嵌套字段，比如 style.color 表示字段 style 里的嵌套字段 color。

同时也支持按多个字段排序，多次调用 orderBy 即可，多字段排序时的顺序会按照 orderBy 调用顺序先后对多个字段排序

示例源码如下，请查看 pre > code 标签中的内容

从查询结果中，过滤掉不需要的字段，或者指定要返回的字段。

示例源码如下，请查看 pre > code 标签中的内容

查询指令以dbCmd.开头，包括等于、不等于、大于、大于等于、小于、小于等于、in、nin、and、or。

示例源码如下，请查看 pre > code 标签中的内容

表示字段等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

事实上在uniCloud的数据库中，等于有两种写法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 eq 指令有更大的灵活性，可以用于表示字段等于某个对象的情况，比如：

示例源码如下，请查看 pre > code 标签中的内容

字段不等于。neq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存为 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存不是 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

如筛选出内存大于 4g 小于 32g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表示需满足所有指定条件中的至少一个。如筛选出价格小于 4000 或在 6000-8000 之间的计算机：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果要跨字段 “或” 操作：(如筛选出内存 8g 或 cpu 3.2 ghz 的计算机)

示例源码如下，请查看 pre > code 标签中的内容

例如下面可以筛选出 version 字段开头是 "数字+s" 的记录，并且忽略大小写：

示例源码如下，请查看 pre > code 标签中的内容

假设数据表class内有以下数据，可以使用下面两种方式查询数组内包含指定值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

使用腾讯云时更新方法必须搭配doc、where方法使用，db.collection('test').update()会报如下错误：param should have required property 'query'

collection.doc().update(Object data)

未使用set、remove更新操作符的情况下，此方法不会删除字段，仅将更新数据和已有数据合并。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，已数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc().set()

此方法会覆写已有字段，需注意与update表现不同，比如以下示例执行set之后follow字段会被删除

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口仅会操作一条数据，有多条数据匹配的情况下会只更新匹配的第一条并返回

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：只可确定数组内只会被匹配到一个的时候使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于设定字段等于指定值。这种方法相比传入纯 JS 对象的好处是能够指定字段等于一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于指示字段自增某个值，这是个原子操作，使用这个操作指令而不是先读数据、再加、再写回的好处是：

在文章阅读数+1、收藏+1等很多场景会用到它。如给收藏的商品数量加一：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意并没有直接提供减法操作符，如果要实现减法，仍通过inc实现。比如上述字段减1，

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意没有直接提供除法操作符，如果要实现除法，仍通过mul实现。比如上述字段除以10，

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于表示删除某个字段。如某人删除了自己一条商品评价中的评分：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组尾部追加元素，支持传入单个元素或数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组头部添加元素，支持传入单个元素或数组。使用同push

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果需要对类型为地理位置的字段进行搜索，一定要建立地理位置索引。

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

按从近到远的顺序，找出字段值在给定点的附近的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

找出字段值在指定 Polygon / MultiPolygon 内的记录，无排序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

事务通常用来在某个数据库操作失败之后进行回滚。

事务因为要锁行，是有时间限制的。从事务开始到事务提交/回滚，时间不可超过10秒。另外注意：如果多条事务同时处理同一行数据，可能存在写冲突，进而导致失败。

阿里云不支持此用法，请换成startTransaction以使用事务

发起事务。与startTransaction作用类似，接收参数类型不同

runTransaction 的形式如下：

示例源码如下，请查看 pre > code 标签中的内容

runTransaction返回一个Promise，此Promise.resolve的结果为callback事务执行函数的返回值，reject 的结果为事务执行过程中抛出的异常或者是 transaction.rollback 传入的值

事务执行函数由开发者传入，函数接收一个参数 transaction，其上提供 collection 方法和 rollback 方法。collection 方法用于取数据库集合记录引用进行操作，rollback 方法用于在不想继续执行事务时终止并回滚事务。

事务执行函数必须为 async 异步函数或返回 Promise 的函数，当事务执行函数返回时，uniCloud 会认为用户逻辑已完成，自动提交（commit）事务，因此务必确保用户事务逻辑完成后才在 async 异步函数中返回或 resolve Promise。

事务执行函数可能会被执行多次，在内部发现事务冲突时会自动重复执行，如果超过设定的执行次数上限，会报错退出。

在事务执行函数中发生的错误，都会认为事务执行失败而抛错。

事务执行函数返回的值会作为 runTransaction 返回的 Promise resolve 的值，在函数中抛出的异常会作为 runTransaction 返回的 Promise reject 的值，如果事务执行函数中调用了 transaction.rollback，则传入 rollback 函数的值会作为 runTransaction 返回的 Promise reject 的值。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

发起事务。与runTransaction作用类似，接收参数类型不同

startTransaction 形式如下

示例源码如下，请查看 pre > code 标签中的内容

返回一个Promise，此Promise resolve的结果为事务操作对象（注意这里与runTransaction的区别），其上可通过 collection API 操作数据库，通过 commit（使用startTransaction需要主动commit） 或 rollback 来结束或终止事务。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 2 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 3 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 4 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb.html

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=alias

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## 扩展库Redis | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/redis.html

**Contents:**
- # 扩展库Redis
- # 开通Redis服务
- # 为云函数启用redis扩展库
- # 云函数中调用Redis
- # Redis本地运行
- # 数据类型
  - # 字符串 String
  - # 列表 List
  - # 哈希表 Hash
  - # 集合 Set

2021年11月18日，腾讯云和阿里云均支持

使用腾讯云node12及以上版本和redis，务必仔细阅读此文档：keepRunningAfterReturn

Redis是一个基于key/value的内存数据库。在项目中通常作为MongoDB等磁盘数据库的补充来搭配使用。 相对于磁盘数据库，Redis的核心优势是快。因为操作内存要比磁盘快的多，并且Redis只支持key/value数据，读写都很快。但Redis没有磁盘数据库丰富的查询等功能。

Redis一般需要与MongoDB搭配使用，MongoDB做主存储，Redis缓存部分数据应对高性能需求场景。

在uniCloud中，Redis还有一个特点，是它按容量和使用时长计费，访问它不耗费云数据库的读写次数。

Redis的sdk体积不小，没有内置在云函数中。在需要Redis的云函数里，开发者需手动配置Redis扩展库。（Redis没有免费试用，需购买才可以使用）。如何启用扩展库请参考：使用扩展库

示例源码如下，请查看 pre > code 标签中的内容

因为Redis在云函数的内网中，所以只能在云端云函数中访问，而不能在本地云函数中访问。每次调试Redis相关功能需要不断的上传云函数，严重影响开发效率。自HBuilderX 3.4.10起，本地云函数可以通过云端内置代理访问云端Redis。如果在本地调用云端Redis的话会在云函数日志内看到HBuilderX运行调试Redis的代理请求字样。

Redis中数据被存储为key-value形式，key均为字符串，value有以下几种类型

字符串类型，这是最简单Redis类型。需要注意的是Redis并没有number类型，如果存入number类型的数据最终也会转为string类型。

示例源码如下，请查看 pre > code 标签中的内容

列表类型，类似JavaScript中的数组，但是有区别。严格来说List是基于链表实现的，和js中数组相比一个显著的差异就是头部插入的效率。如果你测试过往一个长度百万的数组最前面插入一位的话，你会发现这个操作会耗时很久。但是List并没有这个问题，对于List来说在前后插入数据耗时是一样的。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

集合是String的无序排列，集合内的元素不可重复

示例源码如下，请查看 pre > code 标签中的内容

有序集合和集合一样也是string类型元素的集合，且不允许重复的成员。不同的是每个元素将有一个double类型的分数（分数不一定是连续的），用于对元素进行排序

示例源码如下，请查看 pre > code 标签中的内容

一个集合（指的是 Object 的聚合，可以包含重复元素）中不重复元素的个数。例如集合 {1,3,5,1,3}，它有5个元素，但它的基数为3。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

是一串连续的二进制数组（0和1），可以通过偏移量（offset）定位元素。BitMap通过最小的单位bit来进行0|1的设置，表示某个元素的值或者状态，时间复杂度为O(1)。

示例源码如下，请查看 pre > code 标签中的内容

此处仅列举常见命令，完整命令支持请查看redis官方文档

示例源码如下，请查看 pre > code 标签中的内容

此接口返回获取到的数据（字符串类型），返回null表示无此键

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串类型'OK'表示操作成功，返回null表示未更新

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回截取得到的子字符串表示操作成功，返回空字符串表示未匹配

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串类型'OK'表示操作成功，返回null表示未更新

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串类型'OK'表示操作成功，返回null表示未更新

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口按传入顺序返回获取到的数据组成的数组，存在的键返回字符串类型，不存在的键返回null

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串长度，不存在的key会返回0

示例源码如下，请查看 pre > code 标签中的内容

批量设置键值，当且仅当所有给定 key 都不存在。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置key对应字符串value，并且设置key在给定的milliseconds（毫秒）时间之后超时过期

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加一操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加操作后的值（number类型）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行减1操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加一操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

如果 key 已经存在并且是一个字符串， APPEND 命令将指定的 value 追加到该 key 原来值（value）的末尾。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回数字1表示删除成功，数字0表示键不存在删除失败

示例源码如下，请查看 pre > code 标签中的内容

用于序列化给定 key ，并返回被序列化的值。

示例源码如下，请查看 pre > code 标签中的内容

key不存在返回null，存在返回序列化后的值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果key存在返回数字1，如果key不存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

EXPIREAT 的作用和 EXPIRE 类似，都用于为 key 设置过期时间。 不同在于 EXPIREAT 命令接受的时间参数是 UNIX 时间戳(unix timestamp)。

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

这个命令和 expire 命令的作用类似，但是它以毫秒为单位设置 key 的生存时间，而不像 expire 命令那样，以秒为单位。

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

设置 key 过期时间的时间戳(unix timestamp) 以毫秒计

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

支付宝云不支持keys命令，请使用scan 代替

查找所有符合给定模式 pattern 的 key 。

示例源码如下，请查看 pre > code 标签中的内容

符合给定模式的 key 列表 (类型为Array)。

示例源码如下，请查看 pre > code 标签中的内容

移除 key 的过期时间，key 将持久保持。

示例源码如下，请查看 pre > code 标签中的内容

移除过期时间成功返回1， key不存在或者key没有设置过期时间返回0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果没有设置过期时间（永久有效）返回数字-1，如果不存在或者已过期返回数字-2，否则返回剩余秒数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果没有设置过期时间（永久有效）返回数字-1，如果不存在或者已过期返回数字-2，否则返回剩余秒数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

数据库不为空时返回一个 key， 数据库为空时返回 null

示例源码如下，请查看 pre > code 标签中的内容

当 key 和 newkey 相同，或者 key 不存在时，返回一个错误。

当 newkey 已经存在时， rename 命令将覆盖旧值。

示例源码如下，请查看 pre > code 标签中的内容

修改成功返回 OK，key 不存在时返回一个错误

示例源码如下，请查看 pre > code 标签中的内容

仅当 newkey 不存在时，将 key 改名为 newkey 。

示例源码如下，请查看 pre > code 标签中的内容

修改成功返回 1, newKey 存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用法同rpush，仅在list存在时才在List结尾追加数据

移除列表的最后一个元素，并将该元素添加到另一个列表并返回。

示例源码如下，请查看 pre > code 标签中的内容

source存在返回被移除的元素，source 不存在返回 null

示例源码如下，请查看 pre > code 标签中的内容

从List类型数据结尾删除一条数据，并返回删除的值

注意：redis内List长度为0时会被自动删除

示例源码如下，请查看 pre > code 标签中的内容

接口返回此次操作删除的值，如果key不存在则返回null

示例源码如下，请查看 pre > code 标签中的内容

用法同lpush，仅在list存在时才在List开头追加数据

从List类型数据开头删除一条数据，并返回删除的值

注意：redis内List长度为0时会被自动删除

示例源码如下，请查看 pre > code 标签中的内容

接口返回此次操作删除的值，如果key不存在则返回null

在List内指定元素位置前或后插入元素，未匹配到指定元素时不插入

示例源码如下，请查看 pre > code 标签中的内容

接口返回插入后的list长度，未匹配到要查找的值时返回-1，key不存在时此接口返回0

示例源码如下，请查看 pre > code 标签中的内容

接口返回指定下标在list内对应的值，如果key不存在则返回null

示例源码如下，请查看 pre > code 标签中的内容

接口返回list的长度，如果key不存在则返回0

返回列表 key 中指定区间内的元素，区间以偏移量 start 和 stop 指定。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据参数 count 的值，移除列表中与参数 value 相等的元素。

示例源码如下，请查看 pre > code 标签中的内容

key 存在时返回被移除的元素的数量，key 不存在时返回 0

示例源码如下，请查看 pre > code 标签中的内容

将列表 key 下标为 index 的元素的值设置为 value 。

示例源码如下，请查看 pre > code 标签中的内容

key 存在时成功返回 OK，key 不存在时返回错误

示例源码如下，请查看 pre > code 标签中的内容

修剪(trim)一个已存在的 list，这样 list 就会只包含指定范围的指定元素

示例源码如下，请查看 pre > code 标签中的内容

如果 start 下标比列表的最大下标 end ( llen list 减去 1 )还要大，或者 start > stop ， ltrim 返回一个空列表(因为 ltrim 已经将整个列表清空)。

如果 stop 下标比 end 下标还要大，Redis将 stop 的值设置为 end 。

示例源码如下，请查看 pre > code 标签中的内容

移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。

如果列表为空，返回一个 nil 。 否则，返回一个含有两个元素的列表，第一个元素是被弹出元素所属的 key ，第二个元素是被弹出元素的值。

示例源码如下，请查看 pre > code 标签中的内容

列表为空返回 null，否则返回含有两个元素的数组[键名, 值]

示例源码如下，请查看 pre > code 标签中的内容

移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。

假如在指定时间内没有任何元素被弹出，则返回一个 nil 和等待时长。 反之，返回一个含有两个元素的列表，第一个元素是被弹出元素所属的 key ，第二个元素是被弹出元素的值。

示例源码如下，请查看 pre > code 标签中的内容

在指定时间内没有任何元素被弹出，则返回 null 和等待时长，否则返回含有两个元素的数组[键名, 值]

示例源码如下，请查看 pre > code 标签中的内容

从 source 中取出最后一个元素，并插入到 destination 头部；如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。

示例源码如下，请查看 pre > code 标签中的内容

在指定时间内没有任何元素被弹出，则返回 null 和等待时长，否则返回含有两个元素的数组[键名, 值]

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果 key 不存在，将会创建一个新的哈希表并进行 hset 操作。

如果 field 已经存在于哈希表中，旧值将被覆盖。

新创建的 field 返回 1， 覆盖旧值返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

field 不存在时返回 null， 存在返回 field 值

示例源码如下，请查看 pre > code 标签中的内容

同时在一个 key 中设置多个 field-value

示例源码如下，请查看 pre > code 标签中的内容

key 不是hash类型时返回错误，执行成功返回 OK

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回 key 的所有 field 与 value

示例源码如下，请查看 pre > code 标签中的内容

返回 field与value，类型Array

示例源码如下，请查看 pre > code 标签中的内容

删除 key 中指定的一个或多个 field

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

字段存在返回 1， key 不存在或者字段不存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

为 key 中指定的 field 的值加上整数增量 increment

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为 key 中指定的 field 的值加上浮点数增量 increment

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回所有 field；类型Array，key 不存在时返回 空数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回 field 数量，key 不存在时返回 0

示例源码如下，请查看 pre > code 标签中的内容

当 key 中 field 不存在时设置 value，当 field 已存在，该操作无效。

示例源码如下，请查看 pre > code 标签中的内容

设置成功返回 1， field 已存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

返回 key 中所有 field 的 value

示例源码如下，请查看 pre > code 标签中的内容

返回所有 field 的 value，类型Array，key 不存在时返回空数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

将一个或多个 member 加入到集合 key 中，已经在集合中的 member 元素将忽略。

示例源码如下，请查看 pre > code 标签中的内容

返回被添加到集合中的新元素的数量，不包括被忽略的元素。

示例源码如下，请查看 pre > code 标签中的内容

返回集合存储的key的基数(集合中元素的数量)

示例源码如下，请查看 pre > code 标签中的内容

返回集合存储的key的基数，key 不存在时返回 0

示例源码如下，请查看 pre > code 标签中的内容

返回一个集合的全部成员，该集合是所有给定集合之间的差集。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这个命令的作用和 sdiff 类似，但它将结果保存到 destination 集合，而不是简单地返回结果集。

如果 destination 集合已经存在，则将其覆盖。

destination 可以是 key 本身。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回一个集合的全部成员，该集合是所有给定集合的交集。

当给定集合当中有一个空集时，结果也为空集(根据集合运算定律)。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这个命令类似于 sinter 命令，但它将结果保存到 destination 集合，而不是简单地返回结果集。

如果 destination 集合已经存在，则将其覆盖。

destination 可以是 key 本身。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

判断 member 元素是否是集合 key 成员。

示例源码如下，请查看 pre > code 标签中的内容

member 元素是集合的成员返回 1，不是集合成员返回或者 key 不存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回集合中的所有成员，类型Array 示例

示例源码如下，请查看 pre > code 标签中的内容

将 member 元素从 source 集合移动到 destination 集合。

示例源码如下，请查看 pre > code 标签中的内容

member 移除成功返回 1，member 不是 source 集合成员，并且没有任何操作对 destination 集合执行，那么返回 0 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回被移除的随机元素。key 不存在或 key 是空集时，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

在集合 key 中随机获取一个或者 count 个元素

示例源码如下，请查看 pre > code 标签中的内容

只提供 key 参数时，返回一个元素；如果集合为空，返回 nil 。

如果提供了 count 参数，那么返回一个数组；如果集合为空，返回空数组。

示例源码如下，请查看 pre > code 标签中的内容

移除集合 key 中的一个或多个 member 元素，不存在的 member 元素会被忽略。

示例源码如下，请查看 pre > code 标签中的内容

返回被成功移除的元素的数量，不包括被忽略的元素。

示例源码如下，请查看 pre > code 标签中的内容

返回一个集合的全部成员，该集合是所有给定集合的并集。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这个命令类似于 sunion 命令，但它将结果保存到 destination 集合，而不是简单地返回结果集。

如果 destination 已经存在，则将其覆盖。

destination 可以是 key 本身。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

将一个或多个 member 元素及其 score 值加入到有序集 key 当中。

如果某个 member 已经是有序集的成员，那么更新这个 member 的 score 值，并通过重新插入这个 member 元素，来保证该 member 在正确的位置上。

示例源码如下，请查看 pre > code 标签中的内容

返回被成功添加的新成员的数量，不包括那些被更新的、已经存在的成员。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当 key 存在且是有序集类型时，返回有序集的基数。 当 key 不存在时，返回 0 。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中， score 值在 min 和 max 之间(默认包括 score 值等于 min 或 max )的成员的数量。

示例源码如下，请查看 pre > code 标签中的内容

返回 score 值在 min 和 max 之间的成员的数量。

示例源码如下，请查看 pre > code 标签中的内容

为有序集 key 的成员 member 的 score 值加上增量 increment 。

示例源码如下，请查看 pre > code 标签中的内容

返回 member 成员的新 score 值，以字符串形式表示。

示例源码如下，请查看 pre > code 标签中的内容

计算给定的一个或多个有序集的交集，其中给定 key 的数量必须以 numkeys 参数指定，并将该交集(结果集)储存到 destination 。

示例源码如下，请查看 pre > code 标签中的内容

返回保存到 destination 的结果集的基数。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中，指定区间内的成员。

示例源码如下，请查看 pre > code 标签中的内容

返回指定区间内，带有 score 值(可选)的有序集成员的列表，类型Array

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中成员 member 的排名。其中有序集成员按 score 值递增(从小到大)顺序排列。

示例源码如下，请查看 pre > code 标签中的内容

如果 member 是有序集 key 的成员，返回 member 的排名。

如果 member 不是有序集 key 的成员，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

移除有序集 key 中的一个或多个成员，不存在的成员将被忽略。

示例源码如下，请查看 pre > code 标签中的内容

返回被成功移除的成员的数量，不包括被忽略的成员。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中，指定区间内的成员，其中成员的位置按 score 值递减(从大到小)来排列。

示例源码如下，请查看 pre > code 标签中的内容

返回指定区间内，带有 score 值(可选)的有序集成员的列表，类型Array。

示例源码如下，请查看 pre > code 标签中的内容

通过字典区间返回有序集合的成员（具有分页功能）（集合按照分值从小到大排序）

示例源码如下，请查看 pre > code 标签中的内容

返回指定区间内，带有 score 值(可选)的有序集成员的列表。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集key中成员member的排名，其中有序集成员按score值从高到低排列。

排名从0开始，也就是说，score值最大的成员排名为0。

示例源码如下，请查看 pre > code 标签中的内容

如果 member 是有序集 key 的成员，返回 member 的排名。 如果 member 不是有序集 key 的成员，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

获取有序集 key 中，成员 member 的 score 值。

示例源码如下，请查看 pre > code 标签中的内容

返回member 成员的 score 值，以字符串形式表示，key 不存在或者 member 不是 key 的成员，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

计算给定的一个或多个有序集的并集，其中给定 key 的数量必须以 numkeys 参数指定，并将该并集(结果集)储存到 destination 。

示例源码如下，请查看 pre > code 标签中的内容

返回保存到 destination 的结果集的基数。

示例源码如下，请查看 pre > code 标签中的内容

迭代有序集合中的元素（包括元素成员和元素分值）

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

添加指定元素到 HyperLogLog 中。

示例源码如下，请查看 pre > code 标签中的内容

如果至少有个元素被添加返回 1， 否则返回 0。

示例源码如下，请查看 pre > code 标签中的内容

返回给定 HyperLogLog 的基数估算值。

示例源码如下，请查看 pre > code 标签中的内容

返回给定 HyperLogLog 的基数值，如果多个 HyperLogLog 则返回基数估值之和。

示例源码如下，请查看 pre > code 标签中的内容

将多个 HyperLogLog 合并为一个 HyperLogLog

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

针对key存储的字符串值，设置或清除指定偏移量offset上的位(bit)

位的设置或清除取决于value值，即1或0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回key对应的字符串，offset 位置的位（bit）

示例源码如下，请查看 pre > code 标签中的内容

返回偏移量offset位置的bit值， key 不存在时或当offset大于值的长度时返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回bit值为1的数量，如果key不存在，返回0

示例源码如下，请查看 pre > code 标签中的内容

对一个或多个保存二进制位的字符串key进行位元操作，并将结果保存到destkey上。

示例源码如下，请查看 pre > code 标签中的内容

返回保存到 destkey 的字符串的长度（和参数给定的key中最长的字符串长度相等）

示例源码如下，请查看 pre > code 标签中的内容

返回字符串中，从左到右，第一个比特值为bit（0或1）的偏移量

示例源码如下，请查看 pre > code 标签中的内容

返回第一个比特值为指定bit（0或1）的偏移量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

某些情况下需要使用复杂的原子操作以避免高并发下数据修改混乱的问题，这种需求一般可通过执行lua脚本实现。如以下示例，判断redis中不存在key-test时，将其值设置为1；存在且小于10时进行加一操作；大于等于10时不进行操作直接返回。

{0, 1}是lua内的table类型，返回到云函数时会转为数组对应的值为[0, 1]

示例源码如下，请查看 pre > code 标签中的内容

断开redis连接，会等待redis请求执行完成后才断开连接

示例源码如下，请查看 pre > code 标签中的内容

和传统开发不同，云函数实例之间是不互通的，也就是说每个使用redis的函数实例都会和redis建立一个连接，在云函数实例复用时此连接也会复用。

可以利用redis的原子操作保证在高并发下不会超卖，以下为一个简单示例

在抢购活动开始前可以将商品库存同步到redis内，实际业务中可以通过提前访问一次抢购页面加载所有商品来实现。下面通过一个简单的演示代码来实现

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

Example 2 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

Example 3 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

Example 4 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

---

## 基础概念@base | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/hellodb

**Contents:**
- # 基础概念
- # 创建第一个表
- # 数据表的3个组成部分
  - # 数据内容
  - # 数据库索引
  - # 数据表格式定义
- # API操作数据库的方式
- # 获取数据库对象的API
  - # 获取其他服务空间数据库实例
- # 创建集合/表的API

uniCloud提供了一个 JSON 格式的文档型数据库。顾名思义，数据库中的每条记录都是一个 JSON 格式的文档。

它是 nosql 非关系型数据库，如果您之前熟悉 sql 关系型数据库，那么两者概念对应关系如下表：

例如，数据库中有一个表，名为user，存放用户信息。表user的数据内容如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据中，每行数据表示一个用户的信息，被称之为“记录(record/doc)”。name和tel称之为“字段(field)”。而“13900000000”则是第一条记录的字段tel的值。

每行记录，都是一个完整的json文档，获取到记录后可以使用常规json方式操作。但表并非json文档，表是多个json文档的汇总，获取表需要使用专门的API。

与关系型数据库的二维表格式不同，json文档数据库支持不同记录拥有不同的字段、支持多层嵌套数据。

仍然以user表举例，要在数据库中存储每个人的每次登录时间和登录ip，则变成如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据表示张三登录了2次，login_date里的值是时间戳(timestamp)格式，在数据库内timestamp就是一个数字类型的数据。而李四没有登录过。

可以看出json文档数据库相对于关系型数据库的灵活，李四可以没有login_log字段，也可以有这个字段但登录次数记录与张三不同。

此处仅为举例，实际业务中，登录日志单独存放在另一个表更合适

对于初学者，如果不了解数据库设计，可以参考opendb，已经预置了大量常见的数据库设计。

对于不熟悉传统数据库，但掌握json的js工程师而言，uniCloud的云数据库更亲切，没有传统数据库高昂的学习成本。

在uniCloud web控制台新建表时，在下面的模板中也可以选择各种opendb表模板，直接创建。

uniCloud同时支持阿里云、腾讯云和支付宝云，它们的数据库大体相同，有细微差异。阿里云和支付宝云的数据库是mongoDB4.0，腾讯云则使用自研的文档型数据库（兼容mongoDB 4.0版本）。uniCloud基本抹平了不同云厂商的差异，有差异的部分会在文档中单独标注。

打开 uniCloud web控制台 https://unicloud.dcloud.net.cn/

创建或进入一个已存在的服务空间，选择 云数据库->云数据库，创建一个新表

比如我们创建一个简历表，名为 resume。点击上方右侧的 创建 按钮即可。

新建表时，支持选择现成的 opendb 表模板，选择一个或多个模板表，可以点击右下方按钮创建。

在uniCloud的web控制台可以看到一个数据表的3部分内容。

data，就是存放的数据记录(record)。里面是一条一条的json文档。

record可以增删改查、排序统计。后续有API介绍。

可以先在 web控制台 为之前的 resume 表创建一条记录。

示例源码如下，请查看 pre > code 标签中的内容

创建一条新记录，是不管在web控制台创建，还是通过API创建，每条记录都会自带一个_id字段用以作为该记录的唯一标志。

_id字段是每个数据表默认自带且不可删除的字段。同时，它也是数据表的索引。

阿里云使用的是标准的mongoDB，_id是自增的，后创建的记录的_id总是大于先生成的_id。传统数据库的自然数自增字段在多物理机的大型数据库下很难保持同步，大型数据库均使用_id这种长度较长、不会重复且仍然保持自增规律的方式。

腾讯云使用的是兼容mongoDB的自研数据库，_id并非自增

插入/导入数据时也可以自行指定_id而不使用自动生成的_id，这样可以很方便的将其他数据库的数据迁移到uniCloud云数据库。

所谓索引，是指在数据表的众多字段中挑选一个或多个字段，让数据库引擎优先处理这些字段。

设置为索引的字段，在通过该字段查询(where)或排序(orderBy)时可以获得更快的查询速度。

但设置过多索引也不合适，会造成数据新增和删除变慢。

唯一型索引要求整个数据表多个记录的该字段的值不能重复。比如_id就是唯一型索引。

假使有2个人都叫“张三”，那么他们在user数据表里的区分就是依靠不同的_id来区分。

如果我们要根据name字段来查询，为了提升查询速度，此时可以把name字段设为非唯一索引。

索引内容较多，还有“组合索引”、“稀疏索引”、“地理位置索引”、“TTL索引”等概念。有单独的文档详细讲述索引，另见：数据库索引

DB Schema是表结构描述。描述数据表有哪些字段、值域类型是什么、是否必填、数据操作权限等很多内容。

因为 MongoDB 的灵活性，理论上DB Schema不是必须的，使用传统 MongoDB API 操作数据库不需要DB Schema。

但如果使用 JQL，那DB Schema就是必须的。

DB Schema涉及内容较多，另见文档：https://uniapp.dcloud.io/uniCloud/schema

uniCloud 的云数据库有多种操作方式。

uniCloud 默认推荐使用 JQL 语法操作数据库，它是一种更简单易用、对js开发者更友好的、开发效率更高的数据库操作语法。详见

不管在云函数中还是在uni-app客户端中，均支持JQL。

同时 uniCloud 保留了在云函数中使用传统 MongoDB 的 nodejs API 操作云数据库。

优先使用客户端操作数据库（称为clientDB）

传统开发中，其实大多数服务器接口开发，就是检验下前端数据和身份的合法性，然后写个SQL操作下数据库，返回JSON给前端。其实很无聊。

clientDB最大的好处就是不用写服务端代码，客户端直接操作数据库。因为uniCloud提供了DB Schema和uni-id，可以直接控制数据库的内容和权限校验。

clientDB同时支持action云函数作为补充，当发起一个客户端操作云数据库的请求时，可以同时触发一个action云函数，在云端对数据库操作进行前置或后置处理。

对于clientDB不适应的场景，推荐在云函数或云对象中使用JQL。

目前云函数中JQL不适用的场景：使用 set 操作符动态修改字段名称（不是字段值）。这个场景常规业务不涉及，未来JQL可能会完善并支持这个场景。

除非开发者原本就对 nodejs 操作 MongoDB 非常熟悉，且需要使用 set 操作符动态修改字段名等，否则不推荐使用传统MongoDB写法。

MongoDB API操作数据库，不能在客户端操作、不支持 DB Schema，不支持HBuilderX的jql查询器，不能在客户端的代码提示中提示数据库的表名、字段。

不管使用哪种方法，都有很多公共的概念或功能。本文档将讲述这些公共的内容。

同时左侧导航有三种方法的专项链接，描述它们各自特有的功能。

想要通过代码操作数据库，第一步要获取服务空间里的数据库对象。

示例源码如下，请查看 pre > code 标签中的内容

js中敲下代码块cdb，即可快速输入上述代码。

其中，云函数内使用JQL扩展库时，还需要做一个工作，就是指定操作用户身份。详见

示例源码如下，请查看 pre > code 标签中的内容

如果当前应用仅使用一个服务空间，在HBuilderX中做好服务空间关联即可。获取当前空间的数据库实例时无需传递配置，直接调用database方法默认就是操作关联服务空间的数据库。

如果应用有连接其他服务空间数据库的需求，可以在获取database实例时传递对应服务空间的配置

HBuilderX 3.2.11及更高版本支持客户端初始化其他服务空间database实例，此前仅腾讯云云函数环境支持。阿里云云函数环境不支持此用法。

调用uniCloud.database()时可以传入对应的服务空间信息（参数同uniCloud.init，参考:uniCloud.init）来获取指定服务空间的database实例。

示例源码如下，请查看 pre > code 标签中的内容

调用add方法，给某数据表新增数据记录时，如果该数据表不存在，会自动创建该数据表。如下代码给table1数据表新增了一条数据，如果table1不存在，会自动创建。

示例源码如下，请查看 pre > code 标签中的内容

腾讯云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

支付宝云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

创建好数据表后，可以通过API获取数据表对象。

示例源码如下，请查看 pre > code 标签中的内容

集合/数据表 Collection 的方法

通过 db.collection(name) 可以获取指定数据表的引用，在数据表上可以进行以下操作

collection对象的方法可以增和查数据，删和改不能直接操作，需要collection对象通过doc或get得到指定的记录后再调用remove或update方法进行删改。

这里我们使用clientDB，实现一个简单的在前端获取刚才输入 resume 表的记录的功能。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema的数据类型有专门文档，详见

Date 类型用于表示时间，精确到毫秒，可以用 JavaScript 内置 Date 对象创建。需要特别注意的是，连接本地云函数时，用此方法创建的时间是客户端当前时间，不是服务端当前时间，只有连接云端云函数才是服务端当前时间。

另外，我们还单独提供了一个 API 来创建服务端当前时间，使用 serverDate 对象来创建一个服务端当前时间的标记，该对象暂时只支持腾讯云空间，当使用了 serverDate 对象的请求抵达服务端处理时，该字段会被转换成服务端当前的时间，更棒的是，我们在构造 serverDate 对象时还可通过传入一个有 offset 字段的对象来标记一个与当前服务端时间偏移 offset 毫秒的时间，这样我们就可以达到比如如下效果：指定一个字段为服务端时间往后一个小时。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

不同于传统开发，连接数据库有单次操作时长限制，目前单次操作时间限制如下。超出此时间会报超时错误。一般情况下在设置了合适的索引时不会遇到超时错误，如何优化查询速度请参考：数据库性能优化

如果是大数据批处理，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

uniCloud数据库提供了多种数据导入导出和备份方案。

除上述三种方法外，开发者还可以编程处理数据的导入导出。如进行大量数据操作，建议在HBuilderX的本地运行云函数环境中操作，这样可以避免触发云端的云函数超时限制。

旧规范中的db_init.json废弃，但是仍保留db_init.json上的初始化菜单，对db_init.json文件执行初始化操作时，其中的初始化数据、索引、schema会被拆分成多个文件。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

HBuilderX 3.97及以上版本，uniCloud内database目录支持直接右键进行数据库初始化。database目录下支持以下几种文件类型

在执行数据库初始化操作时，上述文件都会被上传到云端。

web控制台导出时默认不包括_id字段，在导入时，数据库插入新记录时会自动补_id字段。如果需要指定_id，需要手工补足数据。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

注意下面的示例仅为演示，实际配置时不要带注释

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.97及之后版本需要拆分为上面一种方式对应的文件，可以在项目管理器选中db_init.json右键初始化数据库时自动拆分。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

db_init.json定义了一个json格式，里面包含了表名、表数据、表索引等表的相关数据。

在HBuilderX中，项目的cloudfunctions目录（HBuilderX 2.5.11 - 2.9.11版本） 或 uniCloud/database 目录（HBuilderX 3.0+版本），可以放置db_init.json文件，对该文件点右键，可以按db_init.json的描述，在云服务空间创建相应的表、初始化表中的数据、索引和schema。

这个功能尤其适合插件作者，可以快速初始化插件所需的数据库环境。

db_init.json包含三部分：数据内容(data)、数据表索引(index)、数据表结构(schema)，形式如下

注意：HBuilderX 3.0.0以上版本schema不再放在db_init.json内，而是独立放在uniCloud/database/目录下。

HBuilderX 3.0.0版本之前的db_init.json示例

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中对上述db_init.json点右键，可初始化数据库到云服务空间，创建collection_test表，并按上述json配置设置该表的index索引和schema，以及插入data下的数据。

opendb的表，在db_init.json中初始化时，不建议自定义index和schema。系统会自动从opendb规范中读取最新的index和schema。

在HBuilderX中，对项目下的cloudfunctions目录下的db_init.json点右键，即可选择初始化云数据库。将db_init.json里的内容导入云端。

在uniCloud web控制台的数据库界面，左侧导航点击 生成db_init.json，会将选择的表的内容、索引、表结构导出为db_init.json文件。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

uniCloud会在每天凌晨自动备份一次数据库，最多保留7天。这让开发者不再担心数据丢失。

此功能主要用于导出整个表的数据，导出文件为jsonl格式

jsonl格式示例，形如下面这样每行一个json格式的数据库记录的文件

示例源码如下，请查看 pre > code 标签中的内容

uniCloud提供的db_init.json主要是为了对数据库进行初始化，并不适合导入大量数据。与db_init.json不同，数据导入功能可以导入大量数据，目前支持导入 CSV、JSON 格式（关于json格式看下面注意事项）的文件数据。

如果是自己拼接的json格式数据请注意：如果存在表A关联表B的字段的场景需要保证关联字段在A、B内是一致的（特别需要注意的是各种与_id关联的字段）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 2 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 3 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 4 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=error

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage/authentication

**Contents:**
- # 名词解释
- # 云函数接口
  - # uniCloud.customAuth
  - # auth.createTicket
  - # auth.getUserInfo
- # 客户端接口
  - # uniCloud.customAuth
  - # auth.signInWithTicket
  - # auth.getLoginState
  - # auth.getUserInfo

本功能的主要作用是前端删除云存储的文件，并不推荐这种用法。

腾讯云提供了一套自己的用户权限，这套系统和uni-id不同，不支持编程，不能用于业务系统的真实账户。仅用于云存储的前端管理。

在腾讯云的概念里，默认情况下所有用户都是通过匿名登录访问云存储的，自定义登录提供了在云端区分用户身份的能力。开启腾讯云自定义登录后，每个用户会在腾讯云的后台有一个身份标记，从前端上传文件到云存储时，腾讯云会自动给文件加入这个标记。如果同时在云存储权限配置里配置了仅创建者可写，则前端可以直接删除这个云存储，删除时腾讯云会自动校验文件上传者的userId和当前用户的userId一致时才允许删除。

在微信小程序云的开发中，自定义登录还可以用于前端操作数据库。

但因为腾讯云提供的这套方案不够灵活和完善，uniCloud单独做了uni-id用于完善的账户体系，单独做了clientDB，用于完善快捷的前端操作数据库。

所以目前腾讯云的自定义登录功能，在uniCloud中的价值只剩下前端删除云存储。DCloud不建议开发者这么用，前端直传云存储不需要腾讯云自定义登录，而删除云存储，还是应该在云端进行。

重要：自HBuilderX 2.9.12起，此接口由uniCloud.auth调整为uniCloud.customAuth，短时间内仍会兼容uniCloud.auth

示例源码如下，请查看 pre > code 标签中的内容

云端根据用户id创建票据用于客户端登录到对应的云厂商

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

任何方式登录成功后，可以调用 getUserInfo 获得用户的身份信息。

示例源码如下，请查看 pre > code 标签中的内容

重要：自HBuilderX 2.9.12起，此接口由uniCloud.auth调整为uniCloud.customAuth，短时间内仍会兼容uniCloud.auth

示例源码如下，请查看 pre > code 标签中的内容

使用云函数接口createTicket返回的票据进行登录，详细描述参考登录流程

示例源码如下，请查看 pre > code 标签中的内容

开发者可以通过 getLoginState() 来获取当前的登录状态，调用 getLoginState() 后，SDK 会识别本地是否有登录状态，如果有，则会尝试刷新登录状态，若刷新登录状态成功，则会返回新的登录状态，否则返回 undefined。

示例源码如下，请查看 pre > code 标签中的内容

任何方式登录成功后，可以调用 getUserInfo 获得用户的身份信息。

示例源码如下，请查看 pre > code 标签中的内容

uniCloud允许开发者使用特定的登录凭据Ticket对用户进行身份认证。开发者可以使用服务端 SDK来创建Ticket，并且将Ticket传入到应用内，然后调用signInWithTicket()获得登录态。

登录uniCloud控制台uniCloud控制台 ，在自定义登录中，点击“生成并下载”

注意：重复生成私钥会使之前生成的私钥失效，并导致用户登录状态失效

获取私钥文件（credentials.json）之后，放在需要生成Ticket的云函数内index.js同级即可

服务端 SDK内置了生成Ticket的接口，开发者需要提供一个自定义的customUserId作为用户的唯一身份标识。Ticket有效期为5分钟，过期则失效。

每个用户的customUserId不能相同，每次用户重新登录时，原有的登录态将会失效。

Ticket一般在验证了用户名密码成功之后下发

示例源码如下，请查看 pre > code 标签中的内容

创建Ticket之后，开发者应将Ticket发送至客户端，然后使用客户端SDK提供的 signInWithTicket() 登录uniCloud：

示例源码如下，请查看 pre > code 标签中的内容

uniCloud允许开发者使用匿名登录的方式进行静默授权，可以避免强制登录。在匿名状态下可正常的调用uniCloud的资源，开发者同时可以配合安全规则针对匿名用户制定对应的访问限制。

匿名用户如果要重新使用开发者提供的身份登录，可以调用auth.signInWithTicket来进行。参考

目前uniCloud支持将匿名用户转化为正式用户，此转正用户将会继承匿名用户在云端创建的资源，流程如下：

示例源码如下，请查看 pre > code 标签中的内容

当登录态失效时，会触发这个事件，开发者可以在这个事件回调内，尝试重新登录 uniCloud。

示例源码如下，请查看 pre > code 标签中的内容

JS SDK 会在登录态生效期间，自动刷新和维护短期访问令牌（access token），每次成功刷新时会触发此事件。

对于两种登录态并存（uniCloud、自身业务登录态）的应用，这个事件可以用于同步登录态之间的状态。

示例源码如下，请查看 pre > code 标签中的内容

shouldRefreshAccessToken 接收一个 callback 函数，并且会在刷新短期访问令牌前调用此 callback 函数，根据返回值决定是否要刷新短期访问令牌。

对于两种登录态并存（uniCloud、自身业务登录态）的应用，可以在 callback 内判断自身业务登录态是否失效，从而决定是否续期 uniCloud 的短期访问令牌。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

Example 2 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

Example 3 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

Example 4 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

---

## HBuilderX的JQL数据库管理器 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql-runner.html

**Contents:**
- # HBuilderX的JQL数据库管理器

为方便开发者调试查询语句，HBuilderX 3.1.5起内置了JQL查询调试器。用法如下

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/old.html

**Contents:**
- # 需求背景
- # 组成部分
- # uni-id 对开发者的价值
- # 现状和未来
- # 快速上手
- # config.json的说明
- # Token
- # preferedAppPlatform
  - # 旧项目的处理
  - # 新项目的处理

本文档为uni-id 3.x 版本文档。适用于老用户。 HBuilderX 3.5以上版本用户，请另行查阅 uni-id 4+ 版本文档。如何从旧版本升级到uni-id-pages请查看：升级到uni-id-pages

99%的应用，都要开发用户注册、登录、发送短信验证码、密码加密保存、修改密码、token管理等功能，从前端到后端都需要。

为什么不能有一个开源的通用项目，避免大家的重复开发呢？

uni-id为uniCloud开发者提供了简单、统一、可扩展的用户管理能力封装。

clientDB、DB Schema、uni-starter 、uniCloud admin，这些产品都基于uni-id的账户体系。可以说uni-id是uniCloud不可或缺的基础能力。

主表为 uni-id-users 表，保存用户的基本信息。扩展字段有很多，如实名认证数据、工作履历数据，开发者可以自由扩展。

还有 uni-id- 开头的十几个附表，比如权限表uni-id-permissions、角色表uni-id-roles、积分表uni-id-scores、设备表uni-id-device...

所有uni-id的数据表，在uniCloud web控制台新建表的界面上，都可以选择这些数据表模板，直接建好。

提供一个名为uni-id的公共模块，该模块封装了一系列API，包括注册、登录、修改密码、设置头像等。

示例工程中还提供了一个user-center的云函数，演示在云函数中如何调用uni-id公共模块。推荐使用云端一体登录插件

前端示例通过callfunction调用云函数user-center，在注册和登录时保存token。在这个云端一体登录插件 里，有完整的登录、注册、修改密码等前后端代码示例。详见

uniCloud框架底层，会自动在callfunction时传递uni-id的token（uni-app 2.7.13+版本）。在云函数的event中可直接拿到uni-id的token。也就是说开发者无需自己管理token了。

一个应用，往往需要集成多个功能模块。比如一个电商应用，需要一个基本电商模板，还需要客服聊天模板，甚至还需要用户交流社区。

在插件市场，每类模板插件都能找到，但他们如果不是基于同一套用户体系设计，就很难整合。

所有uniCloud的应用，几乎都基于uni-id来做。

有了统一的账户规范，并且围绕这套账户规范，有各种各样插件，那么开发者可以随意整合这些插件，让数据互通。

规范，还可以让上下游充分协同。插件市场会出现各种数据迁移插件，比如把从discuz里把用户迁移到uni-id中的插件，相信围绕这套规范的产业链会非常活跃。

事实上，clientDB、DB Schema、uni-starter 、uniCloud admin等重要uniCloud产品，以及插件市场上各种优秀的轮子，都是基于uni-id的。

关于还缺少的部分，哪些DCloud在完善，哪些希望开发者给共同完善开源项目，计划与边界公布如下：

DCloud暂无计划开发百度、头条、QQ等小程序的登录，以及微博、QQ等App端的登录。欢迎其他开发者在开源项目上提交pr，共同完善uni-id。

发送邮件验证邮箱真实性，DCloud暂无计划开发，有需求的开发者欢迎提供pr。

目前插件市场里已经有不少相关插件，未来DCloud会整合到uni-id中。

其他方面，各种常见开源项目如discuz、wordPress、ecshop的用户导入插件，不属于uni-id主工程，欢迎开发者单独提交插件到插件市场。

uni-id的git仓库：https://gitee.com/dcloud/uni-id.git

非uni_modules版本（非uni_modules版本已不再更新，不推荐使用）

或者直接导入uni-id在插件市场的示例工程

uni-id的云端配置文件在uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json中。

在云函数URL化的场景无法获取客户端平台信息，可以在调用uni-id相关接口之前（推荐在云函数入口）通过修改context.PLATFORM手动传入客户端平台信息

示例源码如下，请查看 pre > code 标签中的内容

！！！重要！！！ passwordSecret与tokenSecret十分重要，切记妥善保存（不要直接使用下面示例中的passwordSecret与tokenSecret）。修改passwordSecret会导致老用户使用密码无法登录，修改tokenSecret会导致所有已经下发的token失效。如果重新导入uni-id切勿直接覆盖config.json相关配置

示例源码如下，请查看 pre > code 标签中的内容

tokenExpiresThreshold用于指定token还有多长时间过期时自动刷新token。

例：指定tokenExpiresThreshold:600,tokenExpiresIn:7200，token过期时间为2小时，在token有效期不足10分钟时自动刷新token

在token还有5分钟过期时调用checkToken接口会返回新的token和新的token的过期时间（新token有效时间也是2小时），需要前端主动保存此新token。

用户注册/登录成功之后均会返回token及其过期时间，token是一个json web token 字符串。开发者应在用户登录/注册成功后持久化保存token及其过期时间。同样的在用户登出之后应删除保存的token及其过期时间。

用户token为明文存储，可以在token内查看用户相关信息。uniCloud也提供了一个接口用于直接获取token内的用户信息，参考：uniCloud.getCurrentUserInfo

uniCloud.getCurrentUserInfo接口大致逻辑如下，需要注意的是某些小程序平台不支持atob，getCurrentUserInfo接口内已包含atob的polyfill

示例源码如下，请查看 pre > code 标签中的内容

uni-app vue2版本app端对应的platform为app-plus（HBuilderX 3.4.9起 vue2版本app端对应的platform值也调整为app），uni-app vue3版本app端对应的platform为app。此改动引发了一些问题，比如在uni-id内使微信登录会无法匹配对应的平台导致登录报错。

由于uni-id将客户端平台存储在了数据库内（例如：app端微信登录的openid被存储为wx_openid['app-plus']），此问题无法平滑升级，因此对于新老项目建议分别处理。

如果配置文件中使用的客户端平台和客户端不一致会出现Client platform is app, but app-plus was found in config.这种提示，按照下面文档配置preferedAppPlatform后即可正常使用。

旧项目建议将所有platform为app的场景统一为app-plus，即建议使用如下配置

示例源码如下，请查看 pre > code 标签中的内容

新项目建议将platform统一为app，即建议使用如下配置

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.4.9起，uni-app web端对应的platform由h5调整为web。此改动引发了一些问题，比如在uni-id内将无法获取web平台配置，以及有些基于uni-id扩充功能的项目可能存在不兼容的情况

如果配置文件中使用的客户端平台和客户端不一致会出现Client platform is web, but h5 was found in config.这种提示，按照下面文档配置preferedWebPlatform后即可正常使用。

旧项目建议将所有platform为web的场景统一为h5，即建议使用如下配置

示例源码如下，请查看 pre > code 标签中的内容

新项目建议将platform统一为web，即建议使用如下配置

示例源码如下，请查看 pre > code 标签中的内容

uni-id基于经典的RBAC模型实现了角色权限系统。

RBAC：Role-Based Access Control，基于角色的访问控制。

其基本思想：对系统操作的各种权限不是直接授予具体的用户，而是在用户集合与权限集合之间建立一个角色集合。每一种角色对应一组相应的权限。一旦用户被分配了适当的角色后，该用户就拥有此角色的所有权限。

这样做的好处是，增强系统管理的扩展性，对于批量用户的权限变更，仅需变更该批用户角色对应权限即可，而无需对该批每个用户变更权限。

这个模型有三个关键名词：用户、角色、权限：

用户信息存储在uni-id-users表中，然后通过role字段保存该用户所拥有的所有角色ID，角色ID即角色表（uni-id-roles表）中的role_id字段，注意不是_id字段。

示例源码如下，请查看 pre > code 标签中的内容

Tips：将用户角色设计为用户表的字段，而没有新建用户角色关联表的原因：避免mongodb在跨表查询时的性能开销

角色信息存储在uni-id-roles表中

示例源码如下，请查看 pre > code 标签中的内容

如下是角色在clientDB中的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

Tips1：uni-id中admin为超级管理员角色，uni-clientDB也基于同样的策略；如果用户角色包含admin，则该用户就拥有所有数据表的全部权限。

Tips2：出厂时可内置常用角色，也可上线后由运营人员动态创建角色。

权限信息在uni-id-permissions表中，表结构定义如下：

其中，permission_id为权限标志，全局唯一，可用于clientDB中的权限配置，建议按照语义化命名，例如：USER_DEL、BRANCH_ADD。权限总数量不得超过500

示例源码如下，请查看 pre > code 标签中的内容

如下是权限在clientDB中的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

Tips1：建议出厂时内置所有权限，方便clientDB中的权限配置。

uni-id针对角色权限模块封装了丰富的API，比如：获取用户角色、获取某角色下的所有权限等，详情参考：角色权限API。

自uni-id 3.0.0起，支持在token内缓存用户的角色权限，默认开启此功能，各登录接口的needPermission参数不再生效。如需关闭请在config内配置"removePermissionAndRoleFromToken": true。详情参考：缓存角色权限。

如果不在token内缓存角色权限，可以使用以下方式，在checkToken时返回数据库内对应用户的角色权限信息。

uni-id登录注册接口可接收needPermission参数，若needPermission配置为true时，后续会在checkToken接口返回用户权限列表（permission）。如下是通过token判断权限的简单示例：

示例源码如下，请查看 pre > code 标签中的内容

注意：**在uniCloud admin中，封装了可视化的用户、权限、角色的管理，新增删除修改均支持。**无需自己维护。详见

如果需要管理多端的用户，建议使用type在uni-id-users表内进行区分，不要分多个表

uni-id作为一个云函数的公共模块，暴露了各种API，供云函数调用。

用法：uniID.createInstance(Object CreateInstanceOptions);

CreateInstanceOptions内可以传入云函数context，自uni-id 3.3.13起，也可以传入clientInfo参数，作用和context类似。方便在云对象内获取clientInfo后直接传入，什么是云对象？。

示例源码如下，请查看 pre > code 标签中的内容

默认情况下uni-id某些接口会自动从全局context内获取客户端的PLATFORM（平台，如：app、web、mp-weixin）信息。

在单实例多并发的场景下可能无法正确获取（全局对象会被后面的请求覆盖，可能会导致前面一次请求使用了后面一次请求的PLATFORM信息）。因此推荐在开启云函数单实例多并发后，自行为uni-id传入context。

此外云函数url化时无法获取客户端信息，也需要使用这种方式将客户端信息传入uni-id。

用户注册就是将客户端用户输入的用户名和密码，经服务端：

如上操作uni-id的注册api内部会自动完成 用法uniID.register(Object RegisterOptions)

RegisterOptions不仅支持如上列举字段，可以根据需要自定义更多字段。比如：直接传入mobile即可设置手机号码，注意：切勿直接传入客户端传来的参数，否则这是一个极大的安全问题

username可以是字符串、可以是email、可以是手机号，本插件不约束，开发者可以自己定。如果使用登录接口时希望可以同时使用username、email、手机号登录，那么切记username不可以和手机号、email拥有相同格式，否则可能出现某一串字符串是一个用户的username同时又是另一个用户的email或者手机号的情况。

比如要求username为手机号，则自行在前端界面上做好提示，在后台对格式进行校验。

password入库时会自动进行一次sha1加密，不明文存储密码。这是一种单向不可逆加密方式，强度高于md5，密钥是开发者在config.json里自行配置的passwordSecret。

即用户注册时输入的密码，通过密钥passwordSecret使用sha1算法加密，然后再入库。

由于是不可逆加密，理论上数据库泄露或passwordSecret泄露都不会造成用户的真实密码被泄露。

但任何加密算法，在撞库等暴力手段面前被攻破只是时间和算力问题。使用自己特定的而不是默认的passwordSecret，并保护好passwordSecret可以数倍提升破解的算力代价。

uni-id公共模块没有限制密码的强度，如长度限制、是否包含大小写或数据等限制，这类限制需要开发者自行在云函数中处理。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

登录就是通过查询数据库验证，客户端传递的“用户名”和“密码”是否匹配并返回token、uid等响应参数（详见下文“响应参数”表）的过程。 如果你允许用户同时使用多种方式登录，需要注意：必须限制用户注册用户名不为邮箱格式且不为手机号格式，uni-id内部并未做出此类限制。否则用户可以使用他人的手机号码作为用户名注册账号，这就成了一个漏洞。具体做法可以参考云端一体应用快速开发模版"uniStarter"

用法：uniID.login(Object LoginOptions)

示例源码如下，请查看 pre > code 标签中的内容

一个校验客户端发起请求（uniCloud.callFunction）自带的uniIdToken，获得用户的uid、token、token的过期时间、角色、权限、用户信息(uni-id-users全部字段)的API。

这是非常高频且重要的API通常用于换取操作当前云函数的用户Id。

如果你并没有服务端开发经验，可能会想：为什么需要通过token去换取用户Id，而不是让客户端直接传递用户Id更方便？ 这里就涉及到安全问题，有一句话叫做：“前端传递的参数都是不可信任的”。比如：你去银行取款，柜台会要求出示你的身份证来证明你是谁，而不是你直接告诉银行柜台你是谁就管用。否则这是一个极大的安全漏洞。 综上所述：所有服务端操作涉及账户信息相关内容，都需要使用token来获得，而不是使用前端传递的参数。

用法：await uniID.checkToken(String token, Object checkTokenOptions)

请务必阅读一下此文档：关于缓存角色权限的说明

uni-id使用jwt生成token，jwt所生成的token包含三部分，其中存储的信息为明文信息，uni-id只根据tokenSecret来校验客户端token是否合法。

uni-id 3.0.0之前的版本，checkToken必然会查询数据库进行token合法性校验。

uni-id 3.0.0起，默认情况下不再查库校验token，角色权限将被缓存在token中，此举能减少或消除checkToken的查库次数（有效节省费用、减少响应时间）。 如需关闭此行为需在config内配置removePermissionAndRoleFromToken:true。

更多关于removePermissionAndRoleFromToken的说明见：缓存角色权限

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.refreshToken(Object RefreshTokenOptions);

示例源码如下，请查看 pre > code 标签中的内容

登出就是一个验证客户端uniCloud.callFunction自带的uniIdToken通过token校验并获取uid，将对应uid的用户的token清除的过程（uniID登出api内部会自动完成，你传入uniIdToken即可）。

用法：uniID.logout(String token);

示例源码如下，请查看 pre > code 标签中的内容

注意createToken接口不会将生成的token存库，只是生成token而已

用法：uniID.createToken(Object CreateTokenOptions)

用法：uniID.updatePwd(Object UpdatePwdOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.resetPwd(Object ResetPwdOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.resetPwdBySms(Object ResetPwdBySmsOptions)

用法：uniID.encryptPwd(String password)

2.0.0版本起encryptPwd接口调整为返回对象。结构如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.setAvatar(Object SetAvatarOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.updateUser(Object UpdateUserOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.getUserInfo(Object GetUserInfoOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.getUserInfoByToken(String token);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.addUser(Object AddUserOptions);

BanAccountOptions参数说明

用法：uniID.banAccount(Object BanAccountOptions);

BanAccountOptions参数说明

用法：uniID.unbanAccount(Object UnbanAccountOptions);

UnbanAccountOptions参数说明

用法：uniID.closeAccount(Object CloseAccountOptions);

CloseAccountOptions参数说明

用法：uniID.openAccount(Object OpenAccountOptions);

OpenAccountOptions参数说明

此接口已废弃，如需自行传入配置请使用uniID.createInstance接口创建uniID实例来使用

用法：uniID.init(Object InitOptions);

此接口仅适用于不希望使用config.json初始化而是希望通过js的方式传入配置的情况，多数情况下不推荐使用。如果你要使用clientDB，且必须要用这种方式初始化uni-id，必须在uni-id的config.json内也写上同样的配置。

InitOptions格式与config.json 完全相同

示例源码如下，请查看 pre > code 标签中的内容

在用户登录/注册成功后应在storage内保存用户的token及其过期时间，示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

在用户登出成功之后应删除持久化存储的token及其过期时间，示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.sendSmsCode(Object SendSmsCodeOptions)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果使用uni-id的sendSmsCode发送短信的话会自动设置验证码（在数据表：opendb-verify-codes添加一条记录)，否则你需要使用此接口自行在库中设置验证码。

用法：uniID.setVerifyCode(Object SetVerifyCodeOptions)

示例源码如下，请查看 pre > code 标签中的内容

一个查库校验：由uni-id的sendSmsCode发送短信自动设置或调用uniID.setVerifyCode手动设置的验证码的API

uni-id内置方法loginBySms、bindMobile、unbindMobile均已内置校验验证码方法，如果使用以上方法不需要再调用此接口，如需扩展类型请确保type和发送验证码/设置验证码时对应

用法：uniID.verifyCode(Object VerifyCodeOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.loginBySms(Object LoginBySmsOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.loginByUniverify(Object loginByUniverifyOptions)

需在开发者控制台 开通一键登录并在config.json内配置univerify相关信息

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.bindMobile(Object BindMobileOptions)

type为sms时mobile、code必传，type为univerify时access_token、openid必传

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.unbindMobile(Object UnbindMobileOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.loginByEmail(Object LoginByEmailOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.bindEmail(Object BindEmailOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.unbindEmail(Object UnbindEmailOptions)

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.loginByWeixin(Object LoginByWexinOptions);

LoginByWexinOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.code2SessionWeixin(Object Code2SessionWeixinOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.bindWeixin(Object BindWeixinOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.unbindWeixin(String uid);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.wxBizDataCrypt(Object WxBizDataCryptOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.getWeixinUserInfo(Object GetWeixinUserInfoOptions);

用法：uniID.loginByQQ(Object LoginByQQOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.bindQQ(Object BindQQOptions);

用法：uniID.unbindQQ(String uid);

用法：uniID.loginByAlipay(Object LoginByAlipayOptions);

LoginByAlipayOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.code2SessionAlipay(Object Code2SessionAlipayOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.bindAlipay(Object BindAlipayOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.unbindAlipay(String uid);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.loginByApple(Object LoginByAppleOptions);

LoginByAppleOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.verifyAppleIdentityToken(Object Code2SessionAppleOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.getRoleByUid(Object GetRoleByUidOptions)

用法：uniID.getPermissionByRole(Object GetPermissionByRoleOptions)

用法：uniID.getPermissionByUid(Object GetPermissionByUidOptions)

用法：uniID.bindRole(Object BindRoleOptions)

用法：uniID.bindPermission(Object BindPermissionOptions)

用法：uniID.unbindRole(Object UnbindRoleOptions)

用法：uniID.unbindPermission(Object UnbindPermissionOptions)

用法：uniID.addRole(Object AddRoleOptions)

用法：uniID.getRoleList(Object GetRoleListOptions)

用法：uniID.getRoleInfo(String roleID)

用法：uniID.updateRole(Object UpdateRoleOptions)

用法：uniID.deleteRole(Object DeleteRoleOptions)

用法：uniID.addPermission(Object AddPermissionOptions)

用法：uniID.getPermissionList(Object GetPermissionListOptions)

用法：uniID.getPermissionInfo(String permissionID)

用法：uniID.updatePermission(Object UpdatePermissionOptions)

用法：uniID.deletePermission(Object DeletePermissionOptions)

针对未生成邀请码的用户使用此方法生成邀请码

用法：uniID.setUserInviteCode(Object SetUserInviteCodeOptions);

此接口用于在注册之后再填写邀请码的场景，多数情况下不会用到此接口而是在注册时填写邀请码

用法：uniID.acceptInvite(Object AcceptInviteOptions);

用法：uniID.getInvitedUser(Object GetInvitedUserOptions);

示例源码如下，请查看 pre > code 标签中的内容

需要注意的是客户端APPID信息是由客户端上传上来的，并非完全可信，尽量在入口处进行校验。例：

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.setAuthorizedAppLogin(Object SetAuthorizedAppLoginOptions);

覆盖原有dcloud_appid字段，设置指定用户允许登录的客户端

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.authorizeAppLogin(Object AuthorizeAppLoginOptions);

在已有允许登录的客户端列表中插入新的客户端的DCloud Appid

示例源码如下，请查看 pre > code 标签中的内容

用法：uniID.forbidAppLogin(Object ForbidAppLoginOptions);

从已有允许登录的客户端列表中移除一个客户端的DCloud Appid，禁止后用户不可在特定客户端登录

示例源码如下，请查看 pre > code 标签中的内容

此类目下接口仅可用于开发调试，不要在生产环境使用

由于uni-id提供了多种传入配置的方式config.json、uniID.createInstance、uniID.init（已不推荐使用），开发者在使用插件作者或者其他人开发的功能时容易搞错到底在哪进行配置。可以使用此接口查看实际使用的配置文件内容，方便开发调试

用法：uniID.dev.getConfig()

此接口会返回uni-id实例使用的配置内容。

uni-id的所有数据表，都在opendb 规范中。

在unicloud web控制台 新建数据表时，可以从uni-id的模板分类里找到下面的表，并一键创建这些表。

realNameAuth 扩展字段定义 该字段存储实名认证信息。

注意：调用addUser添加的用户无此字段

示例源码如下，请查看 pre > code 标签中的内容

目前opendb内提供的uni-id-users表包含完整的索引，数据库在索引量多且频繁更新的情况下可能会出现写入缓慢的情况，因此推荐开发者在使用uni-id-users表时可以适当删除部分没有用到的索引。

例：项目内只使用了微信登录，不使用其他登录方式，可以只保留wx_unionid、wx_openid.mp-weixin、wx_openid.app-plus这些账号相关的索引，删除其他账号的索引

表名：opendb-verify-codes

uni-id 2.0.0版本以前，使用的表名为uni-verify，2.0.0+起改为新表名

该表的前缀不是uni-id，意味着该表的设计用途是通用的，不管是uni-id的手机号验证码，或者支付等关键业务需要验证码，都使用此表。

每条验证信息，都记录在本表中。uni-id不会自动删除本表的历史数据，数据保留有效期需要开发者自行管理，可以在云函数中设置一个定时运行来清理过期数据。

表名：uni-id-permissions

还有更多uni-id的配套数据表，可以在uniCloud web控制台 新建表时选择相应模板。此处不再详述，仅罗列清单：

自3.1.1版本起uni-id使用errCode作为错误码，errMsg作为错误信息，为兼容旧版本，code、message字段仍保留。

另外还有一些字符串类型的扩展错误码在各自接口的文档中展示，请不要直接使用code>0这种方式来判断是否有错误，建议使用if(code){}来判断是否有错误

自1.1.2版本起uni-id支持裂变功能，目前仅适用手机号+验证码方式注册可以填写邀请码（inviteCode）接受邀请。裂变相关API请参考裂变API

在config.json内配置了autoSetInviteCode: true则在用户注册时会自动给设置不重复的6位邀请码，如果不希望使用自动设置的邀请码可以自行传入myInviteCode参数来设置邀请码，需要注意的是要保证邀请码唯一。

在config.json内配置了forceInviteCode: true则只有使用邀请码才可以注册（仅手机号+验证码注册方式支持）。

针对之前使用了旧版本（不支持裂变）的uni-id，现在想增加裂变功能，可以调用setUserInviteCode接口给已注册用户设置邀请码，在设置之前可以使用my_invite_code不存在作为条件查询所有需要设置的用户。

如果希望用户注册完成之后再填写邀请人的邀请码，可以调用acceptInvite接口来使用户接受邀请。

getInvitedUser接口可以用于获取接受邀请的用户列表，其中level参数可以用来设置要获取哪一级的邀请用户，不填写level参数则默认获取第一级。

如果想详细的体验一下裂变流程，可以在插件市场导入前后一体登录模板 ，此项目内已有邀请用户注册示例，流程如下

注意：通常情况下设定好passwordSecret之后不需要再进行修改，使用此功能时请务必小心谨慎

在config.json内修改passwordSecret会导致历史用户无法通过密码登录。但是某些情况下有些应用有修改passwordSecret的需求，例如刚开始使用uni-id时没有自定义passwordSecret，后续需要修改，此时可以使用uni-id 2.0.1版本新增的修改passwordSecret功能。（注意：2.0.1版本验证码表名调整为了opendb-verify-codes）

下面以将passwordSecret从passwordSecret-demo修改为qwertyasdfgh为例介绍如何使用

示例源码如下，请查看 pre > code 标签中的内容

如果在上面基础上再修改passwordSecret为1q2w3e4r5t,config.json调整如下

!!!注意只有在数据库内完全没有使用某个版本（password_secret_version字段表示了用户密钥版本）密钥的用户才可以将此密钥从config.json内去除。没有password_secret_version的用户使用的是最旧版本的passwordSecret，如果存在这样的用户对应的passwordSecret也不可去除。

示例源码如下，请查看 pre > code 标签中的内容

uni-id-users表内存储的password字段为使用hmac-sha1生成的hash值，此值不可逆向推出用户真实密码。所以直接修改passwordSecret会导致老用户无法使用密码登录。

上述修改通过密钥版本号区分新旧密钥，用户登录时如果密钥版本小于当前最新版本，会为用户更新数据库内存储的password字段，并记录当前使用的密钥版本。

用户对应的数据库记录内没有密钥版本的话会使用最低版本密钥进行密码校验，校验通过后为用户更新为最新版密钥对应的password并记录版本号。

由于是不可逆加密，理论上passwordSecret泄露不会造成用户的真实密码被泄露，自定义passwordSecret只是进一步加强安全性。

自uni-id 3.0.0起，支持在token内缓存用户的角色权限，默认开启此功能，各登录接口的needPermission参数不再生效。如需关闭请在config内配置"removePermissionAndRoleFromToken": true。

为什么要缓存角色权限？要知道云数据库是按照读写次数来收取费用的，并且读写数据库会拖慢接口响应速度。未配置"removePermissionAndRoleFromToken": true的情况下，可以在调用checkToken接口时不查询数据库获取用户角色权限。

可以看出，旧版token（removePermissionAndRoleFromToken为true时生成的）在checkToken时如需返回权限需要进行两次数据库查询。新版token不需要查库即可返回权限信息。

示例源码如下，请查看 pre > code 标签中的内容

uni-id 3.0.7及以上版本，且需要使用uni-config-center

自uni-id 3.0.0起，支持在token内缓存用户的角色权限。但是某些情况下开发者可能还希望缓存一些别的东西，以便在客户端能方便的访问（注意：不可缓存机密信息到token内）。

在uni-config-center模块内的uni-id插件内创建custom-token.js内容如下：

示例源码如下，请查看 pre > code 标签中的内容

uni-id会自动加载custom-token.js进行处理，在所有生成token的操作（包括：登录、注册、token过期自动刷新、开发者自行调用createToken）执行时自动获取新token信息，并生成token。

新增于uni-id 3.3.10，此功能依赖于[uni-config-center]

在cloudfunctions/common/uni-config-center/uni-id/lang/目录下创建index.js，内容示例如下：

示例源码如下，请查看 pre > code 标签中的内容

uni-id会自动进行语言匹配，无需额外配置

一个完整的项目，通常需要客户端、管理端等，但是不同端的用户在同一服务空间下使用uni-id会比较难处理。比如不同端需要不同的配置文件、登录接口需要开发者自行隔离开。自uni-id 3.3.0起，支持对不同端用户进行隔离，此功能在此版本是直接开启的。

uni-id 3.3.0版本起用户注册时会自动在用户表的记录内标记为注册端用户，如果没有授权登录其他端的话是不可以在其他端登录的

如何授权登录其他端请参考：授权、禁止用户在特定客户端登录

需要注意的是客户端APPID信息是由端上传上来的，并非完全可信，尽量在入口处进行校验。例：

示例源码如下，请查看 pre > code 标签中的内容

DCloud Appid是一个很重要的配置，如无必要请勿随意更换。

不同端用户数据通过用户表的dcloud_appid字段隔离，同一个手机号、微信号也可以同时注册管理端和用户端，绑定账号同理。

uni-id的config.json支持配置为数组，每项都是一个完整的配置，对不同的配置使用dcloudAppid字段进行区分（此字段与项目内的manifest.json里面的DCloud AppId一致），uni-id会自动根据客户端的appid来判断该使用哪套配置。如果使用云函数url化请参考：云函数Url化时使用

需要注意的是客户端APPID信息是由端上传上来的，并非完全可信，尽量在入口处进行校验。例：

示例源码如下，请查看 pre > code 标签中的内容

数组每一项都是一个完整的配置文件，全部选项请参考：uni-id 配置

注意：如果允许同一账号在不同端使用相同的账号+密码登录需要将不同端的passwordSecret设置成一样的

示例源码如下，请查看 pre > code 标签中的内容

云函数url化时uni-id无法自行获取客户端相关信息，需要开发者自行创建uniID实例并传入相关信息，以下为一个简单示例

注意：实际业务中务必验证一下前端传来的数据的合法性，APPID、PLATFORM等均来自前端

示例源码如下，请查看 pre > code 标签中的内容

uni-id 3.3.29起支持，此功能无需额外开发，升级uni-id到此版本后会自动依赖uni-open-bridge-common，在用户使用微信、QQ等三方登录时会自动将用户在三方平台的凭证存储到opendb-open-data表，以便其他功能使用这些凭证。注意升级不要忘记上传uni-open-bridge-common模块。

由于保存三方凭证只在登录时进行，而存量用户可能需要等到token过期才会重新登录，因此无法确保所有三方平台登录的用户都有凭证信息。

自2.0.0版本起uni-id调整了验证码表名（这个调整导致了与旧版不兼容），如果要使用2.0.0以上版本需要在数据库中创建opendb-verify-code表（建议直接选择opendb内uni-id下的opendb-verify-code表，会自动创建索引以及表结构）

3.0.0版本起uni-id默认将缓存用户角色权限到token内，关于缓存角色权限的说明请参考：缓存角色权限。从2.x.x版本升级到3.x.x版本需要根据自己需求分别处理。

uniCloud admin可以平滑升级到uni-id 3.0.0。如果要缓存角色权限到token内（uni-id 3.0.0的默认行为），那还有几点可以优化。详细调整如下

auth中间件内可以调整为checkToken时不再获取用户信息，这样auth中间件就无需进行数据库查询，可以加速接口响应

受第一步影响app/init内无法获取用户信息，可以额外调用uniID的getUserInfo获取

可以参考此次提交进行调整：uniCloud admin

从插件市场导入支持uni_modules的uni-id，会自动安装依赖的uni-config-center到uni_modules内。如果此前并没有使用uni-config-center可以直接将uni-id的config.json移至uni-config-center/uni-id/config.json即可（可以参照插件市场的uni-id示例项目）

以上三个配置不会进行合并，优先级高的先生效

uni-id 3.1.0版本主要有以下两个调整

自此版本起会对所有接口中的用户名、邮箱、密码进行前后去空格。

此版本之前uni-id并未忽略用户名及邮箱的大小写。这样导致了一些问题，比如用户在手机上登录不小心就会使用首字母大写的用户名或邮箱，这样就会登录失败，影响用户体验。很多应用/网站的登录都是忽略大小写的，为此uni-id在3.1.0版本起调整为默认忽略用户名、邮箱的大小写。实现方式为将用户名、邮箱均存储为小写，用户输入用户名邮箱时也转化为小写进行匹配

uni-id3.3.0以下版本升级到3.3.0及以上版本时，需要参照本章节补齐用户数据

uni-id在3.3.0提供了根据客户端appid（项目manifest.json内配置的DCloud Appid）隔离不同用户的功能，旧版本的uni-id在注册用户时并未将当前客户端的appid存储在用户的记录内，更新到新版后这些没有dcloud_appid字段的用户和之前一样可以登录所有端。开发者使用云函数本地运行可以自行对用户数据进行修补，为用户创建dcloud_appid字段

更新后用户将只允许登录与自己数据库记录内匹配的端

注意：如果要更新的记录很多可能会超时失败，此时无需重试等待数据库自行完成更新即可

如果仅有一端，将所有用户的数据更新为同一个dcloud_appid即可，例：

示例源码如下，请查看 pre > code 标签中的内容

如果之前就有区分不同端的用户，可以将自己区分用户的条件加上再进行更新，例：

示例源码如下，请查看 pre > code 标签中的内容

如果允许用户在多个端登录需要将多端的DCloud Appid都传进来，例：

示例源码如下，请查看 pre > code 标签中的内容

username、email、mobile三个字段

**Examples:**

Example 1 (javascript):
```javascript
exports.main = async (event, context) => {
	context.PLATFORM = 'app'
}
```

Example 2 (javascript):
```javascript
exports.main = async (event, context) => {
	context.PLATFORM = 'app'
}
```

Example 3 (javascript):
```javascript
exports.main = async (event, context) => {
	context.PLATFORM = 'app'
}
```

Example 4 (javascript):
```javascript
exports.main = async (event, context) => {
	context.PLATFORM = 'app'
}
```

---

## 云数据库聚合操作@aggregate | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database-aggregate

**Contents:**
- # 云数据库聚合操作
- # 聚合表达式
- # addFields
- # bucket
- # bucketAuto
- # count
- # geoNear
- # group
- # limit
- # lookup

有时候我们需要对数据进行分析操作，比如一些统计操作、联表查询等，这个时候简单的查询操作就搞不定这些需求，因此就需要使用聚合操作来完成。

示例源码如下，请查看 pre > code 标签中的内容

云函数中使用时切勿复用aggregate实例，容易引发Bug。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表达式可以是字段路径、常量、或数据库运算方法。表达式可以嵌套表达式。

表达式用字段路径表示法来指定记录中的字段。字段路径的表示由一个 $ 符号加上字段名或嵌套字段名。嵌套字段名用点将嵌套的各级字段连接起来。如 $profile 就表示 profile 的字段路径，$profile.name 就表示 profile.name 的字段路径（profile 字段中嵌套的 name 字段）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

常量可以是任意类型。默认情况下 $ 开头的字符串都会被当做字段路径处理，如果想要避免这种行为，使用 db.command.aggregate.literal 声明为常量。

聚合阶段。添加新字段到输出的记录。经过 addFields 聚合阶段，输出的所有记录中除了输入时带有的字段外，还将带有 addFields 指定的字段。

addFields 等同于同时指定了所有已有字段和新增字段的 project 阶段。

示例源码如下，请查看 pre > code 标签中的内容

addFields 可指定多个新字段，每个新字段的值由使用的表达式决定。

如果指定的新字段与原有字段重名，则新字段的值会覆盖原有字段的值。注意 addFields 不能用来给数组字段添加元素。

示例源码如下，请查看 pre > code 标签中的内容

应用两次 addFields，第一次增加两个字段分别为 homework 和 quiz 的和值，第二次增加一个字段再基于上两个和值求一次和值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以用点表示法在嵌套记录里增加字段。假设 vehicles 集合含有如下记录：

示例源码如下，请查看 pre > code 标签中的内容

可以用如下操作在 specs 字段下增加一个新的字段 fuel_type，值都设为固定字符串 unleaded：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以通过 $ 加字段名组成的字符串作为值的表达式来设置字段的值为另一个字段的值。

同样用上一个集合示例，可以用如下操作添加一个字段 vehicle_type，将其值设置为 type 字段的值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将输入记录根据给定的条件和边界划分成不同的组，每组即一个 bucket。

每组分别作为一个记录输出，包含一个以下界为值的 _id 字段和一个以组中记录数为值的 count 字段。count 在没有指定 output 的时候是默认输出的。

bucket 只会在组内有至少一个记录的时候输出。

示例源码如下，请查看 pre > code 标签中的内容

groupBy 是一个用以决定分组的表达式，会应用在各个输入记录上。可以用 $ 前缀加上要用以分组的字段路径来作为表达式。除非用 default 指定了默认值，否则每个记录都需要包含指定的字段，且字段值必须在 boundaries 指定的范围之内。

boundaries 是一个数组，每个元素分别是每组的下界。必须至少指定两个边界值。数组值必须是同类型递增的值。

default 可选，指定之后，没有进入任何分组的记录将都进入一个默认分组，这个分组记录的 _id 即由 default 决定。default 的值必须小于 boundaries 中的最小值或大于等于其中的最大值。default 的值可以与 boundaries 元素值类型不同。

output 可选，用以决定输出记录除了 _id 外还要包含哪些字段，各个字段的值必须用累加器表达式指定。当 output 指定时，默认的 count 是不会被默认输出的，必须手动指定：

示例源码如下，请查看 pre > code 标签中的内容

使用 bucket 需要满足以下至少一个条件，否则会抛出错误：

每一个输入记录应用 groupBy 表达式获取的值都必须是一个在 boundaries 内的值

指定一个 default 值，该值在 boundaries 以外，或与 boundaries 元素的值不同的类型。

示例源码如下，请查看 pre > code 标签中的内容

对上述记录进行分组，将 [0, 50) 分为一组，[50, 100) 分为一组，其他分为一组：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将输入记录根据给定的条件划分成不同的组，每组即一个 bucket。与 bucket 的其中一个不同之处在于无需指定 boundaries，bucketAuto 会自动尝试将记录尽可能平均的分散到每组中。

API 说明 每组分别作为一个记录输出，包含一个以包含组中最大值和最小值两个字段的对象为值的 _id 字段和一个以组中记录数为值的 count 字段。count 在没有指定 output 的时候是默认输出的。

示例源码如下，请查看 pre > code 标签中的内容

groupBy 是一个用以决定分组的表达式，会应用在各个输入记录上。可以用 $ 前缀加上要用以分组的字段路径来作为表达式。除非用 default 指定了默认值，否则每个记录都需要包含指定的字段，且字段值必须在 boundaries 指定的范围之内。

buckets 是一个用于指定划分组数的正整数。

granularity 是可选枚举值字符串，用于保证自动计算出的边界符合给定的规则。这个字段仅可在所有 groupBy 值都是数字并且没有 NaN 的情况下使用。枚举值包括：R5、R10、R20、R40、R80、1-2-5、E6、E12、E24、E48、E96、E192、POWERSOF2。

output 可选，用以决定输出记录除了 _id 外还要包含哪些字段，各个字段的值必须用累加器表达式指定。当 output 指定时，默认的 count 是不会被默认输出的，必须手动指定：

示例源码如下，请查看 pre > code 标签中的内容

在以下情况中，输出的分组可能会小于给定的组数：

granularity 用于保证边界值属于一个给定的数字序列。

Renard 序列是以 10 的 5 / 10 / 20 / 40 / 80 次方根来推导的、在 1.0 到 10.0 (如果是 R80 则是 10.3) 之间的数字序列。

设置 granularity 为 R5 / R10 / R20 / R40 / R80 就把边界值限定在序列内。如果 groupBy 的值不在 1.0 到 10.0 (如果是 R80 则是 10.3) 内，则序列数字会自动乘以 10。

E 序列是以 10 的 6 / 12 / 24 / 48 / 96 / 192 次方跟来推导的、带有一个特定误差的、在 1.0 到 10.0 之间的数字序列。

1-2-5 序列 表现与三值 Renard 序列一样。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。计算上一聚合阶段输入到本阶段的记录数，输出一个记录，其中指定字段的值为记录数。

示例源码如下，请查看 pre > code 标签中的内容

<string> 是输出记录数的字段的名字，不能是空字符串，不能以 $ 开头，不能包含 . 字符。

count 阶段等同于 group + project 的操作：

示例源码如下，请查看 pre > code 标签中的内容

上述操作会输出一个包含 count 字段的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将记录按照离给定点从近到远输出。

假设集合 attractions 有如下记录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将输入记录按给定表达式分组，输出时每个记录代表一个分组，每个记录的 _id 是区分不同组的 key。输出记录中也可以包括累计值，将输出字段设为累计值即会从该分组中计算累计值。

使用group可以很方便的实现类似SQL的distinct功能

示例源码如下，请查看 pre > code 标签中的内容

_id 参数是必填的，如果填常量则只有一组。其他字段是可选的，都是累计值，用 $.sum 等累计器(const $ = db.command.aggregate)，但也可以使用其他表达式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以给 _id 传入记录的方式按多个值分组。还是沿用上面的示例数据，按各个区域（region）获得相同最高分（score）的来分组，并求出各组虚拟币（coins）的总量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回价格大于 20 的记录的最小的两个记录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。联表查询。与同个数据库下的一个指定的集合做 left outer join(左外连接)。对该阶段的每一个输入记录，lookup 会在该记录中增加一个数组字段，该数组是被联表中满足匹配条件的记录列表。lookup 会将连接后的结果输出给下个阶段。

将输入记录的一个字段和被连接集合的一个字段进行相等匹配时，采用以下定义：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果需要指定除相等匹配之外的连接条件，或指定多个相等匹配条件，或需要拼接被连接集合的子查询结果，那可以使用如下定义：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下聚合操作可以通过一个相等匹配条件连接 orders 和 books 集合，匹配的字段是 orders 集合的 book 字段和 books 集合的 title 字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对数组字段应用相等匹配 假设 authors 集合有以下记录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下操作获取作者信息及他们分别发表的书籍，使用了 lookup 操作匹配 authors 集合的 name 字段和 books 集合的 authors 数组字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

组合 mergeObjects 应用相等匹配

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下操作匹配 orders 的 book 字段和 books 的 title 字段，并将 books 匹配结果直接 merge 到 orders 记录中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下操作连接 orders 和 books 集合，要求两个条件：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在每条输出记录上加上一个数组字段，该数组字段的值是对 books 集合的一个查询语句的结果：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如需orders关联books，book再关联authors查询，可以在pipeline内再使用lookup

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。根据条件过滤文档，并且把符合条件的文档传递给下一个流水线阶段。

支付宝云中，使用match管道过滤时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

查询条件与普通查询一致，可以用普通查询操作符，注意 match 阶段和其他聚合阶段不同，不可使用数据库运算方法，只能使用查询操作符。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这里的代码尝试找到所有 author 字段是 stark 的文章，那么匹配如下：

示例源码如下，请查看 pre > code 标签中的内容

match 过滤出文档后，还可以与其他流水线阶段配合使用。

比如下面这个例子，我们使用 group 进行搭配，计算 score 字段大于 80 的文档数量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。把指定的字段传递给下一个流水线，指定的字段可以是某个已经存在的字段，也可以是计算出来的新字段。

示例源码如下，请查看 pre > code 标签中的内容

_id 字段是默认包含在输出中的，除此之外其他任何字段，如果想要在输出中体现的话，必须在 project 中指定； 如果指定包含一个尚不存在的字段，那么 project 会忽略这个字段，不会加入到输出的文档中；

如果你在 project 中指定排除某个字段，那么其它字段都会体现在输出中； 如果指定排除的是非 _id 字段，那么在本次 project 中，不能再使用其它表达式；

你可以使用一些特殊的表达式加入新的字段，或重置某个已有字段。

有时有些字段处于多层嵌套的底层，我们可以使用点记法：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 articles 集合，其中含有以下文档：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 project，让输出只包含 _id、title 和 author 字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

_id 是默认包含在输出中的，如果不想要它，可以指定去除它：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们还可以指定在输出中去掉某个非 _id 字段，这样其它字段都会被输出：

示例源码如下，请查看 pre > code 标签中的内容

输出如下，相比输入，没有了 isbn 字段：

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 students 集合，其中包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码，我们使用 project，在输出中加入了一个新的字段 totalScore：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 points 集合，包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码，我们使用 project，把 x 和 y 字段，放入到一个新的数组字段 coordinate 中：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。指定一个已有字段作为输出的根节点，也可以指定一个计算出的新字段作为根节点。

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 schools 集合，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 replaceRoot，把 teachers 字段作为根节点输出：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 roles 集合，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 replaceRoot，把 first_name 和 last_name 拼在一起：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。随机从文档中选取指定数量的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果现在进行抽奖活动，需要选出一名幸运用户。那么 sample 的调用方式如下：

示例源码如下，请查看 pre > code 标签中的内容

返回了随机选中的一个用户对应的记录，结果如下：

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。指定一个正整数，跳过对应数量的文档，输出剩下的文档。

示例源码如下，请查看 pre > code 标签中的内容

这段代码会跳过查找到的前 5 个文档，并且把剩余的文档输出。

聚合阶段。根据指定的字段，对输入的文档进行排序。

示例源码如下，请查看 pre > code 标签中的内容

假设我们有集合 articles，其中包含数据如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面的代码在 students 集合中进行聚合搜索，并且将结果排序，首先根据 age 字段降序排列，然后再根据 score 字段进行降序排列。

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。根据传入的表达式，将传入的集合进行分组（group）。然后计算不同组的数量，并且将这些组按照它们的数量进行排序，返回排序后的结果。

示例源码如下，请查看 pre > code 标签中的内容

表达式的形式是：$ + 指定字段。请注意：不要漏写 $ 符号。

示例源码如下，请查看 pre > code 标签中的内容

下面的代码就可以统计文章的分类信息，并且计算每个分类的数量。即对 category 字段执行 sortByCount 聚合操作。

示例源码如下，请查看 pre > code 标签中的内容

返回的结果如下所示：Web 分类下有2篇文章，Life 分类下有1篇文章。

示例源码如下，请查看 pre > code 标签中的内容

假设集合 passages 的记录如下：tags 字段对应的值是数组类型。

示例源码如下，请查看 pre > code 标签中的内容

如何统计文章的标签信息，并且计算每个标签的数量？因为 tags 字段对应的数组，所以需要借助 unwind 操作解构 tags 字段，然后再调用 sortByCount。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。使用指定的数组字段中的每个元素，对文档进行拆分。拆分后，文档会从一个变为一个或多个，分别对应数组的每个元素。

使用指定的数组字段中的每个元素，对文档进行拆分。拆分后，文档会从一个变为一个或多个，分别对应数组的每个元素。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 products 集合，包含数据如下：

示例源码如下，请查看 pre > code 标签中的内容

我们根据 size 字段对这些文档进行拆分

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们根据 size 字段对文档进行拆分后，想要保留原数组索引在新的 index 字段中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果想要在输出中保留 size 为空数组、null，或者 size 字段不存在的文档，可以使用 preserveNullAndEmptyArrays 参数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
db.collection('scores').aggregate()
```

Example 2 (unknown):
```unknown
db.collection('scores').aggregate()
```

Example 3 (unknown):
```unknown
db.collection('scores').aggregate()
```

Example 4 (unknown):
```unknown
db.collection('scores').aggregate()
```

---

## uni-push2.0、uni-id、uni统计的组合说明 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/mate.html

**Contents:**
- # uni-push2.0、uni-id、uni统计的组合说明
  - # 包含的opendb表
    - # 设备信息
  - # 推送接口查库详解：

uni统计模块，在设备启动时立即调用getPushClientId 获取push_clientid，如果获取成功后（应用未在manifest中启用uni-push2.0则会获取失败）则调用uni-stat-receiver云对象的report方法（参数：push_clientid），服务器会向opendb-device表写入或更新（存在时）：设备信息和push_clientid。

uni-id-pages插件，调用uniCloud.onRefreshToken 监听token发生变化（即：用户登录和token续期时），调用uni-id-co云对象的setPushCid方法（参数：push_clientid）服务器操作uni-id-device表，记录device_id 与 user_id的映射关系；完整字段包含user_id、device_id、token_expired、push_clientid、appid。同时再向opendb-device表写入或更新（存在时）：设备信息和push_clientid。

综上：push_clientid被存储在uni-id-device和opendb-device两个表，前者用于存储device_id 与 user_id的映射关系，仅用户登录成功后才有对应数据；后者用于存储完整的设备信息，未登录的用户也有对应的数据。

注意： 当用户未登录时，我们可以基于device_id向用户推送消息，但有被窃听的风险（营销类消息不用太关心这个）。因为opendb-device表中存储的设备信息，底层的技术原理是获取客户端自动上报的信息，理论上存在被篡改可能。如：张三使用李四的device_id+张三的push_clientid。上报数据；服务器会认为李四的push_clientid更新了，从而将李四的device_id与push_clientid的映射关系，指向张三的push_clientid;张三从而窃听到，其他人发给李四的消息。 而基于user_id或者user_tag推送消息，是基于uni-id-device表，在新增/更新操作时：会校验当前用户的user_id，不会被其他用户篡改，即没有被他人窃听消息的风险。

来源uniCloud云对象中的this.getClientInfo 方法，完整字段列表参考：uni.getSystemInfo

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=returnvalue

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## 数据库可视化管理工具 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-mongodb/mongodb-compass.html

**Contents:**
- # 数据库可视化管理工具
- # 安装教程
- # 使用教程
  - # 新建库
  - # 新建表
  - # 查看表数据
  - # 创建索引
- # 特别注意

MongoDB官方提供了数据库可视化管理工具，该工具可以对数据库进行可视化管理，如库创建、表创建、索引创建、表数据查询等操作。

windows：mongodb-compass-1.46.2-win32-x64.exe

mac-arm64：mongodb-compass-1.46.2-darwin-arm64.dmg

mac-x64：mongodb-compass-1.46.2-darwin-x64.dmg

linux：mongodb-compass-1.46.2-linux-x64.tar.gz

打开 MongoDB Compass 进入工具首页，输入连接信息，如下图所示

连接数据库后，可以看到3个内置的库（admin、config、local），这3个库不要去动Ta

在弹窗中按如下图所示输入相应的信息，并点击创建

在弹窗中按如下图所示输入相应的信息，并点击创建

在弹窗中按如下图所示输入相应的信息，并点击创建

唯一稀疏索引：即允许字段不存在，但如果存在，则值必须唯一的索引。可按如下图所示创建

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-im

**Contents:**
- # 简介
- # 案例
- # 快速部署体验
- # 前提条件
- # 体验示例项目
- # 部署到自己的项目
  - # 常见问题：
- # 限制普通用户向其他用户发起会话
- # 开发文档
- # 目录结构

uni-im 已开放需求征集和投票 点此前往

uni-im 是一款集云端一体、全平台支持、免费且开源的即时通讯系统

插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-im

应用名称：DCloud。此 App 的内置聊天模块即是基于 uni-im 开发的。

web端网址（支持PC宽屏和移动端）：https://im.dcloud.net.cn/index.html#/

下载地址为：https://im.dcloud.net.cn/uni-portal.html

uni-im相关功能建议或问题，可以加入由uni-im（本插件）搭建的交流群点此加入

注意：实际情况可能与视频存在差异，部分服务空间可能不会自动创建数据表。此时，需打开项目根目录下的：uniCloud/database 目录，右键上传所有DB Schema（含扩展库）

创建运行uni-im服务端代码的云服务环境

注意：这里和你自己项目服务端代码是什么语言开发的，以及运行在什么服务器环境无关。uni-im运行在专有的运行环境uniCloud（一种serverless 服务器 ）下。 你的项目服务端和uni-im的服务端之间分别“独立部署”，二者通过发送 http 请求并借助事件进行通讯。 当然，如果你的项目服务端也是基于uniCloud开发的，就可以部署在同一个服务空间内；通过云函数互调通讯。

公有云 开通地址：https://unicloud.dcloud.net.cn/ 服务商推荐选择“支付宝云”，性能更好。

私有云 普通中小企业项目使用公有云即可，但如果的项目存在特殊需求，例如：政务类、对信息保密性要求较高、用户都在海外的项目，这种情况下则需要进行私有化部署，详情可点击此处 。

下载示例项目 打开uni-im插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-im 点击使用HBuilderX导入示例项目

绑定项目的服务空间 在项目根目录uniCloud右键选择“关联云服务空间或项目”（注意：选择关联的服务空间，需在项目的 uni-push2.0的web控制台 被关联）

创建相关数据表 打开项目根目录：uniCloud/database 目录，右键上传所有DB Schema（含扩展库）

运行项目 在菜单运行->运行到浏览器 选择要运行的浏览器 这里需要运行到两个不同的浏览器（避免同一浏览器打开多个uni-im页面，引起socket占线)，注册账号并登录2个账号，体验对话效果

向指定用户发起会话 通过访问路径：/uni_modules/uni-im/pages/chat/chat?user_id= + 指定用户的id即可。 如果你不知道用户的id，可通过在浏览器控制台执行uni.imObservableData.currentUser._id可获取当前登录的账号id

注意：以上为连接本地云函数体验，如果要发行为正式项目，需要把uniCloud内的文件部署到云端。操作方式为：对项目根目录uniCloud点右键选择“云服务空间初始化向导”界面按提示部署项目

如果你的项目客户端，不是基于Vue3版本的uni-app + uniCloud + uni-id-pages 或对im的交互性能要求不高，或希望便捷快速地给你的项目增加个客服功能。建议直接使用uni-im-web-load部署（即：将uni-im打包发行为web页面，通过web-view的方式集成至项目）。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序端注意: uni-im 的“扩展插件功能“基于“动态组件”实现；而微信小程序并不支持“动态组件”，需要引入vite插件rollup-plugin-uniapp-cementing.js 实现“动态组件静态化”。

示例: 在项目根目录创建：vite.config.js，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

配置Schema扩展Js的公共模块或扩展库 先复制示例项目的/uni_modules/uni-id-pages/uniCloud/database/uni-id-users.schema.json文件覆盖到自己项目，解决表操作权限问题。 由于uni-im的数据库的触发器依赖了uni-im-utils，需要在目录uniCloud/database右键 -> 选择“配置Schema扩展Js的公共模块或扩展库” -> 在选择项目的公共模块中找到uni-im-utils并勾选 -> 点击确定，完成配置；然后在目录uniCloud/database右键 -> 上传Schema扩展Js的配置。

部署到uniCloud 在项目根目录uniCloud点右键，选择“云服务空间初始化向导” 按提示部署项目（注意：选择绑定的服务空间，须在uni-push2.0的web控制台 关联）

登录uni-im 基于uni-id-pages 实现用户体系的项目， 集成 uni-im 不需要考虑账号打通问题，用户登录项目后，不需要额外登录 uni-im。 其他项目，需要通过 uni-im 的客户端 sdk 的login方法，实现登录。

为什么不能实时接收到推送的消息，需要刷新或者关闭重新打开才能收到？ 答： uni-im通过uni-push实现消息实时送达，请检查是否已开通并正确配置，且在配置正常后重新登录

怎么样快速上手 答：先下载示例项目，部署并正确配置push后，体验没问题了再部署到自己的项目。

非unicloud项目提前导入用户数据 答：通过uni-im的httpapi调用login方法，实现用户数据导入。

客服场景下，我们希望管理员客服可以向任意用户发起会话。而普通用户的会话对象只能是客服。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-im-co 云函数（云对象）支持：在uni-app客户端及外部服务器调用。

示例源码如下，请查看 pre > code 标签中的内容

在实际应用中，常有外部服务器模拟用户执行向其他用户发消息、撤回消息、拉群等操作。 例如：创建一个名为“系统通知”的用户，通过接口向其他用户发送系统通知。

获取http请求的网络地址 在项目根目录的uniCloud目录右键，选择“打开uniCloud web控制台” -> 云函数/云对象 -> 云函数/云对象列表 -> 找到“云对象uni-im-co” -> 点击右侧的“详情”-> 在页面最下方可以看到“云函数URL化”点击“复制路径“。

实现安全通讯 为防止uni-im-co的url化链接，遭受非法HTTP请求，其默认设置为禁止访问。若要启用访问功能，需配置安全通讯密钥，以此建立可信的访问通道。

示例源码如下，请查看 pre > code 标签中的内容

此安全通讯基于uni-cloud-s2s实现，有：connectCode 和 数据签名2种安全通讯验证方式，这里以connectCode为例。如您希望通过数据签名验证详情参考

示例源码如下，请查看 pre > code 标签中的内容

完整的body 是一个长度为 2 的数组，且每一项都是对象：

示例源码如下，请查看 pre > code 标签中的内容

补充示例（为了方便进一步理解，以在uniCloud中请求外部接口为例）：

示例源码如下，请查看 pre > code 标签中的内容

已废弃。uni-im-co已支持通过http访问云对象内的任意方法，无需额外请求httpApi方法。详情查看在外部服务器调用uni-im-co

示例源码如下，请查看 pre > code 标签中的内容

注意：这是一个递归云对象，500个设备为一组批量向用户推送消息（该方法仅允许云对象或者触发器调用）

路径：/uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/uni-im/config.json

入口文件路径:@/uni_modules/uni-im/sdk/index.js

其中conversation,msg,friend,group,notification继承类/uni_modules/uni-im/sdk/ext/CloudData.class.js类，均拥有:

适用于非unicloud或用户体系前端非uni-id-pages的项目登录im，同时实现同步你项目的用户数据到uni-im的数据库中。

前提条件 ：需要配置uni-id的 tokenSecret tokenExpiresIn tokenExpiresThreshold详情查看

此方法根据uni-im服务端配置中get_external_userinfo字段的值，支持两种登录模式：

配置路径：uniCloud/cloudfunctions/common/uni-config-center/uni-im/config.json

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-im的会话列表和消息列表，需要显示实时的发生时间。而一个应用开启太多的定时器，会消耗较大的系统性能。 所以uni-im提供了一个每秒钟更新一次的响应式数据heartbeat，由uniImInit方法：启用一个定时器刷新，挂载在全局，所有应用场景引用这一个变量即可

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

加载系统消息数据 参数与获取系统消息数据一致

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

utils封装了uni-im常用方法的模块，路径：/uni_modules/uni-im/sdk/utils/index.js

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-im遵循uni-app的插件模块化规范，即：uni_modules 。

在项目根目录下的uni_modules目录下，以插件ID即uni-im为插件文件夹命名，在该目录右键也会看到“从插件市场更新”选项，点击即可更新该插件。也可以用插件市场web界面下载覆盖。

本许可协议，是数字天堂（北京）网络技术有限公司（以下简称DCloud）对其所拥有著作权的“DCloud uni-im”（以下简称软件），提供的使用许可协议。

您对“软件”的复制、使用、修改及分发受本许可协议的条款的约束，如您不接受本协议，则不能使用、复制、修改本软件。

a) 授予您永久性的、全球性的、免费的、非独占的、不可撤销的本软件的源码使用许可，您可以使用这些源码制作自己的应用。

b) 您只能在DCloud产品体系内使用本软件及其源码。您不能将源码修改后运行在DCloud产品体系之外的环境，比如客户端脱离uni-app，或服务端脱离uniCloud。

c) DCloud未向您授权商标使用许可。您在根据本软件源码制作自己的应用时，需以自己的名义发布软件，而不是以DCloud名义发布。

DCloud的责任限制 “软件”在提供时不带任何明示或默示的担保。在任何情况下，DCloud不对任何人因使用“软件”而引发的任何直接或间接损失承担责任，不论因何种原因导致或者基于何种法律理论,即使其曾被建议有此种损失的可能性。

b) 您在分发自己的应用时，不得侵犯DCloud商标和名誉权利。

c) 您不得进行破解、反编译、套壳等侵害DCloud知识产权的行为。您不得利用DCloud系统漏洞谋利或侵害DCloud利益，如您发现DCloud系统漏洞应第一时间通知DCloud。您不得进行攻击DCloud的服务器、网络等妨碍DCloud运营的行为。您不得利用DCloud的产品进行与DCloud争夺开发者的行为。

d) 如您违反本许可协议，需承担因此给DCloud造成的损失。

本协议签订地点为中华人民共和国北京市海淀区。

根据发展，DCloud可能会对本协议进行修改。修改时，DCloud会在产品或者网页中显著的位置发布相关信息以便及时通知到用户。如果您选择继续使用本框架，即表示您同意接受这些修改。

uni-im本身并不收费，实际使用中需要依赖uniCloud云服务，会产生费用；而uniCloud的价格很实惠：

更多计费参考：支付宝云版uniCloud按量计费文档

合计：1次云函数请求、2次数据库读操作、2次数据库写操作、1次uni-push2推送操作，即 (1 * 0.0133 + 2 * 0.015 + 2 * 0.05 + 1 * 0.0283)/10000 ≈ 0.000017元

合计：向500人群发送消息，会产生：1次云函数请求、4次数据库读操作、2次数据库写操作、1次uni-push2推送操作，即 (1 * 0.0133 + 4 * 0.015 + 2 * 0.05 + 1 * 0.0283)/10000 ≈ 0.000020元

相比市面上同类型产品，使用uni-im仅需花费如此便宜的uniCloud（serverless服务器）费用；在价格这块uni-im性价比极高。

注：由于uni-im会持续升级，其服务端运行逻辑也会不断优化，或新增其他逻辑，这可能导致上述费用计算方法中的数据库操作次数发生变化。因此，此处的费用算法仅作参考。

**Examples:**

Example 1 (html):
```html
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 2 (html):
```html
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 3 (javascript):
```javascript
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 4 (html):
```html
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=action

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## 初始化uniCloud实例@init-unicloud | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/init?id=init-db

**Contents:**
- # 初始化uniCloud实例
- # 获取其他服务空间的database

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database.html

**Contents:**
- # 获取集合的引用
  - # 集合 Collection
  - # 记录 Record / Document
  - # 查询筛选指令 Query Command
  - # 字段更新指令 Update Command
- # 新增文档
- # 查询文档
  - # 添加查询条件
  - # 获取查询数量
  - # 设置记录数量

云函数中支持对云数据库的全部功能的操作。本章节主要讲解如何在云函数内通过传统api操作数据库，如需在云函数内使用JQL语法操作数据库，请参考：云函数内使用JQL语法

示例源码如下，请查看 pre > code 标签中的内容

通过 db.collection(name) 可以获取指定集合的引用，在集合上可以进行以下操作

查询及更新指令用于在 where 中指定字段需满足的条件，指令可通过 db.command 对象取得。

通过 db.collection(collectionName).doc(docId) 可以获取指定集合上指定 _id 的记录的引用，在记录上可以进行以下操作

doc(docId)方法的参数只能是字符串，即数据库默认的_id字段。

如需要匹配多个_id的记录，应使用where方法。可以在where方法里用in指令匹配一个包含_id的数组。

新增文档时数据库会自动生成_id字段，也可以自行将_id设置为其他值

如果你熟悉SQL，可查询mongodb与sql语句对照表 进行学习。

方法1： collection.add(data)

示例源码如下，请查看 pre > code 标签中的内容

方法2： collection.doc().set(data)

也可通过 set 方法新增一个文档，需先取得文档引用再调用 set 方法。 如果文档不存在，set 方法会创建一个新文档。

示例源码如下，请查看 pre > code 标签中的内容

支持 where()、limit()、skip()、orderBy()、get()、field()、count() 等操作。

只有当调用get()时才会真正发送查询请求。

limit，即返回记录的最大数量，默认值为100，也就是不设置limit的情况下默认返回100条数据。limit最大为1000条。

如果使用JQL语法传入getTree参数以返回树形数据也受上面的规则限制，不过此时limit方法仅对根节点生效（大量数据建议使用分层加载，不要使用getTree一次返回所有数据）

支付宝云中，使用where查询时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

注意： 聚合操作中不能使用where，需使用match，关于聚合操作的更多介绍，详见

设置过滤条件，where 可接收对象作为参数，表示筛选出拥有和传入对象相同的 key-value 的文档。比如筛选出所有类型为计算机的、内存为 8g 的商品：

示例源码如下，请查看 pre > code 标签中的内容

如果要表达更复杂的查询，可使用高级查询指令，比如筛选出所有内存大于 8g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

where 还可以使用正则表达式来查询文档，比如一下示例查询所有name字段以ABC开头的用户

示例源码如下，请查看 pre > code 标签中的内容

mongoDB内按照数组内的值查询可以使用多种写法，以下面的数据为例

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内第一个元素的name为item-1的记录可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内某个元素的name为item-1的记录（可以是数组内的任意一条name为item-1）可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.skip(value)

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很大的情况下，skip性能会很差，尽量使用其他方式替代，参考：skip性能优化

collection.orderBy(field, orderType)

如果需要对嵌套字段排序，需要用 "点表示法" 连接嵌套字段，比如 style.color 表示字段 style 里的嵌套字段 color。

同时也支持按多个字段排序，多次调用 orderBy 即可，多字段排序时的顺序会按照 orderBy 调用顺序先后对多个字段排序

示例源码如下，请查看 pre > code 标签中的内容

从查询结果中，过滤掉不需要的字段，或者指定要返回的字段。

示例源码如下，请查看 pre > code 标签中的内容

查询指令以dbCmd.开头，包括等于、不等于、大于、大于等于、小于、小于等于、in、nin、and、or。

示例源码如下，请查看 pre > code 标签中的内容

表示字段等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

事实上在uniCloud的数据库中，等于有两种写法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 eq 指令有更大的灵活性，可以用于表示字段等于某个对象的情况，比如：

示例源码如下，请查看 pre > code 标签中的内容

字段不等于。neq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存为 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存不是 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

如筛选出内存大于 4g 小于 32g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表示需满足所有指定条件中的至少一个。如筛选出价格小于 4000 或在 6000-8000 之间的计算机：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果要跨字段 “或” 操作：(如筛选出内存 8g 或 cpu 3.2 ghz 的计算机)

示例源码如下，请查看 pre > code 标签中的内容

例如下面可以筛选出 version 字段开头是 "数字+s" 的记录，并且忽略大小写：

示例源码如下，请查看 pre > code 标签中的内容

假设数据表class内有以下数据，可以使用下面两种方式查询数组内包含指定值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

使用腾讯云时更新方法必须搭配doc、where方法使用，db.collection('test').update()会报如下错误：param should have required property 'query'

collection.doc().update(Object data)

未使用set、remove更新操作符的情况下，此方法不会删除字段，仅将更新数据和已有数据合并。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，已数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc().set()

此方法会覆写已有字段，需注意与update表现不同，比如以下示例执行set之后follow字段会被删除

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口仅会操作一条数据，有多条数据匹配的情况下会只更新匹配的第一条并返回

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：只可确定数组内只会被匹配到一个的时候使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于设定字段等于指定值。这种方法相比传入纯 JS 对象的好处是能够指定字段等于一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于指示字段自增某个值，这是个原子操作，使用这个操作指令而不是先读数据、再加、再写回的好处是：

在文章阅读数+1、收藏+1等很多场景会用到它。如给收藏的商品数量加一：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意并没有直接提供减法操作符，如果要实现减法，仍通过inc实现。比如上述字段减1，

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意没有直接提供除法操作符，如果要实现除法，仍通过mul实现。比如上述字段除以10，

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于表示删除某个字段。如某人删除了自己一条商品评价中的评分：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组尾部追加元素，支持传入单个元素或数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组头部添加元素，支持传入单个元素或数组。使用同push

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果需要对类型为地理位置的字段进行搜索，一定要建立地理位置索引。

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

按从近到远的顺序，找出字段值在给定点的附近的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

找出字段值在指定 Polygon / MultiPolygon 内的记录，无排序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

事务通常用来在某个数据库操作失败之后进行回滚。

事务因为要锁行，是有时间限制的。从事务开始到事务提交/回滚，时间不可超过10秒。另外注意：如果多条事务同时处理同一行数据，可能存在写冲突，进而导致失败。

阿里云不支持此用法，请换成startTransaction以使用事务

发起事务。与startTransaction作用类似，接收参数类型不同

runTransaction 的形式如下：

示例源码如下，请查看 pre > code 标签中的内容

runTransaction返回一个Promise，此Promise.resolve的结果为callback事务执行函数的返回值，reject 的结果为事务执行过程中抛出的异常或者是 transaction.rollback 传入的值

事务执行函数由开发者传入，函数接收一个参数 transaction，其上提供 collection 方法和 rollback 方法。collection 方法用于取数据库集合记录引用进行操作，rollback 方法用于在不想继续执行事务时终止并回滚事务。

事务执行函数必须为 async 异步函数或返回 Promise 的函数，当事务执行函数返回时，uniCloud 会认为用户逻辑已完成，自动提交（commit）事务，因此务必确保用户事务逻辑完成后才在 async 异步函数中返回或 resolve Promise。

事务执行函数可能会被执行多次，在内部发现事务冲突时会自动重复执行，如果超过设定的执行次数上限，会报错退出。

在事务执行函数中发生的错误，都会认为事务执行失败而抛错。

事务执行函数返回的值会作为 runTransaction 返回的 Promise resolve 的值，在函数中抛出的异常会作为 runTransaction 返回的 Promise reject 的值，如果事务执行函数中调用了 transaction.rollback，则传入 rollback 函数的值会作为 runTransaction 返回的 Promise reject 的值。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

发起事务。与runTransaction作用类似，接收参数类型不同

startTransaction 形式如下

示例源码如下，请查看 pre > code 标签中的内容

返回一个Promise，此Promise resolve的结果为事务操作对象（注意这里与runTransaction的区别），其上可通过 collection API 操作数据库，通过 commit（使用startTransaction需要主动commit） 或 rollback 来结束或终止事务。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 2 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 3 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 4 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

---

## 云数据库运算方法@aggregate-operator | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database-aggregate-operator.html

**Contents:**
- # 云数据库运算方法
- # 算术操作符
  - # abs
    - # API 说明
    - # 示例代码
  - # add
    - # API 说明
    - # 示例代码
  - # ceil
    - # API 说明

示例源码如下，请查看 pre > code 标签中的内容

abs 传入的值除了数字常量外，也可以是任何最终解析成一个数字的表达式。

如果表达式解析为 null 或者指向一个不存在的字段，则 abs 的结果是 null。如果值解析为 NaN，则结果是 NaN。

示例源码如下，请查看 pre > code 标签中的内容

··· 可以用如下方式求得各个记录的 start 和 end 之间的绝对差异大小：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将数字相加或将数字加在日期上。如果数组中的其中一个值是日期，那么其他值将被视为毫秒数加在该日期上。

示例源码如下，请查看 pre > code 标签中的内容

表达式可以是形如 $ + 指定字段，也可以是普通字符串。只要能够被解析成字符串即可。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如下操作可以获取各个记录的 lastUpdate 加一个小时之后的值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向上取整，返回大于或等于给定数字的最小整数。

示例源码如下，请查看 pre > code 标签中的内容

<number> 可以是任意解析为数字的表达式。如果表达式解析为 null 或指向一个不存在的字段，则返回 null，如果解析为 NaN，则返回 NaN。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设集合 railroads 有如下记录：

示例源码如下，请查看 pre > code 标签中的内容

可以用如下方式取各个数字转换为千米之后的值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

取 e（自然对数的底数，欧拉数） 的 n 次方。

示例源码如下，请查看 pre > code 标签中的内容

<exponent> 可以是任意解析为数字的表达式。如果表达式解析为 null 或指向一个不存在的字段，则返回 null，如果解析为 NaN，则返回 NaN。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向下取整，返回大于或等于给定数字的最小整数。

示例源码如下，请查看 pre > code 标签中的内容

<number> 可以是任意解析为数字的表达式。如果表达式解析为 null 或指向一个不存在的字段，则返回 null，如果解析为 NaN，则返回 NaN。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

<number> 可以是任意解析为非负数字的表达式。

ln 等价于 log([<number>, Math.E])，其中 Math.E 是 JavaScript 获取 e 的值的方法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算给定数字在给定对数底下的 log 值。

示例源码如下，请查看 pre > code 标签中的内容

<number> 可以是任意解析为非负数字的表达式。<base> 可以是任意解析为大于 1 的数字的表达式。

如果任一参数解析为 null 或指向任意一个不存在的字段，log 返回 null。如果任一参数解析为 NaN，log 返回 NaN。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算给定数字在对数底为 10 下的 log 值。

示例源码如下，请查看 pre > code 标签中的内容

<number> 可以是任意解析为非负数字的表达式。

log10 等同于 log 方法的第二个参数固定为 10。

计算给定数字在对数底为 10 下的 log 值。

示例源码如下，请查看 pre > code 标签中的内容

<number> 可以是任意解析为非负数字的表达式。

log10 等同于 log 方法的第二个参数固定为 10。

示例源码如下，请查看 pre > code 标签中的内容

第一个数字是被除数，第二个数字是除数。参数可以是任意解析为数字的表达式。

示例源码如下，请查看 pre > code 标签中的内容

各记录取 items 除以 bags 的余数（items % bags）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设直角三角形集合 triangle 有如下记录：

示例源码如下，请查看 pre > code 标签中的内容

假设 x 和 y 分别为两直角边，则求斜边长：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将两个数字相减然后返回差值，或将两个日期相减然后返回相差的毫秒数，或将一个日期减去一个数字返回结果的日期。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

求各个记录的 max 和 min 的差值。：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

<array> 可以是任意解析为数组的表达式。

<index> 可以是任意解析为整形的表达式。如果是正数，arrayElemAt 返回在 index 位置的元素，如果是负数，arrayElemAt 返回从数组尾部算起的 index 位置的元素。

示例源码如下，请查看 pre > code 标签中的内容

求各个第一次考试的分数和和最后一次的分数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

第一种：传入一个二维数组，第二维的数组长度必须为 2，其第一个值为字段名，第二个值为字段值

示例源码如下，请查看 pre > code 标签中的内容

第二种：传入一个对象数组，各个对象必须包含字段 k 和 v，分别指定字段名和字段值

示例源码如下，请查看 pre > code 标签中的内容

传入 arrayToObject 的参数只要可以解析为上述两种表示法之一即可。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定一个值和一个数组，如果值在数组中则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

<array> 可以是任意解析为数组的表达式。

示例源码如下，请查看 pre > code 标签中的内容

标记销量最高的商品包含 ice cream 的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在数组中找出等于给定值的第一个元素的下标，如果找不到则返回 -1。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算总销量，如果 sales 是数字，则求 sales * base，如果 sales 是数组，则求数组元素之和与 base 的乘积。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似 JavaScript Array 上的 map 方法，将给定数组的每个元素按给定转换方法转换后得出新的数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将一个对象转换为数组。方法把对象的每个键值对都变成输出数组的一个元素，元素形如 { k: <key>, v: <value> }。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回一组生成的序列数字。给定开始值、结束值、非零的步长，range 会返回从开始值开始逐步增长、步长为给定步长、但不包括结束值的序列。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似 JavaScript 的 reduce 方法，应用一个表达式于数组各个元素然后归一成一个元素。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取各个球员的全名，并加 Player: 前缀：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

<array> 可以是任意解析为数组的表达式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似 JavaScritp 的 slice 方法。返回给定数组的指定子集。

示例源码如下，请查看 pre > code 标签中的内容

返回从指定位置算作数组开头、再向后或向前的 n 个元素：

示例源码如下，请查看 pre > code 标签中的内容

<array> 可以是任意解析为数组的表达式。

<position> 可以是任意解析为整形的表达式。如果是正数，则将数组的第 <position> 个元素作为数组开始；如果 <position> 比数组长度更长，slice 返回空数组。如果是负数，则将数组倒数第 <position> 个元素作为数组开始；如果 <position> 的绝对值大于数组长度，则开始位置即为数组开始位置。

<n> 可以是任意解析为整形的表达式。如果 <position> 有提供，则 <n> 必须为正整数。如果是正数，slice 返回前 n 个元素。如果是负数，slice 返回后 n 个元素。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

把二维数组的第二维数组中的相同序号的元素分别拼装成一个新的数组进而组装成一个新的二维数组。如可将 [ [ 1, 2, 3 ], [ "a", "b", "c" ] ] 转换成 [ [ 1, "a" ], [ 2, "b" ], [ 3, "c" ] ]。

示例源码如下，请查看 pre > code 标签中的内容

inputs 是一个二维数组（inputs 不可以是字段引用），其中每个元素的表达式（这个可以是字段引用）都可以解析为数组。如果其中任意一个表达式返回 null，<inputs> 也返回 null。如果其中任意一个表达式不是指向一个合法的字段 / 解析为数组 / 解析为 null，则返回错误。

useLongestLength 决定输出数组的长度是否采用输入数组中的最长数组的长度。默认为 false，即输入数组中的最短的数组的长度即是输出数组的各个元素的长度。

defaults 是一个数组，用于指定在输入数组长度不一的情况下时采用的数组各元素默认值。指定这个字段则必须指定 useLongestLength，否则返回错误。如果 useLongestLength 是 true 但是 defaults 是空或没有指定，则 zip 用 null 做数组元素的缺省默认值。指定各元素默认值时 defaults 数组的长度必须是输入数组最大的长度。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果设 useLongestLength 为 true：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定多个表达式，and 仅在所有表达式都返回 true 时返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

如果表达式返回 false、null、0、或 undefined，表达式会解析为 false，否则对其他返回值都认为是 true。

示例源码如下，请查看 pre > code 标签中的内容

求 min 大于等于 30 且 max 小于等于 80 的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定一个表达式，如果表达式返回 true，则 not 返回 false，否则返回 true。注意表达式不能为逻辑表达式（and、or、nor、not）。

示例源码如下，请查看 pre > code 标签中的内容

如果表达式返回 false、null、0、或 undefined，表达式会解析为 false，否则对其他返回值都认为是 true。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定多个表达式，如果任意一个表达式返回 true，则 or 返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

如果表达式返回 false、null、0、或 undefined，表达式会解析为 false，否则对其他返回值都认为是 true。

示例源码如下，请查看 pre > code 标签中的内容

求 min 小于 40 或 max 大于 60 的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果第一个值小于第二个值，返回 -1 如果第一个值大于第二个值，返回 1 如果两个值相等，返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

求 shop1 和 shop2 的各个物品的价格对比。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果相等则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者大于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者大于或等于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者小于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者小于或等于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果不相等则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算布尔表达式，返回指定的两个值其中之一。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

两种形式中，三个参数（if、then、else）都是必须的。

如果布尔表达式为真，那么 $cond 将会返回 <真值>，否则会返回 <假值>

示例源码如下，请查看 pre > code 标签中的内容

我们可以使用 cond，根据 amount 字段，来生成新的字段 discount：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算给定的表达式，如果表达式结果为 null、undefined 或者不存在，那么返回一个替代值；否则返回原值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们可以使用 ifNull，对不存在 desc 字段的文档，或者 desc 字段为 null 的文档，补充一个替代值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据给定的 switch-case-default 计算返回值、

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们可以使用 switch，根据 amount 字段，来生成新的字段 discount：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定日期的相关信息，构建并返回一个日期对象。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据指定的表达式将日期对象格式化为符合要求的字符串。

dateToString 的调用形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面是将 date 字段的值，格式化成形如 年份-月份-日期 的字符串：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面是将 date 字段值格式化为上海时区时间的例子：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当指定的 <日期表达式> 返回空或者不存在的时候，可以设置缺失情况下的默认值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的天数（一个月中的哪一天），是一个介于 1 至 31 之间的数字。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 dayOfMonth() 对 date 字段进行投影，获取对应的日期：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的天数（一周中的第几天），是一个介于 1（周日）到 7（周六）之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 dayOfWeek() 对 date 字段进行投影，获取对应的天数（一周中的第几天）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的天数（一年中的第几天），是一个介于 1 到 366 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 dayOfYear() 对 date 字段进行投影，获取对应的天数（一年中的第几天）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的小时数，是一个介于 0 到 23 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 hour() 对 date 字段进行投影，获取对应的小时数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的 ISO 8601 标准的天数（一周中的第几天），是一个介于 1（周一）到 7（周日）之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 isoDayOfWeek() 对 date 字段进行投影，获取对应的 ISO 8601 标准的天数（一周中的第几天）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的 ISO 8601 标准的周数（一年中的第几周），是一个介于 1 到 53 之间的整数。

根据 ISO 8601 标准，周一到周日视为一周，本年度第一个周四所在的那周，视为本年度的第 1 周。

例如：2016 年 1 月 7 日是那年的第一个周四，那么 2016.01.04（周一）到 2016.01.10（周日） 即为第 1 周。同理，2016 年 1 月 1 日的周数为 53。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 isoWeek() 对 date 字段进行投影，获取对应的 ISO 8601 标准的周数（一年中的第几周）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的 ISO 8601 标准的天数（一年中的第几天）。

此处的“年”以第一周的周一为开始，以最后一周的周日为结束。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 isoWeekYear() 对 date 字段进行投影，获取对应的 ISO 8601 标准的天数（一年中的第几天）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的毫秒数，是一个介于 0 到 999 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 millisecond() 对 date 字段进行投影，获取对应的毫秒数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的分钟数，是一个介于 0 到 59 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 minute() 对 date 字段进行投影，获取对应的分钟数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的月份，是一个介于 1 到 12 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 month() 对 date 字段进行投影，获取对应的月份：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的秒数，是一个介于 0 到 59 之间的整数，在特殊情况下（闰秒）可能等于 60。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 second() 对 date 字段进行投影，获取对应的秒数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的周数（一年中的第几周），是一个介于 0 到 53 之间的整数。

每周以周日为开头，每年的第一个周日即为 week 1 的开始，这天之前是 week 0。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 week() 对 date 字段进行投影，获取对应的周数（一年中的第几周）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们使用 year() 对 date 字段进行投影，获取对应的年份：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

直接返回一个值的字面量，不经过任何解析和处理。

示例源码如下，请查看 pre > code 标签中的内容

如果 <值> 是一个表达式，那么 literal 不会解析或者计算这个表达式，而是直接返回这个表达式。

比如我们有一个 items 集合，其中数据如下：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 literal，生成了一个新的字段 isOneDollar，表示 price 字段是否严格等于 "$1"。

注意：我们这里无法使用 eq(['$price', '$1'])，因为 "$1" 是一个表达式，代表 "1" 字段对应的值，而不是字符串字面量 "$1"。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 literal，投影了一个新的字段 amount，其值为 1。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用形式如下： 在 group() 中使用时：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 mergeObjects()，将用相同 name 的文档合并：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 mergeObjects()，将文档中的 foo 和 bar 字段合并为 foobar：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入一个数组，或者数组字段的表达式。如果数组中所有元素均为真值，那么返回 true，否则返回 false。空数组永远返回 true。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 allElementsTrue()，判断 array 字段中是否均为真值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入一个数组，或者数组字段的表达式。如果数组中任意一个元素为真值，那么返回 true，否则返回 false。空数组永远返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 anyElementTrue()，判断 array 字段中是否含有真值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入两个集合，输出只存在于第一个集合中的元素。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 setDifference，找到只存在于 B 中的数字：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入两个集合，判断两个集合中包含的元素是否相同（不考虑顺序、去重）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 setEquals，判断两个集合中包含的元素是否相同：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 setIntersection，输出两个集合的交集：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入两个集合，判断第一个集合是否是第二个集合的子集。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 setIsSubset，判断第一个集合是否是第二个集合的子集：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 setUnion，输出两个集合的并集：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表达式可以是形如 $ + 指定字段，也可以是普通字符串。只要能够被解析成字符串即可。

示例源码如下，请查看 pre > code 标签中的内容

借助 concat 可以拼接 lastName 和 firstName 字段，得到每位学生的名字全称：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在目标字符串中查找子字符串，并返回第一次出现的 UTF-8 的字节索引（从0开始）。如果不存在子字符串，返回 -1。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

借助 indexOfBytes 查找字符 "a" 在字段 firstName 中的位置：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在目标字符串中查找子字符串，并返回第一次出现的 UTF-8 的 code point 索引（从0开始）。如果不存在子字符串，返回 -1。

code point 是“码位”，又名“编码位置”。这里特指 Unicode 包中的码位，范围是从0（16进制）到10FFFF（16进制）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

借助 indexOfCP 查找字符 "a" 在字段 firstName 中的位置：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按照分隔符分隔数组，并且删除分隔符，返回子字符串组成的数组。如果字符串无法找到分隔符进行分隔，返回原字符串作为数组的唯一元素。

示例源码如下，请查看 pre > code 标签中的内容

字符串表达式和分隔符表达式可以是任意形式的表达式，只要它可以被解析为字符串即可。

示例源码如下，请查看 pre > code 标签中的内容

通过 split 将每条记录中的 birthday 字段对应值分隔成数组，每个数组分别由代表年、月、日的3个元素组成：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算并返回指定字符串中 utf-8 编码的字节数量。

示例源码如下，请查看 pre > code 标签中的内容

只要表达式可以被解析成字符串，那么它就是有效表达式。

示例源码如下，请查看 pre > code 标签中的内容

借助 strLenBytes 计算 name 字段和 nickname 字段对应值的字节长度：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算并返回指定字符串的UTF-8 code points 数量。

示例源码如下，请查看 pre > code 标签中的内容

只要表达式可以被解析成字符串，那么它就是有效表达式。

示例源码如下，请查看 pre > code 标签中的内容

借助 strLenCP 计算 name 字段和 nickname 字段对应值的UTF-8 code points 的数量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对两个字符串在不区分大小写的情况下进行大小比较，并返回比较的结果。

示例源码如下，请查看 pre > code 标签中的内容

只要 表达式1和 表达式2 可以被解析成字符串，那么它们就是有效的。

示例源码如下，请查看 pre > code 标签中的内容

借助 strcasecmp 比较 firstName 字段值和 lastName 字段值的大小：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回字符串从指定位置开始的指定长度的子字符串。它是 db.command.aggregate.substrBytes 的别名，更推荐使用后者。

示例源码如下，请查看 pre > code 标签中的内容

表达式1 是任何可以解析为字符串的有效表达式，表达式2 和 表达式3 是任何可以解析为数字的有效表达式。

如果 表达式2 是负数，返回的结果为 ""。

如果 表达式3 是负数，返回的结果为从 表达式2 指定的开始位置以及之后其余部分的子字符串。

示例源码如下，请查看 pre > code 标签中的内容

借助 substr 可以提取 birthday 中的年、月、日信息，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回字符串从指定位置开始的指定长度的子字符串。子字符串是由字符串中指定的 UTF-8 字节索引的字符开始，长度为指定的字节数。

示例源码如下，请查看 pre > code 标签中的内容

表达式1 是任何可以解析为字符串的有效表达式，表达式2 和 表达式3 是任何可以解析为数字的有效表达式。

如果 表达式2 是负数，返回的结果为 ""。

如果 表达式3 是负数，返回的结果为从 表达式2 指定的开始位置以及之后其余部分的子字符串。

示例源码如下，请查看 pre > code 标签中的内容

借助 substrBytes 可以提取 birthday 中的年、月、日信息，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回字符串从指定位置开始的指定长度的子字符串。子字符串是由字符串中指定的 UTF-8 字节索引的字符开始，长度为指定的字节数。

示例源码如下，请查看 pre > code 标签中的内容

表达式1 是任何可以解析为字符串的有效表达式，表达式2 和 表达式3 是任何可以解析为数字的有效表达式。

如果 表达式2 是负数，返回的结果为 ""。

如果 表达式3 是负数，返回的结果为从 表达式2 指定的开始位置以及之后其余部分的子字符串。

示例源码如下，请查看 pre > code 标签中的内容

借助 substrCP 可以提取 nickname 字段值的第一个汉字：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

只要表达式可以被解析成字符串，那么它就是有效表达式。例如：$ + 指定字段。

示例源码如下，请查看 pre > code 标签中的内容

借助 toLower 将 firstName 的字段值转化为小写：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

只要表达式可以被解析成字符串，那么它就是有效表达式。例如：$ + 指定字段。

示例源码如下，请查看 pre > code 标签中的内容

借助 toUpper 将 lastName 的字段值转化为大写：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合运算符。向数组中添加值，如果数组中已存在该值，不执行任何操作。它只能在 group stage 中使用。

示例源码如下，请查看 pre > code 标签中的内容

表达式是形如 $ + 指定字段 的字符串。如果指定字段的值是数组，那么整个数组会被当作一个元素。

示例源码如下，请查看 pre > code 标签中的内容

每条记录的 category 对应值的类型是非数组，利用 addToSet 统计所有分类：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

每条记录的 tags 对应值的类型是数组，数组不会被自动展开：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回一组集合中，指定字段对应数据的平均值。

示例源码如下，请查看 pre > code 标签中的内容

avg 传入的值除了数字常量外，也可以是任何最终解析成一个数字的表达式。它会忽略非数字值。

示例源码如下，请查看 pre > code 标签中的内容

借助 avg 可以计算所有记录的 score 的平均值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回指定字段在一组集合的第一条记录对应的值。仅当这组集合是按照某种定义排序（ sort ）后，此操作才有意义。

示例源码如下，请查看 pre > code 标签中的内容

表达式是形如 $ + 指定字段 的字符串。

first 只能在 group 阶段被使用，并且需要配合 sort 才有意义。

示例源码如下，请查看 pre > code 标签中的内容

如果需要得到所有记录中 score 的最小值，可以先将所有记录按照 score 排序，然后取出第一条记录的 first。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回指定字段在一组集合的最后一条记录对应的值。仅当这组集合是按照某种定义排序（ sort ）后，此操作才有意义。

示例源码如下，请查看 pre > code 标签中的内容

表达式是形如 $ + 指定字段 的字符串。

last 只能在 group 阶段被使用，并且需要配合 sort 才有意义。

示例源码如下，请查看 pre > code 标签中的内容

如果需要得到所有记录中 score 的最大值，可以先将所有记录按照 score 排序，然后取出最后一条记录的 last。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表达式是形如 $ + 指定字段 的字符串。

示例源码如下，请查看 pre > code 标签中的内容

借助 max 可以统计不同组（ group ）中成绩的最高值，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表达式是形如 $ + 指定字段 的字符串。

示例源码如下，请查看 pre > code 标签中的内容

借助 min 可以统计不同组（ group ）中成绩的最低值，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 group 阶段，返回一组中表达式指定列与对应的值，一起组成的数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

借助 push 操作，对不同分组( group )的所有记录，聚合所有数据并且将其放入一个新的字段中，进一步结构化和语义化数据。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表达式传入的是指定字段，指定字段对应的值的数据类型必须是 number ，否则结果会返回 null。

假设集合 students 的记录如下：a 组同学的成绩分别是84和96，b组同学的成绩分别是80和100。

示例源码如下，请查看 pre > code 标签中的内容

可以用 stdDevPop 来分别计算 a 和 b 两组同学成绩的标准差，以此来比较哪一组同学的成绩更稳定。代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算输入值的样本标准偏差。如果输入值代表数据总体，或者不概括更多的数据，请改用 db.command.aggregate.stdDevPop。

示例源码如下，请查看 pre > code 标签中的内容

表达式传入的是指定字段，stdDevSamp 会自动忽略非数字值。如果指定字段所有的值均是非数字，那么结果返回 null。

示例源码如下，请查看 pre > code 标签中的内容

可以用 stdDevSamp 来计算成绩的标准样本偏差。代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果向集合 students 添加一条新记录，它的 score 字段类型是 string：

示例源码如下，请查看 pre > code 标签中的内容

用上面代码计算标准样本偏差时，stdDevSamp 会自动忽略类型不为 number 的记录，返回结果保持不变。

示例源码如下，请查看 pre > code 标签中的内容

表达式可以传入指定字段，也可以传入指定字段组成的列表。sum 会自动忽略非数字值。如果字段下的所有值均是非数字，那么结果返回 0。若传入数字常量，则当做所有记录该字段的值都给给定常量，在聚合时相加，最终值为输入记录数乘以常量。

假设代表商品的集合 goods 的记录如下：price 代表商品销售额，cost 代表商品成本

示例源码如下，请查看 pre > code 标签中的内容

借助 sum 可以计算所有商品的销售总和，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果需要计算所有商品的利润总额，那么需要将每条记录的 cost 和 price 相加得到此记录对应商品的利润。最后再计算所有商品的利润总额。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

自定义变量，并且在指定表达式中使用，返回的结果是表达式的结果。

示例源码如下，请查看 pre > code 标签中的内容

vars 中可以定义多个变量，变量的值由 变量表达式 计算而来，并且被定义的变量只有在 in 中的 结果表达式 才可以访问。

在 in 的结果表达式中访问自定义变量时候，请在变量名前加上双美元符号( $$ )并用引号括起来。

假设代表商品的集合 goods 的记录如下：price 代表商品价格，discount 代表商品折扣率，cost 代表商品成本

示例源码如下，请查看 pre > code 标签中的内容

借助 let 可以定义并计算每件商品实际的销售价格，并将其赋值给自定义变量 priceTotal。最后再将 priceTotal 与 cost 进行取和( sum )运算，得到每件商品的利润。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (typescript):
```typescript
db.command.aggregate.abs(<number>)
```

Example 2 (typescript):
```typescript
db.command.aggregate.abs(<number>)
```

Example 3 (typescript):
```typescript
db.command.aggregate.abs(<number>)
```

Example 4 (typescript):
```typescript
db.command.aggregate.abs(<number>)
```

---

## 云数据库聚合操作@aggregate | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database-aggregate.html

**Contents:**
- # 云数据库聚合操作
- # 聚合表达式
- # addFields
- # bucket
- # bucketAuto
- # count
- # geoNear
- # group
- # limit
- # lookup

有时候我们需要对数据进行分析操作，比如一些统计操作、联表查询等，这个时候简单的查询操作就搞不定这些需求，因此就需要使用聚合操作来完成。

示例源码如下，请查看 pre > code 标签中的内容

云函数中使用时切勿复用aggregate实例，容易引发Bug。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表达式可以是字段路径、常量、或数据库运算方法。表达式可以嵌套表达式。

表达式用字段路径表示法来指定记录中的字段。字段路径的表示由一个 $ 符号加上字段名或嵌套字段名。嵌套字段名用点将嵌套的各级字段连接起来。如 $profile 就表示 profile 的字段路径，$profile.name 就表示 profile.name 的字段路径（profile 字段中嵌套的 name 字段）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

常量可以是任意类型。默认情况下 $ 开头的字符串都会被当做字段路径处理，如果想要避免这种行为，使用 db.command.aggregate.literal 声明为常量。

聚合阶段。添加新字段到输出的记录。经过 addFields 聚合阶段，输出的所有记录中除了输入时带有的字段外，还将带有 addFields 指定的字段。

addFields 等同于同时指定了所有已有字段和新增字段的 project 阶段。

示例源码如下，请查看 pre > code 标签中的内容

addFields 可指定多个新字段，每个新字段的值由使用的表达式决定。

如果指定的新字段与原有字段重名，则新字段的值会覆盖原有字段的值。注意 addFields 不能用来给数组字段添加元素。

示例源码如下，请查看 pre > code 标签中的内容

应用两次 addFields，第一次增加两个字段分别为 homework 和 quiz 的和值，第二次增加一个字段再基于上两个和值求一次和值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以用点表示法在嵌套记录里增加字段。假设 vehicles 集合含有如下记录：

示例源码如下，请查看 pre > code 标签中的内容

可以用如下操作在 specs 字段下增加一个新的字段 fuel_type，值都设为固定字符串 unleaded：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以通过 $ 加字段名组成的字符串作为值的表达式来设置字段的值为另一个字段的值。

同样用上一个集合示例，可以用如下操作添加一个字段 vehicle_type，将其值设置为 type 字段的值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将输入记录根据给定的条件和边界划分成不同的组，每组即一个 bucket。

每组分别作为一个记录输出，包含一个以下界为值的 _id 字段和一个以组中记录数为值的 count 字段。count 在没有指定 output 的时候是默认输出的。

bucket 只会在组内有至少一个记录的时候输出。

示例源码如下，请查看 pre > code 标签中的内容

groupBy 是一个用以决定分组的表达式，会应用在各个输入记录上。可以用 $ 前缀加上要用以分组的字段路径来作为表达式。除非用 default 指定了默认值，否则每个记录都需要包含指定的字段，且字段值必须在 boundaries 指定的范围之内。

boundaries 是一个数组，每个元素分别是每组的下界。必须至少指定两个边界值。数组值必须是同类型递增的值。

default 可选，指定之后，没有进入任何分组的记录将都进入一个默认分组，这个分组记录的 _id 即由 default 决定。default 的值必须小于 boundaries 中的最小值或大于等于其中的最大值。default 的值可以与 boundaries 元素值类型不同。

output 可选，用以决定输出记录除了 _id 外还要包含哪些字段，各个字段的值必须用累加器表达式指定。当 output 指定时，默认的 count 是不会被默认输出的，必须手动指定：

示例源码如下，请查看 pre > code 标签中的内容

使用 bucket 需要满足以下至少一个条件，否则会抛出错误：

每一个输入记录应用 groupBy 表达式获取的值都必须是一个在 boundaries 内的值

指定一个 default 值，该值在 boundaries 以外，或与 boundaries 元素的值不同的类型。

示例源码如下，请查看 pre > code 标签中的内容

对上述记录进行分组，将 [0, 50) 分为一组，[50, 100) 分为一组，其他分为一组：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将输入记录根据给定的条件划分成不同的组，每组即一个 bucket。与 bucket 的其中一个不同之处在于无需指定 boundaries，bucketAuto 会自动尝试将记录尽可能平均的分散到每组中。

API 说明 每组分别作为一个记录输出，包含一个以包含组中最大值和最小值两个字段的对象为值的 _id 字段和一个以组中记录数为值的 count 字段。count 在没有指定 output 的时候是默认输出的。

示例源码如下，请查看 pre > code 标签中的内容

groupBy 是一个用以决定分组的表达式，会应用在各个输入记录上。可以用 $ 前缀加上要用以分组的字段路径来作为表达式。除非用 default 指定了默认值，否则每个记录都需要包含指定的字段，且字段值必须在 boundaries 指定的范围之内。

buckets 是一个用于指定划分组数的正整数。

granularity 是可选枚举值字符串，用于保证自动计算出的边界符合给定的规则。这个字段仅可在所有 groupBy 值都是数字并且没有 NaN 的情况下使用。枚举值包括：R5、R10、R20、R40、R80、1-2-5、E6、E12、E24、E48、E96、E192、POWERSOF2。

output 可选，用以决定输出记录除了 _id 外还要包含哪些字段，各个字段的值必须用累加器表达式指定。当 output 指定时，默认的 count 是不会被默认输出的，必须手动指定：

示例源码如下，请查看 pre > code 标签中的内容

在以下情况中，输出的分组可能会小于给定的组数：

granularity 用于保证边界值属于一个给定的数字序列。

Renard 序列是以 10 的 5 / 10 / 20 / 40 / 80 次方根来推导的、在 1.0 到 10.0 (如果是 R80 则是 10.3) 之间的数字序列。

设置 granularity 为 R5 / R10 / R20 / R40 / R80 就把边界值限定在序列内。如果 groupBy 的值不在 1.0 到 10.0 (如果是 R80 则是 10.3) 内，则序列数字会自动乘以 10。

E 序列是以 10 的 6 / 12 / 24 / 48 / 96 / 192 次方跟来推导的、带有一个特定误差的、在 1.0 到 10.0 之间的数字序列。

1-2-5 序列 表现与三值 Renard 序列一样。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。计算上一聚合阶段输入到本阶段的记录数，输出一个记录，其中指定字段的值为记录数。

示例源码如下，请查看 pre > code 标签中的内容

<string> 是输出记录数的字段的名字，不能是空字符串，不能以 $ 开头，不能包含 . 字符。

count 阶段等同于 group + project 的操作：

示例源码如下，请查看 pre > code 标签中的内容

上述操作会输出一个包含 count 字段的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将记录按照离给定点从近到远输出。

假设集合 attractions 有如下记录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。将输入记录按给定表达式分组，输出时每个记录代表一个分组，每个记录的 _id 是区分不同组的 key。输出记录中也可以包括累计值，将输出字段设为累计值即会从该分组中计算累计值。

使用group可以很方便的实现类似SQL的distinct功能

示例源码如下，请查看 pre > code 标签中的内容

_id 参数是必填的，如果填常量则只有一组。其他字段是可选的，都是累计值，用 $.sum 等累计器(const $ = db.command.aggregate)，但也可以使用其他表达式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以给 _id 传入记录的方式按多个值分组。还是沿用上面的示例数据，按各个区域（region）获得相同最高分（score）的来分组，并求出各组虚拟币（coins）的总量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回价格大于 20 的记录的最小的两个记录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。联表查询。与同个数据库下的一个指定的集合做 left outer join(左外连接)。对该阶段的每一个输入记录，lookup 会在该记录中增加一个数组字段，该数组是被联表中满足匹配条件的记录列表。lookup 会将连接后的结果输出给下个阶段。

将输入记录的一个字段和被连接集合的一个字段进行相等匹配时，采用以下定义：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果需要指定除相等匹配之外的连接条件，或指定多个相等匹配条件，或需要拼接被连接集合的子查询结果，那可以使用如下定义：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下聚合操作可以通过一个相等匹配条件连接 orders 和 books 集合，匹配的字段是 orders 集合的 book 字段和 books 集合的 title 字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对数组字段应用相等匹配 假设 authors 集合有以下记录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下操作获取作者信息及他们分别发表的书籍，使用了 lookup 操作匹配 authors 集合的 name 字段和 books 集合的 authors 数组字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

组合 mergeObjects 应用相等匹配

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下操作匹配 orders 的 book 字段和 books 的 title 字段，并将 books 匹配结果直接 merge 到 orders 记录中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下操作连接 orders 和 books 集合，要求两个条件：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在每条输出记录上加上一个数组字段，该数组字段的值是对 books 集合的一个查询语句的结果：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如需orders关联books，book再关联authors查询，可以在pipeline内再使用lookup

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。根据条件过滤文档，并且把符合条件的文档传递给下一个流水线阶段。

支付宝云中，使用match管道过滤时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

查询条件与普通查询一致，可以用普通查询操作符，注意 match 阶段和其他聚合阶段不同，不可使用数据库运算方法，只能使用查询操作符。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这里的代码尝试找到所有 author 字段是 stark 的文章，那么匹配如下：

示例源码如下，请查看 pre > code 标签中的内容

match 过滤出文档后，还可以与其他流水线阶段配合使用。

比如下面这个例子，我们使用 group 进行搭配，计算 score 字段大于 80 的文档数量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。把指定的字段传递给下一个流水线，指定的字段可以是某个已经存在的字段，也可以是计算出来的新字段。

示例源码如下，请查看 pre > code 标签中的内容

_id 字段是默认包含在输出中的，除此之外其他任何字段，如果想要在输出中体现的话，必须在 project 中指定； 如果指定包含一个尚不存在的字段，那么 project 会忽略这个字段，不会加入到输出的文档中；

如果你在 project 中指定排除某个字段，那么其它字段都会体现在输出中； 如果指定排除的是非 _id 字段，那么在本次 project 中，不能再使用其它表达式；

你可以使用一些特殊的表达式加入新的字段，或重置某个已有字段。

有时有些字段处于多层嵌套的底层，我们可以使用点记法：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 articles 集合，其中含有以下文档：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 project，让输出只包含 _id、title 和 author 字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

_id 是默认包含在输出中的，如果不想要它，可以指定去除它：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们还可以指定在输出中去掉某个非 _id 字段，这样其它字段都会被输出：

示例源码如下，请查看 pre > code 标签中的内容

输出如下，相比输入，没有了 isbn 字段：

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 students 集合，其中包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码，我们使用 project，在输出中加入了一个新的字段 totalScore：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 points 集合，包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码，我们使用 project，把 x 和 y 字段，放入到一个新的数组字段 coordinate 中：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。指定一个已有字段作为输出的根节点，也可以指定一个计算出的新字段作为根节点。

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 schools 集合，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 replaceRoot，把 teachers 字段作为根节点输出：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 roles 集合，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

下面的代码使用 replaceRoot，把 first_name 和 last_name 拼在一起：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。随机从文档中选取指定数量的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果现在进行抽奖活动，需要选出一名幸运用户。那么 sample 的调用方式如下：

示例源码如下，请查看 pre > code 标签中的内容

返回了随机选中的一个用户对应的记录，结果如下：

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。指定一个正整数，跳过对应数量的文档，输出剩下的文档。

示例源码如下，请查看 pre > code 标签中的内容

这段代码会跳过查找到的前 5 个文档，并且把剩余的文档输出。

聚合阶段。根据指定的字段，对输入的文档进行排序。

示例源码如下，请查看 pre > code 标签中的内容

假设我们有集合 articles，其中包含数据如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面的代码在 students 集合中进行聚合搜索，并且将结果排序，首先根据 age 字段降序排列，然后再根据 score 字段进行降序排列。

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。根据传入的表达式，将传入的集合进行分组（group）。然后计算不同组的数量，并且将这些组按照它们的数量进行排序，返回排序后的结果。

示例源码如下，请查看 pre > code 标签中的内容

表达式的形式是：$ + 指定字段。请注意：不要漏写 $ 符号。

示例源码如下，请查看 pre > code 标签中的内容

下面的代码就可以统计文章的分类信息，并且计算每个分类的数量。即对 category 字段执行 sortByCount 聚合操作。

示例源码如下，请查看 pre > code 标签中的内容

返回的结果如下所示：Web 分类下有2篇文章，Life 分类下有1篇文章。

示例源码如下，请查看 pre > code 标签中的内容

假设集合 passages 的记录如下：tags 字段对应的值是数组类型。

示例源码如下，请查看 pre > code 标签中的内容

如何统计文章的标签信息，并且计算每个标签的数量？因为 tags 字段对应的数组，所以需要借助 unwind 操作解构 tags 字段，然后再调用 sortByCount。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

聚合阶段。使用指定的数组字段中的每个元素，对文档进行拆分。拆分后，文档会从一个变为一个或多个，分别对应数组的每个元素。

使用指定的数组字段中的每个元素，对文档进行拆分。拆分后，文档会从一个变为一个或多个，分别对应数组的每个元素。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

假设我们有一个 products 集合，包含数据如下：

示例源码如下，请查看 pre > code 标签中的内容

我们根据 size 字段对这些文档进行拆分

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们根据 size 字段对文档进行拆分后，想要保留原数组索引在新的 index 字段中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果想要在输出中保留 size 为空数组、null，或者 size 字段不存在的文档，可以使用 preserveNullAndEmptyArrays 参数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
db.collection('scores').aggregate()
```

Example 2 (unknown):
```unknown
db.collection('scores').aggregate()
```

Example 3 (unknown):
```unknown
db.collection('scores').aggregate()
```

Example 4 (unknown):
```unknown
db.collection('scores').aggregate()
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=gettree

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=st-foreign-key

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/concepts/database.html

uniCloud 提供了 2 种类型的 nosql 数据库。

uniCloud阿里云版的云数据库就是 MongoDB 的 serverless版；uniCloud腾讯云版的云数据库是兼容 MongoDB 的自研数据库；uniCloud支付宝云版的云数据库是兼容部分 MongoDB 语法的自研数据库；

数据库中的每条记录都是一个 JSON 格式的对象。

一个数据库可以有多个集合（相当于关系型数据中的表），集合可看做一个 JSON 数组，数组中的每个对象就是一条记录，记录的格式是 JSON 对象。

MongoDB的传统操作方法还是比较复杂，uniCloud提供了更多简单操作数据库的方案，包括类似 SQL 的 JQL 语法、clientDB等技术。

在uniCloud中，云数据库、MongoDB数据库，这些概念一般都是指这个数据库，更多云数据库介绍参考。

同时针对支付宝云和阿里云专门推出了扩展数据库，扩展数据库在 ​​性能上限、成本控制、功能自由度​​ 和 ​​容灾能力​​ 上全面领先空间内置数据库，尤其适合需要 ​​弹性扩展、高并发处理、自动化运维​​ 或 ​​多云架构​​ 的企业级场景，具体可参考。

redis 是一种可以运行在内存中的键值对数据库，它的能力没有MongoDB强大，但由于可运行在内存中，它的性能远超常规数据库。

redis 也使用 json 方式 key/value 键值对存储数据。更多文档参考

如果开发者需要其他数据库，比如 MySQL、ElasticSearch、数据湖，这些数据库没有在uniCloud的服务空间内置，云函数中通过 Node.js 的 api 可以访问这些远程数据库。

如果是业务方面的 MySQL，建议通过 uniCloud web 控制台数据导入或通过云函数将 MySQL 数据导入到 uniCloud 的云数据库中，这样速度比连接远程 MySQL 数据库要更快， 并且可以使用 JQL、clientDB 等一系列 uniCloud 提供的数据库操作技术，uniCloud 庞大的生态如 uni-id、uni-admin 也都只支持 uniCloud 云数据库。

如果是 es搜索、大数据分析，则应该通过云函数中 nodejs API 远程连接这些数据库使用。

---

## 什么是索引 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/db-index?ttl

**Contents:**
- # 什么是索引
- # 添加索引
  - # uniCloud web控制台添加
  - # 在{表名}.index.json内配置集合索引
  - # 支付宝云索引配置类型
    - # 字段大小限制
- # 单字段索引
- # 组合索引
  - # 地理位置索引
  - # TTL索引

所有数据库都支持索引，索引文件通过额外占用磁盘空间，提供了一个快速查询记录的方案。查询时先查询索引文件，根据索引文件的指示再去查询真实的数据，在数据量较大时有明显的性能优势。

如果您的查询操作包含了过滤条件（包含等值测试和范围过滤）或者是排序功能，或者需要唯一性，则要考虑给集合的相关字段添加索引。通常来说需要为以下方法/属性内用到的字段添加索引where、match、orderBy、sort，还包括clientDB内getTree和getTreePath的startWith属性。

如果相关字段没有设为索引，当数据表的记录数量变大后，查询会变慢甚至超时报错。这点尤其需要注意。已经有一些开发者遭遇线上故障。开发时没有配索引，因为数据量小而没有性能问题。上线后数据量越来越大，查询越来越慢，直到超时，引发线上事故。

如数据表名为table-abc，则可以在项目uniCloud的database目录下创建table-abc.index.json，索引文件内写法如下：

示例源码如下，请查看 pre > code 标签中的内容

支付宝云在配置索引时，配置索引的数据表字段存储类型需与索引类型匹配，比如数据表table中的name字段存储的是字符串，那么设置索引时的Type必须是varchar，否则会对数据插入及查询有影响。 array类型索引只能单独创建，不能和其他字段创建联合索引。

您可以为查询条件对应的字段创建单字段索引，如果该字段是嵌套字段，可以使用"点表示法" 。例如对如下格式的记录中的color字段进行索引时，可以用style.color表示。

示例源码如下，请查看 pre > code 标签中的内容

在设置单字段索引时，可任意指定索引的排序为升序或降序，数据库总能在对索引字段的排序查询中，进行正确的排序。

组合索引即一个索引包含多个字段。当查询条件使用的字段包含在索引定义的所有字段或前缀字段里时，会命中索引，优化查询性能。

索引前缀即组合索引的字段中定义的前 1 到多个字段，例如对集合 students 中 name, age, score 三个字段按顺序定义了组合索引，那么该索引的前缀包含

示例源码如下，请查看 pre > code 标签中的内容

例如定义组合索引分别为 name, age 与 age, name 是不同的。当组合索引为 name, age 时，其索引前缀为 name, 对字段 name 的查询可以命中 name, age 索引, 而对字段 age 的查询无法命中该索引，因为 age 不属于 name, age 的前缀（反之字段 age 能命中 age, name 索引）。

云数据库目前支持建立平面几何的地理位置索引，使用地理位置查询功能时，必须为地理位置数据的字段建立地理位置索引。

例如对含地理位置字段 point 的集合建立地理位置索引：

示例源码如下，请查看 pre > code 标签中的内容

ttl索引用于设置数据过期时间，并在数据过期后进行删除。仅阿里云支持

创建索引时，索引属性选择唯一，即可添加唯一性限制。此限制会要求集合中索引字段对应的值不能重复。

例如，某个集合内建立了索引字段 foo，且属性为“唯一”，那么在这个集合内，要求不能存在 foo 字段相同的文档。

假如记录中不存在某个字段，则对索引字段来说其值默认为 null。如果索引有唯一性限制，则不允许存在两个或以上的该字段为空 / 不存在该字段的记录。

针对上述问题，阿里云支持将索引设置为稀疏索引，腾讯云暂不支持稀疏索引。

稀疏索引适用于需要某个字段唯一，但是这个字段又可能为空的场景。以用户表为例，用户可能是通过邮箱注册、也可能是通过手机号注册，所以需要保证邮箱、手机号唯一且允许为空，这时候就可以分别将邮箱、手机号的索引设置为稀疏索引来处理这种场景。注意uni-id内支持多应用用户隔离（同一个手机号、邮箱等可以在不同应用注册账号），手机号、邮箱等都不可设置唯一索引

支付宝云索引字段的值限制不能超过255字节

即不要对大段的文字（例如新闻的内容）设置索引

每个英文字母(不分大小写)占一字节的空间，每个中文汉字占两字节的空间。

**Examples:**

Example 1 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

Example 2 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

Example 3 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

Example 4 (json):
```json
[{
  "IndexName": "user_article_", // 索引名称
  "MgoKeySchema": { // 索引规则
      "MgoIndexKeys": [{
          "Name": "user_id", // 索引字段
          "Direction": "1", // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
          "Type": "varchar" // 索引类型，仅支付宝云生效，varchar/bool/int/long/float/double/point/array
      },{
          "Name": "article_id", // 索引字段
          "Direction": "1" // 索引方向，1：ASC-升序，-1：DESC-降序，2dsphere：地理位置
      }],
      "MgoIsUnique": false // 索引是否唯一
  }
}]
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=jsquery

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## 服务器安装部署 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/software/deploy.html

**Contents:**
- # 服务器安装部署
  - # 系统要求
  - # 获取并安装uni云开发软件版
  - # 初始化集群空间配置
  - # 标准版软件联网激活授权
    - # 服务器授权
    - # 应用授权
  - # 企业版软件离线激活授权
    - # 服务器授权
    - # 应用授权

可以使用如下命令来检查服务器环境是否满足要求。

示例源码如下，请查看 pre > code 标签中的内容

登录uniCloud控制台，按图所示进入uni云开发软件版页面

初次使用，需先确认uni云开发软件版的服务协议。

同意并开通后，进入uni云开发软件版集群空间列表

创建一个集群空间，创建成功后，点击右侧下载按钮，阅读“下载提示”后点击继续将会生成软件版部署包。

安装包构建成功后，你可以通过浏览器手动下载安装包，也可以直接在你的服务器上，使用wget命令下载安装包。

将安装包上传到服务器并进行解压，推荐目录为~/uniCloud，后文为方便表述，我们以${uniCloud_HOME}代指uni云开发软件版的安装根目录。

示例源码如下，请查看 pre > code 标签中的内容

在集群空间详情页面，复制SpaceId后，回到你的服务器上，在uni云开发软件版根目录下使用以下命令创建配置文件：

示例源码如下，请查看 pre > code 标签中的内容

接下来，你需要在服务器上，根据自己的具体情况，通过config.json配置mongodb数据库、文件存储、redis等，config.json的完整配置及解释，参考。

uni云开发软件版启动时(./unicloud start)，会自动向DCloud进行注册，默认为试用版，试用有效期为15天。

每个账号每年(自然年)有5次试用机会，即允许在5台服务器上运行未激活的uni云开发软件版。

试用到期后，你需要尽快购买并激活授权，升级为正式版。

服务器授权购买方式： 登录uniCloud控制台 ，从顶部导航栏下拉列表中选择“uni云开发软件版”，进入集群空间列表，选择对应集群空间，可看到该集群空间下的所有已注册服务器，选择需要激活的服务器，完成授权购买。

uniCloud控制台激活操作完成后，会在24小时内自动完成你服务器上的uni云开发软件版激活，或者你也可以通过重启的方式，让uni云开发软件版立即激活。

uniCloud试用版不校验appid，一旦你完成uni云开发软件版的正式激活，则需尽快配置该服务器允许使用的appid清单，每个appid需要一个应用授权。

未授权的应用访问uniCloud正式版将会返回403错误码。

绑定应用后，需重新启动uni云开发软件版，方可生效。

在uni云开发软件版安装目录下运行 ./unicloud scan 命令，会检测服务器环境信息及注册状态，如未注册状态，会在最后生成一个硬件ID

你需要登录uniCloud控制台-集群详情页面，在服务器授权处点击添加授权，输入服务器名称（用于备注服务器）和硬件ID，添加完成后点击"下载授权"，将会生成uniCloud.LICENSE文件。

下载授权文件并上传至uni云开发软件版服务器上，上传目录为${uniCloud_HOME}/license/，重启uni云开发软件版即可完成服务器正式激活。

你需要先完成应用授权的购买，然后手动下载应用的授权文件。

将下载的应用授权文件上传uni云开发软件版服务器上，目录为${uniCloud_HOME}/license/，重启uni云开发软件版即可完成应用授权激活。

示例源码如下，请查看 pre > code 标签中的内容

然后使用 curl localhost:7001命令，若成功返回hello uniCloud，则表示安装成功。

接下来，就是开发自己的业务代码，部署上传到服务器即可。

在HBuilderX中开发业务代码，测试完毕后，构建服务端发行包，并通过ssh/sftp等方式上传到服务器中，构建包的解压目录是${uniCloud_HOME}，关于构建操作，参考。

所有命令，需在uniCloud软件安装根目录下执行

./unicloud install-deps

./unicloud create-config

./unicloud init-database

查看 uniCloud 各服务空间运行状态

uni云开发软件版的部分业务需要从你的服务器向外网发送请求，需联网的业务包括：

若你的服务器开启了防火墙，或限制公网访问，同时又使用了如上业务，则你需要将如上对应域名加入防火墙白名单。

示例源码如下，请查看 pre > code 标签中的内容

uni云开发软件版内置简单的日志服务，日志分为启动日志与运行日志。

启动日志是记录 uniCloud 启动期间的所有输出日志。

运行日志是在 uniCloud 运行期间记录框架的输出日志和云函数输出日志。

启动日志放在${uniCloud_HOME}/logs/master路径下，每次启动的日志独立保存。

运行时日志默认放在${uniCloud_HOME}/logs路径下，可以修改服务空间配置文件中的logger.customLogDir字段来自定义日志目录。

示例源码如下，请查看 pre > code 标签中的内容

运行日志是按天切割，在每日00:00按照.log.YYYY-MM-DD文件名进行切割。

软件版会不定期进行版本升级，新增一些功能或修复一些Bug。

在 uniCloud 控制台-集群空间详情页面，如果有新版本，会在页面右上方显示“发现新版本”按钮。

点击“发现新版本”按钮，会弹出提示框，提示你当最新版本的升级内容。

如需升级，点击“获取新版本”后，系统会自动为你构建最新版本的安装包，构建完成后，可直接下载最新版本的安装包进行升级安装，参考获取并安装uni云开发软件版。

前往插件市场，下载并安装uni云开发软件版插件 。

uni云开发软件版服务空间使用 dcloud 标识

在项目中的uniCloud目录右键-uni云开发软件版-创建本地调试配置文件，即可生成config.json配置文件。

示例源码如下，请查看 pre > code 标签中的内容

你需要根据自己的具体情况，配置mongodb数据库、文件存储、redis等，config.json的完整配置及解释，详见

在本地运行时如果需要连接云端云函数，需要在集群空间详情页配置云端apiEndpoint后切换云端云函数访问。

修改 apiEndpoint 后需要重新关联服务空间生效。

由于有uni_modules插件内包含uniCloud云函数等，需要进行uniCloud打包操作，将uni_modules插件内的云函数及数据库schema抽离出来。

在 uniCloud目录右键“uni云开发软件版”-“打包uniCloud资源”，将会在uniCloud服务空间目录下生成dist目录。

可以使用git/svn等版本管理工具进行管理，将代码上传至git/svn，在服务器拉取代码后将uniCloud-dcloud/dist目录同步到对应服务空间下即可。

也可以单独对dist目录打包zip并上传到服务器对应的服务空间目录下并解压。

上传代码之后需要重新启动服务空间，在uni云开发软件版根目录执行以下命令进行重启操作

示例源码如下，请查看 pre > code 标签中的内容

建议部署时采用分布式部署方案，即使用2台以上服务器部署可以保证服务的稳定性，在服务重启时也不会中断服务。

云函数内跨集群空间调用与在公有云中跨服务空间调用方式一致，详情参考

示例源码如下，请查看 pre > code 标签中的内容

uni云开发软件版需要单独配置mongodb数据库、文件存储、redis等，所有配置全部在config.json中完成。

HBuilderX端开发配置、服务器端线上配置，都通过 config.json实现，且规则保持一致。

示例源码如下，请查看 pre > code 标签中的内容

如项目中使用了存储服务，则还需额外增加存储服务的配置项。即在服务空间目录下创建file目录，并在file目录下增加permission.json配置文件。配置文件内容如下：

示例源码如下，请查看 pre > code 标签中的内容

uni云开发软件版支持SSR项目部署，参考 SSR 项目手动部署发行文档

URL化路径配置错误，参考云函数package.json中云函数配置项 。

软件版默认URL化访问路径为/http，在配置路径时需要添加前缀/http。

**Examples:**

Example 1 (unknown):
```unknown
// 查看内核发行版本号
uname -r     
// 查看系统版本号   
cat /etc/os-release | grep -E "^NAME=|^VERSION="  
// 查看 glibc 版本号
ldd --version           
// 查看 GCC 版本号
gcc --version           
// 查看CPU信息
cat /proc/cpuinfo| grep "processor"     
// 查看内存信息
free -h
// 查看磁盘信息   
df -h
```

Example 2 (unknown):
```unknown
// 查看内核发行版本号
uname -r     
// 查看系统版本号   
cat /etc/os-release | grep -E "^NAME=|^VERSION="  
// 查看 glibc 版本号
ldd --version           
// 查看 GCC 版本号
gcc --version           
// 查看CPU信息
cat /proc/cpuinfo| grep "processor"     
// 查看内存信息
free -h
// 查看磁盘信息   
df -h
```

Example 3 (unknown):
```unknown
// 查看内核发行版本号
uname -r     
// 查看系统版本号   
cat /etc/os-release | grep -E "^NAME=|^VERSION="  
// 查看 glibc 版本号
ldd --version           
// 查看 GCC 版本号
gcc --version           
// 查看CPU信息
cat /proc/cpuinfo| grep "processor"     
// 查看内存信息
free -h
// 查看磁盘信息   
df -h
```

Example 4 (unknown):
```unknown
// 查看内核发行版本号
uname -r     
// 查看系统版本号   
cat /etc/os-release | grep -E "^NAME=|^VERSION="  
// 查看 glibc 版本号
ldd --version           
// 查看 GCC 版本号
gcc --version           
// 查看CPU信息
cat /proc/cpuinfo| grep "processor"     
// 查看内存信息
free -h
// 查看磁盘信息   
df -h
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/redis-introduction.html

**Contents:**
  - # Redis和MongoDB的比较
  - # redis常用应用场景
  - # 注意

Redis（Remote Dictionary Server)，是一种充分利用内存的数据库。

相比传统硬盘数据库，redis的性能要高出更多。

为了保证效率，数据都是缓存在内存中，同时redis会周期性的把更新的数据写入磁盘或者把修改操作写入追加的记录文件，并且在此基础上实现了master-slave(主从)同步，即使宕机，也可以恢复数据。所以redis即做到了高性能又实现了安全持久化存储。

redis是key-value存储系统，支持存储的value类型较多，包括：string(字符串)、list(链表)、set(集合)、sorted set 和hash（哈希类型）详情

使用腾讯云node12及以上版本和redis，务必仔细阅读此文档：keepRunningAfterReturn

其他还有：计数器、消息队列推送、好友关注、粉丝数等这里就不一一列举

虽然Redis的优势明显，但是我们仍然不可用Redis完全替代mongoDB。 推荐：mongoDB+redis组合使用。所有数据都在MongoDB里有一份，适合缓存入redis里的则使用redis。

HBuilderX 3.5.2+，新出了JQL Cache Redis，可以方便的将 MongoDB 中的数据缓存到 Redis 中。详见

---

## 扩展库Redis | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/redis

**Contents:**
- # 扩展库Redis
- # 开通Redis服务
- # 为云函数启用redis扩展库
- # 云函数中调用Redis
- # Redis本地运行
- # 数据类型
  - # 字符串 String
  - # 列表 List
  - # 哈希表 Hash
  - # 集合 Set

2021年11月18日，腾讯云和阿里云均支持

使用腾讯云node12及以上版本和redis，务必仔细阅读此文档：keepRunningAfterReturn

Redis是一个基于key/value的内存数据库。在项目中通常作为MongoDB等磁盘数据库的补充来搭配使用。 相对于磁盘数据库，Redis的核心优势是快。因为操作内存要比磁盘快的多，并且Redis只支持key/value数据，读写都很快。但Redis没有磁盘数据库丰富的查询等功能。

Redis一般需要与MongoDB搭配使用，MongoDB做主存储，Redis缓存部分数据应对高性能需求场景。

在uniCloud中，Redis还有一个特点，是它按容量和使用时长计费，访问它不耗费云数据库的读写次数。

Redis的sdk体积不小，没有内置在云函数中。在需要Redis的云函数里，开发者需手动配置Redis扩展库。（Redis没有免费试用，需购买才可以使用）。如何启用扩展库请参考：使用扩展库

示例源码如下，请查看 pre > code 标签中的内容

因为Redis在云函数的内网中，所以只能在云端云函数中访问，而不能在本地云函数中访问。每次调试Redis相关功能需要不断的上传云函数，严重影响开发效率。自HBuilderX 3.4.10起，本地云函数可以通过云端内置代理访问云端Redis。如果在本地调用云端Redis的话会在云函数日志内看到HBuilderX运行调试Redis的代理请求字样。

Redis中数据被存储为key-value形式，key均为字符串，value有以下几种类型

字符串类型，这是最简单Redis类型。需要注意的是Redis并没有number类型，如果存入number类型的数据最终也会转为string类型。

示例源码如下，请查看 pre > code 标签中的内容

列表类型，类似JavaScript中的数组，但是有区别。严格来说List是基于链表实现的，和js中数组相比一个显著的差异就是头部插入的效率。如果你测试过往一个长度百万的数组最前面插入一位的话，你会发现这个操作会耗时很久。但是List并没有这个问题，对于List来说在前后插入数据耗时是一样的。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

集合是String的无序排列，集合内的元素不可重复

示例源码如下，请查看 pre > code 标签中的内容

有序集合和集合一样也是string类型元素的集合，且不允许重复的成员。不同的是每个元素将有一个double类型的分数（分数不一定是连续的），用于对元素进行排序

示例源码如下，请查看 pre > code 标签中的内容

一个集合（指的是 Object 的聚合，可以包含重复元素）中不重复元素的个数。例如集合 {1,3,5,1,3}，它有5个元素，但它的基数为3。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

是一串连续的二进制数组（0和1），可以通过偏移量（offset）定位元素。BitMap通过最小的单位bit来进行0|1的设置，表示某个元素的值或者状态，时间复杂度为O(1)。

示例源码如下，请查看 pre > code 标签中的内容

此处仅列举常见命令，完整命令支持请查看redis官方文档

示例源码如下，请查看 pre > code 标签中的内容

此接口返回获取到的数据（字符串类型），返回null表示无此键

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串类型'OK'表示操作成功，返回null表示未更新

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回截取得到的子字符串表示操作成功，返回空字符串表示未匹配

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串类型'OK'表示操作成功，返回null表示未更新

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串类型'OK'表示操作成功，返回null表示未更新

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口按传入顺序返回获取到的数据组成的数组，存在的键返回字符串类型，不存在的键返回null

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口返回字符串长度，不存在的key会返回0

示例源码如下，请查看 pre > code 标签中的内容

批量设置键值，当且仅当所有给定 key 都不存在。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置key对应字符串value，并且设置key在给定的milliseconds（毫秒）时间之后超时过期

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加一操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加操作后的值（number类型）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行减1操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回执行加一操作后的值（number类型）

操作的值并非整数形式（例：字符串"1"是整数形式，字符串"a"非整数形式）时会直接抛出错误

示例源码如下，请查看 pre > code 标签中的内容

如果 key 已经存在并且是一个字符串， APPEND 命令将指定的 value 追加到该 key 原来值（value）的末尾。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口返回数字1表示删除成功，数字0表示键不存在删除失败

示例源码如下，请查看 pre > code 标签中的内容

用于序列化给定 key ，并返回被序列化的值。

示例源码如下，请查看 pre > code 标签中的内容

key不存在返回null，存在返回序列化后的值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果key存在返回数字1，如果key不存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

EXPIREAT 的作用和 EXPIRE 类似，都用于为 key 设置过期时间。 不同在于 EXPIREAT 命令接受的时间参数是 UNIX 时间戳(unix timestamp)。

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

这个命令和 expire 命令的作用类似，但是它以毫秒为单位设置 key 的生存时间，而不像 expire 命令那样，以秒为单位。

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

设置 key 过期时间的时间戳(unix timestamp) 以毫秒计

示例源码如下，请查看 pre > code 标签中的内容

如果成功设置过期时间返回数字1，如果未成功存在返回数字0

示例源码如下，请查看 pre > code 标签中的内容

支付宝云不支持keys命令，请使用scan 代替

查找所有符合给定模式 pattern 的 key 。

示例源码如下，请查看 pre > code 标签中的内容

符合给定模式的 key 列表 (类型为Array)。

示例源码如下，请查看 pre > code 标签中的内容

移除 key 的过期时间，key 将持久保持。

示例源码如下，请查看 pre > code 标签中的内容

移除过期时间成功返回1， key不存在或者key没有设置过期时间返回0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果没有设置过期时间（永久有效）返回数字-1，如果不存在或者已过期返回数字-2，否则返回剩余秒数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果没有设置过期时间（永久有效）返回数字-1，如果不存在或者已过期返回数字-2，否则返回剩余秒数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

数据库不为空时返回一个 key， 数据库为空时返回 null

示例源码如下，请查看 pre > code 标签中的内容

当 key 和 newkey 相同，或者 key 不存在时，返回一个错误。

当 newkey 已经存在时， rename 命令将覆盖旧值。

示例源码如下，请查看 pre > code 标签中的内容

修改成功返回 OK，key 不存在时返回一个错误

示例源码如下，请查看 pre > code 标签中的内容

仅当 newkey 不存在时，将 key 改名为 newkey 。

示例源码如下，请查看 pre > code 标签中的内容

修改成功返回 1, newKey 存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用法同rpush，仅在list存在时才在List结尾追加数据

移除列表的最后一个元素，并将该元素添加到另一个列表并返回。

示例源码如下，请查看 pre > code 标签中的内容

source存在返回被移除的元素，source 不存在返回 null

示例源码如下，请查看 pre > code 标签中的内容

从List类型数据结尾删除一条数据，并返回删除的值

注意：redis内List长度为0时会被自动删除

示例源码如下，请查看 pre > code 标签中的内容

接口返回此次操作删除的值，如果key不存在则返回null

示例源码如下，请查看 pre > code 标签中的内容

用法同lpush，仅在list存在时才在List开头追加数据

从List类型数据开头删除一条数据，并返回删除的值

注意：redis内List长度为0时会被自动删除

示例源码如下，请查看 pre > code 标签中的内容

接口返回此次操作删除的值，如果key不存在则返回null

在List内指定元素位置前或后插入元素，未匹配到指定元素时不插入

示例源码如下，请查看 pre > code 标签中的内容

接口返回插入后的list长度，未匹配到要查找的值时返回-1，key不存在时此接口返回0

示例源码如下，请查看 pre > code 标签中的内容

接口返回指定下标在list内对应的值，如果key不存在则返回null

示例源码如下，请查看 pre > code 标签中的内容

接口返回list的长度，如果key不存在则返回0

返回列表 key 中指定区间内的元素，区间以偏移量 start 和 stop 指定。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据参数 count 的值，移除列表中与参数 value 相等的元素。

示例源码如下，请查看 pre > code 标签中的内容

key 存在时返回被移除的元素的数量，key 不存在时返回 0

示例源码如下，请查看 pre > code 标签中的内容

将列表 key 下标为 index 的元素的值设置为 value 。

示例源码如下，请查看 pre > code 标签中的内容

key 存在时成功返回 OK，key 不存在时返回错误

示例源码如下，请查看 pre > code 标签中的内容

修剪(trim)一个已存在的 list，这样 list 就会只包含指定范围的指定元素

示例源码如下，请查看 pre > code 标签中的内容

如果 start 下标比列表的最大下标 end ( llen list 减去 1 )还要大，或者 start > stop ， ltrim 返回一个空列表(因为 ltrim 已经将整个列表清空)。

如果 stop 下标比 end 下标还要大，Redis将 stop 的值设置为 end 。

示例源码如下，请查看 pre > code 标签中的内容

移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。

如果列表为空，返回一个 nil 。 否则，返回一个含有两个元素的列表，第一个元素是被弹出元素所属的 key ，第二个元素是被弹出元素的值。

示例源码如下，请查看 pre > code 标签中的内容

列表为空返回 null，否则返回含有两个元素的数组[键名, 值]

示例源码如下，请查看 pre > code 标签中的内容

移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。

假如在指定时间内没有任何元素被弹出，则返回一个 nil 和等待时长。 反之，返回一个含有两个元素的列表，第一个元素是被弹出元素所属的 key ，第二个元素是被弹出元素的值。

示例源码如下，请查看 pre > code 标签中的内容

在指定时间内没有任何元素被弹出，则返回 null 和等待时长，否则返回含有两个元素的数组[键名, 值]

示例源码如下，请查看 pre > code 标签中的内容

从 source 中取出最后一个元素，并插入到 destination 头部；如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。

示例源码如下，请查看 pre > code 标签中的内容

在指定时间内没有任何元素被弹出，则返回 null 和等待时长，否则返回含有两个元素的数组[键名, 值]

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果 key 不存在，将会创建一个新的哈希表并进行 hset 操作。

如果 field 已经存在于哈希表中，旧值将被覆盖。

新创建的 field 返回 1， 覆盖旧值返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

field 不存在时返回 null， 存在返回 field 值

示例源码如下，请查看 pre > code 标签中的内容

同时在一个 key 中设置多个 field-value

示例源码如下，请查看 pre > code 标签中的内容

key 不是hash类型时返回错误，执行成功返回 OK

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回 key 的所有 field 与 value

示例源码如下，请查看 pre > code 标签中的内容

返回 field与value，类型Array

示例源码如下，请查看 pre > code 标签中的内容

删除 key 中指定的一个或多个 field

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

字段存在返回 1， key 不存在或者字段不存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

为 key 中指定的 field 的值加上整数增量 increment

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为 key 中指定的 field 的值加上浮点数增量 increment

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回所有 field；类型Array，key 不存在时返回 空数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回 field 数量，key 不存在时返回 0

示例源码如下，请查看 pre > code 标签中的内容

当 key 中 field 不存在时设置 value，当 field 已存在，该操作无效。

示例源码如下，请查看 pre > code 标签中的内容

设置成功返回 1， field 已存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

返回 key 中所有 field 的 value

示例源码如下，请查看 pre > code 标签中的内容

返回所有 field 的 value，类型Array，key 不存在时返回空数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

将一个或多个 member 加入到集合 key 中，已经在集合中的 member 元素将忽略。

示例源码如下，请查看 pre > code 标签中的内容

返回被添加到集合中的新元素的数量，不包括被忽略的元素。

示例源码如下，请查看 pre > code 标签中的内容

返回集合存储的key的基数(集合中元素的数量)

示例源码如下，请查看 pre > code 标签中的内容

返回集合存储的key的基数，key 不存在时返回 0

示例源码如下，请查看 pre > code 标签中的内容

返回一个集合的全部成员，该集合是所有给定集合之间的差集。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这个命令的作用和 sdiff 类似，但它将结果保存到 destination 集合，而不是简单地返回结果集。

如果 destination 集合已经存在，则将其覆盖。

destination 可以是 key 本身。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回一个集合的全部成员，该集合是所有给定集合的交集。

当给定集合当中有一个空集时，结果也为空集(根据集合运算定律)。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这个命令类似于 sinter 命令，但它将结果保存到 destination 集合，而不是简单地返回结果集。

如果 destination 集合已经存在，则将其覆盖。

destination 可以是 key 本身。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

判断 member 元素是否是集合 key 成员。

示例源码如下，请查看 pre > code 标签中的内容

member 元素是集合的成员返回 1，不是集合成员返回或者 key 不存在返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回集合中的所有成员，类型Array 示例

示例源码如下，请查看 pre > code 标签中的内容

将 member 元素从 source 集合移动到 destination 集合。

示例源码如下，请查看 pre > code 标签中的内容

member 移除成功返回 1，member 不是 source 集合成员，并且没有任何操作对 destination 集合执行，那么返回 0 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回被移除的随机元素。key 不存在或 key 是空集时，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

在集合 key 中随机获取一个或者 count 个元素

示例源码如下，请查看 pre > code 标签中的内容

只提供 key 参数时，返回一个元素；如果集合为空，返回 nil 。

如果提供了 count 参数，那么返回一个数组；如果集合为空，返回空数组。

示例源码如下，请查看 pre > code 标签中的内容

移除集合 key 中的一个或多个 member 元素，不存在的 member 元素会被忽略。

示例源码如下，请查看 pre > code 标签中的内容

返回被成功移除的元素的数量，不包括被忽略的元素。

示例源码如下，请查看 pre > code 标签中的内容

返回一个集合的全部成员，该集合是所有给定集合的并集。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这个命令类似于 sunion 命令，但它将结果保存到 destination 集合，而不是简单地返回结果集。

如果 destination 已经存在，则将其覆盖。

destination 可以是 key 本身。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

将一个或多个 member 元素及其 score 值加入到有序集 key 当中。

如果某个 member 已经是有序集的成员，那么更新这个 member 的 score 值，并通过重新插入这个 member 元素，来保证该 member 在正确的位置上。

示例源码如下，请查看 pre > code 标签中的内容

返回被成功添加的新成员的数量，不包括那些被更新的、已经存在的成员。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当 key 存在且是有序集类型时，返回有序集的基数。 当 key 不存在时，返回 0 。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中， score 值在 min 和 max 之间(默认包括 score 值等于 min 或 max )的成员的数量。

示例源码如下，请查看 pre > code 标签中的内容

返回 score 值在 min 和 max 之间的成员的数量。

示例源码如下，请查看 pre > code 标签中的内容

为有序集 key 的成员 member 的 score 值加上增量 increment 。

示例源码如下，请查看 pre > code 标签中的内容

返回 member 成员的新 score 值，以字符串形式表示。

示例源码如下，请查看 pre > code 标签中的内容

计算给定的一个或多个有序集的交集，其中给定 key 的数量必须以 numkeys 参数指定，并将该交集(结果集)储存到 destination 。

示例源码如下，请查看 pre > code 标签中的内容

返回保存到 destination 的结果集的基数。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中，指定区间内的成员。

示例源码如下，请查看 pre > code 标签中的内容

返回指定区间内，带有 score 值(可选)的有序集成员的列表，类型Array

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中成员 member 的排名。其中有序集成员按 score 值递增(从小到大)顺序排列。

示例源码如下，请查看 pre > code 标签中的内容

如果 member 是有序集 key 的成员，返回 member 的排名。

如果 member 不是有序集 key 的成员，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

移除有序集 key 中的一个或多个成员，不存在的成员将被忽略。

示例源码如下，请查看 pre > code 标签中的内容

返回被成功移除的成员的数量，不包括被忽略的成员。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集 key 中，指定区间内的成员，其中成员的位置按 score 值递减(从大到小)来排列。

示例源码如下，请查看 pre > code 标签中的内容

返回指定区间内，带有 score 值(可选)的有序集成员的列表，类型Array。

示例源码如下，请查看 pre > code 标签中的内容

通过字典区间返回有序集合的成员（具有分页功能）（集合按照分值从小到大排序）

示例源码如下，请查看 pre > code 标签中的内容

返回指定区间内，带有 score 值(可选)的有序集成员的列表。

示例源码如下，请查看 pre > code 标签中的内容

返回有序集key中成员member的排名，其中有序集成员按score值从高到低排列。

排名从0开始，也就是说，score值最大的成员排名为0。

示例源码如下，请查看 pre > code 标签中的内容

如果 member 是有序集 key 的成员，返回 member 的排名。 如果 member 不是有序集 key 的成员，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

获取有序集 key 中，成员 member 的 score 值。

示例源码如下，请查看 pre > code 标签中的内容

返回member 成员的 score 值，以字符串形式表示，key 不存在或者 member 不是 key 的成员，返回 null 。

示例源码如下，请查看 pre > code 标签中的内容

计算给定的一个或多个有序集的并集，其中给定 key 的数量必须以 numkeys 参数指定，并将该并集(结果集)储存到 destination 。

示例源码如下，请查看 pre > code 标签中的内容

返回保存到 destination 的结果集的基数。

示例源码如下，请查看 pre > code 标签中的内容

迭代有序集合中的元素（包括元素成员和元素分值）

示例源码如下，请查看 pre > code 标签中的内容

返回包含两个元素的数据 [下次迭代的新游标，0代表已结束, [所有被迭代的数据]]

示例源码如下，请查看 pre > code 标签中的内容

添加指定元素到 HyperLogLog 中。

示例源码如下，请查看 pre > code 标签中的内容

如果至少有个元素被添加返回 1， 否则返回 0。

示例源码如下，请查看 pre > code 标签中的内容

返回给定 HyperLogLog 的基数估算值。

示例源码如下，请查看 pre > code 标签中的内容

返回给定 HyperLogLog 的基数值，如果多个 HyperLogLog 则返回基数估值之和。

示例源码如下，请查看 pre > code 标签中的内容

将多个 HyperLogLog 合并为一个 HyperLogLog

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

针对key存储的字符串值，设置或清除指定偏移量offset上的位(bit)

位的设置或清除取决于value值，即1或0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回key对应的字符串，offset 位置的位（bit）

示例源码如下，请查看 pre > code 标签中的内容

返回偏移量offset位置的bit值， key 不存在时或当offset大于值的长度时返回 0

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回bit值为1的数量，如果key不存在，返回0

示例源码如下，请查看 pre > code 标签中的内容

对一个或多个保存二进制位的字符串key进行位元操作，并将结果保存到destkey上。

示例源码如下，请查看 pre > code 标签中的内容

返回保存到 destkey 的字符串的长度（和参数给定的key中最长的字符串长度相等）

示例源码如下，请查看 pre > code 标签中的内容

返回字符串中，从左到右，第一个比特值为bit（0或1）的偏移量

示例源码如下，请查看 pre > code 标签中的内容

返回第一个比特值为指定bit（0或1）的偏移量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

某些情况下需要使用复杂的原子操作以避免高并发下数据修改混乱的问题，这种需求一般可通过执行lua脚本实现。如以下示例，判断redis中不存在key-test时，将其值设置为1；存在且小于10时进行加一操作；大于等于10时不进行操作直接返回。

{0, 1}是lua内的table类型，返回到云函数时会转为数组对应的值为[0, 1]

示例源码如下，请查看 pre > code 标签中的内容

断开redis连接，会等待redis请求执行完成后才断开连接

示例源码如下，请查看 pre > code 标签中的内容

和传统开发不同，云函数实例之间是不互通的，也就是说每个使用redis的函数实例都会和redis建立一个连接，在云函数实例复用时此连接也会复用。

可以利用redis的原子操作保证在高并发下不会超卖，以下为一个简单示例

在抢购活动开始前可以将商品库存同步到redis内，实际业务中可以通过提前访问一次抢购页面加载所有商品来实现。下面通过一个简单的演示代码来实现

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

Example 2 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

Example 3 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

Example 4 (javascript):
```javascript
// 云函数中调用Redis示例
'use strict';
const redis = uniCloud.redis()
exports.main = async (event, context) => {
	const getResult = await redis.get('my-key')
	const setResult = await redis.set('my-key', 'value-test')
	return {
    getResult,
    setResult
  }
};
```

---

## uni-ai | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-ai-intro.html

**Contents:**
- # uni-ai
- # 特点
- # 概念介绍
  - # token
  - # utoken
- # 常见用途场景
- # 合规注意

ai大潮来袭，如何把ai能力引入自己的应用中？几乎是每个开发者都在关心的问题。

uni-ai，定位就是开发者使用ai能力的最佳开发库，更丰富、更易用、更高效。

uni-ai，聚合了国内外各种流行的ai能力。包括

uni-ai支持配置自己在AI厂商处申请的API Key和代理，也支持免配直接使用。

ai能力非常常见的应用场景，有智能客服和自动生成文稿。

uni-ai把这些常见场景对应的应用均已做好，并且开源。开发者可以直接拿走使用。

这些完善的项目，包括了前端页面（全端可用）、云对象、云数据库等全套代码，开箱即用。

在线体验：https://hellouniadmin.dcloud.net.cn/ 。

这是一个集成了uni-cms的uni-admin系统。登录后，左侧内容管理中新建一篇文章，toolbar右上角有ai按钮。注意测试系统的数据会定时清除。

注意这个系统不等于uni-ai，uni-ai是底层的api。uni-cms是集成了uni-ai的开源应用。

ai能力调用，是需要按token数量付费的。token太少会回答不准，太多则费用太高。在反复对话的场景下尤其涉及之前对话记忆多久的问题。uni-im等集成了uni-ai的对话应用，已经内置了平衡策略。开发者无需再编写复杂的代码。

使用简单的js api，快速开始你的ai之旅吧！

示例源码如下，请查看 pre > code 标签中的内容

在大语言模型中，token是指自然语言文本中的最小粒度单位，也就是一个最小的单词或符号。通常情况下，自然语言文本是由一个一个的token组成的，每个token都具备自己的词性、词义等属性。

在训练大语言模型时，会使用一种称为“词向量”的技术，将每个token表示成一个向量形式，这个向量可以包含很多有用的语义信息，比如单词的词性、上下文等。模型通过这些向量来学习和理解自然语言文本，并能够完成各种任务。

在大语言模型处理任务的过程中，输入的文本会被转译为token输入到模型中，而输出则是从token转译到文本。输入token与输出token的合计数量直接影响了大语言模型所消耗的算力，所以业界通常采用基于token数量的计费模式。

也就是一次请求，输入的前文和返回的后文，合计算token总数来计费。

不同的模型在处理文本时分词方法不完全相同，可能存在特定的一句话在不同的模型里面会计算出完全不一样的token数量，此外LLM服务商在处理输入时可能会加入一些额外token。如果服务商调整tokenizer算法也可能会导致token数计算变化。

中文、英文、数字、符号，对应的token数量也不同。

对于连续对话，如果有前文记忆总结，那么总结内容也会消耗token。比如uni-ai-chat模板中已经内置了前文记忆总结功能，会额外消耗token数（如果不进行总结，要不丢失会话记忆，要不多轮对话会因为token数太多无法进行）

不同大语言模型单次请求的token最大数是有上限的，详见开发文档。

举例，同样是输入15个字，返回100个字，在minimax和gpt-3.5-turbo上，token数不一样。

示例源码如下，请查看 pre > code 标签中的内容

鉴于不同厂商及大模型对token的计算方式和定价存在差异，为统一标准、简化计费流程并支持后续接入更多主流厂商与模型，DCloud推出了utoken概念。其本质是一个计量单位，用于统一换算各厂商大模型的token消耗量。通过uni-ai计费网关调用的所有模型，其产生的token数将按特定比例转换为utoken数进行计费。计费网关支持的模型及计费标准 。

现阶段的ai，被称之为AIGC，即生成式ai。我们需要了解它擅长和不擅长的地方，并管理预期。

ai是模糊的、概率的，不是精确的，不要问生成式ai数学题。

从本质来讲，生成式ai不是在回答问题，而是在通过前文预测下文。你的前文可以恰好是一个问题，也可以不是问题。

ai会推理出很多下文并打分，选择最高分的下文返回给你。但“不知道”这个下文的打分往往不如其他胡诌的下文得分高，所以你很少会遇到ai的下文是“不知道”。

ai会使用互联网上的数据进行学习训练，但训练语料不会包含最新实时的知识和互联网上未公开的知识。

虽然ai学习了互联网的知识，但它不是复读机，它把知识压缩形成自己的理解。你的前文和它的理解碰撞出它的下文（所以合适的前文，也就是prompt很重要）。

越好的ai，其知识储备、理解和推理能力越优秀，预测的下文可以更逼近真实，甚至超过普通人的水平。

如对生成内容有较高的准确性要求，一方面使用gpt-4等高级的模型；另一方面需要追加专业甚至私有的语料训练。

gpt-4是目前准确性最高的ai，也是最贵的ai。开发者需根据需求场景选择，一般的文章生成和闲聊，可以不用gpt-4。

另外想得到良好的推理结果，优化prompt前文也非常重要。

国内使用ai，需注意合规性。监管部门并不拒绝使用ai提升生产效率，但对于可能造成社会动员能力、价值观影响等政治问题、以及黄赌毒等违法问题非常敏感。

**Examples:**

Example 1 (javascript):
```javascript
// 因涉及费用，ai能力调用均需在服务器端进行，也就是uniCloud云函数或云对象中
let llmManager = uniCloud.ai.getLLMManager({
  provider: 'azure'
})
await llm.chatCompletion({
  messages: [{
    role: 'user',
    content: '你好，ai'
  }]
})
```

Example 2 (javascript):
```javascript
// 因涉及费用，ai能力调用均需在服务器端进行，也就是uniCloud云函数或云对象中
let llmManager = uniCloud.ai.getLLMManager({
  provider: 'azure'
})
await llm.chatCompletion({
  messages: [{
    role: 'user',
    content: '你好，ai'
  }]
})
```

Example 3 (javascript):
```javascript
// 因涉及费用，ai能力调用均需在服务器端进行，也就是uniCloud云函数或云对象中
let llmManager = uniCloud.ai.getLLMManager({
  provider: 'azure'
})
await llm.chatCompletion({
  messages: [{
    role: 'user',
    content: '你好，ai'
  }]
})
```

Example 4 (javascript):
```javascript
// 因涉及费用，ai能力调用均需在服务器端进行，也就是uniCloud云函数或云对象中
let llmManager = uniCloud.ai.getLLMManager({
  provider: 'azure'
})
await llm.chatCompletion({
  messages: [{
    role: 'user',
    content: '你好，ai'
  }]
})
```

---

## DB Schema扩展js | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql-schema-ext.html

**Contents:**
- # DB Schema扩展js
- # 数据库触发器
  - # 触发器配置
  - # 触发器入参
    - # secondaryCollection
    - # where
    - # docId
    - # rawWhere
    - # rawGeoNear
    - # skip

DB Schema 的json文件无法编程，可编程扩展的js将大大增强schema的控制能力。

过去clientDB里使用action来处理schema.json不足的地方。但action云函数有个安全缺陷，无法禁止客户端发起指定action的调用。

从 HBuilderX 3.6.11+，uniCloud提供了可编程schema，每个${表名}.schema.json旁边都可以配置一个${表名}.schema.ext.js。

schema扩展js在规划中可以实现很多事情，目前仅上线数据库触发器功能。

推荐开发者使用JQL数据库触发器来替代action云函数。

JQL的数据库触发器，用于在执行一段JQL数据库指令（增删改查等）的同时触发相应的操作。

仅限使用JQL来操作数据库，客户端和云端均可以执行JQL。但使用传统MongoDB写法不支持数据库触发器。

由于数据库触发器是在云端执行的，所以clientDB操作数据库时很多不宜写在前端的代码，就可以挪到数据库触发器中实现。

如果把数据库的schema定义好，包括json和ext.js，那么各个业务模块就可以随便安心的调用数据库了，数据一致性逻辑和安全保障将被统一管理，不担心不良业务代码的破坏、不担心哪次调用会漏掉更新时间字段。

在项目的uniCloud/database目录下创建${表名}.schema.ext.js，内容如下。

示例源码如下，请查看 pre > code 标签中的内容

如上配置会在使用jql读取此表内容时触发beforeRead和afterRead。 除这两个时机外还有beforeCount、afterCount、beforeCreate、afterCreate、beforeUpdate、afterUpdate、beforeDelete、afterDelete这些触发时机，后续章节会详细说明

所有触发器均在数据校验、权限校验之后执行，beforeXxx会在实际执行数据库指令之前执行，afterXxx会在实际执行数据库指令之后执行。

触发器的入参有以下几个，不同时机的触发器参数略有不同

仅read操作联表有此参数，新增于 3.7.1

示例源码如下，请查看 pre > code 标签中的内容

read、count、delete、update操作可能有此参数

触发器收到的where参数为转化后的查询条件，可以直接作为参数传给db.collection()和dbJql.collection()的where方法。jql语句使用doc方法时也会转成where，形如：{_id: 'xxx'}

read、delete、update操作可能有此参数，新增于 3.7.0

示例源码如下，请查看 pre > code 标签中的内容

read、delete、update操作可能有此参数，新增于 3.7.0

where或match方法的原始参数，未经jql转化。如果是字符串或使用了数据库方法，则仅能传递给databaseForJQL返回的数据库实例使用，不能传递给database方法返回的数据库实例使用。

示例源码如下，请查看 pre > code 标签中的内容

仅read操作有此参数，新增于 3.7.0

geoNear方法的原始参数，未经jql转化。如果其中query是字符串或使用了数据库方法，则仅能传递给databaseForJQL返回的数据库实例使用，不能传递给database方法返回的数据库实例使用。

仅read操作有此参数，新增于 3.7.0

示例源码如下，请查看 pre > code 标签中的内容

仅read操作有此参数，新增于 3.7.0

示例源码如下，请查看 pre > code 标签中的内容

仅read操作有此参数，新增于 3.7.0

示例源码如下，请查看 pre > code 标签中的内容

field为所有被访问的字段的组成的数组，嵌套的字段会被摊平。未传递field时会返回所有字段

数据库指令add方法的参数和schema内defaultValue、forceDefaultValue合并后的列表。注意为统一数据结构，add方法内只传递一个对象时此参数也是一个仅有一项的数组。

如果在给数据库插入数据前拦截并修改了addDataList的数据，那么插入数据库的就会是新修改的数据。

如果在给数据库修改数据前拦截并修改了updateData的数据，那么更新进数据库的就会是新修改的数据。

本次数据库操作的结果，不同操作返回不同的结构。对result对象的修改会应用到最终返回的结果内

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于判断触发器当前执行的jql语句和方法传入的语句是否等价的方法。

开发者除了使用field、where等分解后的对象，也可以使用isEqualToJql来判断当前执行的JQL语句是什么。

如果单纯使用字符串比较，开发者会遇到单双引号、换行等原因造成比较失败。所以提供了isEqualToJql方法。

示例源码如下，请查看 pre > code 标签中的内容

此方法返回一个bool值，true表示当前执行的jql语句和传入的语句相等，否则为不等

示例源码如下，请查看 pre > code 标签中的内容

此参数为一个空对象，仅用于在before内挂载数据并在after内获取使用

示例源码如下，请查看 pre > code 标签中的内容

为了不增加示例的复杂度，所有权限均设置为true，实际项目中切勿模仿。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

jql触发器内可以使用jql语法操作数据库。

注意：在触发器内再使用jql语法操作数据库还会执行触发器，很容易引发死循环！

为此，uniCloud.databaseForJQL方法增加了参数skipTrigger，用于指定本次数据库操作跳过触发器的执行。

skipTrigger是一个bool值，true跳过执行触发器，false则继续执行触发器。默认为false。

示例源码如下，请查看 pre > code 标签中的内容

我们现在增加一个阅读记录表，schema如下

为了不增加示例的复杂度，所有权限均设置为true，实际项目中切勿模仿。

示例源码如下，请查看 pre > code 标签中的内容

使用jql语法可以自动验证客户端身份，仍以上述article表为例，在afterRead触发器内插入阅读记录。此时会将读者id插入到reader_id字段

示例源码如下，请查看 pre > code 标签中的内容

schema扩展依赖的公共模块和扩展库同样可以被action、validateFunction使用。

内置依赖：目前schema扩展依赖了uni-id或uni-id-common，uni-id 3.0.7及以上版本又依赖了uni-config-center，这两个公共模块是可以在触发器内直接使用的。如果所在服务空间开通了redis，schema扩展内可直接使用redis扩展。

自HBuilderX 3.7.0起，可以在项目的uniCloud/database目录上右键管理schema扩展依赖的公共模块和扩展库。同样在此目录右键选择上传schema扩展Js的配置将配置的依赖同步到云端。

HBuilderX 3.2.7到HBuilderX 3.7.0之间的版本，可通过在要使用的公共模块的package.json内配置"includeInClientDB":true，可以将公共模块和schema扩展关联，HBuilderX 3.7.0及之后的版本不推荐使用此用法

一个在JQL内使用的公共模块的package.json示例如下。

示例源码如下，请查看 pre > code 标签中的内容

通过上述步骤建立起关联关系后，可正常在数据库触发器或action云函数中使用公共模块。

**Examples:**

Example 1 (javascript):
```javascript
module.exports = {
  trigger: {
	// 注册数据表的read前事件
    beforeRead: async function (
	// 确定要监听的什么样的JQL指令
	{
      collection,
      operation,
      where,
      field
    } = {}) {
		// 当上述jql指令被触发时，将执行这里的代码。这里就是普通的uniCloud代码，可以调用uniCloud的各种api。
		console.log("这个触发器被触发了")
    },
    afterRead: async function ({
      collection,
      operation,
      where,
      field
    } = {}) {

    }
  }
}
```

Example 2 (javascript):
```javascript
module.exports = {
  trigger: {
	// 注册数据表的read前事件
    beforeRead: async function (
	// 确定要监听的什么样的JQL指令
	{
      collection,
      operation,
      where,
      field
    } = {}) {
		// 当上述jql指令被触发时，将执行这里的代码。这里就是普通的uniCloud代码，可以调用uniCloud的各种api。
		console.log("这个触发器被触发了")
    },
    afterRead: async function ({
      collection,
      operation,
      where,
      field
    } = {}) {

    }
  }
}
```

Example 3 (javascript):
```javascript
module.exports = {
  trigger: {
	// 注册数据表的read前事件
    beforeRead: async function (
	// 确定要监听的什么样的JQL指令
	{
      collection,
      operation,
      where,
      field
    } = {}) {
		// 当上述jql指令被触发时，将执行这里的代码。这里就是普通的uniCloud代码，可以调用uniCloud的各种api。
		console.log("这个触发器被触发了")
    },
    afterRead: async function ({
      collection,
      operation,
      where,
      field
    } = {}) {

    }
  }
}
```

Example 4 (javascript):
```javascript
module.exports = {
  trigger: {
	// 注册数据表的read前事件
    beforeRead: async function (
	// 确定要监听的什么样的JQL指令
	{
      collection,
      operation,
      where,
      field
    } = {}) {
		// 当上述jql指令被触发时，将执行这里的代码。这里就是普通的uniCloud代码，可以调用uniCloud的各种api。
		console.log("这个触发器被触发了")
    },
    afterRead: async function ({
      collection,
      operation,
      where,
      field
    } = {}) {

    }
  }
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-clientdb-component

文档地址已迁移至：unicloud-db 组件

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=refreshtoken

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## unicloud-city-select 城市选择组件 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-city-select.html

**Contents:**
- # unicloud-city-select 城市选择组件
  - # 介绍
  - # 部署教程
  - # 用法示例
  - # 组件属性
  - # 热门城市
  - # 组件方法
  - # unicloud-city-select的opendb数据表
  - # 常见问题
    - # 城市列表没有数据？

该组件依赖 uni-map-common 公共模块

unicloud-city-select是一个方便用户在应用中快速选择目标城市的组件。

插件市场地址：https://ext.dcloud.net.cn/plugin?name=unicloud-city-select

非unICloud项目需要先开通uniCloud

此插件依赖uniCloud，如果你的项目不是uniCloud项目，需右键项目名 - 创建uniCloud云开发环境 - 选择任意云厂商均可

创建完成后，再右键uniCloud目录，关联空间

右键 cloudfunctions 目录，点击上传所有云函数、公共模块及Actions

等待全部上传成功后，再右键 database 目录，点击初始化云数据库

等待数据库初始化完成，代表云端已部署完成，可以在前端使用了

注意：由于组件是读取数据库表opendb-city-china 进行查询，若表不存在或表内没有数据，则不会显示城市列表，可以右键插件database目录下的opendb-city-china.schema上传Schema（会自动添加城市数据）

示例源码如下，请查看 pre > code 标签中的内容

hotCity的值是一个数组，数组内有2个属性，code和name，如下所示

示例源码如下，请查看 pre > code 标签中的内容

使用这些方法前，需要在组件先声明 ref="citySelect"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

unicloud-city-select需要创建以下表后才能正常运行，可以右键database目录，初始化数据库（如果opendb-city-china表已经存在，但没数据，则需要先删除opendb-city-china表）

unicloud-city-select需要创建以下表后才能正常运行，可以右键database目录，初始化数据库（如果opendb-city-china表已经存在，但没数据，则需要先删除opendb-city-china表）

为了正常使用该组件，请先配置地图Key。地图Key需要在两个地方进行配置：前端配置和云端配置（必须都配置）。

在 manifest.json 文件中点击 Web 配置，选择并配置腾讯地图或高德地图中的任意一个即可。

在 uni-config-center/uni-map/config.js 中进行配置。（没有配置文件就新建）

由于县级市数量比较多，因此在未搜索的情况下，只能选到地级市，当用户直接搜索时，可以搜索到县级市。

**Examples:**

Example 1 (vue):
```vue
<template>
	<view class="page">
		<button type="primary" @click="open()">选择城市</button>
		<view style="margin-top: 20px;">当前城市：{{ city.name }}</view>
		<view style="margin-top: 20px;">城市代码：{{ city.code }}</view>
		<unicloud-city-select ref="citySelect" :hot-city="hotCity" :location="true" @select="select"></unicloud-city-select>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 当前选择的城市
				city: {
					code: "",
					name: "定位中..."
				},
				// 热门城市
				hotCity: [
					{ code: "110100", name: "北京" },
					{ code: "310100", name: "上海" },
					{ code: "330100", name: "杭州" },
					{ code: "440100", name: "广州" },
					{ code: "440300", name: "深圳" },
					{ code: "320100", name: "南京" },
					{ code: "500100", name: "重庆" },
					{ code: "510100", name: "成都" }
				]
			}
		},
		onLoad() {},
		methods: {
			// 点击城市选项
			select(city) {
				this.city = city;
			},
			// 打开城市选择页面
			open() {
				this.$refs.citySelect.open();
			}
		}
	}
</script>

<style lang="scss" scoped>
	.page {
		padding: 15px;
	}
</style>
```

Example 2 (vue):
```vue
<template>
	<view class="page">
		<button type="primary" @click="open()">选择城市</button>
		<view style="margin-top: 20px;">当前城市：{{ city.name }}</view>
		<view style="margin-top: 20px;">城市代码：{{ city.code }}</view>
		<unicloud-city-select ref="citySelect" :hot-city="hotCity" :location="true" @select="select"></unicloud-city-select>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 当前选择的城市
				city: {
					code: "",
					name: "定位中..."
				},
				// 热门城市
				hotCity: [
					{ code: "110100", name: "北京" },
					{ code: "310100", name: "上海" },
					{ code: "330100", name: "杭州" },
					{ code: "440100", name: "广州" },
					{ code: "440300", name: "深圳" },
					{ code: "320100", name: "南京" },
					{ code: "500100", name: "重庆" },
					{ code: "510100", name: "成都" }
				]
			}
		},
		onLoad() {},
		methods: {
			// 点击城市选项
			select(city) {
				this.city = city;
			},
			// 打开城市选择页面
			open() {
				this.$refs.citySelect.open();
			}
		}
	}
</script>

<style lang="scss" scoped>
	.page {
		padding: 15px;
	}
</style>
```

Example 3 (vue):
```vue
<template>
	<view class="page">
		<button type="primary" @click="open()">选择城市</button>
		<view style="margin-top: 20px;">当前城市：{{ city.name }}</view>
		<view style="margin-top: 20px;">城市代码：{{ city.code }}</view>
		<unicloud-city-select ref="citySelect" :hot-city="hotCity" :location="true" @select="select"></unicloud-city-select>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 当前选择的城市
				city: {
					code: "",
					name: "定位中..."
				},
				// 热门城市
				hotCity: [
					{ code: "110100", name: "北京" },
					{ code: "310100", name: "上海" },
					{ code: "330100", name: "杭州" },
					{ code: "440100", name: "广州" },
					{ code: "440300", name: "深圳" },
					{ code: "320100", name: "南京" },
					{ code: "500100", name: "重庆" },
					{ code: "510100", name: "成都" }
				]
			}
		},
		onLoad() {},
		methods: {
			// 点击城市选项
			select(city) {
				this.city = city;
			},
			// 打开城市选择页面
			open() {
				this.$refs.citySelect.open();
			}
		}
	}
</script>

<style lang="scss" scoped>
	.page {
		padding: 15px;
	}
</style>
```

Example 4 (vue):
```vue
<template>
	<view class="page">
		<button type="primary" @click="open()">选择城市</button>
		<view style="margin-top: 20px;">当前城市：{{ city.name }}</view>
		<view style="margin-top: 20px;">城市代码：{{ city.code }}</view>
		<unicloud-city-select ref="citySelect" :hot-city="hotCity" :location="true" @select="select"></unicloud-city-select>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 当前选择的城市
				city: {
					code: "",
					name: "定位中..."
				},
				// 热门城市
				hotCity: [
					{ code: "110100", name: "北京" },
					{ code: "310100", name: "上海" },
					{ code: "330100", name: "杭州" },
					{ code: "440100", name: "广州" },
					{ code: "440300", name: "深圳" },
					{ code: "320100", name: "南京" },
					{ code: "500100", name: "重庆" },
					{ code: "510100", name: "成都" }
				]
			}
		},
		onLoad() {},
		methods: {
			// 点击城市选项
			select(city) {
				this.city = city;
			},
			// 打开城市选择页面
			open() {
				this.$refs.citySelect.open();
			}
		}
	}
</script>

<style lang="scss" scoped>
	.page {
		padding: 15px;
	}
</style>
```

---

## 云数据库相关问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq/db.html

**Contents:**
- # 云数据库相关问题
  - # 微信云开发支持客户端直接操作数据库，uniCloud支持吗？
  - # 如何导入老数据库的数据？
  - # uniCloud云数据库如何实现全文检索
  - # 单次请求超时时间是多久？是否支持调整
  - # MongoDB的版本是多少？
  - # 阿里云数据表和索引已删除，但是创建表或索引时仍提示已到上限
  - # 阿里云数据库慢查询定义是什么
  - # 阿里云请求云函数报错 {“success”:false,”error”:{“code”:”FunctionBizError”,”message”:”InternalBizError:mongo_cell_decision_not_found”}}
  - # 还没有使用就产生了读写次数

uniCloud提供了比微信云开发更优秀的前端操作数据库方案，见：clientDB

uniCloud的云数据库本身就是文档型数据库，可以全文检索。

查询数据时可以传入正则表达式。相比sql的like只有前后的%，正则表达式要强大的多。详情请参考正则表达式查询

当然如果你需要额外配置ElastciSearch等三方数据库，也可以自己找服务器安装这些服务，同步数据，把需要搜索的数据同步过去。

数据表和索引数量有2小时缓存，删除后会在2小时后更新

开发者通过uniCloud web控制台访问数据库会增加少量读写次数

DCloud提供了uni扩展数据库来帮开发者解决高性能、高可用相关问题，详见文档 。

---

## unicloud-map-admin | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-map-admin.html

**Contents:**
- # unicloud-map-admin
  - # 介绍
  - # 使用教程
  - # 配置地图key
  - # unicloud-map-admin的opendb数据表
  - # 常见问题
    - # 点击选择地理位置，不显示地图？
    - # 点击选择地理位置，没有确认按钮？

unicloud-map-admin是unicloud-map组件的admin插件，提供了POI管理，可以在管理端可视化的标记POI。标记的结果存入opendb表，客户端的unicloud-map组件可以自动直接拉取。

插件市场地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map-admin

使用方式简单，只需导入对应的插件至uni-admin项目中即可。

安装unicloud-map-admin插件

在插件市场中找到unicloud-map-admin ，将插件导入至uni-admin 项目中。

如果还未使用过uni-admin，请先在HBuilderX新建项目时选择uni-admin项目。并需要了解uni-admin 的相关知识。

导入unicloud-map-admin插件后，需要先配置地图key

配置地图Key后，运行启动uni-admin，在web管理后台，点击左侧菜单栏的菜单管理，添加“内容管理”菜单。

导入后刷新页面，在uni-admin左侧菜单，可看到地图管理的菜单项，点击即可进入相关页面。

注意：如果刷新页面后没有出现菜单，查看此处菜单是否启用，如下图所示：

打开manifest.json文件，点击Web配置，配置腾讯地图或高德地图任意一个即可

unicloud-map-admin需要创建以下表后才能正常运行，可以右键插件database目录下的opendb-poi.schema.json上传Schema

需要配置地图key，打开manifest.json文件，点击Web配置，配置腾讯地图或高德地图任意一个即可

将以下代码添加到uni-admin的/common/uni.css文件最后一行

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
/* 地图选择top需要大于topWindow的高度 */
.uni-system-choose-location{
	display: block;
	position: fixed;
	left: 0;
	top: 60px;
	width: 100%;
	height: calc(100% - 60px);
	background: #f8f8f8;
}
```

Example 2 (css):
```css
/* 地图选择top需要大于topWindow的高度 */
.uni-system-choose-location{
	display: block;
	position: fixed;
	left: 0;
	top: 60px;
	width: 100%;
	height: calc(100% - 60px);
	background: #f8f8f8;
}
```

Example 3 (css):
```css
/* 地图选择top需要大于topWindow的高度 */
.uni-system-choose-location{
	display: block;
	position: fixed;
	left: 0;
	top: 60px;
	width: 100%;
	height: calc(100% - 60px);
	background: #f8f8f8;
}
```

Example 4 (css):
```css
/* 地图选择top需要大于topWindow的高度 */
.uni-system-choose-location{
	display: block;
	position: fixed;
	left: 0;
	top: 60px;
	width: 100%;
	height: calc(100% - 60px);
	background: #f8f8f8;
}
```

---

## schema2code代码生成系统 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema2code

**Contents:**
- # schema2code代码生成系统
- # 快速上手schema2code生成“通讯录”
  - # 首先创建“带schema的通讯录”数据表
  - # schema2code
- # 生成页面控件的默认策略
- # label属性
- # component属性
- # group属性
- # 生成级联选择

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

为强化表单的自定义性，DB Schema还扩展了label、componentForEdit、componentForShow、group、order等属性，以控制表单项在界面上的渲染控件。

schema2code不是简单的一键crud生成接口，它直接生成了可运行的页面。

schema2code代码生成系统功能包括：

表单校验工作，在前端和后端都需要做。在过去，这造成重复投入。

开发者修改DB Schema并保存后，云端的校验规则直接生效。

然后开发者需要把这套校验规则导入到前端项目中。即利用本功能。

DCloud提供了uni-forms前端组件，该组件的表单校验规范完全符合DB Schema中的校验规则，实现云端统一。uni-forms组件地址：https://ext.dcloud.net.cn/plugin?id=2773

成品演示地址:http://contacts-demo.dcloud.net.cn/

这里需要选择在前端表单页面出现的字段，无需用户在表单页面提交的字段（如create_date）不应勾选。

这里显示了完整的工程结构。点击右下角的“下载zip”可以把这个工程下载到本地。点击这里的每个文件，在右侧会出现文件相应的代码。

只有自动生成的文件会在右侧显示代码，components目录下的三方库不会在右侧显示代码。

根据DB Schema生成的表单页面，是基于uni-forms组件的，该组件地址：https://ext.dcloud.net.cn/plugin?id=2773

区域D. 扩展校验函数，每个函数是一个文件

区域E. 表单校验规则，和表名一致，每个表一个文件

在修改schema中的校验规则后，云端是直接生效的。前端部分则需要下载这个js文件到本地工程。

如果直接已经下载过，需要二次更新，也可以在右侧复制源码，增量添加到前端工程的校验规则中。

自动生成的表单页面，包括新建页面和编辑页面。这些页面均基于clientDB，可直接使用。

注意：需HBuilderX 3.0.5+ 支持

HBuilderX 3.1.15 schema2code 生成文件结构调整, 生成的 pages.json 改为 page_init.json，确认导入工程时自动合并到项目的 pages.json，page_init.json不会导入到工程中，仅在预览界面显示

HBuilderX 3.1.15 之前的版本 pages.json 导入时会覆盖用户工程中已有的 pages.json，导入确认时选择不导入该文件手动拷贝内容到 pages.json

如果生成uniCloud admin页面，生成的列表页（list），需自行配置【排序字段】和【模糊搜索字段】。语法参考JQL。

以uniCloud admin内置页面【用户列表页】为例，要实现列表按注册时间排倒叙，要在列表上方的搜索框搜索，需在生成的list.vue页面的script区域修改如下配置：

示例源码如下，请查看 pre > code 标签中的内容

schema2code是一个代码辅助生成工具。

DB Schema配置的字段，在生成页面时使用什么组件渲染？决定关系如下：

schema2code作为一个插件，有单独的版本号，详见

可以看到schema2code使用了不少含有-data-中间关键字的组件，这种组件称为datacom组件 ， 它是一种可以包含数据的组件，并基于clientDB实现了云端数据的直接对接。详见

在uni-forms组件 中，每个表单项都被包裹在uni-forms-item中，该子组件可设置label，即，在表单项如输入框前面或上面放置一个说明性名词。

在DB Schema的label属性中设置值后，生成前端表单页面时即可自动给uni-forms-item的label属性赋值。

如果未设置label属性，但配置了title属性，生成前端表单页面时会取title作为前端的label。

定义该字段在表单中使用什么样的组件进行渲染，可设置前端的组件名和初始属性。

这里的表单，指的是数据维护表单，比如新建记录或修改记录的表单。

生成的所有表单项，都在uni-forms组件 下。

示例源码如下，请查看 pre > code 标签中的内容

将多个表单项合并在一个分组里显示。前端渲染时，group相同的表单项会自动合并在一个uni-group组件中，不同分组的表单项之间有间隔。该组件详见：https://ext.dcloud.net.cn/plugin?id=3281

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在这个业务里涉及2个表，一个是用户的地址信息表uni-id-address ，一个是候选的省市区数据表opendb-city-china 。

在用户地址信息表的schema配置enumType和enum。如下：

用户地址表（完整的opendb表为uni-id-address ，以下略做简化）

示例源码如下，请查看 pre > code 标签中的内容

省市区数据表 opendb-city-china 的schema如下。树形数据查询另有详细文档，详见

示例源码如下，请查看 pre > code 标签中的内容

这2个表都是opendb表，在uniCloud web控制台新建表时可以选择。opendb-city-china表自带全国省市区数据。

在web控制台的 用户地址表，选择表结构schema，点schema2code生成页面，在生成的代码中会使用多级联选择组件 <uni-data-picker>，效果是懒加载的，选择省后，会根据省的选择去拉取市的数据。

<uni-data-picker> 组件的文档另见：https://ext.dcloud.net.cn/plugin?id=3796

**Examples:**

Example 1 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

Example 2 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

Example 3 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

Example 4 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

---

## 基础概念@base | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/hellodb?id=dbindex

**Contents:**
- # 基础概念
- # 创建第一个表
- # 数据表的3个组成部分
  - # 数据内容
  - # 数据库索引
  - # 数据表格式定义
- # API操作数据库的方式
- # 获取数据库对象的API
  - # 获取其他服务空间数据库实例
- # 创建集合/表的API

uniCloud提供了一个 JSON 格式的文档型数据库。顾名思义，数据库中的每条记录都是一个 JSON 格式的文档。

它是 nosql 非关系型数据库，如果您之前熟悉 sql 关系型数据库，那么两者概念对应关系如下表：

例如，数据库中有一个表，名为user，存放用户信息。表user的数据内容如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据中，每行数据表示一个用户的信息，被称之为“记录(record/doc)”。name和tel称之为“字段(field)”。而“13900000000”则是第一条记录的字段tel的值。

每行记录，都是一个完整的json文档，获取到记录后可以使用常规json方式操作。但表并非json文档，表是多个json文档的汇总，获取表需要使用专门的API。

与关系型数据库的二维表格式不同，json文档数据库支持不同记录拥有不同的字段、支持多层嵌套数据。

仍然以user表举例，要在数据库中存储每个人的每次登录时间和登录ip，则变成如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据表示张三登录了2次，login_date里的值是时间戳(timestamp)格式，在数据库内timestamp就是一个数字类型的数据。而李四没有登录过。

可以看出json文档数据库相对于关系型数据库的灵活，李四可以没有login_log字段，也可以有这个字段但登录次数记录与张三不同。

此处仅为举例，实际业务中，登录日志单独存放在另一个表更合适

对于初学者，如果不了解数据库设计，可以参考opendb，已经预置了大量常见的数据库设计。

对于不熟悉传统数据库，但掌握json的js工程师而言，uniCloud的云数据库更亲切，没有传统数据库高昂的学习成本。

在uniCloud web控制台新建表时，在下面的模板中也可以选择各种opendb表模板，直接创建。

uniCloud同时支持阿里云、腾讯云和支付宝云，它们的数据库大体相同，有细微差异。阿里云和支付宝云的数据库是mongoDB4.0，腾讯云则使用自研的文档型数据库（兼容mongoDB 4.0版本）。uniCloud基本抹平了不同云厂商的差异，有差异的部分会在文档中单独标注。

打开 uniCloud web控制台 https://unicloud.dcloud.net.cn/

创建或进入一个已存在的服务空间，选择 云数据库->云数据库，创建一个新表

比如我们创建一个简历表，名为 resume。点击上方右侧的 创建 按钮即可。

新建表时，支持选择现成的 opendb 表模板，选择一个或多个模板表，可以点击右下方按钮创建。

在uniCloud的web控制台可以看到一个数据表的3部分内容。

data，就是存放的数据记录(record)。里面是一条一条的json文档。

record可以增删改查、排序统计。后续有API介绍。

可以先在 web控制台 为之前的 resume 表创建一条记录。

示例源码如下，请查看 pre > code 标签中的内容

创建一条新记录，是不管在web控制台创建，还是通过API创建，每条记录都会自带一个_id字段用以作为该记录的唯一标志。

_id字段是每个数据表默认自带且不可删除的字段。同时，它也是数据表的索引。

阿里云使用的是标准的mongoDB，_id是自增的，后创建的记录的_id总是大于先生成的_id。传统数据库的自然数自增字段在多物理机的大型数据库下很难保持同步，大型数据库均使用_id这种长度较长、不会重复且仍然保持自增规律的方式。

腾讯云使用的是兼容mongoDB的自研数据库，_id并非自增

插入/导入数据时也可以自行指定_id而不使用自动生成的_id，这样可以很方便的将其他数据库的数据迁移到uniCloud云数据库。

所谓索引，是指在数据表的众多字段中挑选一个或多个字段，让数据库引擎优先处理这些字段。

设置为索引的字段，在通过该字段查询(where)或排序(orderBy)时可以获得更快的查询速度。

但设置过多索引也不合适，会造成数据新增和删除变慢。

唯一型索引要求整个数据表多个记录的该字段的值不能重复。比如_id就是唯一型索引。

假使有2个人都叫“张三”，那么他们在user数据表里的区分就是依靠不同的_id来区分。

如果我们要根据name字段来查询，为了提升查询速度，此时可以把name字段设为非唯一索引。

索引内容较多，还有“组合索引”、“稀疏索引”、“地理位置索引”、“TTL索引”等概念。有单独的文档详细讲述索引，另见：数据库索引

DB Schema是表结构描述。描述数据表有哪些字段、值域类型是什么、是否必填、数据操作权限等很多内容。

因为 MongoDB 的灵活性，理论上DB Schema不是必须的，使用传统 MongoDB API 操作数据库不需要DB Schema。

但如果使用 JQL，那DB Schema就是必须的。

DB Schema涉及内容较多，另见文档：https://uniapp.dcloud.io/uniCloud/schema

uniCloud 的云数据库有多种操作方式。

uniCloud 默认推荐使用 JQL 语法操作数据库，它是一种更简单易用、对js开发者更友好的、开发效率更高的数据库操作语法。详见

不管在云函数中还是在uni-app客户端中，均支持JQL。

同时 uniCloud 保留了在云函数中使用传统 MongoDB 的 nodejs API 操作云数据库。

优先使用客户端操作数据库（称为clientDB）

传统开发中，其实大多数服务器接口开发，就是检验下前端数据和身份的合法性，然后写个SQL操作下数据库，返回JSON给前端。其实很无聊。

clientDB最大的好处就是不用写服务端代码，客户端直接操作数据库。因为uniCloud提供了DB Schema和uni-id，可以直接控制数据库的内容和权限校验。

clientDB同时支持action云函数作为补充，当发起一个客户端操作云数据库的请求时，可以同时触发一个action云函数，在云端对数据库操作进行前置或后置处理。

对于clientDB不适应的场景，推荐在云函数或云对象中使用JQL。

目前云函数中JQL不适用的场景：使用 set 操作符动态修改字段名称（不是字段值）。这个场景常规业务不涉及，未来JQL可能会完善并支持这个场景。

除非开发者原本就对 nodejs 操作 MongoDB 非常熟悉，且需要使用 set 操作符动态修改字段名等，否则不推荐使用传统MongoDB写法。

MongoDB API操作数据库，不能在客户端操作、不支持 DB Schema，不支持HBuilderX的jql查询器，不能在客户端的代码提示中提示数据库的表名、字段。

不管使用哪种方法，都有很多公共的概念或功能。本文档将讲述这些公共的内容。

同时左侧导航有三种方法的专项链接，描述它们各自特有的功能。

想要通过代码操作数据库，第一步要获取服务空间里的数据库对象。

示例源码如下，请查看 pre > code 标签中的内容

js中敲下代码块cdb，即可快速输入上述代码。

其中，云函数内使用JQL扩展库时，还需要做一个工作，就是指定操作用户身份。详见

示例源码如下，请查看 pre > code 标签中的内容

如果当前应用仅使用一个服务空间，在HBuilderX中做好服务空间关联即可。获取当前空间的数据库实例时无需传递配置，直接调用database方法默认就是操作关联服务空间的数据库。

如果应用有连接其他服务空间数据库的需求，可以在获取database实例时传递对应服务空间的配置

HBuilderX 3.2.11及更高版本支持客户端初始化其他服务空间database实例，此前仅腾讯云云函数环境支持。阿里云云函数环境不支持此用法。

调用uniCloud.database()时可以传入对应的服务空间信息（参数同uniCloud.init，参考:uniCloud.init）来获取指定服务空间的database实例。

示例源码如下，请查看 pre > code 标签中的内容

调用add方法，给某数据表新增数据记录时，如果该数据表不存在，会自动创建该数据表。如下代码给table1数据表新增了一条数据，如果table1不存在，会自动创建。

示例源码如下，请查看 pre > code 标签中的内容

腾讯云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

支付宝云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

创建好数据表后，可以通过API获取数据表对象。

示例源码如下，请查看 pre > code 标签中的内容

集合/数据表 Collection 的方法

通过 db.collection(name) 可以获取指定数据表的引用，在数据表上可以进行以下操作

collection对象的方法可以增和查数据，删和改不能直接操作，需要collection对象通过doc或get得到指定的记录后再调用remove或update方法进行删改。

这里我们使用clientDB，实现一个简单的在前端获取刚才输入 resume 表的记录的功能。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema的数据类型有专门文档，详见

Date 类型用于表示时间，精确到毫秒，可以用 JavaScript 内置 Date 对象创建。需要特别注意的是，连接本地云函数时，用此方法创建的时间是客户端当前时间，不是服务端当前时间，只有连接云端云函数才是服务端当前时间。

另外，我们还单独提供了一个 API 来创建服务端当前时间，使用 serverDate 对象来创建一个服务端当前时间的标记，该对象暂时只支持腾讯云空间，当使用了 serverDate 对象的请求抵达服务端处理时，该字段会被转换成服务端当前的时间，更棒的是，我们在构造 serverDate 对象时还可通过传入一个有 offset 字段的对象来标记一个与当前服务端时间偏移 offset 毫秒的时间，这样我们就可以达到比如如下效果：指定一个字段为服务端时间往后一个小时。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

不同于传统开发，连接数据库有单次操作时长限制，目前单次操作时间限制如下。超出此时间会报超时错误。一般情况下在设置了合适的索引时不会遇到超时错误，如何优化查询速度请参考：数据库性能优化

如果是大数据批处理，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

uniCloud数据库提供了多种数据导入导出和备份方案。

除上述三种方法外，开发者还可以编程处理数据的导入导出。如进行大量数据操作，建议在HBuilderX的本地运行云函数环境中操作，这样可以避免触发云端的云函数超时限制。

旧规范中的db_init.json废弃，但是仍保留db_init.json上的初始化菜单，对db_init.json文件执行初始化操作时，其中的初始化数据、索引、schema会被拆分成多个文件。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

HBuilderX 3.97及以上版本，uniCloud内database目录支持直接右键进行数据库初始化。database目录下支持以下几种文件类型

在执行数据库初始化操作时，上述文件都会被上传到云端。

web控制台导出时默认不包括_id字段，在导入时，数据库插入新记录时会自动补_id字段。如果需要指定_id，需要手工补足数据。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

注意下面的示例仅为演示，实际配置时不要带注释

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.97及之后版本需要拆分为上面一种方式对应的文件，可以在项目管理器选中db_init.json右键初始化数据库时自动拆分。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

db_init.json定义了一个json格式，里面包含了表名、表数据、表索引等表的相关数据。

在HBuilderX中，项目的cloudfunctions目录（HBuilderX 2.5.11 - 2.9.11版本） 或 uniCloud/database 目录（HBuilderX 3.0+版本），可以放置db_init.json文件，对该文件点右键，可以按db_init.json的描述，在云服务空间创建相应的表、初始化表中的数据、索引和schema。

这个功能尤其适合插件作者，可以快速初始化插件所需的数据库环境。

db_init.json包含三部分：数据内容(data)、数据表索引(index)、数据表结构(schema)，形式如下

注意：HBuilderX 3.0.0以上版本schema不再放在db_init.json内，而是独立放在uniCloud/database/目录下。

HBuilderX 3.0.0版本之前的db_init.json示例

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中对上述db_init.json点右键，可初始化数据库到云服务空间，创建collection_test表，并按上述json配置设置该表的index索引和schema，以及插入data下的数据。

opendb的表，在db_init.json中初始化时，不建议自定义index和schema。系统会自动从opendb规范中读取最新的index和schema。

在HBuilderX中，对项目下的cloudfunctions目录下的db_init.json点右键，即可选择初始化云数据库。将db_init.json里的内容导入云端。

在uniCloud web控制台的数据库界面，左侧导航点击 生成db_init.json，会将选择的表的内容、索引、表结构导出为db_init.json文件。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

uniCloud会在每天凌晨自动备份一次数据库，最多保留7天。这让开发者不再担心数据丢失。

此功能主要用于导出整个表的数据，导出文件为jsonl格式

jsonl格式示例，形如下面这样每行一个json格式的数据库记录的文件

示例源码如下，请查看 pre > code 标签中的内容

uniCloud提供的db_init.json主要是为了对数据库进行初始化，并不适合导入大量数据。与db_init.json不同，数据导入功能可以导入大量数据，目前支持导入 CSV、JSON 格式（关于json格式看下面注意事项）的文件数据。

如果是自己拼接的json格式数据请注意：如果存在表A关联表B的字段的场景需要保证关联字段在A、B内是一致的（特别需要注意的是各种与_id关联的字段）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 2 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 3 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 4 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

---

## openDB | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/opendb.html

**Contents:**
- # openDB
- # 需求背景
- # openDB中的已有规范
- # 预置数据
- # 数据表升级
- # 如何引入到自己的服务空间
- # 欢迎参与
- # 注意事项

数据库设计，是数字经济的基础，是重要的软基建。

openDB，是一套开放的数据表设计规范，包括了表名、字段等schema定义以及初始数据。

以用户表为例，它约定了一个标准用户表的表名和字段定义，并且基于nosql的特性，可以由开发者自行扩展字段。

openDB是uniCloud 的重要软基建，支撑uniCloud数字生态的发展。

uni-id的账户统一，是openDB的成功实践。基于uni-id规范，有电商插件、有IM插件、有PC管理插件，开发者可以方便的把这些插件整合到自己的同一应用中。

目前openDB已经支持几十张表。可以在https://gitee.com/dcloud/opendb/tree/master/collection 查看。

openDB不仅支持定义常用的数据表字段，还可以预置初始化数据。

比如，opendb-city-china 是opendb中定义好的中国城市字典表，它的定义分为两个部分：

你通过uniCloud web控制台 创建openDB表时，uniCloud会自动校验该opendb表定义中是否包含data.json，若包含，则在创建表定义后，自动导入data.json。

如果你的 HBuilderX 项目中，uniCloud/database目录下定义的数据表中含有opendb表定义，则对该opendb表执行上传DB Schema操作时，uniCloud服务端会判断该opendb表是否已存在：

openDB数据表在后续的更新迭代中，可能会涉及到schema及预置数据的变更。自HBuilderX 3.5.1之后，opendb表支持检查更新。

以opendb-city-china 为例，当我们要修改或补充城市时，为了兼容已部署的数据表，应提供差量数据，这时我们需要做的是：

比如行政区域的撤销或设立需要数据升级，并且定义升级后的版本号为0.0.2，这时需要将差量数据以JQL语句的形式写入文件opendb-city-china/collection.update-0.0.1-0.0.2.jql中，并更新opendb-city-china/package.json的version字段。

在uniCloud web控制台 ，新建表时，可直接选择所有openDB的表。

首先选分类，每个分类下又有若干表，表结构和预置数据可直接预览。支持多个表一起创建。

openDB的表，不应修改表名，修改后就无法与其他插件连同了。

openDB是一个持续发展的、由开发者共建的规范。DCloud欢迎各个业务领域的专业开发者提供规范。

开发者通过提pr的方式，给openDB添加规范，或者给已有规范的表添加字段，或者添加初始化数据。gitee支持轻量pr，尤其适合共同编辑规范。

---

## 基础概念@base | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/hellodb?id=db-init

**Contents:**
- # 基础概念
- # 创建第一个表
- # 数据表的3个组成部分
  - # 数据内容
  - # 数据库索引
  - # 数据表格式定义
- # API操作数据库的方式
- # 获取数据库对象的API
  - # 获取其他服务空间数据库实例
- # 创建集合/表的API

uniCloud提供了一个 JSON 格式的文档型数据库。顾名思义，数据库中的每条记录都是一个 JSON 格式的文档。

它是 nosql 非关系型数据库，如果您之前熟悉 sql 关系型数据库，那么两者概念对应关系如下表：

例如，数据库中有一个表，名为user，存放用户信息。表user的数据内容如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据中，每行数据表示一个用户的信息，被称之为“记录(record/doc)”。name和tel称之为“字段(field)”。而“13900000000”则是第一条记录的字段tel的值。

每行记录，都是一个完整的json文档，获取到记录后可以使用常规json方式操作。但表并非json文档，表是多个json文档的汇总，获取表需要使用专门的API。

与关系型数据库的二维表格式不同，json文档数据库支持不同记录拥有不同的字段、支持多层嵌套数据。

仍然以user表举例，要在数据库中存储每个人的每次登录时间和登录ip，则变成如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据表示张三登录了2次，login_date里的值是时间戳(timestamp)格式，在数据库内timestamp就是一个数字类型的数据。而李四没有登录过。

可以看出json文档数据库相对于关系型数据库的灵活，李四可以没有login_log字段，也可以有这个字段但登录次数记录与张三不同。

此处仅为举例，实际业务中，登录日志单独存放在另一个表更合适

对于初学者，如果不了解数据库设计，可以参考opendb，已经预置了大量常见的数据库设计。

对于不熟悉传统数据库，但掌握json的js工程师而言，uniCloud的云数据库更亲切，没有传统数据库高昂的学习成本。

在uniCloud web控制台新建表时，在下面的模板中也可以选择各种opendb表模板，直接创建。

uniCloud同时支持阿里云、腾讯云和支付宝云，它们的数据库大体相同，有细微差异。阿里云和支付宝云的数据库是mongoDB4.0，腾讯云则使用自研的文档型数据库（兼容mongoDB 4.0版本）。uniCloud基本抹平了不同云厂商的差异，有差异的部分会在文档中单独标注。

打开 uniCloud web控制台 https://unicloud.dcloud.net.cn/

创建或进入一个已存在的服务空间，选择 云数据库->云数据库，创建一个新表

比如我们创建一个简历表，名为 resume。点击上方右侧的 创建 按钮即可。

新建表时，支持选择现成的 opendb 表模板，选择一个或多个模板表，可以点击右下方按钮创建。

在uniCloud的web控制台可以看到一个数据表的3部分内容。

data，就是存放的数据记录(record)。里面是一条一条的json文档。

record可以增删改查、排序统计。后续有API介绍。

可以先在 web控制台 为之前的 resume 表创建一条记录。

示例源码如下，请查看 pre > code 标签中的内容

创建一条新记录，是不管在web控制台创建，还是通过API创建，每条记录都会自带一个_id字段用以作为该记录的唯一标志。

_id字段是每个数据表默认自带且不可删除的字段。同时，它也是数据表的索引。

阿里云使用的是标准的mongoDB，_id是自增的，后创建的记录的_id总是大于先生成的_id。传统数据库的自然数自增字段在多物理机的大型数据库下很难保持同步，大型数据库均使用_id这种长度较长、不会重复且仍然保持自增规律的方式。

腾讯云使用的是兼容mongoDB的自研数据库，_id并非自增

插入/导入数据时也可以自行指定_id而不使用自动生成的_id，这样可以很方便的将其他数据库的数据迁移到uniCloud云数据库。

所谓索引，是指在数据表的众多字段中挑选一个或多个字段，让数据库引擎优先处理这些字段。

设置为索引的字段，在通过该字段查询(where)或排序(orderBy)时可以获得更快的查询速度。

但设置过多索引也不合适，会造成数据新增和删除变慢。

唯一型索引要求整个数据表多个记录的该字段的值不能重复。比如_id就是唯一型索引。

假使有2个人都叫“张三”，那么他们在user数据表里的区分就是依靠不同的_id来区分。

如果我们要根据name字段来查询，为了提升查询速度，此时可以把name字段设为非唯一索引。

索引内容较多，还有“组合索引”、“稀疏索引”、“地理位置索引”、“TTL索引”等概念。有单独的文档详细讲述索引，另见：数据库索引

DB Schema是表结构描述。描述数据表有哪些字段、值域类型是什么、是否必填、数据操作权限等很多内容。

因为 MongoDB 的灵活性，理论上DB Schema不是必须的，使用传统 MongoDB API 操作数据库不需要DB Schema。

但如果使用 JQL，那DB Schema就是必须的。

DB Schema涉及内容较多，另见文档：https://uniapp.dcloud.io/uniCloud/schema

uniCloud 的云数据库有多种操作方式。

uniCloud 默认推荐使用 JQL 语法操作数据库，它是一种更简单易用、对js开发者更友好的、开发效率更高的数据库操作语法。详见

不管在云函数中还是在uni-app客户端中，均支持JQL。

同时 uniCloud 保留了在云函数中使用传统 MongoDB 的 nodejs API 操作云数据库。

优先使用客户端操作数据库（称为clientDB）

传统开发中，其实大多数服务器接口开发，就是检验下前端数据和身份的合法性，然后写个SQL操作下数据库，返回JSON给前端。其实很无聊。

clientDB最大的好处就是不用写服务端代码，客户端直接操作数据库。因为uniCloud提供了DB Schema和uni-id，可以直接控制数据库的内容和权限校验。

clientDB同时支持action云函数作为补充，当发起一个客户端操作云数据库的请求时，可以同时触发一个action云函数，在云端对数据库操作进行前置或后置处理。

对于clientDB不适应的场景，推荐在云函数或云对象中使用JQL。

目前云函数中JQL不适用的场景：使用 set 操作符动态修改字段名称（不是字段值）。这个场景常规业务不涉及，未来JQL可能会完善并支持这个场景。

除非开发者原本就对 nodejs 操作 MongoDB 非常熟悉，且需要使用 set 操作符动态修改字段名等，否则不推荐使用传统MongoDB写法。

MongoDB API操作数据库，不能在客户端操作、不支持 DB Schema，不支持HBuilderX的jql查询器，不能在客户端的代码提示中提示数据库的表名、字段。

不管使用哪种方法，都有很多公共的概念或功能。本文档将讲述这些公共的内容。

同时左侧导航有三种方法的专项链接，描述它们各自特有的功能。

想要通过代码操作数据库，第一步要获取服务空间里的数据库对象。

示例源码如下，请查看 pre > code 标签中的内容

js中敲下代码块cdb，即可快速输入上述代码。

其中，云函数内使用JQL扩展库时，还需要做一个工作，就是指定操作用户身份。详见

示例源码如下，请查看 pre > code 标签中的内容

如果当前应用仅使用一个服务空间，在HBuilderX中做好服务空间关联即可。获取当前空间的数据库实例时无需传递配置，直接调用database方法默认就是操作关联服务空间的数据库。

如果应用有连接其他服务空间数据库的需求，可以在获取database实例时传递对应服务空间的配置

HBuilderX 3.2.11及更高版本支持客户端初始化其他服务空间database实例，此前仅腾讯云云函数环境支持。阿里云云函数环境不支持此用法。

调用uniCloud.database()时可以传入对应的服务空间信息（参数同uniCloud.init，参考:uniCloud.init）来获取指定服务空间的database实例。

示例源码如下，请查看 pre > code 标签中的内容

调用add方法，给某数据表新增数据记录时，如果该数据表不存在，会自动创建该数据表。如下代码给table1数据表新增了一条数据，如果table1不存在，会自动创建。

示例源码如下，请查看 pre > code 标签中的内容

腾讯云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

支付宝云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

创建好数据表后，可以通过API获取数据表对象。

示例源码如下，请查看 pre > code 标签中的内容

集合/数据表 Collection 的方法

通过 db.collection(name) 可以获取指定数据表的引用，在数据表上可以进行以下操作

collection对象的方法可以增和查数据，删和改不能直接操作，需要collection对象通过doc或get得到指定的记录后再调用remove或update方法进行删改。

这里我们使用clientDB，实现一个简单的在前端获取刚才输入 resume 表的记录的功能。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema的数据类型有专门文档，详见

Date 类型用于表示时间，精确到毫秒，可以用 JavaScript 内置 Date 对象创建。需要特别注意的是，连接本地云函数时，用此方法创建的时间是客户端当前时间，不是服务端当前时间，只有连接云端云函数才是服务端当前时间。

另外，我们还单独提供了一个 API 来创建服务端当前时间，使用 serverDate 对象来创建一个服务端当前时间的标记，该对象暂时只支持腾讯云空间，当使用了 serverDate 对象的请求抵达服务端处理时，该字段会被转换成服务端当前的时间，更棒的是，我们在构造 serverDate 对象时还可通过传入一个有 offset 字段的对象来标记一个与当前服务端时间偏移 offset 毫秒的时间，这样我们就可以达到比如如下效果：指定一个字段为服务端时间往后一个小时。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

不同于传统开发，连接数据库有单次操作时长限制，目前单次操作时间限制如下。超出此时间会报超时错误。一般情况下在设置了合适的索引时不会遇到超时错误，如何优化查询速度请参考：数据库性能优化

如果是大数据批处理，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

uniCloud数据库提供了多种数据导入导出和备份方案。

除上述三种方法外，开发者还可以编程处理数据的导入导出。如进行大量数据操作，建议在HBuilderX的本地运行云函数环境中操作，这样可以避免触发云端的云函数超时限制。

旧规范中的db_init.json废弃，但是仍保留db_init.json上的初始化菜单，对db_init.json文件执行初始化操作时，其中的初始化数据、索引、schema会被拆分成多个文件。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

HBuilderX 3.97及以上版本，uniCloud内database目录支持直接右键进行数据库初始化。database目录下支持以下几种文件类型

在执行数据库初始化操作时，上述文件都会被上传到云端。

web控制台导出时默认不包括_id字段，在导入时，数据库插入新记录时会自动补_id字段。如果需要指定_id，需要手工补足数据。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

注意下面的示例仅为演示，实际配置时不要带注释

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.97及之后版本需要拆分为上面一种方式对应的文件，可以在项目管理器选中db_init.json右键初始化数据库时自动拆分。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

db_init.json定义了一个json格式，里面包含了表名、表数据、表索引等表的相关数据。

在HBuilderX中，项目的cloudfunctions目录（HBuilderX 2.5.11 - 2.9.11版本） 或 uniCloud/database 目录（HBuilderX 3.0+版本），可以放置db_init.json文件，对该文件点右键，可以按db_init.json的描述，在云服务空间创建相应的表、初始化表中的数据、索引和schema。

这个功能尤其适合插件作者，可以快速初始化插件所需的数据库环境。

db_init.json包含三部分：数据内容(data)、数据表索引(index)、数据表结构(schema)，形式如下

注意：HBuilderX 3.0.0以上版本schema不再放在db_init.json内，而是独立放在uniCloud/database/目录下。

HBuilderX 3.0.0版本之前的db_init.json示例

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中对上述db_init.json点右键，可初始化数据库到云服务空间，创建collection_test表，并按上述json配置设置该表的index索引和schema，以及插入data下的数据。

opendb的表，在db_init.json中初始化时，不建议自定义index和schema。系统会自动从opendb规范中读取最新的index和schema。

在HBuilderX中，对项目下的cloudfunctions目录下的db_init.json点右键，即可选择初始化云数据库。将db_init.json里的内容导入云端。

在uniCloud web控制台的数据库界面，左侧导航点击 生成db_init.json，会将选择的表的内容、索引、表结构导出为db_init.json文件。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

uniCloud会在每天凌晨自动备份一次数据库，最多保留7天。这让开发者不再担心数据丢失。

此功能主要用于导出整个表的数据，导出文件为jsonl格式

jsonl格式示例，形如下面这样每行一个json格式的数据库记录的文件

示例源码如下，请查看 pre > code 标签中的内容

uniCloud提供的db_init.json主要是为了对数据库进行初始化，并不适合导入大量数据。与db_init.json不同，数据导入功能可以导入大量数据，目前支持导入 CSV、JSON 格式（关于json格式看下面注意事项）的文件数据。

如果是自己拼接的json格式数据请注意：如果存在表A关联表B的字段的场景需要保证关联字段在A、B内是一致的（特别需要注意的是各种与_id关联的字段）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 2 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 3 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 4 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=where

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## unicloud-map 云端一体组件 uni-app x | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-map-x.html

**Contents:**
- # unicloud-map 云端一体组件 uni-app x
  - # 介绍
  - # 用法示例
    - # 简易示例
    - # 渲染静态POI
    - # 渲染动态POI
  - # 地图Key配置
  - # 组件属性
  - # loadtime
  - # 组件方法

该组件依赖 uni-map-common 公共模块

本文档适用于客户端为 uni-app x 的版本，若客户端为 uni-app 则请访问：unicloud-map 文档

基于地图的位置服务，是移动应用的特色场景，但过去开发一个地图类应用非常麻烦。需要对接地图厂商的客户端API、服务器API，再编写自己的业务逻辑。

unicloud的MongoDB数据库，对地理位置查询，提供了比传统数据库更方便的GEO查询方案，比如可以直接查询附近的POI信息。（Point of Interest，地图上的兴趣点）

DCloud之前已推出各种云端一体组件，基于datacom规范 ，组件在客户端可以直接连数据库。

现在进一步封装了地图的datacom组件，将前端地图组件和云端数据库连起来，只需写一个<unicloud-map>组件，就可以直接从数据库里拉出附近的POI信息，并显示在地图上。

在uni-admin中，还提供了POI编辑插件，可以在管理端可视化的标记POI。标记的结果存入opendb表，客户端的<unicloud-map>组件可以自动直接拉取。

本文是<unicloud-map>组件的文档，admin插件文档另见

unicloud-map云端一体组件，主要用于显示数据库里的自定义POI，渲染在地图上。具体可以实现如下功能：

插件市场地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

注意：由于组件是读取数据库表opendb-poi 进行查询，若表不存在或表内没有POI数据，则不会显示POI，可以通过unicloud-map-admin插件管理POI信息

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

示例源码如下，请查看 pre > code 标签中的内容

地图Key需要在两个地方进行配置：前端配置和云端配置（必须都配置）。

在 uni-config-center/uni-map/config.js 中进行配置。（没有配置文件和目录就新建目录和文件）

示例源码如下，请查看 pre > code 标签中的内容

unicloud-map组件依赖map组件，以下是不同于map组件的属性列表，点击查看map组件属性

使用这些方法前，需要在组件先声明 ref="map"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

unicloud-map需要创建以下表后才能正常运行，可以右键插件database目录下的opendb-poi.schema.json上传Schema

unicloud-map是免费的，但高德、腾讯、百度等地图的使用需向地图厂商采购商业授权。DCloud与地图厂商达成合作，可更优惠的给开发者提供地图服务。详见

一键注册高德企业开发者，最高可获取210元奖励金，详见https://ask.dcloud.net.cn/article/41279

**Examples:**

Example 1 (vue):
```vue
<template>
	<view style="width: 100%;height: 100%;">
		<unicloud-map
			ref="map"
			:where="where"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>
	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			} as UTSJSONObject,
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			] as Array<UTSJSONObject>
		}
	}
}
</script>
```

Example 2 (vue):
```vue
<template>
	<view style="width: 100%;height: 100%;">
		<unicloud-map
			ref="map"
			:where="where"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>
	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			} as UTSJSONObject,
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			] as Array<UTSJSONObject>
		}
	}
}
</script>
```

Example 3 (vue):
```vue
<template>
	<view style="width: 100%;height: 100%;">
		<unicloud-map
			ref="map"
			:where="where"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>
	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			} as UTSJSONObject,
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			] as Array<UTSJSONObject>
		}
	}
}
</script>
```

Example 4 (vue):
```vue
<template>
	<view style="width: 100%;height: 100%;">
		<unicloud-map
			ref="map"
			:where="where"
			:latitude="latitude"
			:longitude="longitude"
			:default-icon="defaultIcon"
			:custom-icons="customIcons"
		></unicloud-map>
	</view>
</template>

<script>
export default {
	data() {
		return {
			// 查询条件
			where:{

			} as UTSJSONObject,
			// 你的经纬度，可通过uni.getLocation获取，注意type需传gcj02，同时在电脑端运行时获取到的经纬度是不准的
			latitude: 39.908823,
			longitude: 116.39747,
			defaultIcon: "/static/icon/default.png", // 默认POI图标
			// 自定义POI图标
			customIcons: [
				{ type: "门店", icon: "/static/icon/shop.png" },
				{ type: "总部", icon: "/static/icon/headquarters.png" }
			] as Array<UTSJSONObject>
		}
	}
}
</script>
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=lookup-foreign-key

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=lookup-with-temp

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## 微信小程序云迁移uniCloud | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/wx2unicloud.html

**Contents:**
- # 微信小程序云迁移uniCloud
- # 概念澄清
- # 优劣对比
- # 技术迁移指南
  - # 云函数迁移指南
    - # 对接微信登录
    - # 对接微信支付
    - # 临时CDN
    - # 微信开放接口
  - # 数据库迁移指南

uniCloud，可以自选阿里云和腾讯云的serverless。类似于uni-app屏蔽了各家小程序的端侧差异，uniCloud也屏蔽了微信小程序云开发和支付宝云开发的差异。

也就是说，uniCloud选择腾讯云时，和微信小程序云开发，连的是一套云服务，都是腾讯云官方提供的。

虽然硬件相同，包括API也很相似，但uniCloud和微信云开发仍然有一些软件层面的差异。

uniCloud去掉了微信云开发的一些功能，添加了更多功能。以及在生态配套上差别也比较大。

上述差异，总结来看，uniCloud更开放、生态更丰富、开发效率更高。

开发效率之所以高的原因，包括clientDB、JQL、HBuilderX这些对效率起很大影响的重要功能和工具，也包括大量现成的轮子拿来就用。详见：2021了，让我们把开发效率提升10倍吧！

如果已经开发了微信小程序，想迁移到uniCloud，下面提供云函数和数据库部分的技术迁移指南。

uniCloud可以使用uni-id更简单的接入微信小程序登录。参考uni-id

不同于微信云开发中的直接获取openid，uni-id提供的登录接口会在数据库的uni-id-users表内添加用户记录。

如果要控制云存储的权限可以使用自定义登录，uniCloud腾讯云自定义登录

uniCloud提供了uniPay来实现支付功能，同时支持微信和支付宝unipay文档

示例源码如下，请查看 pre > code 标签中的内容

迁移到uniCloud + uni-app体系，代码改成这样：

示例源码如下，请查看 pre > code 标签中的内容

临时CDN主要用于解决需要传输大文件到云函数的场景，使用uniCloud时可以通过先上传到云存储再传递fileID给云函数的方式实现

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用微信开放接口的场景可以替换为mp-cloud-openapi 来实现。用法基本和微信云开发一致

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

微信小程序云开发的控制台可以导出json数据，这个格式与uniCloud相同，可以将导出文件直接在uniCloud的web控制台操作导入。

微信小程序云开发add、update、set操作时参数比uniCloud多了一层data 从微信小程序云开发迁移时最需要注意的事项

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uniCloud内也支持客户端操作数据库（下面成为clientDB），但是与微信云开发稍有不同。主要有以下两点

**Examples:**

Example 1 (javascript):
```javascript
// 云函数部分的代码
const cloud = require('wx-server-sdk')
cloud.init({
  env: cloud.DYNAMIC_CURRENT_ENV
})

exports.main = async (event, context) => {
  const res = await cloud.cloudPay.unifiedOrder({
    "body" : "商品描述",
    "outTradeNo" : "商户订单号",
    "spbillCreateIp" : "127.0.0.1",
    "totalFee" : 1,
	// 用于接收支付异步通知的云函数所在的服务空间ID和云函数名
    "envId": "test-f0b102",
    "functionName": "pay_cb"
  })
  return res
}

// 小程序部分的代码
wx.cloud.callFunction({
  name: '函数名',
  data: {
    // ...
  },
  success: res => {
    const payment = res.result.payment
    wx.requestPayment({
      ...payment,
      success (res) {
        console.log('pay success', res)
      },
      fail (res) {
        console.error('pay fail', err)
      }
    })
  },
  fail: console.error,
})
```

Example 2 (javascript):
```javascript
// 云函数部分的代码
const cloud = require('wx-server-sdk')
cloud.init({
  env: cloud.DYNAMIC_CURRENT_ENV
})

exports.main = async (event, context) => {
  const res = await cloud.cloudPay.unifiedOrder({
    "body" : "商品描述",
    "outTradeNo" : "商户订单号",
    "spbillCreateIp" : "127.0.0.1",
    "totalFee" : 1,
	// 用于接收支付异步通知的云函数所在的服务空间ID和云函数名
    "envId": "test-f0b102",
    "functionName": "pay_cb"
  })
  return res
}

// 小程序部分的代码
wx.cloud.callFunction({
  name: '函数名',
  data: {
    // ...
  },
  success: res => {
    const payment = res.result.payment
    wx.requestPayment({
      ...payment,
      success (res) {
        console.log('pay success', res)
      },
      fail (res) {
        console.error('pay fail', err)
      }
    })
  },
  fail: console.error,
})
```

Example 3 (javascript):
```javascript
// 云函数部分的代码
const cloud = require('wx-server-sdk')
cloud.init({
  env: cloud.DYNAMIC_CURRENT_ENV
})

exports.main = async (event, context) => {
  const res = await cloud.cloudPay.unifiedOrder({
    "body" : "商品描述",
    "outTradeNo" : "商户订单号",
    "spbillCreateIp" : "127.0.0.1",
    "totalFee" : 1,
	// 用于接收支付异步通知的云函数所在的服务空间ID和云函数名
    "envId": "test-f0b102",
    "functionName": "pay_cb"
  })
  return res
}

// 小程序部分的代码
wx.cloud.callFunction({
  name: '函数名',
  data: {
    // ...
  },
  success: res => {
    const payment = res.result.payment
    wx.requestPayment({
      ...payment,
      success (res) {
        console.log('pay success', res)
      },
      fail (res) {
        console.error('pay fail', err)
      }
    })
  },
  fail: console.error,
})
```

Example 4 (javascript):
```javascript
// 云函数部分的代码
const cloud = require('wx-server-sdk')
cloud.init({
  env: cloud.DYNAMIC_CURRENT_ENV
})

exports.main = async (event, context) => {
  const res = await cloud.cloudPay.unifiedOrder({
    "body" : "商品描述",
    "outTradeNo" : "商户订单号",
    "spbillCreateIp" : "127.0.0.1",
    "totalFee" : 1,
	// 用于接收支付异步通知的云函数所在的服务空间ID和云函数名
    "envId": "test-f0b102",
    "functionName": "pay_cb"
  })
  return res
}

// 小程序部分的代码
wx.cloud.callFunction({
  name: '函数名',
  data: {
    // ...
  },
  success: res => {
    const payment = res.result.payment
    wx.requestPayment({
      ...payment,
      success (res) {
        console.log('pay success', res)
      },
      fail (res) {
        console.error('pay fail', err)
      }
    })
  },
  fail: console.error,
})
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database?id=update-and-return

**Contents:**
- # 获取集合的引用
  - # 集合 Collection
  - # 记录 Record / Document
  - # 查询筛选指令 Query Command
  - # 字段更新指令 Update Command
- # 新增文档
- # 查询文档
  - # 添加查询条件
  - # 获取查询数量
  - # 设置记录数量

云函数中支持对云数据库的全部功能的操作。本章节主要讲解如何在云函数内通过传统api操作数据库，如需在云函数内使用JQL语法操作数据库，请参考：云函数内使用JQL语法

示例源码如下，请查看 pre > code 标签中的内容

通过 db.collection(name) 可以获取指定集合的引用，在集合上可以进行以下操作

查询及更新指令用于在 where 中指定字段需满足的条件，指令可通过 db.command 对象取得。

通过 db.collection(collectionName).doc(docId) 可以获取指定集合上指定 _id 的记录的引用，在记录上可以进行以下操作

doc(docId)方法的参数只能是字符串，即数据库默认的_id字段。

如需要匹配多个_id的记录，应使用where方法。可以在where方法里用in指令匹配一个包含_id的数组。

新增文档时数据库会自动生成_id字段，也可以自行将_id设置为其他值

如果你熟悉SQL，可查询mongodb与sql语句对照表 进行学习。

方法1： collection.add(data)

示例源码如下，请查看 pre > code 标签中的内容

方法2： collection.doc().set(data)

也可通过 set 方法新增一个文档，需先取得文档引用再调用 set 方法。 如果文档不存在，set 方法会创建一个新文档。

示例源码如下，请查看 pre > code 标签中的内容

支持 where()、limit()、skip()、orderBy()、get()、field()、count() 等操作。

只有当调用get()时才会真正发送查询请求。

limit，即返回记录的最大数量，默认值为100，也就是不设置limit的情况下默认返回100条数据。limit最大为1000条。

如果使用JQL语法传入getTree参数以返回树形数据也受上面的规则限制，不过此时limit方法仅对根节点生效（大量数据建议使用分层加载，不要使用getTree一次返回所有数据）

支付宝云中，使用where查询时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

注意： 聚合操作中不能使用where，需使用match，关于聚合操作的更多介绍，详见

设置过滤条件，where 可接收对象作为参数，表示筛选出拥有和传入对象相同的 key-value 的文档。比如筛选出所有类型为计算机的、内存为 8g 的商品：

示例源码如下，请查看 pre > code 标签中的内容

如果要表达更复杂的查询，可使用高级查询指令，比如筛选出所有内存大于 8g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

where 还可以使用正则表达式来查询文档，比如一下示例查询所有name字段以ABC开头的用户

示例源码如下，请查看 pre > code 标签中的内容

mongoDB内按照数组内的值查询可以使用多种写法，以下面的数据为例

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内第一个元素的name为item-1的记录可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内某个元素的name为item-1的记录（可以是数组内的任意一条name为item-1）可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.skip(value)

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很大的情况下，skip性能会很差，尽量使用其他方式替代，参考：skip性能优化

collection.orderBy(field, orderType)

如果需要对嵌套字段排序，需要用 "点表示法" 连接嵌套字段，比如 style.color 表示字段 style 里的嵌套字段 color。

同时也支持按多个字段排序，多次调用 orderBy 即可，多字段排序时的顺序会按照 orderBy 调用顺序先后对多个字段排序

示例源码如下，请查看 pre > code 标签中的内容

从查询结果中，过滤掉不需要的字段，或者指定要返回的字段。

示例源码如下，请查看 pre > code 标签中的内容

查询指令以dbCmd.开头，包括等于、不等于、大于、大于等于、小于、小于等于、in、nin、and、or。

示例源码如下，请查看 pre > code 标签中的内容

表示字段等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

事实上在uniCloud的数据库中，等于有两种写法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 eq 指令有更大的灵活性，可以用于表示字段等于某个对象的情况，比如：

示例源码如下，请查看 pre > code 标签中的内容

字段不等于。neq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存为 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存不是 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

如筛选出内存大于 4g 小于 32g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表示需满足所有指定条件中的至少一个。如筛选出价格小于 4000 或在 6000-8000 之间的计算机：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果要跨字段 “或” 操作：(如筛选出内存 8g 或 cpu 3.2 ghz 的计算机)

示例源码如下，请查看 pre > code 标签中的内容

例如下面可以筛选出 version 字段开头是 "数字+s" 的记录，并且忽略大小写：

示例源码如下，请查看 pre > code 标签中的内容

假设数据表class内有以下数据，可以使用下面两种方式查询数组内包含指定值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

使用腾讯云时更新方法必须搭配doc、where方法使用，db.collection('test').update()会报如下错误：param should have required property 'query'

collection.doc().update(Object data)

未使用set、remove更新操作符的情况下，此方法不会删除字段，仅将更新数据和已有数据合并。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，已数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc().set()

此方法会覆写已有字段，需注意与update表现不同，比如以下示例执行set之后follow字段会被删除

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口仅会操作一条数据，有多条数据匹配的情况下会只更新匹配的第一条并返回

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：只可确定数组内只会被匹配到一个的时候使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于设定字段等于指定值。这种方法相比传入纯 JS 对象的好处是能够指定字段等于一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于指示字段自增某个值，这是个原子操作，使用这个操作指令而不是先读数据、再加、再写回的好处是：

在文章阅读数+1、收藏+1等很多场景会用到它。如给收藏的商品数量加一：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意并没有直接提供减法操作符，如果要实现减法，仍通过inc实现。比如上述字段减1，

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意没有直接提供除法操作符，如果要实现除法，仍通过mul实现。比如上述字段除以10，

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于表示删除某个字段。如某人删除了自己一条商品评价中的评分：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组尾部追加元素，支持传入单个元素或数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组头部添加元素，支持传入单个元素或数组。使用同push

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果需要对类型为地理位置的字段进行搜索，一定要建立地理位置索引。

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

按从近到远的顺序，找出字段值在给定点的附近的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

找出字段值在指定 Polygon / MultiPolygon 内的记录，无排序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

事务通常用来在某个数据库操作失败之后进行回滚。

事务因为要锁行，是有时间限制的。从事务开始到事务提交/回滚，时间不可超过10秒。另外注意：如果多条事务同时处理同一行数据，可能存在写冲突，进而导致失败。

阿里云不支持此用法，请换成startTransaction以使用事务

发起事务。与startTransaction作用类似，接收参数类型不同

runTransaction 的形式如下：

示例源码如下，请查看 pre > code 标签中的内容

runTransaction返回一个Promise，此Promise.resolve的结果为callback事务执行函数的返回值，reject 的结果为事务执行过程中抛出的异常或者是 transaction.rollback 传入的值

事务执行函数由开发者传入，函数接收一个参数 transaction，其上提供 collection 方法和 rollback 方法。collection 方法用于取数据库集合记录引用进行操作，rollback 方法用于在不想继续执行事务时终止并回滚事务。

事务执行函数必须为 async 异步函数或返回 Promise 的函数，当事务执行函数返回时，uniCloud 会认为用户逻辑已完成，自动提交（commit）事务，因此务必确保用户事务逻辑完成后才在 async 异步函数中返回或 resolve Promise。

事务执行函数可能会被执行多次，在内部发现事务冲突时会自动重复执行，如果超过设定的执行次数上限，会报错退出。

在事务执行函数中发生的错误，都会认为事务执行失败而抛错。

事务执行函数返回的值会作为 runTransaction 返回的 Promise resolve 的值，在函数中抛出的异常会作为 runTransaction 返回的 Promise reject 的值，如果事务执行函数中调用了 transaction.rollback，则传入 rollback 函数的值会作为 runTransaction 返回的 Promise reject 的值。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

发起事务。与runTransaction作用类似，接收参数类型不同

startTransaction 形式如下

示例源码如下，请查看 pre > code 标签中的内容

返回一个Promise，此Promise resolve的结果为事务操作对象（注意这里与runTransaction的区别），其上可通过 collection API 操作数据库，通过 commit（使用startTransaction需要主动commit） 或 rollback 来结束或终止事务。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 2 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 3 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 4 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

---

## openDB | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/opendb

**Contents:**
- # openDB
- # 需求背景
- # openDB中的已有规范
- # 预置数据
- # 数据表升级
- # 如何引入到自己的服务空间
- # 欢迎参与
- # 注意事项

数据库设计，是数字经济的基础，是重要的软基建。

openDB，是一套开放的数据表设计规范，包括了表名、字段等schema定义以及初始数据。

以用户表为例，它约定了一个标准用户表的表名和字段定义，并且基于nosql的特性，可以由开发者自行扩展字段。

openDB是uniCloud 的重要软基建，支撑uniCloud数字生态的发展。

uni-id的账户统一，是openDB的成功实践。基于uni-id规范，有电商插件、有IM插件、有PC管理插件，开发者可以方便的把这些插件整合到自己的同一应用中。

目前openDB已经支持几十张表。可以在https://gitee.com/dcloud/opendb/tree/master/collection 查看。

openDB不仅支持定义常用的数据表字段，还可以预置初始化数据。

比如，opendb-city-china 是opendb中定义好的中国城市字典表，它的定义分为两个部分：

你通过uniCloud web控制台 创建openDB表时，uniCloud会自动校验该opendb表定义中是否包含data.json，若包含，则在创建表定义后，自动导入data.json。

如果你的 HBuilderX 项目中，uniCloud/database目录下定义的数据表中含有opendb表定义，则对该opendb表执行上传DB Schema操作时，uniCloud服务端会判断该opendb表是否已存在：

openDB数据表在后续的更新迭代中，可能会涉及到schema及预置数据的变更。自HBuilderX 3.5.1之后，opendb表支持检查更新。

以opendb-city-china 为例，当我们要修改或补充城市时，为了兼容已部署的数据表，应提供差量数据，这时我们需要做的是：

比如行政区域的撤销或设立需要数据升级，并且定义升级后的版本号为0.0.2，这时需要将差量数据以JQL语句的形式写入文件opendb-city-china/collection.update-0.0.1-0.0.2.jql中，并更新opendb-city-china/package.json的version字段。

在uniCloud web控制台 ，新建表时，可直接选择所有openDB的表。

首先选分类，每个分类下又有若干表，表结构和预置数据可直接预览。支持多个表一起创建。

openDB的表，不应修改表名，修改后就无法与其他插件连同了。

openDB是一个持续发展的、由开发者共建的规范。DCloud欢迎各个业务领域的专业开发者提供规范。

开发者通过提pr的方式，给openDB添加规范，或者给已有规范的表添加字段，或者添加初始化数据。gitee支持轻量pr，尤其适合共同编辑规范。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=common-for-action

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## schema2code代码生成系统 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema2code.html

**Contents:**
- # schema2code代码生成系统
- # 快速上手schema2code生成“通讯录”
  - # 首先创建“带schema的通讯录”数据表
  - # schema2code
- # 生成页面控件的默认策略
- # label属性
- # component属性
- # group属性
- # 生成级联选择

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

为强化表单的自定义性，DB Schema还扩展了label、componentForEdit、componentForShow、group、order等属性，以控制表单项在界面上的渲染控件。

schema2code不是简单的一键crud生成接口，它直接生成了可运行的页面。

schema2code代码生成系统功能包括：

表单校验工作，在前端和后端都需要做。在过去，这造成重复投入。

开发者修改DB Schema并保存后，云端的校验规则直接生效。

然后开发者需要把这套校验规则导入到前端项目中。即利用本功能。

DCloud提供了uni-forms前端组件，该组件的表单校验规范完全符合DB Schema中的校验规则，实现云端统一。uni-forms组件地址：https://ext.dcloud.net.cn/plugin?id=2773

成品演示地址:http://contacts-demo.dcloud.net.cn/

这里需要选择在前端表单页面出现的字段，无需用户在表单页面提交的字段（如create_date）不应勾选。

这里显示了完整的工程结构。点击右下角的“下载zip”可以把这个工程下载到本地。点击这里的每个文件，在右侧会出现文件相应的代码。

只有自动生成的文件会在右侧显示代码，components目录下的三方库不会在右侧显示代码。

根据DB Schema生成的表单页面，是基于uni-forms组件的，该组件地址：https://ext.dcloud.net.cn/plugin?id=2773

区域D. 扩展校验函数，每个函数是一个文件

区域E. 表单校验规则，和表名一致，每个表一个文件

在修改schema中的校验规则后，云端是直接生效的。前端部分则需要下载这个js文件到本地工程。

如果直接已经下载过，需要二次更新，也可以在右侧复制源码，增量添加到前端工程的校验规则中。

自动生成的表单页面，包括新建页面和编辑页面。这些页面均基于clientDB，可直接使用。

注意：需HBuilderX 3.0.5+ 支持

HBuilderX 3.1.15 schema2code 生成文件结构调整, 生成的 pages.json 改为 page_init.json，确认导入工程时自动合并到项目的 pages.json，page_init.json不会导入到工程中，仅在预览界面显示

HBuilderX 3.1.15 之前的版本 pages.json 导入时会覆盖用户工程中已有的 pages.json，导入确认时选择不导入该文件手动拷贝内容到 pages.json

如果生成uniCloud admin页面，生成的列表页（list），需自行配置【排序字段】和【模糊搜索字段】。语法参考JQL。

以uniCloud admin内置页面【用户列表页】为例，要实现列表按注册时间排倒叙，要在列表上方的搜索框搜索，需在生成的list.vue页面的script区域修改如下配置：

示例源码如下，请查看 pre > code 标签中的内容

schema2code是一个代码辅助生成工具。

DB Schema配置的字段，在生成页面时使用什么组件渲染？决定关系如下：

schema2code作为一个插件，有单独的版本号，详见

可以看到schema2code使用了不少含有-data-中间关键字的组件，这种组件称为datacom组件 ， 它是一种可以包含数据的组件，并基于clientDB实现了云端数据的直接对接。详见

在uni-forms组件 中，每个表单项都被包裹在uni-forms-item中，该子组件可设置label，即，在表单项如输入框前面或上面放置一个说明性名词。

在DB Schema的label属性中设置值后，生成前端表单页面时即可自动给uni-forms-item的label属性赋值。

如果未设置label属性，但配置了title属性，生成前端表单页面时会取title作为前端的label。

定义该字段在表单中使用什么样的组件进行渲染，可设置前端的组件名和初始属性。

这里的表单，指的是数据维护表单，比如新建记录或修改记录的表单。

生成的所有表单项，都在uni-forms组件 下。

示例源码如下，请查看 pre > code 标签中的内容

将多个表单项合并在一个分组里显示。前端渲染时，group相同的表单项会自动合并在一个uni-group组件中，不同分组的表单项之间有间隔。该组件详见：https://ext.dcloud.net.cn/plugin?id=3281

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在这个业务里涉及2个表，一个是用户的地址信息表uni-id-address ，一个是候选的省市区数据表opendb-city-china 。

在用户地址信息表的schema配置enumType和enum。如下：

用户地址表（完整的opendb表为uni-id-address ，以下略做简化）

示例源码如下，请查看 pre > code 标签中的内容

省市区数据表 opendb-city-china 的schema如下。树形数据查询另有详细文档，详见

示例源码如下，请查看 pre > code 标签中的内容

这2个表都是opendb表，在uniCloud web控制台新建表时可以选择。opendb-city-china表自带全国省市区数据。

在web控制台的 用户地址表，选择表结构schema，点schema2code生成页面，在生成的代码中会使用多级联选择组件 <uni-data-picker>，效果是懒加载的，选择省后，会根据省的选择去拉取市的数据。

<uni-data-picker> 组件的文档另见：https://ext.dcloud.net.cn/plugin?id=3796

**Examples:**

Example 1 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

Example 2 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

Example 3 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

Example 4 (javascript):
```javascript
const dbOrderBy = 'register_date desc' // 排序字段，asc(升序)、desc(降序)
const dbSearchFields = ['username', 'role_name', 'mobile', 'email'] // 模糊搜索字段，支持模糊搜索的字段列表
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=lookup

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uni扩展数据库 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-mongodb/intro.html

**Contents:**
- # uni扩展数据库
- # 介绍
- # 产品优势
- # 相关文档

扩展数据库是DCloud推出的用来解决内置数据库现有问题的解决方案。同时为您的业务提供高性能、高可用的数据库服务。

扩展数据库在 ​​性能上限、成本控制、功能自由度​​ 和 ​​容灾能力​​ 上全面领先空间内置数据库，尤其适合需要 ​​弹性扩展、高并发处理、自动化运维​​ 或 ​​多云架构​​ 的企业级场景，具体体现在以下几个方面：

您的业务是否正在面临内置数据库带来的这些挑战？

扩展数据库，为您的业务增长提供更强有力的支持！

别让数据库成为业务发展的瓶颈！立即开通扩展数据库，为您的业务保驾护航！

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/db-performance.html

**Contents:**
- # 设置合适的索引
- # 将JQL查询结果缓存到redis中
- # 大数据量时查询语句写法注意
  - # 带条件的count
  - # 使用skip方法传入较大的值
  - # 抽样方法sample
- # clientDB联表查询超时
- # 慢查询日志
  - # 阿里云
  - # 支付宝云

慢查询，指云数据库查询较慢，不能及时返回结果。这样的查询会收录在 uniCloud web控制台的慢查询日志栏目中。但收录不是实时的，有一定延时。

开发者应经常查阅自己的慢查询，修复问题，保证业务系统的健康稳定。

在数据库语句执行超过一定时间（腾讯云、阿里云均为5秒）仍不能返回结果后，数据库请求会报超时错误。

如果您的数据量非常大，在设置合适的索引之后仍然会查询超时，您要考虑以下优化方案。

尽量避免使用skip，至少不应该skip比较大的值，因为skip操作Mongo服务端依然会扫描被skip的数据，带skip操作的耗时和skip的数量线性相关。您可以考虑使用排序和范围查询功能来替代直接使用skip。

对于非常大的数据可以分段来查询，即通过一定的条件将一次查询拆分为多次查询操作。

如果满足条件的数据特别多，where+count会特别慢，很有可能超时。我们建议不要在大数据量的集合内这样使用count方法。

您应该避免使用where+skip+limit的查询方式来遍历整个集合，因为这种方式随着Skip数量的增长响应时间会越来越慢，还可能会造成请求超时。

下面的代码给出了一个示例。为避免示例过于复杂，先假设没有两条记录的create_date是相等，如果create_date不能唯一标识数据，可以再额外加入其他字段，比如文章作者等

按照create_date（创建时间）降序排序，每次查询时都指定查询条件小于上次查询结果中的最后一条记录的create_date，这样不需要使用skip即可实现分页效果，同时还能保证用户在上下翻页的时候不会因为出现新增数据而引起的前后两页数据重复的问题。

示例源码如下，请查看 pre > code 标签中的内容

使用上述写法后您应该使用上一页、下一页、上n页（其中n是一个比较小的数字）、下n页的翻页功能来替换随机翻页。您可以参考百度或者谷歌的搜索结果的分页功能，当结果页数非常多时，不展示共有多少页，仅支持在前10页中支持随机翻页；再往下翻页的过程中，不再支持随机翻页，仅支持向下翻一个较小的页数，这样就可以在已经查询出结果的基础上再使用where+skip（少量）+limit+orderBy的方式来快速查询到结果。

sample操作在大数据量高频触发时会响应缓慢，使用前请务必确定自己的业务场景适合使用sample方法

请参考此文档调整优化，使用getTemp进行联表查询

一般产生慢查询日志都是因为数据表未配置索引，请根据日志内容中的查询条件配置对应索引。详见数据库索引相关介绍

阿里云服务空间当每分钟新产生的慢查询日志超过200条或文档扫描数超2000万行时会触发阿里云限流：Throttling.Api: Request was denied due to api flow control. RequestId，导致服务异常。请及时对慢查询进行优化，如合理配置查询索引、优化表结构及业务代码查询条件等。

慢查询的定义：单条查询语句耗时超100毫秒。符合条件的查询会被统计进来。 一个典型的慢查询日志包含以下信息

其中查询语句是详细的查询日志内容，内容示例如下：

示例源码如下，请查看 pre > code 标签中的内容

本次查询中，keysExamined和docsExamined值很大说明可能未配置索引导致全表扫描。此时应前往控制台检查uni-id-users表是否配置invite_code该查询条件的索引，如未配置可在控制台操作添加，添加后索引生效有一定延迟（需后台执行创建，数据量越大创建越慢）。待索引生效后，该查询命中索引便会减少慢查询，达到优化的目的。

在慢查询日志到一定量级时，我们会发送邮件通知到服务空间所属账号邮箱，请及时关注并前往uniCloud web控制台 查看慢查询日志统计和详细信息，参考本文档进行优化。

慢查询日志支持查看统计及详细数据，可查询具体某个数据表的慢查询日志记录。

可查询某个特定云函数下的某个数据表或某个数据表的慢查询统计及详细数据。

如果你的数据表记录条数超过几十万，可以使用分表策略来优化。

比如很多电商系统的订单表，最近3个月的订单是一张表，超期的订单会挪到其他表。银行系统也会把几年前的交易数据归档，防止数据量太大查不动。

冗余表是另一种策略，不是分表，而是把大表中的高频数据单独摘出来成为一张表。其实 jql-cache-redis 就是一种冗余思路，把数据在redis里多存一份。

当数据量庞大，优化索引难以解决内置云数据库的慢查询问题时，可考虑使用扩展数据库 来突破性能瓶颈。

**Examples:**

Example 1 (javascript):
```javascript
const db = uniCloud.database()
const dbCmd = db.command
module.exports = async function(event,context) {
  const {
    lastCreateDate = Date.now(),
    pageSize
  } = event
  if(pageSize > 100){
    throw new Error('单页数据不可超过100条')
  }
  const res = await db.collection('book').where({
    create_date: dbCmd.lt(lastCreateDate)
  })
  .limit(pageSize)
  .get()
}
```

Example 2 (javascript):
```javascript
const db = uniCloud.database()
const dbCmd = db.command
module.exports = async function(event,context) {
  const {
    lastCreateDate = Date.now(),
    pageSize
  } = event
  if(pageSize > 100){
    throw new Error('单页数据不可超过100条')
  }
  const res = await db.collection('book').where({
    create_date: dbCmd.lt(lastCreateDate)
  })
  .limit(pageSize)
  .get()
}
```

Example 3 (javascript):
```javascript
const db = uniCloud.database()
const dbCmd = db.command
module.exports = async function(event,context) {
  const {
    lastCreateDate = Date.now(),
    pageSize
  } = event
  if(pageSize > 100){
    throw new Error('单页数据不可超过100条')
  }
  const res = await db.collection('book').where({
    create_date: dbCmd.lt(lastCreateDate)
  })
  .limit(pageSize)
  .get()
}
```

Example 4 (javascript):
```javascript
const db = uniCloud.database()
const dbCmd = db.command
module.exports = async function(event,context) {
  const {
    lastCreateDate = Date.now(),
    pageSize
  } = event
  if(pageSize > 100){
    throw new Error('单页数据不可超过100条')
  }
  const res = await db.collection('book').where({
    create_date: dbCmd.lt(lastCreateDate)
  })
  .limit(pageSize)
  .get()
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage/authentication.html

**Contents:**
- # 名词解释
- # 云函数接口
  - # uniCloud.customAuth
  - # auth.createTicket
  - # auth.getUserInfo
- # 客户端接口
  - # uniCloud.customAuth
  - # auth.signInWithTicket
  - # auth.getLoginState
  - # auth.getUserInfo

本功能的主要作用是前端删除云存储的文件，并不推荐这种用法。

腾讯云提供了一套自己的用户权限，这套系统和uni-id不同，不支持编程，不能用于业务系统的真实账户。仅用于云存储的前端管理。

在腾讯云的概念里，默认情况下所有用户都是通过匿名登录访问云存储的，自定义登录提供了在云端区分用户身份的能力。开启腾讯云自定义登录后，每个用户会在腾讯云的后台有一个身份标记，从前端上传文件到云存储时，腾讯云会自动给文件加入这个标记。如果同时在云存储权限配置里配置了仅创建者可写，则前端可以直接删除这个云存储，删除时腾讯云会自动校验文件上传者的userId和当前用户的userId一致时才允许删除。

在微信小程序云的开发中，自定义登录还可以用于前端操作数据库。

但因为腾讯云提供的这套方案不够灵活和完善，uniCloud单独做了uni-id用于完善的账户体系，单独做了clientDB，用于完善快捷的前端操作数据库。

所以目前腾讯云的自定义登录功能，在uniCloud中的价值只剩下前端删除云存储。DCloud不建议开发者这么用，前端直传云存储不需要腾讯云自定义登录，而删除云存储，还是应该在云端进行。

重要：自HBuilderX 2.9.12起，此接口由uniCloud.auth调整为uniCloud.customAuth，短时间内仍会兼容uniCloud.auth

示例源码如下，请查看 pre > code 标签中的内容

云端根据用户id创建票据用于客户端登录到对应的云厂商

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

任何方式登录成功后，可以调用 getUserInfo 获得用户的身份信息。

示例源码如下，请查看 pre > code 标签中的内容

重要：自HBuilderX 2.9.12起，此接口由uniCloud.auth调整为uniCloud.customAuth，短时间内仍会兼容uniCloud.auth

示例源码如下，请查看 pre > code 标签中的内容

使用云函数接口createTicket返回的票据进行登录，详细描述参考登录流程

示例源码如下，请查看 pre > code 标签中的内容

开发者可以通过 getLoginState() 来获取当前的登录状态，调用 getLoginState() 后，SDK 会识别本地是否有登录状态，如果有，则会尝试刷新登录状态，若刷新登录状态成功，则会返回新的登录状态，否则返回 undefined。

示例源码如下，请查看 pre > code 标签中的内容

任何方式登录成功后，可以调用 getUserInfo 获得用户的身份信息。

示例源码如下，请查看 pre > code 标签中的内容

uniCloud允许开发者使用特定的登录凭据Ticket对用户进行身份认证。开发者可以使用服务端 SDK来创建Ticket，并且将Ticket传入到应用内，然后调用signInWithTicket()获得登录态。

登录uniCloud控制台uniCloud控制台 ，在自定义登录中，点击“生成并下载”

注意：重复生成私钥会使之前生成的私钥失效，并导致用户登录状态失效

获取私钥文件（credentials.json）之后，放在需要生成Ticket的云函数内index.js同级即可

服务端 SDK内置了生成Ticket的接口，开发者需要提供一个自定义的customUserId作为用户的唯一身份标识。Ticket有效期为5分钟，过期则失效。

每个用户的customUserId不能相同，每次用户重新登录时，原有的登录态将会失效。

Ticket一般在验证了用户名密码成功之后下发

示例源码如下，请查看 pre > code 标签中的内容

创建Ticket之后，开发者应将Ticket发送至客户端，然后使用客户端SDK提供的 signInWithTicket() 登录uniCloud：

示例源码如下，请查看 pre > code 标签中的内容

uniCloud允许开发者使用匿名登录的方式进行静默授权，可以避免强制登录。在匿名状态下可正常的调用uniCloud的资源，开发者同时可以配合安全规则针对匿名用户制定对应的访问限制。

匿名用户如果要重新使用开发者提供的身份登录，可以调用auth.signInWithTicket来进行。参考

目前uniCloud支持将匿名用户转化为正式用户，此转正用户将会继承匿名用户在云端创建的资源，流程如下：

示例源码如下，请查看 pre > code 标签中的内容

当登录态失效时，会触发这个事件，开发者可以在这个事件回调内，尝试重新登录 uniCloud。

示例源码如下，请查看 pre > code 标签中的内容

JS SDK 会在登录态生效期间，自动刷新和维护短期访问令牌（access token），每次成功刷新时会触发此事件。

对于两种登录态并存（uniCloud、自身业务登录态）的应用，这个事件可以用于同步登录态之间的状态。

示例源码如下，请查看 pre > code 标签中的内容

shouldRefreshAccessToken 接收一个 callback 函数，并且会在刷新短期访问令牌前调用此 callback 函数，根据返回值决定是否要刷新短期访问令牌。

对于两种登录态并存（uniCloud、自身业务登录态）的应用，可以在 callback 内判断自身业务登录态是否失效，从而决定是否续期 uniCloud 的短期访问令牌。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

Example 2 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

Example 3 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

Example 4 (javascript):
```javascript
const auth = uniCloud.customAuth()
```

---

## JQL 常用运算方法 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql-operator-example.html

**Contents:**
- # JQL 常用运算方法
- # 数据库运算方法汇总
  - # 完整运算方法列表
  - # 分组运算方法
- # 常用运算方法示例
  - # 算术运算方法
    - # abs
    - # add
    - # ceil
    - # divide

uniCloud的云数据库，提供了一批强大的运算方法。这些方法是数据库执行的，而不是云函数执行的。

这些运算方法是与数据查询搭配使用的，它们可以对字段的值或字段的值的一部分进行运算，将运算后的结果返回给查询请求。

数据库运算方法，提供了比传统SQL更大强大和灵活的查询。可以实现更多功能、可以一次性查询出期待的结果。不必多次查库多次运算，那样不仅代码复杂，而且会造成多次查库性能下降；如果使用计费云空间，使用这些方法还可以减少数据库查询次数。

比如sum()方法，可以对多行记录的某个字段值求和、可以对单行记录的若干字段的值求和，如果字段是一个数组，还可以对数组的各项求和。

为方便书写，JQL内将数据库运算方法的用法进行了简化（相对于原始数据库运算方法写法而言），主要是参数摊平，以字符串方式表达。以下是可以在JQL中使用的数据库运算方法

示例源码如下，请查看 pre > code 标签中的内容

可以通过以下查询将publish_date字段从时间戳转为2021-01-20形式，然后进行按天进行统计

示例源码如下，请查看 pre > code 标签中的内容

上述代码使用add方法将publish_date时间戳转为日期类型，再用dateToString将上一步的日期按照时区'+0800'（北京时间），格式化为4位年-2位月-2位日格式，完整格式化参数请参考dateToString。

示例源码如下，请查看 pre > code 标签中的内容

运算方法中仅数据库字段可以直接去除引号作为变量书写，其他字符串仍要写成字符串形式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

分组运算方法是专用于统计汇总的数据库运算方法。它也是数据库的方法，而不是js的方法。

groupField内可使用且仅能使用如下运算方法。

以下列举常用的运算方法在 JQL 中的应用

算术表达式对数字执行数学运算。一些算术表达式也可以支持日期算术。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将数字相加或将数字加在日期上。如果参数中的其中一个值是日期，那么其他值将被视为毫秒数加在该日期上。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算给定数字在给定对数底下的 log 值。

示例源码如下，请查看 pre > code 标签中的内容

在计算中使用 $ log_2 $ 来确定表示的值所需的位数 positiveInt：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算给定数字在对数底为 10 下的 log 值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

取模运算，第一个数字是被除数，第二个数字是除数。

示例源码如下，请查看 pre > code 标签中的内容

使用 mod 表达式返回 hours 字段的其余部分除以 tasks 字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用 multiply 表达式将 price 和 quantity 字段相乘：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用 multiply 表达式将 price 和 quantity 字段相乘：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下示例计算 p1 和 p2 之间的距离：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将两个数字相减然后返回差值，或将两个日期相减然后返回相差的毫秒数，或将一个日期减去一个数字返回结果的日期。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回favorites数组中的第一个和最后一个元素：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例集合inventory包含以下文档的集合：

示例源码如下，请查看 pre > code 标签中的内容

以下将dimensions字段作为对象返回：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例集合warehouses包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

以下示例将instock和ordered数组串联在一起：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将items数组过滤为仅包含price大于或等于100的文档：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定一个值和一个数组，如果值在数组中则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

判断in_stock数组中是否存在bananas字符串：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在数组中找出等于给定值的第一个元素的下标，如果找不到则返回 -1。

示例源码如下，请查看 pre > code 标签中的内容

查询数字2在每个items数组中所处的数组索引：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例集合warehouses包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

在将两个字段连接在一起之前检查instock和ordered字段是否为数组：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似 JavaScript Array 上的 map 方法，将给定数组的每个元素按给定转换方法转换后得出新的数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将一个对象转换为数组。方法把对象的每个键值对都变成输出数组的一个元素，元素形如 { k: <key>, v: <value> }

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回一组生成的序列数字。给定开始值、结束值、非零的步长，range 会返回从开始值开始逐步增长、步长为给定步长、但不包括结束值的序列。

示例源码如下，请查看 pre > code 标签中的内容

一名骑自行车的人正计划从旧金山骑车前往集合中列出的每个城市，并希望每25英里停下来休息一下。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似 JavaScript 的 reduce 方法，应用一个表达式于数组各个元素然后归一成一个元素。

示例源码如下，请查看 pre > code 标签中的内容

每个文档包含一个discounts数组，其中包含每个项目当前可用的优惠券。 如果每个折扣都可以一次应用于该产品，则可以通过reduce对discounts数组中的每个元素应用以下公式来计算最低价格 （1-折扣）*价格。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面的示例favorites以相反的顺序返回一个包含数组元素的数组：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似 JavaScritp 的 slice 方法。返回给定数组的指定子集。

示例源码如下，请查看 pre > code 标签中的内容

为每个用户最多返回favorites数组中的前三个元素：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

把二维数组的第二维数组中的相同序号的元素分别拼装成一个新的数组进而组装成一个新的二维数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

布尔表达式将其参数表达式计算为布尔值，并返回一个布尔值作为结果。

给定多个表达式，and 仅在所有表达式都返回 true 时返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

判断qty字段是否大于100并小于250：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定一个表达式，如果表达式返回 true，则 not 返回 false，否则返回 true。注意表达式不能为逻辑表达式（and、or、nor、not）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定多个表达式，如果任意一个表达式返回 true，则 or 返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

判断qty字段是否大于250或小于200：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

比较表达式返回一个布尔值，除了 cmp，它返回一个数字。

给定两个值，返回其比较值。如果第一个值小于第二个值，返回 -1 如果第一个值大于第二个值，返回 1 如果两个值相等，返回 0。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果相等则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者大于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者大于或等于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者小于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果前者小于或等于后者则返回 true，否则返回 false。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

匹配两个值，如果不相等则返回 true，否则返回 false.

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算布尔表达式1，成立返回表达式2，否则返回表达式3。

示例源码如下，请查看 pre > code 标签中的内容

如果 qty 值大于等于250，将discount设置为30，否则设置为20：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算给定的表达式，如果表达式结果为 null、undefined 或者不存在，那么返回一个替代值；否则返回原值。

示例源码如下，请查看 pre > code 标签中的内容

如果description字段为空或不存在返回"Unspecified"字符串， 否则返回description字段值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据给定的 switch-case-default 计算返回值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

给定日期的相关信息，构建并返回一个日期对象。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例集合logmessages包含以下集合。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

该timezone参数也可以通过一个文档字段，而不是硬编码参数提供的。例如：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果集合中带有不可解析的日期字符串，将引发错误 onError，可以用 onError 参数以其原始字符串形式返回无效日期：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果集合中带有null日期字符串，可以使用 onNull 参数返回一个日期：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据指定的表达式将日期对象格式化为符合要求的字符串。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的天数（一个月中的哪一天），是一个介于 1 至 31 之间的数字。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的天数（一周中的第几天），是一个介于 1（周日）到 7（周六）之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的天数（一年中的第几天），是一个介于 1 到 366 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的小时数，是一个介于 0 到 23 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的 ISO 8601 标准的天数（一周中的第几天），是一个介于 1（周一）到 7（周日）之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

从birthday字段中返回一周中的第几天：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的 ISO 8601 标准的周数（一年中的第几周），是一个介于 1 到 53 之间的整数。

示例集合deliveries包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的 ISO 8601 标准的天数（一年中的第几天）。

示例集合anniversaries包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

返回date字段ISO 8601格式的年份。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的毫秒数，是一个介于 0 到 999 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的分钟数，是一个介于 0 到 59 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的月份，是一个介于 1 到 12 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的秒数，是一个介于 0 到 59 之间的整数，在特殊情况下（闰秒）可能等于 60。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回日期字段对应的周数（一年中的第几周），是一个介于 0 到 53 之间的整数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

仅JQL字符串内支持，HBuilderX 3.1.0起支持

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

直接返回一个值的字面量，不经过任何解析和处理。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果要合并的文档包含相同的字段名称，则结果文档中的字段将会覆盖上次合并的文档中的值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

先通过 lookup 将两表进行关联，之后使用 mergeObjects 表达式在 replaceRoot 阶段合并两表。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按照 item 进行分组，mergeObjects 仅接受单个对象操作。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Set 表达式对数组执行 set 操作，将数组视为 sets。 Set 表达式忽略每个输入数组中的重复条目和元素的顺序。

如果 set 操作返回一个 set，则该操作会过滤掉结果中的重复项，以输出仅包含唯一条目的 array。输出 array 中元素的顺序未指定。

如果集合包含嵌套的 array 元素，则 set 表达式不会下降到嵌套的 array 中，而是在顶层level 处计算 array。

输入一个数组，或者数组字段的表达式。如果数组中所有元素均为真值，那么返回 true，否则返回 false。空数组永远返回 true。 示例集合survey使用以下文档：

示例源码如下，请查看 pre > code 标签中的内容

判断responses数组是否仅包含计算结果为true的值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入一个数组，或者数组字段的表达式。如果数组中任意一个元素为真值，那么返回 true，否则返回 false。空数组永远返回 false。

示例源码如下，请查看 pre > code 标签中的内容

判断responses数组是否包含任何计算结果为true：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入两个集合，输出只存在于第一个集合中的元素

示例集合experiments包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入两个集合，判断两个集合中包含的元素是否相同（不考虑顺序、去重）

示例集合experiments包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例集合experiments包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

输入两个集合，判断第一个集合是否是第二个集合的子集。

示例集合experiments包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例集合experiments包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

返回在A数组或B数组或两者中都找到的元素数组：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

字符串表达式（除外 concat）仅对ASCII字符字符串具有明确定义的行为。

concat 行为是明确定义的，与所使用的字符无关。

示例源码如下，请查看 pre > code 标签中的内容

将item字段和description用“-”定界符的字段连接起来：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在目标字符串中查找子字符串，并返回第一次出现的 UTF-8 的字节索引（从0开始）。如果不存在子字符串，返回 -1

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在目标字符串中查找子字符串，并返回第一次出现的 UTF-8 的 code point 索引（从0开始）。如果不存在子字符串，返回 -1

示例源码如下，请查看 pre > code 标签中的内容

返回foo每个item字符串中字符串所在的代码点索引：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按照分隔符分隔数组，并且删除分隔符，返回子字符串组成的数组。如果字符串无法找到分隔符进行分隔，返回原字符串作为数组的唯一元素

示例集合deliveries包含以下文档：

示例源码如下，请查看 pre > code 标签中的内容

通过分割创建字符串数组city字段，使用, 作为分隔符。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

计算并返回指定字符串中 utf-8 编码的字节数量。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

_id: 3 和 _id: 5 的文档每个都包含一个变音符号（分别为 é 和 ñ），需要两个字节进行编码。

_id: 8 的文档包含两个日语字符，每个字符使用三个字节进行编码。

这使得长度大于具有 _id: 3、_id: 5 和 _id: 8 的文档的名称中的字符数。

计算并返回指定字符串的UTF-8 code points 数量。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对两个字符串在不区分大小写的情况下进行大小比较，并返回比较的结果

示例源码如下，请查看 pre > code 标签中的内容

对quarter字段值与字符串“13q4”进行不区分大小写的比较：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回字符串从指定位置开始的指定长度的子字符串。

不推荐使用，推荐使用substrBytes或substrCP

示例源码如下，请查看 pre > code 标签中的内容

将quarter分为 yearSubstring 和 QuarterSubstring：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回字符串从指定位置开始的指定长度的子字符串。子字符串是由字符串中指定的 UTF-8 字节索引的字符开始，长度为指定的字节数。

示例源码如下，请查看 pre > code 标签中的内容

将quarter（仅包含单字节 US-ASCII 字符）分隔为 yearSubstring 和 QuarterSubstring。

QuarterSubstring 字段表示来自 yearSubstring 之后的指定字节索引的字符串的其余部分。

它是通过使用 strLenBytes 从字符串的长度中减去字节索引来计算的。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回字符串从指定位置开始的指定长度的子字符串。子字符串是由字符串中指定的 UTF-8 字节索引的字符开始，长度为指定的字节数

示例源码如下，请查看 pre > code 标签中的内容

将quarter分隔为 yearSubstring 和 QuarterSubstring。

QuarterSubstring 字段表示来自 yearSubstring 之后的指定字节索引的字符串的其余部分。

它是通过使用 strLenCP 从字符串的长度中减去字节索引来计算的。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回小写item和小写description值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回大写item和大写description值：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组中添加值，如果数组中已存在该值，不执行任何操作。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按item字段对文档进行分组，并计算每个分组的平均数量和平均数量。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回指定字段在一组集合的第一条记录对应的值。仅当这组集合是按照某种定义排序（ sort ）后，此操作才有意义。

示例源码如下，请查看 pre > code 标签中的内容

按字段item分组，并计算每个物料的首次销售日期：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回指定字段在一组集合的最后一条记录对应的值。仅当这组集合是按照某种定义排序（ sort ）后，此操作才有意义。

示例源码如下，请查看 pre > code 标签中的内容

按照item和date对文档进行排序，然后按item字段对现在已排序的文档进行分组，并计算每个物料的最后销售日期：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按字段item分组，并计算每组文件的最大总量和最大数量。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按item字段对文档进行分组，并计算每次分组的最小数量和最小数量。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回一组中表达式指定列与对应的值，一起组成的数组。

示例源码如下，请查看 pre > code 标签中的内容

按date字段的日期和年份分组，并计算每组的物料清单和销售数量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了计算用户样本的标准差，首先使用sample管道对100个用户进行采样，然后使用stdDevSamp计算样本用户的标准差。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按照date字段的日期和年份对文档进行分组，并计算每组文档的总数和计数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果要合并的文档包含相同的字段名称，则结果文档中的字段将会覆盖上次合并的文档中的值。

示例源码如下，请查看 pre > code 标签中的内容

按照 item 进行分组，mergeObjects 仅接受单个对象操作。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在本示例中使用 group 与 groupField，对应 Aggregate 阶段的 $group 与 $project 阶段。

将商品分类 category 字段用 groupBy 进行分组，在 groupField 中使用 sum 表达式对商品数量(goodsNumber)加1，库存(stock)同样也用 sum 表达式计算库存总和。

示例源码如下，请查看 pre > code 标签中的内容

相比于上面 JQL 方式，下面的 Aggregate 就略显复杂一些，但大致逻辑是一致的。

在 Aggregate 第一阶段，按照商品分类进行分组，同时组内添加商品数量(goodsNumber)与库存(stock)字段，计算与上面计算方式一样，将结果传递至下一阶段。

第二阶段中，使用 $project 管道对字段修整，移除 _id 字段，增加 category 字段，保留 goodsNumber, stock 字段，如果使用 JQL 方式将不需要手动对字段修整。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用 where 先初步筛选商品金额大于5000的商品，对筛选后的商品按照分类(category)使用 groupBy 分组，在 groupField 中使用 sum 表达式对商品数量(goodsNumber)加1。

示例源码如下，请查看 pre > code 标签中的内容

在阶段一中使用 $match 管道按照商品金额筛选，将结果传递至下一阶段。

第二阶段中使用 $group 管道按照商品分类(category)分组，同时组内添加 goodsNumber 字段，使用 sum 表达式对数量加1。

第三阶段中使用 $project 管道对字段进行修整，移除 _id 字段，添加 category 字段值为上一阶段传递来的商品分类(category)，保留 goodsNumber 字段。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

第一阶段使用 $sort 管道将 goods 表按照 price 倒叙排列，将结果传递到下一阶段。

第二阶段使用 $group 管道按照 category 分组，由于在第一阶段已经按照 price 倒叙排列了，所以在组内添加了 maxGoodsName, maxGoodsPrice 字段使用 $first 表达式来选择第一个文档，及 price 最大的一个表示价格最高的商品，相反，minGoodsName, minGoodsPrice 字段使用 $last 表达式来选择最后一个文档，代表价格最低的商品。

第三阶段使用 $project 管道对数据修整，移除 _id 字段，添加 category 字段值为上一阶段传递来的商品分类(category)，maxGoods 为价格最高的商品，minGoods 为价格最低的商品。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

第一阶段使用 $match 管道筛选某一天的订单，将结果传递至下一阶段

第二阶段使用 $group 管道使用 avg 表达式计算平均客单价

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
  "_id": "1",
  "publish_date": 1611141512751,
  "content": "hello uniCloud content 01",
  "content": "hello uniCloud title 01",
}

{
  "_id": "2",
  "publish_date": 1611141512752,
  "content": "hello uniCloud content 02",
  "content": "hello uniCloud title 02",
}

{
  "_id": "3",
  "publish_date": 1611141512753,
  "content": "hello uniCloud content 03",
  "content": "hello uniCloud title 03",
}
```

Example 2 (json):
```json
{
  "_id": "1",
  "publish_date": 1611141512751,
  "content": "hello uniCloud content 01",
  "content": "hello uniCloud title 01",
}

{
  "_id": "2",
  "publish_date": 1611141512752,
  "content": "hello uniCloud content 02",
  "content": "hello uniCloud title 02",
}

{
  "_id": "3",
  "publish_date": 1611141512753,
  "content": "hello uniCloud content 03",
  "content": "hello uniCloud title 03",
}
```

Example 3 (json):
```json
{
  "_id": "1",
  "publish_date": 1611141512751,
  "content": "hello uniCloud content 01",
  "content": "hello uniCloud title 01",
}

{
  "_id": "2",
  "publish_date": 1611141512752,
  "content": "hello uniCloud content 02",
  "content": "hello uniCloud title 02",
}

{
  "_id": "3",
  "publish_date": 1611141512753,
  "content": "hello uniCloud content 03",
  "content": "hello uniCloud title 03",
}
```

Example 4 (json):
```json
{
  "_id": "1",
  "publish_date": 1611141512751,
  "content": "hello uniCloud content 01",
  "content": "hello uniCloud title 01",
}

{
  "_id": "2",
  "publish_date": 1611141512752,
  "content": "hello uniCloud content 02",
  "content": "hello uniCloud title 02",
}

{
  "_id": "3",
  "publish_date": 1611141512753,
  "content": "hello uniCloud content 03",
  "content": "hello uniCloud title 03",
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=distinct

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## 基础概念@base | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/hellodb.html

**Contents:**
- # 基础概念
- # 创建第一个表
- # 数据表的3个组成部分
  - # 数据内容
  - # 数据库索引
  - # 数据表格式定义
- # API操作数据库的方式
- # 获取数据库对象的API
  - # 获取其他服务空间数据库实例
- # 创建集合/表的API

uniCloud提供了一个 JSON 格式的文档型数据库。顾名思义，数据库中的每条记录都是一个 JSON 格式的文档。

它是 nosql 非关系型数据库，如果您之前熟悉 sql 关系型数据库，那么两者概念对应关系如下表：

例如，数据库中有一个表，名为user，存放用户信息。表user的数据内容如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据中，每行数据表示一个用户的信息，被称之为“记录(record/doc)”。name和tel称之为“字段(field)”。而“13900000000”则是第一条记录的字段tel的值。

每行记录，都是一个完整的json文档，获取到记录后可以使用常规json方式操作。但表并非json文档，表是多个json文档的汇总，获取表需要使用专门的API。

与关系型数据库的二维表格式不同，json文档数据库支持不同记录拥有不同的字段、支持多层嵌套数据。

仍然以user表举例，要在数据库中存储每个人的每次登录时间和登录ip，则变成如下：

示例源码如下，请查看 pre > code 标签中的内容

上述数据表示张三登录了2次，login_date里的值是时间戳(timestamp)格式，在数据库内timestamp就是一个数字类型的数据。而李四没有登录过。

可以看出json文档数据库相对于关系型数据库的灵活，李四可以没有login_log字段，也可以有这个字段但登录次数记录与张三不同。

此处仅为举例，实际业务中，登录日志单独存放在另一个表更合适

对于初学者，如果不了解数据库设计，可以参考opendb，已经预置了大量常见的数据库设计。

对于不熟悉传统数据库，但掌握json的js工程师而言，uniCloud的云数据库更亲切，没有传统数据库高昂的学习成本。

在uniCloud web控制台新建表时，在下面的模板中也可以选择各种opendb表模板，直接创建。

uniCloud同时支持阿里云、腾讯云和支付宝云，它们的数据库大体相同，有细微差异。阿里云和支付宝云的数据库是mongoDB4.0，腾讯云则使用自研的文档型数据库（兼容mongoDB 4.0版本）。uniCloud基本抹平了不同云厂商的差异，有差异的部分会在文档中单独标注。

打开 uniCloud web控制台 https://unicloud.dcloud.net.cn/

创建或进入一个已存在的服务空间，选择 云数据库->云数据库，创建一个新表

比如我们创建一个简历表，名为 resume。点击上方右侧的 创建 按钮即可。

新建表时，支持选择现成的 opendb 表模板，选择一个或多个模板表，可以点击右下方按钮创建。

在uniCloud的web控制台可以看到一个数据表的3部分内容。

data，就是存放的数据记录(record)。里面是一条一条的json文档。

record可以增删改查、排序统计。后续有API介绍。

可以先在 web控制台 为之前的 resume 表创建一条记录。

示例源码如下，请查看 pre > code 标签中的内容

创建一条新记录，是不管在web控制台创建，还是通过API创建，每条记录都会自带一个_id字段用以作为该记录的唯一标志。

_id字段是每个数据表默认自带且不可删除的字段。同时，它也是数据表的索引。

阿里云使用的是标准的mongoDB，_id是自增的，后创建的记录的_id总是大于先生成的_id。传统数据库的自然数自增字段在多物理机的大型数据库下很难保持同步，大型数据库均使用_id这种长度较长、不会重复且仍然保持自增规律的方式。

腾讯云使用的是兼容mongoDB的自研数据库，_id并非自增

插入/导入数据时也可以自行指定_id而不使用自动生成的_id，这样可以很方便的将其他数据库的数据迁移到uniCloud云数据库。

所谓索引，是指在数据表的众多字段中挑选一个或多个字段，让数据库引擎优先处理这些字段。

设置为索引的字段，在通过该字段查询(where)或排序(orderBy)时可以获得更快的查询速度。

但设置过多索引也不合适，会造成数据新增和删除变慢。

唯一型索引要求整个数据表多个记录的该字段的值不能重复。比如_id就是唯一型索引。

假使有2个人都叫“张三”，那么他们在user数据表里的区分就是依靠不同的_id来区分。

如果我们要根据name字段来查询，为了提升查询速度，此时可以把name字段设为非唯一索引。

索引内容较多，还有“组合索引”、“稀疏索引”、“地理位置索引”、“TTL索引”等概念。有单独的文档详细讲述索引，另见：数据库索引

DB Schema是表结构描述。描述数据表有哪些字段、值域类型是什么、是否必填、数据操作权限等很多内容。

因为 MongoDB 的灵活性，理论上DB Schema不是必须的，使用传统 MongoDB API 操作数据库不需要DB Schema。

但如果使用 JQL，那DB Schema就是必须的。

DB Schema涉及内容较多，另见文档：https://uniapp.dcloud.io/uniCloud/schema

uniCloud 的云数据库有多种操作方式。

uniCloud 默认推荐使用 JQL 语法操作数据库，它是一种更简单易用、对js开发者更友好的、开发效率更高的数据库操作语法。详见

不管在云函数中还是在uni-app客户端中，均支持JQL。

同时 uniCloud 保留了在云函数中使用传统 MongoDB 的 nodejs API 操作云数据库。

优先使用客户端操作数据库（称为clientDB）

传统开发中，其实大多数服务器接口开发，就是检验下前端数据和身份的合法性，然后写个SQL操作下数据库，返回JSON给前端。其实很无聊。

clientDB最大的好处就是不用写服务端代码，客户端直接操作数据库。因为uniCloud提供了DB Schema和uni-id，可以直接控制数据库的内容和权限校验。

clientDB同时支持action云函数作为补充，当发起一个客户端操作云数据库的请求时，可以同时触发一个action云函数，在云端对数据库操作进行前置或后置处理。

对于clientDB不适应的场景，推荐在云函数或云对象中使用JQL。

目前云函数中JQL不适用的场景：使用 set 操作符动态修改字段名称（不是字段值）。这个场景常规业务不涉及，未来JQL可能会完善并支持这个场景。

除非开发者原本就对 nodejs 操作 MongoDB 非常熟悉，且需要使用 set 操作符动态修改字段名等，否则不推荐使用传统MongoDB写法。

MongoDB API操作数据库，不能在客户端操作、不支持 DB Schema，不支持HBuilderX的jql查询器，不能在客户端的代码提示中提示数据库的表名、字段。

不管使用哪种方法，都有很多公共的概念或功能。本文档将讲述这些公共的内容。

同时左侧导航有三种方法的专项链接，描述它们各自特有的功能。

想要通过代码操作数据库，第一步要获取服务空间里的数据库对象。

示例源码如下，请查看 pre > code 标签中的内容

js中敲下代码块cdb，即可快速输入上述代码。

其中，云函数内使用JQL扩展库时，还需要做一个工作，就是指定操作用户身份。详见

示例源码如下，请查看 pre > code 标签中的内容

如果当前应用仅使用一个服务空间，在HBuilderX中做好服务空间关联即可。获取当前空间的数据库实例时无需传递配置，直接调用database方法默认就是操作关联服务空间的数据库。

如果应用有连接其他服务空间数据库的需求，可以在获取database实例时传递对应服务空间的配置

HBuilderX 3.2.11及更高版本支持客户端初始化其他服务空间database实例，此前仅腾讯云云函数环境支持。阿里云云函数环境不支持此用法。

调用uniCloud.database()时可以传入对应的服务空间信息（参数同uniCloud.init，参考:uniCloud.init）来获取指定服务空间的database实例。

示例源码如下，请查看 pre > code 标签中的内容

调用add方法，给某数据表新增数据记录时，如果该数据表不存在，会自动创建该数据表。如下代码给table1数据表新增了一条数据，如果table1不存在，会自动创建。

示例源码如下，请查看 pre > code 标签中的内容

腾讯云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

支付宝云提供了专门的创建数据表的API，此API仅支持云函数内运行，不支持clientDB调用。

示例源码如下，请查看 pre > code 标签中的内容

创建好数据表后，可以通过API获取数据表对象。

示例源码如下，请查看 pre > code 标签中的内容

集合/数据表 Collection 的方法

通过 db.collection(name) 可以获取指定数据表的引用，在数据表上可以进行以下操作

collection对象的方法可以增和查数据，删和改不能直接操作，需要collection对象通过doc或get得到指定的记录后再调用remove或update方法进行删改。

这里我们使用clientDB，实现一个简单的在前端获取刚才输入 resume 表的记录的功能。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema的数据类型有专门文档，详见

Date 类型用于表示时间，精确到毫秒，可以用 JavaScript 内置 Date 对象创建。需要特别注意的是，连接本地云函数时，用此方法创建的时间是客户端当前时间，不是服务端当前时间，只有连接云端云函数才是服务端当前时间。

另外，我们还单独提供了一个 API 来创建服务端当前时间，使用 serverDate 对象来创建一个服务端当前时间的标记，该对象暂时只支持腾讯云空间，当使用了 serverDate 对象的请求抵达服务端处理时，该字段会被转换成服务端当前的时间，更棒的是，我们在构造 serverDate 对象时还可通过传入一个有 offset 字段的对象来标记一个与当前服务端时间偏移 offset 毫秒的时间，这样我们就可以达到比如如下效果：指定一个字段为服务端时间往后一个小时。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

不同于传统开发，连接数据库有单次操作时长限制，目前单次操作时间限制如下。超出此时间会报超时错误。一般情况下在设置了合适的索引时不会遇到超时错误，如何优化查询速度请参考：数据库性能优化

如果是大数据批处理，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

uniCloud数据库提供了多种数据导入导出和备份方案。

除上述三种方法外，开发者还可以编程处理数据的导入导出。如进行大量数据操作，建议在HBuilderX的本地运行云函数环境中操作，这样可以避免触发云端的云函数超时限制。

旧规范中的db_init.json废弃，但是仍保留db_init.json上的初始化菜单，对db_init.json文件执行初始化操作时，其中的初始化数据、索引、schema会被拆分成多个文件。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

HBuilderX 3.97及以上版本，uniCloud内database目录支持直接右键进行数据库初始化。database目录下支持以下几种文件类型

在执行数据库初始化操作时，上述文件都会被上传到云端。

web控制台导出时默认不包括_id字段，在导入时，数据库插入新记录时会自动补_id字段。如果需要指定_id，需要手工补足数据。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

注意下面的示例仅为演示，实际配置时不要带注释

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.97及之后版本需要拆分为上面一种方式对应的文件，可以在项目管理器选中db_init.json右键初始化数据库时自动拆分。

此方式导入导出会消耗数据库读写次数，不适用于大数据量导入导出，仅适用于项目初始化。

db_init.json定义了一个json格式，里面包含了表名、表数据、表索引等表的相关数据。

在HBuilderX中，项目的cloudfunctions目录（HBuilderX 2.5.11 - 2.9.11版本） 或 uniCloud/database 目录（HBuilderX 3.0+版本），可以放置db_init.json文件，对该文件点右键，可以按db_init.json的描述，在云服务空间创建相应的表、初始化表中的数据、索引和schema。

这个功能尤其适合插件作者，可以快速初始化插件所需的数据库环境。

db_init.json包含三部分：数据内容(data)、数据表索引(index)、数据表结构(schema)，形式如下

注意：HBuilderX 3.0.0以上版本schema不再放在db_init.json内，而是独立放在uniCloud/database/目录下。

HBuilderX 3.0.0版本之前的db_init.json示例

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中对上述db_init.json点右键，可初始化数据库到云服务空间，创建collection_test表，并按上述json配置设置该表的index索引和schema，以及插入data下的数据。

opendb的表，在db_init.json中初始化时，不建议自定义index和schema。系统会自动从opendb规范中读取最新的index和schema。

在HBuilderX中，对项目下的cloudfunctions目录下的db_init.json点右键，即可选择初始化云数据库。将db_init.json里的内容导入云端。

在uniCloud web控制台的数据库界面，左侧导航点击 生成db_init.json，会将选择的表的内容、索引、表结构导出为db_init.json文件。

在db_init.json内可以使用以下形式定义Date类型的数据：

示例源码如下，请查看 pre > code 标签中的内容

uniCloud会在每天凌晨自动备份一次数据库，最多保留7天。这让开发者不再担心数据丢失。

此功能主要用于导出整个表的数据，导出文件为jsonl格式

jsonl格式示例，形如下面这样每行一个json格式的数据库记录的文件

示例源码如下，请查看 pre > code 标签中的内容

uniCloud提供的db_init.json主要是为了对数据库进行初始化，并不适合导入大量数据。与db_init.json不同，数据导入功能可以导入大量数据，目前支持导入 CSV、JSON 格式（关于json格式看下面注意事项）的文件数据。

如果是自己拼接的json格式数据请注意：如果存在表A关联表B的字段的场景需要保证关联字段在A、B内是一致的（特别需要注意的是各种与_id关联的字段）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 2 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 3 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

Example 4 (json):
```json
{"name":"张三","tel":"13900000000"}
{"name":"李四","tel":"13911111111"}
```

---

## JQL数据库操作 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql.html

**Contents:**
- # JQL数据库操作
    - # jql的诞生背景
- # JQL流程图解
- # JQL包含的模块
- # JQL的使用场景
  - # 不同场景的区别
- # JQL的限制
- # JQL方法使用限制
  - # 单表查询
  - # 联表查询

JQL，全称 javascript query language，是一种js方式操作数据库的规范。

传统的数据库查询，有sql和nosql两种查询语法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

sql写法，对js工程师而言有学习成本，而且无法处理非关系型的MongoDB数据库，以及sql的联表查询inner join、left join也并不易于学习。

而nosql的写法，实在过于复杂。比如如下3个例子：

比如一个简单的查询，取field1>0，则需要如下复杂写法

示例源码如下，请查看 pre > code 标签中的内容

如果要表达或关系，需要用or方法，写法更复杂

示例源码如下，请查看 pre > code 标签中的内容

sql的inner join、left join已经够乱了，而nosql的代码无论写法还是可读性，都更“令人发指”。比如这个联表查询：

示例源码如下，请查看 pre > code 标签中的内容

这些问题竖起一堵墙，让后端开发难度加大，成为一个“专业领域”。但其实这堵墙是完全可以推倒的。

jql将解决这些问题，让js工程师没有难操作的数据库。

示例源码如下，请查看 pre > code 标签中的内容

下图包括clientDB及云函数内使用jql扩展库的调用流程

这里选择以使用了JQL完整功能clientDB为例，JQL操作数据库的流程如下。不同使用场景的区别请参考： JQL的使用场景

上述场景在新增、修改数据时都会执行数据校验，但是关于权限校验及action部分稍有不同

下面这些方法必须严格按照下面的顺序进行调用，其他方法需要在这些方法之后调用（不限制顺序）

示例源码如下，请查看 pre > code 标签中的内容

临时表可以使用以下方法（需按照下面的顺序调用）

示例源码如下，请查看 pre > code 标签中的内容

虚拟联表可以使用以下方法（需按照下面的顺序调用）

示例源码如下，请查看 pre > code 标签中的内容

仅允许collection().add()这样的形式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如需自定义返回的err对象，可以在clientDB中挂一个action云函数，在action云函数的after内用js修改返回结果，传入after内的result不带code和message。

示例源码如下，请查看 pre > code 标签中的内容

使用jql查询语法时，可以直接使用students=='wang'作为查询条件来查询students内包含wang的记录。

示例源码如下，请查看 pre > code 标签中的内容

如果使用unicloud-db组件写法如下

示例源码如下，请查看 pre > code 标签中的内容

上面的示例中使用了正则修饰符i，用于表示忽略大小写

JQL于2021年4月28日优化了联表查询策略，详情参考：联表查询策略调整

JQL提供了更简单的联表查询方案。不需要学习join、lookup等复杂方法。

只需在db schema中，将两个表的关联字段建立映射关系，就可以把2个表当做一个虚拟联表来直接查询。

示例源码如下，请查看 pre > code 标签中的内容

上面两种写法最终结果一致，但是第二种写法性能更好。第一种写法会先将所有数据进行关联，如果数据量很大这一步会消耗很多时间。详细示例见下方说明

通过HBuilderX提供的JQL数据库管理功能方便的查看联表查询时返回数据的结构

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

比如有以下两个表，book表，存放书籍商品；order表存放书籍销售订单记录。

book表内有以下数据，title为书名、author为作者：

示例源码如下，请查看 pre > code 标签中的内容

order表内有以下数据，book_id字段为book表的书籍_id，quantity为该订单销售了多少本书：

示例源码如下，请查看 pre > code 标签中的内容

如果我们要对这2个表联表查询，在订单记录中同时显示书籍名称和作者，那么首先要建立两个表中关联字段book的映射关系。

即，在order表的db schema中，配置字段 book_id 的foreignKey，指向 book 表的 _id 字段，如下

示例源码如下，请查看 pre > code 标签中的内容

book表的DB Schema也要保持正确

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，即使用JQL查询。查询表设为order和book这2个表名后，即可自动按照一个合并虚拟联表来查询，field、where等设置均按合并虚拟联表来设置。

示例源码如下，请查看 pre > code 标签中的内容

上面的写法是jql语法，如果不使用jql的话，使用传统MongoDB写法，需要写很长并且不太容易看懂的代码，大致如下

示例源码如下，请查看 pre > code 标签中的内容

上述查询会返回如下结果，可以看到书籍信息被嵌入到order表的book_id字段下，成为子节点。同时根据where条件设置，只返回书名为三国演义的订单记录。

示例源码如下，请查看 pre > code 标签中的内容

二维关系型数据库做不到这种设计。jql充分利用了json文档型数据库的特点，动态嵌套数据，实现了这个简化的联表查询方案。

不止是2个表，3个、4个表也可以通过这种方式查询，多表场景下只能使用副表与主表之间的关联关系（foreignKey），不可使用副表与副表之间的关联关系。

不止js，<unicloud-db>组件也支持所有jql功能，包括联表查询。

在前端页面调试JQL联表查询且不过滤字段时会受权限影响，导致调试比较困难。可以通过HBuilderX提供的JQL数据库管理功能方便的查看联表查询时的虚拟联表结构。

如上述查询可以直接在JQL文件中执行以下代码查看完整的返回字段

示例源码如下，请查看 pre > code 标签中的内容

在此之前JQL联表查询只能直接使用虚拟联表，而不能先对主表、副表过滤再生成虚拟联表。由于生成虚拟联表时需要整个主表和副表进行联表，在数据量大的情况下性能会很差。

使用临时表进行联表查询，可以先对主表或者副表进行过滤，然后在处理后的临时表的基础上生成虚拟联表。

仍以上面article、comment两个表为例

获取article_id为'1'的文章及其评论的数据库操作，在直接联表查询和使用临时表联表查询时写法分别如下

示例源码如下，请查看 pre > code 标签中的内容

直接使用虚拟联表联表查询，在第一步生成虚拟联表时会以主表所有数据和副表进行联表查询，如果主表数据量很大，这一步会浪费相当多的时间。先过滤主表则没有这个问题，过滤之后仅有一条数据和副表进行联表查询。

方法调用必须严格按照顺序，比如field不能放在where之前

示例源码如下，请查看 pre > code 标签中的内容

临时表内如果使用field进行字段过滤需要保留关联字段

示例源码如下，请查看 pre > code 标签中的内容

方法调用必须严格按照顺序，比如foreignKey不能放在where之后

示例源码如下，请查看 pre > code 标签中的内容

一般情况下不需要再对虚拟联表额外处理，因为数据在临时表内已经进行了过滤排序等操作。以下代码仅供演示，并无实际意义

示例源码如下，请查看 pre > code 标签中的内容

要求组成虚拟联表的各个临时表都要满足权限限制，即权限校验不会计算组合成虚拟联表之后使用的where、field

以下为一个订单表（order）和书籍表（book）的schema示例

示例源码如下，请查看 pre > code 标签中的内容

如果先对主表进行过滤where('uid==$cloudEnv_uid')，则能满足权限限制（order表的"doc.uid==auth.uid"）

示例源码如下，请查看 pre > code 标签中的内容

如果不对主表过滤，而是对虚拟联表（联表结果）进行过滤，则无法满足权限限制（order表的"doc.uid==auth.uid"）

示例源码如下，请查看 pre > code 标签中的内容

联表查询时也可以在field内对字段进行重命名，写法和简单查询时别名写法类似，原字段名 as 新字段名即可。简单查询时的字段别名

仍以上述order、book两个表为例，以下查询将联表查询时order表的quantity字段重命名为order_quantity，将book表的title重命名为book_title、author重命名为book_author

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果存在多个foreignKey且只希望部分生效，可以使用foreignKey来指定要使用的foreignKey

2021年4月28日10点前此方法仅用于兼容JQL联表查询策略调整前后的写法，在此日期后更新的clientDB（上传schema、uni-id均会触发更新）才会有指定foreignKey的功能，关于此次调整请参考：联表查询策略调整

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

2021年4月28日之前的JQL只支持主表的foreignKey，把副表内容嵌入主表的foreignKey字段下面。不支持处理副本的foreignKey。

2021年4月28日调整后，新版支持副表foreignKey联查。副表的数据以数组的方式嵌入到主表中作为一个虚拟联表使用。

通过HBuilderX提供的JQL数据库管理功能方便的查看联表查询时返回数据的结构

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以下查询使用comment表的article字段对应的foreignKey进行关联查询

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如需对上述查询的副表字段进行过滤，需要注意多插入的一层副表表名

示例源码如下，请查看 pre > code 标签中的内容

副表内的字段也可以使用as进行重命名，例如上述查询中如果希望将副表的content重命名为value可以使用如下写法

HBuilderX 3.3.7及以上版本支持getTemp内使用as

示例源码如下，请查看 pre > code 标签中的内容

jql对查询条件进行了简化，开发者可以使用where('a==1||b==2')来表示字段a等于1或字段b等于2。如果不使用jql语法，上述条件需要写成下面这种形式

示例源码如下，请查看 pre > code 标签中的内容

两种用法性能上并没有太大差距，可以视场景选择合适的写法。

jql支持两种类型的查询条件，以下内容有助于理解两种的区别，实际书写的时候无需过于关心是简单查询条件还是复杂查询条件，JQL会自动进行选择

where内还支持使用云端环境变量，详情参考：云端环境变量

在 unicloud-db 组件中使用where查询 参考

简单查询条件包括以下几种，对应着db.command下的各种操作符 以及不使用操作符的查询如where({a:1})。

这里的test方法比较强大，格式为：正则规则.test(fieldname)。

具体到这个正则 /abc/.test(content)，类似于sql中的content like '%abc%'，即查询所有字段content包含abc的数据记录。

简单查询条件内要求二元运算符两侧不可均为数据库内的字段

上述写法的查询语句可以在权限校验阶段与schema内配置的permission进行一次对比校验，如果校验通过则不会再查库进行权限校验。

复杂查询内可以使用数据库运算方法。需要注意的是，与云函数内使用数据库运算方法不同jql内对数据库运算方法的用法进行了简化。

示例源码如下，请查看 pre > code 标签中的内容

使用如下写法可以筛选语文数学总分大于150的数据

示例源码如下，请查看 pre > code 标签中的内容

另外与简单查询条件相比，复杂查询条件可以比较数据库内的两个字段，简单查询条件则要求二元运算符两侧不可均为数据库内的字段，JQL会自动判断要使用简单查询还是复杂查询条件。

例：仍以上面的数据为例，以下查询语句可以查询数学得分比语文高的记录

示例源码如下，请查看 pre > code 标签中的内容

在查询条件时也可以使用new Date()来获取一个日期对象。

示例源码如下，请查看 pre > code 标签中的内容

使用下面的写法可以查询deadline小于当前时间（云函数内的时间）的字段

示例源码如下，请查看 pre > code 标签中的内容

可以通过skip+limit来进行分页查询

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db>组件提供了更简单的分页方法，包括两种模式：

详见：https://doc.dcloud.net.cn/uniCloud/unicloud-db?id=page

查询时可以使用field方法指定返回字段。不使用field方法时会返回所有字段

field可以指定字符串，也可以指定一个对象。

如果数据库里的数据结构是嵌套json，比如book表有个价格字段，包括普通价格和vip用户价格，数据如下：

示例源码如下，请查看 pre > code 标签中的内容

那么使用db.collection('book').field("price.vip").get()，就可以只返回vip价格，而不返回普通价格。查询结果如下：

示例源码如下，请查看 pre > code 标签中的内容

对于联表查询，副表的数据嵌入到了主表的关联字段下面，此时在filed里通过{}来定义副表字段。比如之前联表查询章节举过的例子，book表和order表联表查询：

示例源码如下，请查看 pre > code 标签中的内容

field方法内可以不使用{}进行副表字段过滤，以上面示例为例可以写为

示例源码如下，请查看 pre > code 标签中的内容

自2020-11-20起JQL支持字段别名，主要用于在前端需要的字段名和数据库字段名称不一致的情况下对字段进行重命名。

用法形如：author as book_author，意思是将数据库的author字段重命名为book_author。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

_id是比较特殊的字段，如果对_id设置别名会同时返回_id和设置的别名字段

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

副表字段使用别名需要注意，如果写成.field('book_id.title as book_id.book_title,book_id.author,quantity as order_quantity') book_title将会是由book_id下每一项的title组成的数组，这点和mongoDB内数组表现一致

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，JQL支持在云端数据库对字段进行一定的操作运算之后再返回，详细可用的方法列表请参考：数据库常用运算方法

需要注意的是，为方便书写，JQL内将数据库运算方法的用法进行了简化（相对于云函数内使用数据库运算方法而言）。用法请参考上述链接

示例源码如下，请查看 pre > code 标签中的内容

如下写法可以由grade计算得到一个isTopGrade来表示是否为最高年级

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

传统的MongoDB的排序参数是json格式，jql支持类sql的字符串格式，书写更为简单。

sort方法和orderBy方法内可以传入一个字符串来指定排序规则。

orderBy允许进行多个字段排序，以逗号分隔。每个字段可以指定 asc(升序)、desc(降序)。默认是升序。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用limit方法，可以查询有限条数的数据记录。

比如查询销量top10的书籍，或者查价格最高的一本书。

示例源码如下，请查看 pre > code 标签中的内容

limit默认值是100，即不设置的情况下，默认返回100条数据。limit最大值为1000。

一般情况下不应该给前端一次性返回过多数据，数据库查询也慢、网络返回也慢。可以通过分页的方式分批返回数据。

在查询的result里，有一个affectedDocs。但affectedDocs和limit略有区别。affectedDocs小于等于limit。

比如book表里只有2本书，limit虽然设了10，但查询结果只能返回2条记录，affectedDocs为2。

使用JQL的API方式时，可以在get方法内传入参数getOne:true来返回一条数据。

getOne其实等价于上一节的limit(1)。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果使用uniCloud-db组件，则在组件的属性上增加一个 getone。详见

统计符合查询条件的记录数，是数据库层面的概念。

在查询的result里，有一个affectedDocs。但affectedDocs和count计数不是一回事。

例如book表里有110本书，不写任何where、limit等条件，但写了count方法或getCount参数，那么result会变成如下：

示例源码如下，请查看 pre > code 标签中的内容

也就是数据库查到了110条记录，通过count返回；而网络侧只给前端返回了100条数据，通过affectedDocs表示。

使用count()方法，如db.collection('order').count()

可以继续加where等条件进行数据记录过滤。

使用JQL的API方式时，可以在get方法内传入参数getCount:true来同时返回总数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果使用uniCloud-db组件，则在组件的属性上增加一个 getcount。详见

HBuilderX 3.0.3+起，JQL支持在get方法内传入getTree参数查询树状结构数据。（HBuilderX 3.0.5+ unicloud-db组件开始支持，之前版本只能通过js方式使用）

树形数据，在数据库里一般不会按照tree的层次来存储，因为按tree结构通过json对象的方式存储不同层级的数据，不利于对tree上的某个节点单独做增删改查。

一般存储树形数据，tree上的每个节点都是一条单独的数据表记录，然后通过类似parent_id来表达父子关系。

如部门的数据表，里面有2条数据，一条数据记录是“总部”，parent_id为空；另一条数据记录“一级部门A”，parent_id为总部的_id

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

虽然存储格式是分条记录的，但查询反馈到前端的数据仍然需要是树形的。这种转换在过去比较复杂。

JQL提供了一种简单、优雅的方案，在DB Schema里配置parentKey来表达父子关系，然后查询时声明使用Tree查询，就可以直接查出树形数据。

department部门表的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey字段将数据表不同记录的父子关系描述了出来。查询就可以直接写了。

注意：一个表的一次查询中只能有一个父子关系。如果一个表的schema里多个字段均设为了parentKey，那么需要在JQL中通过parentKey()方法指定某个要使用的parentKey字段。

schema里描述好后，查询就变的特别简单。

查询树形数据，分为 查询所有子节点 和 查询父级路径 这2种需求。

指定符合条件的记录，然后查询它的所有子节点，并且可以指定层级，返回的结果是以符合条件的记录为一级节点的所有子节点数据，并以树形方式嵌套呈现。

只需要在JQL的get方法中增加getTree参数，如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以看出，每个子节点，被嵌套在父节点的"children"下，这个"children"是一个固定的格式。

如果不指定getTree的参数，会把department表的所有数据都查出来，从总部开始到10级部门，以树形结构提供给客户端。

如果有多个总部，即多行记录的parent_id为空，则多个总部会分别作为一级节点，把它们下面的所有children一级一级拉出来。如下：

示例源码如下，请查看 pre > code 标签中的内容

如果觉得返回的parent_id字段多余，也可以指定.field("_id,name")，过滤掉该字段。

getTree的参数limitLevel的说明

limitLevel表示查询返回的树的最大层级。超过设定层级的节点不会返回。

getTree的参数startWith的说明

如果只需要查“总部”的子部门，不需要“总部2”，可以在startWith里指定（getTree: {"startWith":"name=='总部'"}）。

使用中请注意startWith和where的区别。where用于描述对所有层级的生效的条件（包括第一层级）。而startWith用于描述从哪个或哪些节点开始查询树。

startWith不填时，默认的条件是 'parent_id==null||parent_id==""'，即schema配置parentKey的字段为null（即不存在）或值为空字符串时，这样的节点被默认视为根节点。

示例源码如下，请查看 pre > code 标签中的内容

以下查询语句指定startWith为_id=="1"、where条件为status==0，查询总部下所有status为0的子节点。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

需要注意的是where内的条件也会对第一级数据生效，例如将上面的查询改成如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过parentKey方法指定某个parentKey

如果表的schema中有多个字段都配置了parentKey，但查询时其实只能有一个字段的parentKey关系可以生效，那么此时就需要通过parentKey()方法来指定这次查询需要的哪个parentKey关系生效。

parentKey()方法的参数是字段名。

示例源码如下，请查看 pre > code 标签中的内容

插件市场有一个 家谱 的示例，可以参阅：https://ext.dcloud.net.cn/plugin?id=3798

如果tree的数据量较大，则不建议一次性把所有的树形数据返回给客户端。建议分层查询，即懒加载。

比如地区选择的场景，全国的省市区数据量很大，一次性查询所有数据返回给客户端非常耗时和耗流量。可以先查省，然后根据选择的省再查市，以此类推。

getTree是查询子节点，而getTreePath，则是查询父节点。

get方法内传入getTreePath参数对包含父子关系的表查询返回树状结构数据某节点路径。

示例源码如下，请查看 pre > code 标签中的内容

查询返回的结果为，从“一级部门A”起向上找10级，找到最终节点后，以该节点为根，向下嵌套children，一直到达“一级部门A”。

返回结果只包括“一级部门A”的直系父，其父节点的兄弟节点不会返回。所以每一层数据均只有一个节点。

仍以上面department的表结构和数据为例

示例源码如下，请查看 pre > code 标签中的内容

从根节点“总部”开始，返回到“一级部门A”。“总部2”等节点不会返回。

示例源码如下，请查看 pre > code 标签中的内容

如果startWith指定的节点没有父节点，则返回自身。

如果startWith匹配的节点不止一个，则以数组的方式，返回每个节点的treepath。

例如“总部”和“总部2”下面都有一个部门的名称叫“销售部”，且 "startWith": "name=='销售部'"，则会返回“总部”和“总部2”两条treepath，如下

示例源码如下，请查看 pre > code 标签中的内容

本地调试支持：HBuilderX 3.1.0+；云端支持：2021-1-26日后更新一次云端 DB Schema 生效

数据分组统计，即根据某个字段进行分组（groupBy），然后对其他字段分组后的值进行求和、求数量、求均值。

比如统计每日新增用户数，就是按时间进行分组，对每日的用户记录进行count运算。

分组统计有groupBy和groupField。和传统sql略有不同，传统sql没有单独的groupField。

JQL的groupField里不能直接写field字段，只能使用分组运算方法来处理字段，常见的累积器计算符包括：count(*)、sum(字段名称)、avg(字段名称)。更多分组运算方法详见

示例源码如下，请查看 pre > code 标签中的内容

如果额外还在groupBy之前使用了field方法，那么此field的含义并不是最终返回的字段，而是用于对字段预处理，然后将预处理的字段传给groupBy和groupField使用。

与field不同，使用groupField时返回结果不会默认包含_id字段。同时开发者也不应该在groupBy和groupField里使用_id字段，_id是唯一的，没有统一意义。

举例： 如果数据库score表为某次比赛统计的分数数据，每条记录为一个学生的分数。学生有所在的年级（grade）、班级（class）、姓名（name）、分数（score）等字段属性。

示例源码如下，请查看 pre > code 标签中的内容

接下来我们对这批数据进行分组统计，分别演示如何使用求和、求均值和计数。

groupBy内也可以使用数据库运算方法对数据进行处理，为方便书写，clientDB内将数据库运算方法的用法进行了简化（相对于云函数内使用数据库运算方法而言）。用法请参考：数据库运算方法

groupField内可以使用分组运算方法对分组结果进行统计，所有可用的累积方法请参考分组运算方法，下面以sum（求和）和avg（求均值）为例介绍如何使用

使用sum方法可以对数据进行求和统计。以上述数据为例，如下写法对不同班级进行分数统计

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

1年级A班、1年级B班、2年级A班，3个班级的总分分别是20、40、60。

求均值方法与求和类似，将上面sum方法换成avg方法即可

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果额外还在groupBy之前使用了field方法，此field用于决定将哪些数据传给groupBy和groupField使用

示例源码如下，请查看 pre > code 标签中的内容

如下field写法将上面的score数组求和之后传递给groupBy和groupField使用。在field内没出现的字段（比如name），在后面的方法里面不能使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用count方法可以对记录数量进行统计。以上述数据为例，如下写法对不同班级统计参赛人数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

按时间段统计是常见的需求，而时间段统计会用到日期运算符。

假设要统计uni-id-users 表的每日新增注册用户数量。表内有以下数据：

示例源码如下，请查看 pre > code 标签中的内容

由于register_date字段是时间戳格式，含有时分秒信息。但统计每日新增注册用户时是需要忽略时分秒的。

add操作符的用法为add(值1,值2)。add(new Date(0),register_date)表示给字段register_date + 0，这个运算没有改变具体的时间，但把register_date的格式从时间戳转为了日期类型。

dateToString操作符的用法为dateToString(日期对象,格式化字符串,时区)。具体如下：dateToString(add(new Date(0),register_date),"%Y-%m-%d","+0800")

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

完整数据库运算方法列表请参考：JQL内可使用的数据库运算方法

在使用普通的累积器操作符，如sum、avg时，权限控制与常规的权限控制并无不同。

但使用count时，可以单独配置表级的count权限。

请不要轻率的把uni-id-users 表的count权限设为true，即任何人都可以count。这意味着游客将可以获取到你的用户总数量。

通过.distinct()方法，对数据查询结果中重复的记录进行去重。

distinct方法将按照field方法指定的字段进行去重（如果field内未指定_id，不会按照_id去重）

本地调试支持：HBuilderX 3.1.0+；云端支持：2021-1-26日后更新一次云端 DB Schema生效

示例源码如下，请查看 pre > code 标签中的内容

例：如果数据库score表为某次比赛统计的分数数据，每条记录为一个学生的分数

示例源码如下，请查看 pre > code 标签中的内容

以下代码可以按照grade、class两字段去重，获取所有参赛班级

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

geoNear可用于查询位置在给定点一定距离内的数据库记录。此方法必须紧跟在collection方法或aggregate方法后。

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

用于匹配某字段和另一个表的字段相等的记录，类似sql语句中的in+子查询的写法，只能在where方法内使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

in的这种用法底层使用了lookup方法，在数据量很大时效率不高，推荐在使用时尽量在in之外的条件内筛选出尽量小的数据集。以上述示例中register_date > 1670000000000 && company_id in ${companyFilter}查询条件为例，register_date > 1670000000000这部分条件应筛选出尽量小的结果集以便查询能更高效。

获取到db的表对象后，通过add方法新增数据记录。

方法：collection.add(data)

data支持一条记录，也支持多条记录一并新增到集合中。

data中不需要包括_id字段，数据库会自动维护该字段。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果上述代码执行成功，则res的值将包括inserted:3，代表插入3条数据，同时在ids里返回3条记录的_id。

如果新增记录失败，会抛出异常，以下代码示例为捕获异常：

示例源码如下，请查看 pre > code 标签中的内容

获取到db的表对象，然后指定要删除的记录，通过remove方法删除。

注意：如果是非admin账户删除数据，需要在数据库中待操作表的db schema中要配置permission权限，赋予delete允许用户操作的权限。

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很多的情况下这种方式删除会超时，但是数据仍会全部删除掉

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

获取到db的表对象，然后指定要更新的记录，通过update方法更新。

注意：如果是非admin账户修改数据，需要在数据库中待操作表的db schema中要配置permission权限，赋予update为true。

collection.doc().update(Object data)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，以数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.1.22及以上版本支持

在实际业务中通常会遇到一个页面需要查询多次的情况，比如应用首页需要查询轮播图列表、公告列表、首页商品列表等。如果分开请求需要发送很多次网络请求，这样会影响性能。使用multiSend可以将多个数据库请求合并成一个发送。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件也支持使用getTemp方法，结合multiSend可以与其他数据库请求一起发送

示例源码如下，请查看 pre > code 标签中的内容

JQL API 支持事务操作，与 uniCloud.database() 的事务操作类似，事务操作可以将多条增删改操作合并成一个原子操作，要么全部成功，要么全部失败。

示例源码如下，请查看 pre > code 标签中的内容

JQL API支持使用聚合操作读取数据，关于聚合操作请参考聚合操作

示例源码如下，请查看 pre > code 标签中的内容

新增于 HBuilderX 3.5.1，JQL数据库管理支持使用更新操作符

更新操作符可以在执行更新时使用。比如对字段重命名（rename）、删除字段（remove）等。适用于表结构变更后，使用 HBuilderX 的 JQL管理器进行数据变更。

db.command.rename重命名字段：

示例源码如下，请查看 pre > code 标签中的内容

db.command.remove删除字段：

示例源码如下，请查看 pre > code 标签中的内容

DB Schema是基于 JSON 格式定义的数据结构的规范。

这些工具大幅减少了开发者的开发工作量和重复劳动。

DB Schema是JQL紧密相关的配套，掌握JQL离不开详读DB Schema文档。

**下面示例中使用了注释，实际使用时schema是一个标准的json文件不可使用注释。**完整属性参考schema字段

示例源码如下，请查看 pre > code 标签中的内容

DB Schema中的数据权限配置功能非常强大，请详读DB Schema的数据权限控制

在配置好DB Schema的权限后，JQL的查询写法，尤其是非JQL的聚合查询写法有些限制，具体如下：

schema内permission配置示例

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在进行数据库操作之前，JQL会使用permission内配置的规则对客户端操作进行一次校验，如果本次校验不通过还会通过数据库查询再进行一次校验

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此时客户端条件里面只有doc._id == 1，schema内又限制的doc.user_id == auth.uid，所以第一次预校验无法通过，会进行一次查库校验判断是否有权限进行操作。发现auth.uid确实和doc.user_id一致，上面的数据库操作允许执行。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。以下内容仅为向下兼容保留

action的作用是在执行前端发起的数据库操作时，额外触发一段云函数逻辑。它是一个可选模块。action是运行于云函数内的，可以使用云函数内的所有接口。

当一个前端操作数据库的方式不能完全满足需求，仍然同时需要在云端再执行一些云函数时，就在前端发起数据库操作时，通过db.action("someactionname")方式要求云端同时执行这个叫someactionname的action。还可以在权限规则内指定某些操作必须使用指定的action，比如"action in ['action-a','action-b']"，来达到更灵活的权限控制。

注意action方法是db对象的方法，只能跟在db后面，不能跟在collection()后面

尽量不要在action中使用全局变量，如果一定要用请务必确保自己已经阅读并理解了云函数的启动模式

如果使用<unicloud-db>组件，该组件也有action属性，设置action="someactionname"即可。

示例源码如下，请查看 pre > code 标签中的内容

action支持一次使用多个，比如使用db.action("action-a,action-b")，其执行流程为action-a.before->action-b.before->执行数据库操作->action-b.after->action-a.after。在任一before环节抛出错误直接进入after流程，在after流程内抛出的错误会被传到下一个after流程。

action是一种特殊的云函数，它不占用服务空间的云函数数量。

每个action在uni-clientDB-actions目录下存放一个以action名称命名的js文件。

在这个js文件的代码里，包括before和after两部分，分别代表JQL具体操作数据库前和后。

before在数据库操作执行前触发，before里的代码执行完毕后再开始操作数据库。before的常用用途：

after在数据库操作执行后触发，JQL操作数据库后触发after里的代码。after的常用用途：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关文档移至：schema扩展依赖公共模块和扩展库

**Examples:**

Example 1 (sql):
```sql
select * from table1 where field1="value1"
```

Example 2 (sql):
```sql
select * from table1 where field1="value1"
```

Example 3 (sql):
```sql
select * from table1 where field1="value1"
```

Example 4 (sql):
```sql
select * from table1 where field1="value1"
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html

**Contents:**
- # 需求背景
- # uni-id 的价值
- # 功能清单
- # 组成结构
- # 快速上手
- # 云端配置config.json的说明
  - # 密码强度
  - # 登录方式及配置说明
  - # 用户注册时设置默认角色uni-id-pages 1.1.6+
- # token令牌

本文档适用于uni-id 4.0.0及以上版本，需 HBuilderX 3.5.0 及以上版本。旧版本文档请访问：uni-id 3.x.x 文档

99%的应用，都要开发用户注册、登录、发送短信验证码、修改密码、密码加密保存、密码防探测、token管理、页面访问权限、注册用户统计等众多功能，从前端到后端都需要。

为什么不能有一个开源的通用项目，避免大家的重复开发呢？

uni-id为uniCloud开发者提供了开源、易用、安全、丰富、可扩展的用户管理框架。

clientDB、DB Schema、uni-starter 、uni-admin，这些产品都基于uni-id的账户体系。可以说uni-id是uniCloud不可或缺的基础能力。

一个应用，往往需要集成多个功能模块。比如一个电商应用，需要一个基本电商模板，还需要客服聊天模板、统计看板模板。

在插件市场，每类模板插件都能找到，但他们如果不是基于同一套用户体系设计，就很难整合。

所有uniCloud的标准应用，都基于uni-id来做。uni-id-common公共模块自动内置在每个服务空间里的。

有了统一的账户规范，并且围绕这套账户规范，有各种各样插件，那么开发者可以随意整合这些插件，让数据互通。

规范，还可以让上下游充分协同。插件市场会出现各种数据迁移插件，比如把从discuz里把用户迁移到uni-id中的插件，相信围绕这套规范的产业链会非常活跃。

目前插件市场上各种优秀的uniCloud轮子，几乎都是基于uni-id的。

由于三方登录很多，DCloud没有精力全部实现，在uni-id-co中留下了空实现，欢迎开发者自行补充、提交pr或发布扩展插件，共同完善uni-id。。

后续计划：DCloud未来将内置 微信扫码登录和公众号登录、邮箱验证集成、facebook等海外主流社交账户登录、活体检测。

其他方面，各种常见开源项目如discuz、wordPress、ecshop的用户导入插件，不属于uni-id主工程，欢迎开发者单独提交插件到插件市场。

uni-id贯穿了uni-app前端到uniCloud后端的各个环节。

数据库是一个系统的核心，uni-id首先规范化了十几张用户相关的opendb数据表，

主表为uni-id-users表，保存用户的基本信息。扩展字段有很多，如实名认证数据、工作履历数据。由于MongoDB的特性，开发者可以自由扩展字段。

所有uni-id的数据表，不管在HBuilderX中新建 DB Schema 还是在 uniCloud web控制台新建表的界面上，都可以选择模板直接建好。

uni-id-common公共模块包含了账户体系服务端的核心权限、token管理，内置在每个uniCloud服务空间里。

如开发者需要在自己的云函数/云对象里校验前端用户token，则需要引用uni-id-common公共模块。

uniCloud众多功能（如DB Schema的权限、uni-id-co）也都依赖 uni-id-common。

uni-id在云端有很多配置，比如密码加密秘钥、短信和微信登录的appsecret等等。在uni-config-center下的uni-id目录下的config.json里存放着这些配置。

uni-app与uniCloud搭配且使用uni-id，登录后自动下发token、网络传输层自动传输token（uni-app 2.7.13+版本）、token临近过期会自动续期（uni-app 3.4.13 +版本），也就是说开发者无需自己管理token了。

uni-app客户端还有一批uni-id相关的内置API：

基于uni-id-common，DCloud还提供了一组完整的前端页面和后端云对象 ，合称uni-id-pages。

uni-id-pages的功能包括：用户注册（含用户协议、隐私协议）、退出、修改密码、忘记密码等各种功能，同时适配PC宽屏和各种手机平台（App、H5、小程序）。

此外，DCloud的其他产品也为uni-id提供了众多支持：

在HBuilderX 3.5之前，DCloud提供了一个公共模块uni-id （注意不叫uni-id-common）和一个示例性云函数uni-id-cf（集成在uni-starter和uni-admin中）。

老的公共模块uni-id是一个大而全的账户管理公共模块，体积太大，不适合被其他云函数引用。比如某个业务云函数需要校验用户token，引用的uni-id公共模块还包含了忘记密码的代码，很浪费资源。

在云对象发布之前，DCloud基于云函数方式提供了uni-id-cf。但在HBuilderX 3.5 以后，推荐使用基于云对象的uni-id-pages，代码更简单清晰。

从HBuilder 3.5起，uni-id 和uni-id-cf都将被淘汰，不再更新。老的公共模块uni-id被拆开，变成了uni-id-common公共模块和uni-id-co云对象。

uni-id-common很精简，只包括token和权限，适合被所有云函数引用。

uni-id-co则是一个更加比uni-id-cf更完善和规范的用户管理的云对象。

uni-id-common的插件市场地址为：uni-id-common插件 。但一般不需要单独下载这个插件，但更新uni-id-common公共模块时需要从这里下载更新。

一般推荐直接使用uni-starter项目模板来开始开发，或者在新项目里导入uni-id-pages页面模板来使用。

uni-id云端的配置是依赖uni-config-center公用模块的，在工程目录uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json。（如未安装uni-config-center需安装，如缺少目录需手动创建）

uni-id云端同时依赖了公共模块uni-captcha ，这个功能模块负责生成和校验验证码，进行人机验证。

体验uni-id需保证uniCloud服务空间至少有数据表uni-id-users、opendb-verify-codes（验证码表）

你的应用采用什么方式注册登录？比如用户名密码、手机号+短信验证码、或者微信登录。

很多登录方式涉及三方服务，需要开通短信验证码服务、开通App一键登录、或者向微信等申请登录的appid和appsecret信息。

申请开通相关服务后，需要把配置信息填写在云端配置文件config.json中。

账户如果涉及密码，那么需要配置passwordSecret，账户的密码会根据passwordSecret使用sha1摘要加密算法以不可逆的方式存储在数据库中。

配置tokenSecret是为了防止token被第三方解密，模拟用户身份。

千万不要使用默认的passwordSecret和tokenSecret，会造成系统安全隐患。

云端的config.json还有各种配置，详见下个章节。前端的配置请参考uni-id-pages的文档。

uni-id的云端配置文件在uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json中。

！！！重要！！！ passwordSecret与tokenSecret十分重要，切记妥善保存（不要直接使用下面示例中的passwordSecret与tokenSecret）。修改passwordSecret会导致老用户使用密码无法登录，修改tokenSecret会导致所有已经下发的token失效。如果重新导入uni-id切勿直接覆盖config.json相关配置

示例源码如下，请查看 pre > code 标签中的内容

新增于uni-id-pages 1.0.8

passwordStrength配置项支持以下四种内置规则

示例源码如下，请查看 pre > code 标签中的内容

uni-id-co 与 uni-id-pages 内的前端页面均支持这四个内置规则

默认情况下，用户注册后不会关联任何角色，如果需要用户在注册后关联角色，可以通过此配置项开启。

配置项userRegisterDefaultRole的值类型为Array，每个元素为角色ID(role_id)， 例如：

示例源码如下，请查看 pre > code 标签中的内容

如需保持活跃客户端的登录状态，请勿将token有效期设置一个很大的值，具体如何实现请参考：保持客户端登录状态

首先解释下token的概念。token是服务器颁发给客户端的一个令牌。

用户在客户端登录时，云端通过登录接口对用户的用户名+密码，或者手机号+验证码进行校验，校验通过后服务器会给客户端下发一个token（就是根据tokenSecret生成的一串加密字符串），并同时给出有效期。

客户端把这个token保存在storage中，然后每次联网请求服务器时，都带上这个token。服务器解密这个token，通过这个token认定客户端的身份。

这样就避免了客户端每次请求服务器，都需要再传输一次用户名和密码。

在传统开发下，客户端和服务器各自需要为了token做很多事情。在uni云端一体下，开发者无需操心，只需要在uni-id云端config.json中配置好token的secret和有效期即可。剩余的工作都被自动处理了。

uni-id云端会在login方法成功后自动返回token，uni-app前端框架会自动识别并保存这个token在storage中（uni_id_token），在前端每次连接uniCloud（不管是clientDB、callfunction、云对象调用），都会自动带上这个token。

云函数和云对象都提供了获取和校验token的方法，在uni-id相关业务中，校验token的代码都已经写好。

包括token快到期时的自动续期，开发者只需在config.json中配置好临近多久自动续期，续期的代码也无需开发者编写，框架已经内置。

注：不同平台的token有效期一般不一样，app有效期较长，web有效期较短。每个平台的有效期都可以单独在config.json里配置。

uni-id基于经典的RBAC模型实现了角色权限系统。

RBAC：Role-Based Access Control，基于角色的访问控制。

其基本思想：对系统操作的各种权限不是直接授予具体的用户，而是在用户集合与权限集合之间建立一个角色集合。每一种角色对应一组相应的权限。一旦用户被分配了适当的角色后，该用户就拥有此角色的所有权限。

这样做的好处是，增强系统管理的扩展性，对于批量用户的权限变更，仅需变更该批用户角色对应权限即可，而无需对该批每个用户变更权限。

这个模型有三个关键名词：用户、角色、权限：

用户、角色、权限都存在数据库了，都可以动态创建和修改。当权限对应的代码实现完成后，用户的新入、退出、角色升迁都无需再修改代码，在uni-admin后台的web界面可以由运维人员可视化的给每个用户调整角色、给每个角色调整权限。

用户信息存储在uni-id-users表中，然后通过role字段保存该用户所拥有的所有角色ID，角色ID即角色表（uni-id-roles表）中的role_id字段，注意不是_id字段。

示例源码如下，请查看 pre > code 标签中的内容

Tips：将用户角色设计为用户表的字段，而没有新建用户角色关联表的原因：避免mongodb在跨表查询时的性能开销

角色信息存储在uni-id-roles表中

示例源码如下，请查看 pre > code 标签中的内容

如下是角色在clientDB中的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

Tips1：uni-id中admin为超级管理员角色，uni-clientDB也基于同样的策略；如果用户角色包含admin，则该用户就拥有所有数据表的全部权限。

Tips2：出厂时可内置常用角色，也可上线后由运营人员动态创建角色。

权限信息在uni-id-permissions表中，表结构定义如下：

其中，permission_id为权限标志，全局唯一，可用于clientDB中的权限配置，建议按照语义化命名，例如：USER_DEL、BRANCH_ADD。权限总数量不得超过500

示例源码如下，请查看 pre > code 标签中的内容

如下是权限在clientDB中的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

Tips1：建议代码交付时内置所有权限，方便clientDB中的权限配置和调整。

uni-id将用户的角色权限缓存在token内。详情参考：缓存角色权限。

示例源码如下，请查看 pre > code 标签中的内容

注意： 在uniCloud admin中，封装了可视化的用户、权限、角色的管理，新增删除修改均支持，无需自己维护。详见

uni-id的所有数据表，都在opendb规范中。

在unicloud web控制台 新建数据表时，可以从uni-id的模板分类里找到下面的表，并一键创建这些表。HBuilderX 3.4.11起新建 DB Schema 也有模板可选择。

opendb中uni-id-users表1.0.0调整为下面的结构，uni-id-co使用此标准。如何处理旧数据请参考：自uni-id升级为uni-id-co+uni-id-common

opendb中uni-id-users表1.0.0调整为下面的结构，uni-id-co使用此标准。如何处理旧数据请参考：自uni-id升级为uni-id-co+uni-id-common

realNameAuth 扩展字段定义 该字段存储实名认证信息，子节点说明如下。

注意：该字段是在前端注册用户时记录的前端环境信息。如果是管理员在云端调用uni-id的addUser添加的用户则无此字段

示例源码如下，请查看 pre > code 标签中的内容

目前 opendb 内提供的 uni-id-users表 包含完整的索引，数据库在索引量多且频繁更新的情况下可能会出现写入缓慢的情况，因此推荐开发者在使用 uni-id-users表 时可以删除没有用到的索引。

例：项目内只使用了微信登录，不使用其他登录方式，可以只保留wx_unionid、wx_openid.mp这些账号相关的索引，删除其他登录方式的索引（比如username、mobile）

表名：opendb-verify-codes

该表的前缀不是uni-id，意味着该表的设计用途是通用的，不管是uni-id的手机号验证码，或者支付等关键业务需要验证码，都使用此表。

每条验证信息，都记录在本表中。uni-id不会自动删除本表的历史数据，数据保留有效期需要开发者自行管理，可以在云函数中设置一个定时运行来清理过期数据。

表名：uni-id-permissions

还有更多uni-id的配套数据表，可以在uniCloud web控制台 新建表时选择相应模板。此处不再详述，仅罗列清单：

对应uni-id-users表的status字段

对应opendb-verify-codes表短信、邮箱验证码相关记录的的scene字段

对应opendb-verify-codes表图形验证码相关记录的scene字段

uniIdRouter 是一个运行在前端的、对前端页面访问权限路由进行控制的方案。

大多数应用，都会指定某些页面需要登录才能访问。以往开发者需要写不少代码。

现在，只需在项目的pages.json内配置登录页路径、需要登录才能访问的页面等信息，uni-app框架的路由跳转，会自动在需要登录且客户端登录状态过期或未登录时跳转到登录页面。

结合以下代码及注释了解如何使用uniIdRouter

示例源码如下，请查看 pre > code 标签中的内容

以上代码，指定了登录页为首页index，然后将list页面和detail目录下的所有页面，设为需要登录才能访问。那么访问list页面和detail目录下的页面时，如果客户端未登录或登录状态过期（也就是uni_id_token失效），那么会自动跳转到index页面来登录。

与此功能对应的有两个uniCloud客户端api，uniCloud.onNeedLogin()和uniCloud.offNeedLogin()，开发者在监听onNeedLogin事件后，框架就不再自动跳转到登录页面，而是由开发者在onNeedLogin事件内自行处理。详情参考：uniCloud.onNeedLogin

自动跳转到登录页面时会携带uniIdRedirectUrl参数，其值为encodeURIComponent(${跳转前的页面（包含路径和参数的完整页面地址）})，如果希望用户登录后跳转回之前的页面，可以使用此参数实现。

以下为登录页面跳转到之前访问页面的简单示例：

pages/login/login.vue

示例源码如下，请查看 pre > code 标签中的内容

云对象抛出uni-id token过期或token无效错误码时，会触发客户端自动跳转配置的登录页面，以下代码为一个简单示例

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

有些系统由多个子应用组成，且没有各自独立服务空间，而是需要共享一个服务空间。此时就涉及一个问题，多个应用注册的账户都在uni-id-user表中，如何有效隔离。

比如一个打车软件，有乘客端、司机端、管理端，都要注册账户。它们也都有自己的DCloud appID（manifest.json里第一个配置）

uni-id-user表中有一个数组型字段dcloud_appid，可以存贮这个用户有权登陆哪个应用。

比如乘客端的appid是__uni_111111，司机端appid是__uni_222222，那么2个appid都存入dcloud_appid，即表示这个用户有权登录这2个应用。

uni-id 3.3.0版本起用户注册时会自动在用户表的记录内标记为注册应用对应的用户，如果没有单独授权登录其他应用的话则只能登录这个应用。即在乘客端应用注册的，默认只能在乘客端应用登录。

如何授权登录其他应用请参考：授权、禁止用户在特定客户端应用登录

需要注意的是客户端APPID信息是由端上传上来的，并非完全可信，尽量在入口处进行校验。例：

示例源码如下，请查看 pre > code 标签中的内容

DCloud Appid是一个很重要的配置，如无必要请勿随意更换。

不同端用户数据通过用户表的dcloud_appid字段隔离，同一个手机号、微信号也可以同时注册管理端和用户端，绑定账号同理。

uni-id的config.json支持配置为数组，每项都是一个完整的配置，对不同的配置使用dcloudAppid字段进行区分（此字段与项目内的manifest.json里面的DCloud AppId一致）， uni-id会自动根据客户端的appid来判断该使用哪套配置。

需要注意的是客户端APPID信息是由端上传上来的，并非完全可信，尽量在入口处进行校验。例：

示例源码如下，请查看 pre > code 标签中的内容

数组每一项都是一个完整的配置文件，全部选项请参考：uni-id 配置

注意：如果允许同一账号在不同端使用相同的账号+密码登录需要将不同端的passwordSecret设置成一样的

示例源码如下，请查看 pre > code 标签中的内容

一般来说token的有效期不会无限长，示例配置内web端token有效期为2小时，微信小程序为3天，app端为30天。你可以回忆一下你所用的软件，只要每天都打开就一直不需要重新登录，这样就牵扯到保持客户端的登录状态的问题。

uni-id使用了判断token剩余有效时间小于一定的阈值（配置文件内的tokenExpiresThreshold）但是大于0时自动下发新token的逻辑来保证活跃客户端一直处于登录状态，返回新token的逻辑由checkToken方法实现。具体该将token有效期和token刷新阈值设置为多少，需要根据多数用户软件使用频率来确定。

举个例子，开发者配置的token有效期（tokenExpiresIn）为1天，token刷新阈值（tokenExpiresThreshold）为8小时。用户在0点0分0秒获取了token，如果用户在16点后（token有效期已小于8小时）调用接口时执行了checkToken方法则会返回新token。

在config.json（uniCloud/cloudfuntions/common/uni-config-center/uni-id/config.json，以下config.json均指此文件）内配置了autoSetInviteCode: true则在用户注册时会自动给设置不重复的6位邀请码

在config.json内配置了forceInviteCode: true则只有使用邀请码才可以注册。

uni-id-co在会产生注册行为的接口均添加了inviteCode参数，用于传递邀请码使注册用户接受邀请

注意：通常情况下设定好passwordSecret之后不需要再进行修改，使用此功能时请务必小心谨慎

在config.json内修改passwordSecret会导致历史用户无法通过密码登录。但是某些情况下有些应用有修改passwordSecret的需求，例如刚开始使用uni-id时没有自定义passwordSecret，后续需要修改，此时可以使用uni-id 2.0.1版本新增的修改passwordSecret功能。（注意：2.0.1版本验证码表名调整为了opendb-verify-codes）

下面以将passwordSecret从passwordSecret-demo修改为qwertyasdfgh为例介绍如何使用

示例源码如下，请查看 pre > code 标签中的内容

如果在上面基础上再修改passwordSecret为1q2w3e4r5t,config.json调整如下

!!!注意只有在数据库内完全没有使用某个版本（password_secret_version字段表示了用户密钥版本）密钥的用户才可以将此密钥从config.json内去除。没有password_secret_version的用户使用的是最旧版本的passwordSecret，如果存在这样的用户对应的passwordSecret也不可去除。

示例源码如下，请查看 pre > code 标签中的内容

uni-id-users表内存储的password字段为使用hmac-sha1生成的hash值，此值不可逆向推出用户真实密码。所以直接修改passwordSecret会导致老用户无法使用密码登录。

上述修改通过密钥版本号区分新旧密钥，用户登录时如果密钥版本小于当前最新版本，会为用户更新数据库内存储的password字段，并记录当前使用的密钥版本。

用户对应的数据库记录内没有密钥版本的话会使用最低版本密钥进行密码校验，校验通过后为用户更新为最新版密钥对应的password并记录版本号。

由于是不可逆加密，理论上passwordSecret泄露不会造成用户的真实密码被泄露，自定义passwordSecret只是进一步加强安全性。

使用uni-id-common时，token内会缓存用户的角色权限。

为什么要在token缓存角色权限？token校验是高频操作，云数据库是按照读写次数来收取费用的，并且读写数据库会拖慢接口响应速度。

比较经济的做法就是在token里缓存角色权限。更好的方案是在redis里缓存角色权限，只是redis需要付费开通。

uni-id-common支持在token内缓存用户的角色权限。但是某些情况下开发者可能还希望缓存一些别的东西，以便在客户端能方便的访问（注意：不可缓存机密信息到token内）。

在uni-config-center模块内的uni-id插件内创建custom-token.js内容如下：

示例源码如下，请查看 pre > code 标签中的内容

uni-id会自动加载custom-token.js进行处理，在所有生成token的操作（包括：登录、注册、token过期自动刷新、开发者自行调用createToken）执行时自动获取新token信息，并生成token。

在cloudfunctions/common/uni-config-center/uni-id/lang/目录下创建index.js，内容示例如下：

示例源码如下，请查看 pre > code 标签中的内容

uni-id会自动进行语言匹配，无需额外配置

uni-id-co在微信、QQ登录或注册时会自动保存用户的sessionKey、accessToken信息。

在uni-id-pages 1.0.8之前，uni-id-co直接将这些信息保存在了用户表（uni-id-users）的third_party字段下，仅按照平台区分没有按照不同应用区分。具体结构如下

示例源码如下，请查看 pre > code 标签中的内容

此结构无法满足多应用同一平台关联同一服务空间且允许用户跨应用登录的场景。因此在uni-id-pages 1.0.8及更高版本对此做出了调整，改为使用uni-open-bridge-common存储用户在三方平台的凭据信息。同时为了兼容旧版本上述third_party字段仍存有这些信息。

目前被uni-id-co保存的三方凭据有以下几种：

开发者如需获取某用户对应的openid，可以在用户使用相应的登录操作之后自行读取用户记录获取。代码示例如下：

示例源码如下，请查看 pre > code 标签中的内容

新增于 uni-id-pages 1.0.8

uni-id-co是一个完整的云对象，里面注册登录等流程都已完全实现，开发者不方便进行修改。例如要实现注册时为某端用户统一添加一个角色的功能，只能去修改uni-id-co的代码。因此uni-id-co提供了通过钩子干涉内置逻辑的功能

uni-id钩子函数需要在uni-config-center内配置。在uni-config-center/uni-id下创建hooks目录并在其内创建index.js内容如下

示例源码如下，请查看 pre > code 标签中的内容

beforeRegister在注册用户记录入库前触发。钩子会接收到如下参数，需要返回处理后的用户记录用以入库存储

以为__UNI_123123这个应用注册的用户添加"teacher"角色为例，beforeRegister钩子示例如下

示例源码如下，请查看 pre > code 标签中的内容

uni-id 默认使用了 hmac-sha1 加密算法对密码进行加密，自 uni-id-pages@1.0.28 版本起新增了 hmac-sha256 加密算法，开发者可以自己需求选择不同的算法，推荐使用 hmac-sha256算法。

在 uni-config-center/uni-id/config.json 中配置， uni-id/config.json说明

示例源码如下，请查看 pre > code 标签中的内容

适用于 uni-id-pages@1.0.28 以下版本， 首先确认 uni-config-center/uni-id/config.json 中 passwordSecret 字段类型

passwordSecret 字段可能是string或者array类型，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

如果 passwordSecret 是字符串类型，修改为数组类型后，在 passwordSecret 中添加 hmac-256 算法，同时 version 加 1

示例源码如下，请查看 pre > code 标签中的内容

如果内置的加密算法无法满足业务需求，可以自定义加密规则。

首先在 uni-config-center/uni-id/config.json 中增加自定义密码类型 custom

示例源码如下，请查看 pre > code 标签中的内容

在 uni-config-center/uni-id/custom-password.js文件（没有请手动创建）中创建加密与验证方法即可。

示例源码如下，请查看 pre > code 标签中的内容

如果你想将自己系统内的用户导入至 uni-id，请按照以下步骤操作

uni-id 默认使用了 hmac-256 密码加密算法，可能与你的加密算法不同，所以在迁移前需要自定义你的密码加密函数。 当用户第一次在 uni-id 中进行登录时，会先使用自定义验证密码(verifyPassword)函数进行验证，这样用户用之前的密码依旧能够登录，不需要用户重置密码。 在用户第一次登录成功后用户密码的加密算法规则将升级为配置文件中最新的算法规则。

首先在uni-config-center/uni-id/config.json文件中创建自定义类型的paswordSecret，如下：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-config-center/uni-id/custom-password.js 文件（不存在请手动创建）中创建 verifyPassword 函数验证之前用户密码。

示例源码如下，请查看 pre > code 标签中的内容

如果配置文件中passwordSecret最新版本的 type 是 custom，那么所有用户的加密及校验都会使用自定义算法规则。

如果仅是为了迁移使用，请另外在 passwordSecret 中添加 hmac-sha256 类型算法，用于其他用户的加密与校验。

这样只有之前的用户才会使用 custom 自定义规则，其他用户或者迁移后的新注册的用户会使用 hmac-sha256 算法规则。

示例源码如下，请查看 pre > code 标签中的内容

导出文件大小最大不超过 50MB，超过 50MB 请导出多个json文件

如果存在表A关联表B的字段的场景需要保证关联字段在A、B内是一致的（特别需要注意的是各种与_id关联的字段）

请将用户数据导出为json格式文件，注意json文件不是标准的json文件，请按照以下格式每行是一个json格式的用户记录导出：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-id 中 userId 是系统自动创建的 _id，如果想保留之前用户的userId，可以将用户的 userId 映射为 _id，如果不保留 userId 建议删除 userId 字段，在数据导入中会创建 _id。

注意password_secret_version字段，字段值需要修改为自定义密码类型的 version

导入到 uni-id 之前，需要处理用户数据与 uni-id 字段的映射关系，见下方 uni-id 字段及说明：

在 uniCloud 控制台 ，找到 uni-id 所在的服务空间，在云数据库中选中 uni-id-users 表，点击导入按钮，上传用户数据json文件即可。

实人认证相关功能建议或问题，可以加入uni-im交流群进行讨论，点此加入

基于uni实人认证服务实现，可以实现用户刷脸核验真实身份，完成实名认证。

uni-id-pages / uni-id-pages-x 中内置了实名认证页面

如没有实名认证需求，可以将实名认证相关页面注释：

实名认证相关配置项如下，配置文件路径uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json，详细的uni-id配置文件参考

用户的姓名、身份证号、实人认证照片属于用户隐私信息，为了防止隐私信息泄露，在数据存储上使用了对称加密aes-256-cbc算法对数据进行加密。 在前端页面需要使用时，例如”获取用户实名信息“接口，只会返回脱敏后的数据，减少暴露风险，提高安全性。

由于加密密钥sensitiveInfoEncryptSecret来源于config.json配置文件，强烈建议更换为自定义的字符串，不要使用默认的密钥。 密钥长度需要是32位的字符串。

实人认证照片将会上传至云存储中，阿里云与腾讯云存储路径如下：

**Examples:**

Example 1 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

Example 2 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

Example 3 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

Example 4 (json):
```json
// 如果拷贝此内容切记去除注释
{
  "passwordSecret": [
    {
      "type": "hmac-sha256",
      "version": 1
    }
  ], // 数据库中password字段是加密存储的，这里的passwordSecret即为加密密码所用的加密算法，详见[密码安全]
  "passwordStrength": "medium", // 密码强度，新增于 uni-id-pages 1.0.8版本，见下方说明
  "tokenSecret": "", // 生成token所用的密钥，注意修改为自己的，使用一个较长的字符串即可
  "requestAuthSecret": "", // URL化请求鉴权签名密钥
  "tokenExpiresIn": 7200, // 全平台token过期时间，未指定过期时间的平台会使用此值
  "tokenExpiresThreshold": 3600, // 新增于uni-id 1.1.7版本，checkToken时如果token有效期小于此值且在有效期内则自动获取新token，请注意将新token返回给前端保存（云对象会自动保存符合uniCloud响应体规范的响应内的新token），如果不配置此参数则不开启自动获取新token功能
  "maxTokenLength": 10, // 数据库用户记录token数组的最大长度，默认为10。新增于uni-id-common 1.0.16
  "passwordErrorLimit": 6, // 密码错误最大重试次数
  "passwordErrorRetryTime": 3600, // 密码错误重试次数超限之后的冻结时间
  "autoSetInviteCode": false, // 是否在用户注册时自动设置邀请码，默认不自动设置
  "forceInviteCode": false, // 是否强制用户注册时必填邀请码，默认为false
  "idCardCertifyLimit": 1, // 实名认证相关; 限制每个身份证可以绑定几个账号
  "realNameCertifyLimit": 5, // 实名认证相关; 限制用户每日认证次数，防止接口被刷
  "sensitiveInfoEncryptSecret": "", // 敏感信息加密密钥(长度为32位的字符串)，如使用实名认证功能需配置此密钥
  "frvNeedAlivePhoto": false, // 实名认证相关；是否获取认证照片
  "userRegisterDefaultRole": [], // 用户注册时的默认角色
  "app": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是app-plus，务必注意调整为app
    "tokenExpiresIn": 2592000,
    "tokenExpiresThreshold": 864000,
    "oauth": {
      // App微信登录所用到的appid、appsecret需要在微信开放平台获取，注意：不是公众平台而是开放平台
      "weixin": {
        "appid": "",
        "appsecret": ""
      },
      // App QQ登录所用到的appid、appsecret需要在腾讯开放平台获取，注意：不是公众平台而是开放平台
      "qq": {
        "appid": "",
        "appsecret": ""
      },
      "apple": { // 使用苹果登录时需要
        "bundleId": ""
      },
      "huawei": { // 鸿蒙应用使用华为登录
        "clientId": "",
        "clientSecret": ""
      }
    }
  },
  "web": { // 如果你使用旧版本uni-id公共模块而不是uni-id-common这里可能配置的是h5，务必注意调整为web
    "tokenExpiresIn": 7200,
    "tokenExpiresThreshold": 3600,
    "oauth": {
      "weixin-h5": { // 微信公众号登录配置
        "appid": "",
        "appsecret": ""
      },
      "weixin-web": { // 微信PC页面扫码登录配置
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 微信小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "weixin": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-qq": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // QQ小程序登录所用的appid、appsecret需要在对应的小程序管理控制台获取
      "qq": {
        "appid": "",
        "appsecret": ""
      }
    }
  },
  "mp-alipay": {
    "tokenExpiresIn": 259200,
    "tokenExpiresThreshold": 86400,
    "oauth": {
      // 支付宝小程序登录用到的appid、privateKey请参考支付宝小程序的文档进行设置或者获取，https://opendocs.alipay.com/open/291/105971#LDsXr
      "alipay": {
        "appid": "",
        "privateKey": "", // 私钥
        "keyType": "PKCS8", // 私钥类型，如果私钥类型不是PKCS8，需要填写此字段，否则会出现“error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag”错误
        "appCertPath": "", // 应用公钥证书路径 证书验签方式必填
        "alipayRootCertPath": "", // 支付宝根证书路径 证书验签方式必填
        "appAuthToken": "" // 三方应用授权token
      }
    }
  },
  "mp-harmony": {
      "oauth": {
        "huawei": { // 鸿蒙元服务使用华为登录
          "clientId": "",
          "clientSecret": ""
        }
      }
  },
  "service": {
    "sms": {
      "name": "", // 应用名称，对应短信模版的name
      "codeExpiresIn": 180, // 验证码过期时间，单位为秒，注意一定要是60的整数倍
      "scene": {
        "bind-mobile-by-sms": { // 对绑定手机号场景的配置，短信验证码场景值参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#sms-scene
          "templateId": "", // 绑定手机号使用的短信验证码模板
          "codeExpiresIn": 240 // 绑定手机号验证码过期时间
        }
      }
    },
    "univerify": {
      "appid": "" // uni-id-co 1.1.17及以上版本无需填写，当前应用的appid，使用云函数URL化，此项必须配置
    }
  }
}
```

---

## uni-open-bridge | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-open-bridge.html

**Contents:**
- # uni-open-bridge
- # 背景
- # 系统组成
- # 凭据介绍
  - # 凭据汇总
  - # 平台标记Platform
  - # 常见凭据用途
  - # access_token(应用级)
  - # user_access_token(用户级)
  - # code(临时凭据)

开发者对接微信等三方开放平台时，这些开放平台有众多的凭据需要管理，比如access_token、session_key、encrypt_key、ticket等。

uni-open-bridge 是一个统一管理微信等三方平台认证凭据的开源工具。

这里面容易搞混和出错的地方非常多。假使在不同的业务逻辑中都向微信服务器请求凭据，必然会冲突。

所以需要在一个中央系统来统一管理这些凭据，需要定时请求的凭据则由中央系统定时统一请求微信服务器，保存到数据库。

然后各个业务需要这些凭据时，从这个中央系统的接口中获取，而不是自己向微信服务器请求。

这个中央系统就是uni-open-bridge。

示例源码如下，请查看 pre > code 标签中的内容

云对象uni-open-bridge默认是定时运行的，在package.json中配置了每小时定时运行一次（部署到线上服务空间后生效）。

该云对象根据在 uni-config-center 中配置固定凭据，从而有权定时向微信服务器发请求，将获取到的 access_token或ticket 保存到数据库 opendb-open-data 表中。

当所在服务空间开通redis时，还会缓存在redis的key。这会让系统性能更好。

云对象uni-open-bridge还提供了URL化能力，以方便外部系统读写这些凭据。

uni-open-bridge-common 提供了操作微信等三方平台凭据的底层接口，包括访问微信服务器和多层读写Redis、数据库的能力。

云对象uni-open-bridge访问微信服务器和读写凭据时其实也是依赖 uni-open-bridge-common公共模块。安装 uni-open-bridge 云对象插件时会自动安装依赖插件 uni-open-bridge-common

从微信获取到各种凭据后，当各个业务代码需要这些凭据时，通过如下方式获取。

微信有公众号h5、小程序、App、web等4种平台，每个平台都有若干凭据。

定时刷新：指由云对象 uni-open-bridge 的定时任务触发，自动从微信服务器获取凭据，通过调用 uni-open-bridge-common 写入到Redis或数据库

开发者操作：指由开发者引入公共模块 uni-open-bridge-common，调用相关读写方法

session_key： 如果使用了uni-id，则uni-id用户登陆时会自动读写该凭据。一般无需开发者维护。

encrypt_key 依赖 access_token、session_key，如果依赖的值已存在，可直接读取 encrypt_key，如果不存在自动向微信服务器获取、开发者应该仅读取该值，如果使用了uni云端一体安全网络由其维护，如果有不使用 uni-open-bridge 托管的情况，则有外部系统操作

ticket 依赖 access_token，直接获取 ticket 会检查 access_token，如果不存在默认先请求微信服务器获取并保存，继续请求 ticket

还有一些不常用的凭据暂不列出，例如：非微信的App平台的 access_token。

uni-open-bridge中将不同平台命名如下表，在API和存储数据时都使用下表标记。注意不同于前端条件编译使用的uniPlatform。

提示：自动刷新固定应用级凭据目前仅支持 weixin-mp、weixin-h5。 后续补充其他平台

微信凭据分应用级、用户级、一次性等凭据，如果你之前未接触过微信这些凭据，请务必阅读下面的每个凭据的详细介绍

微信小程序 access_token 是微信小程序全局唯一后台接口调用凭据，调用绝大多数后台接口时都需使用。详情

微信公众号H5 access_token 是公众号的全局唯一接口调用凭据，公众号调用各接口时都需使用 access_token。开发者需要进行妥善保存。access_token 的存储至少要保留512个字符空间。access_token 的有效期目前为2个小时，需定时刷新，重复获取将导致上次获取的 access_token 失效。

注意：微信公众号H5access_token的获取需要固定IP，需将IP白名单填入到微信公众平台。uniCloud中默认没有固定IP，获取固定IP需另见文档固定IP

公众平台的 API 调用所需的 access_token 的使用及生成方式说明：

1、建议公众号开发者使用中控服务器统一获取和刷新 access_token，其他业务逻辑服务器所使用的 access_token 均来自于该中控服务器，不应该各自去微信服务器刷新，否则容易造成冲突，导致 access_token 覆盖而影响业务；

2、目前access_token 的有效期通过返回的expires_in来传达，目前是7200秒之内的值。中控服务器需要根据这个有效时间提前去刷新新 access_token。在刷新过程中，中控服务器可对外继续输出的老 access_token，此时公众平台后台会保证在5分钟内，新老 access_token 都可用，这保证了第三方业务的平滑过渡；

3、access_token 的有效时间可能会在未来有调整，所以中控服务器不仅需要内部定时主动刷新，还需要提供被动刷新 access_token 的接口，这样便于业务服务器在 API 调用获知 access_token 已超时的情况下，可以触发 access_token 的刷新流程。

4、对于可能存在风险的调用，在开发者进行获取 access_token 调用时进入风险调用确认流程，需要用户管理员确认后才可以成功获取。具体流程为：

开发者通过某 IP 发起调用->平台返回错误码[89503]并同时下发模板消息给公众号管理员->公众号管理员确认该 IP 可以调用->开发者使用该 IP 再次发起调用->调用成功。

如公众号管理员第一次拒绝该 IP 调用，用户在1个小时内将无法使用该 IP 再次发起调用，如公众号管理员多次拒绝该 IP 调用，该 IP 将可能长期无法发起调用。平台建议开发者在发起调用前主动与管理员沟通确认调用需求，或请求管理员开启 IP 白名单功能并将该 IP 加入 IP 白名单列表。

微信公众号H5平台有两个相同名字 access_token，分别用于

1、应用级：公众号的全局唯一接口调用凭据，公众号调用各接口时都需使用 access_token。 2、用户级：网页授权接口调用凭证，用户授权的作用域 access_token。

众多凭据命名都叫access_token，无法有效区分。对于用户级的access_token，在 uni-open-bridge 中改名为 user_access_token 。它对应微信公众平台网页用户授权 access_token

在客户端通过调用 uni.login() 获得临时登录凭证 code 后传到开发者服务器在请求微信服务器获得 session_key、openid、unionid

code 仅可在服务器使用一次，客户端调用频率限制每个用户每分钟100次。

所以uni-open-bridge中并没有持续化存储code。

需要在开发者服务器请求微信服务器获得，依赖参数 code，详情

uni-open-bridge中并没有持续化存储openid，相关读写和保存是交由另一个插件uni-id来负责的。

开发者如果遇到因为 session_key 不正确而校验签名失败或解密失败，请关注下面几个与 session_key 有关的注意事项。

uni.login 调用时，用户的 session_key 可能会被更新而致使旧 session_key 失效（刷新机制存在最短周期，如果同一个用户短时间内多次调用 uni.login，并非每次调用都导致 session_key 刷新）。

开发者应该在明确需要重新登录时才调用 uni.login，及时通过 code2Session 接口更新服务器存储的 session_key。

微信不会把 session_key 的有效期告知开发者，会根据用户使用小程序的行为对 session_key 进行续期。用户越频繁使用小程序，session_key 有效期越长。

开发者在 session_key 失效时，可以通过重新执行登录流程获取有效的 session_key。使用接口 uni.checkSession 可以校验 session_key 是否有效，从而避免小程序反复执行登录流程。

当开发者在实现自定义登录态时，可以考虑以 session_key 有效期作为自身登录态有效期，也可以实现自定义的时效性策略。

为了避免微信小程序与开发者后台通信时数据被截取和篡改，微信侧维护了一个用户维度的可靠key，用于小程序和后台通信时进行加密和签名。详情

开发者可以分别通过小程序前端和微信后台提供的接口，获取用户的加密 key。

ticket 是微信公众号用于调用微信 JS 接口的临时票据。正常情况下，ticket 的有效期为7200秒，通过 access_token 来获取。

由于获取 ticket 的 api 调用次数非常有限，频繁刷新 ticket 会导致 api 调用受限，影响自身业务，开发者必须在自己的服务全局缓存 ticket 。详情

而在uni-open-bridge已经缓存了该凭据。

如果你没有appid 和 secret ，需要先向微信申请

然后在项目的 uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json 文件中配置(如果不存在需手动新建)

如果不需要定时刷新 access_token、ticket、也不需要通过外部系统访问凭据时可单独引入 uni-open-bridge-common，然后在云函数或云对象中直接调用相关方法

uni-id-config中uni-id示例代码

示例源码如下，请查看 pre > code 标签中的内容

注意：拷贝此文件内容时需要移除 注释。标准json不支持注释。在HBuilderX中可用多选//来批量移除注释。

在uni-config-center目录下新建子目录uni-open-bridge, 新增 config.json，配置 dcloudAppid ，详情见下面的示例代码

uni-id-config中uni-open-bridge示例代码

示例源码如下，请查看 pre > code 标签中的内容

注意：拷贝此文件内容时需要移除 注释。标准json不支持注释。在HBuilderX中可用多选//来批量移除注释。

云对象uni-open-bridge上传到服务空间后，会每隔一个小时自动运行一次，从微信服务器获取相关凭据并保存到数据库。

在数据库opendb-open-data中会看到数据。需要在uniCloud web控制台 --》云数据库中或在项目的uniCloud--》database目录下，手动创建数据表opendb-open-data。

如开通redis则在redis的uni-id分组中查看（推荐开通redis以获取更好的性能）。

如果异常，请在 uniCloud Web控制台 ，找到云函数/云对象 uni-open-bridge 检查运行日志。很可能是第一步或第二步的配置出错了。

当然如果不需要定时任务，可以修改云对象package.json里的定时任务配置并重新上传。或在uniCloud web控制台修改定时任务。一般不推荐修改定时任务设置。

如需获取微信公众号H5平台的access_token，需要处理服务空间的固定出口IP问题。因为需将IP白名单填入到微信公众平台，然后才能在从微信服务器拿到该凭据。uniCloud中默认没有固定IP，获取固定IP需另见文档固定IP

在uni-open-bridge云对象获取到相关凭据后，当业务系统（比如登录支付或其他业务）需要使用这些凭据时，通过以下方式获取。

当你的业务在uniCloud上时，在你的业务云函数/云对象中引用公共模块uni-open-bridge-common，然后调用下面的API。

云函数公共模块是不同云函数共享代码的一种方式。如果你不了解什么是云函数公共模块，请另读文档公共模块

uni-open-bridge-common 公共模块，提供了 access_token、user_access_token、session_key、encrypt_key、ticket 的读取、写入、删除操作。

uni-open-bridge-common 支持多层 读取 / 写入 机制，redis -> database -> fallback，优先级如下:

如果用户没有开通 redis 或者操作失败，透传到 database，database 失败后，如果用户配置了 fallback，继续调用 fallback 方法，否则抛出 Error，database 对应的表为: opendb-open-data

在常见的情况下，在你的云函数/云对象中调用uni-open-bridge-common的几个get方法即可。

示例源码如下，请查看 pre > code 标签中的内容

除了上述常见方法，下文列出了所有凭据的get、set、remove方法。

写入 access_token。开发者一般只需使用get类方法，用不到set、remove类方法。下同

删除 access_token。开发者一般只需使用get类方法，用不到set、remove类方法。下同

示例源码如下，请查看 pre > code 标签中的内容

对应微信公众平台网页用户授权 access_token，详情见下文说明

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可选 async function fallback()，当 reids -> database 都找不到对应 key 时，调用此方法，需要返回数据格式如下

示例源码如下，请查看 pre > code 标签中的内容

为了简化调用 getAccessToken()、getTicket() 已内置 fallback 到微信的服务器，需要在 config-center 中配置 appid appsecret，详情

云对象 uni-open-bridge URL化后，非uniCloud系统可通过 http 方式访问凭据。

URL化，是一种让云函数或云对象暴露为Http接口的方式，详见。可以在 uniCloud Web控制台 操作。

通过以下2种方式验证外部服务器与uniCloud安全通讯

配置URL化后，其他系统可以通过下面的http接口，读写删各种开放平台凭据。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

其中参数platform值域详见。下同，不再复述。

如果各种开放平台凭据由uni-open-bridge托管，那么只需要调用各种get方法，是用不到set等方法的。但在某些情况下，相关凭据没有由uni-open-bridge从微信服务器获取，就需要这些set方法了。详见

示例源码如下，请查看 pre > code 标签中的内容

由外部系统从微信获取到相关凭据，然后写入。详见

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

其中参数openid值域详见。下同，不再复述。

示例源码如下，请查看 pre > code 标签中的内容

由外部系统从微信获取到相关凭据，然后写入。详见

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由外部系统从微信获取到相关凭据，然后写入。详见

示例源码如下，请查看 pre > code 标签中的内容

默认值 "expiresIn": -1 为永不过期

由于微信的设计并没有告知开发者最短有效期，且只能通过客户的 uni.checkSession() 检查是否过期，过期后通知服务器同步到 uni-open-bridge

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由外部系统从微信获取到相关凭据，然后写入。详见

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由外部系统从微信获取到相关凭据，然后写入。详见

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

提示：上面 Url 中的 uni-open-bridge 指云函数 uni-open-bridge 开启 Url 化时配置的 path 名称

如开发者的老业务里已经获取了微信的access_token等凭据，难以迁移到由uni-open-bridge来托管微信相关凭据。

那么uni-open-bridge也暴露了允许三方系统给uni-open-bridge写入微信相关凭据的接口。

因为其他插件会依赖uni-open-bridge，比如：

如果uni-open-bridge里没有相关凭据，上述插件或功能就无法使用。

因此，开发者即不想改成由uni-open-bridge托管微信凭据，又需要使用上述依赖uni-open-bridge的功能或插件，就只能将老系统获取到的相关凭据写入到uni-open-bridge中。

在uni-open-bridge云对象的package.json中找到定时器节点triggers，删除该节点。本地修改package.json后需重新上传到服务空间方生效。

先将云对象uni-open-bridge进行URL化，暴露出http接口。然后老系统调用setAccessToken、setUserAccessToken、setSessionKey、setEncryptKey、setTicket等接口。参考

**Examples:**

Example 1 (json):
```json
uni-id:[dcloudAppid]:[platform]:[openid]:[access-token|user-access-token|session-key|encrypt-key-version|ticket]
```

Example 2 (json):
```json
uni-id:[dcloudAppid]:[platform]:[openid]:[access-token|user-access-token|session-key|encrypt-key-version|ticket]
```

Example 3 (json):
```json
uni-id:[dcloudAppid]:[platform]:[openid]:[access-token|user-access-token|session-key|encrypt-key-version|ticket]
```

Example 4 (json):
```json
uni-id:[dcloudAppid]:[platform]:[openid]:[access-token|user-access-token|session-key|encrypt-key-version|ticket]
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=multi-send

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/clientdb?id=groupby

**Contents:**
- # clientDB简介
- # 对比：传统与clientDB云端协同的开发效率
  - # 传统开发方式:
  - # clientDB的开发方式:
- # clientDB图解
- # clientDB前端API
- # 客户端事件
  - # 刷新token
  - # 错误处理
- # JQL语法

自HBuilderX 2.9.5起支持在客户端直接使用uniCloud.databaseForJQL()方式获取数据库引用，即在前端直接操作数据库，这个功能被称为clientDB

HBuilderX 2.9.5以前的用户如使用过clientDB，在升级后请将clientDB的前端库和云函数删除，新版已经在前端和云端内置了clientDB

大白话：传统的数据库操作只能在服务端实现，因为他在前端使用有安全问题。而uniCloud的云数据库有表结构(DB Schema)他通过简单的js表达式，配置了：各种角色权限的账号是否可以读取和写入某种规范的数据等，解决了在前端操作的安全问题；因此uniCloud的云数据库可以直接在前端调用。

使用clientDB的好处：不用写服务器代码了！

1个应用开发的一半的工作量，就此直接省去。

当然使用clientDB需要扭转传统后台开发观念，不再编写服务端代码，直接在前端操作数据库。但是为了数据安全，需要在数据库上配置DB Schema。

在DB Schema中，配置数据操作的权限和字段值域校验规则，阻止前端不恰当的数据读写。详见：DB Schema

如果需要数据库操作之前或之后，云端执行关联逻辑（比如获取文章详情后，文章阅读量+1），clientDB提供了数据库触发器（从HBuilderX 3.6.11开始）。 在不支持数据库触发器的低版本，使用action云函数

传统云端分离的开发方式，共计：64行代码。

总结：基于uniCloud云端协同的开发方式，不需要写js代码，不需要写服务端的代码。直接在视图模板中写6行代码，即可完成传统开发方式需要64行代码才能完成的效果。且不仅仅是代码量的问题。整个开发过程的体验，提高了完全不止10倍的开发效率。

clientDB的前端，有两种用法，可以用js API操作云数据库，也可以使用<unicloud-db>组件。

js API可以执行所有数据库操作。<unicloud-db>组件是js API的再封装，进一步简化查询等常用数据库操作的代码量。

以下文章重点介绍clientDB的js API。至于组件的用法，另见文档。

clientDB的客户端部分主要负责提供API，允许前端编写数据库操作指令，以及处理一些客户端不太方便表示的字段，比如用户ID（详情看下面语法扩展部分）

clientDB支持传统的nosql查询语法，并新增了jql查询语法。jql是一种更易用的查询语法。

这段示例代码，在一个前端页面，直接查询了云数据库的list表，并且指定了name字段值为hello-uni-app的查询条件，then里的res即为返回的查询结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端操作数据库的语法与云函数一致，但有以下限制（使用jql语法时也一样）：

clientDB有两种方式获取数据库引用uniCloud.database()和uniCloud.databaseForJQL()（新增于HBuilderX 3.6.7）。

强烈推荐使用databaseForJQL接口，和云端jql扩展库返回结构一致，方便代码复用

database接口和databaseForJQL有以下不同点

示例源码如下，请查看 pre > code 标签中的内容

如果使用databaseForJQL接口，res结构如下

示例源码如下，请查看 pre > code 标签中的内容

透传uni-id自动刷新的token给客户端

HBuilderX 3.2.11及以上版本，clientDB会自动将刷新的token及过期时间保存在storage内。

示例源码如下，请查看 pre > code 标签中的内容

全局clientDB错误事件，HBuilderX 3.0.0起支持。

示例源码如下，请查看 pre > code 标签中的内容

clientDB使用JQL在客户端编写查询语句，关于JQL语法请参考：JQL语法

**Examples:**

Example 1 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 2 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 3 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

Example 4 (javascript):
```javascript
// 获取db引用
const db = uniCloud.databaseForJQL() //代码块为cdb
db.collection('list')
  .where({
    name: "hello-uni-app" //传统MongoDB写法，不是jql写法。实际开发中推荐使用jql写法
  }).get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err.code); // 打印错误码
		console.log(err.message); // 打印错误内容
  })
```

---

## uniCloud发行 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/publish.html

**Contents:**
- # uniCloud发行
- # 云资源发行
  - # 小程序中使用uniCloud
  - # 已经加了白名单，但小程序体验版和正式版还是无法请求云函数
  - # Web端使用uniCloud
- # 客户端资源发行
  - # 前端网页托管
  - # App升级中心
  - # 应用统一发布页
- # cli发行

本地开发调试后，务必上传到uniCloud服务空间才能在现网生效。

各种云函数、DB Schema，都需要上传发行。

各家小程序平台，均要求在小程序管理后台配置小程序应用的联网服务器域名，否则无法联网。

使用uniCloud后，开发者将不再需要自己购买、备案域名，直接将uniCloud的域名填写在小程序管理后台即可。（如需使用前端网页托管仍需进行域名备案）

根据下表，在小程序管理后台设置request合法域名、uploadFile合法域名（如没有上传文件业务，可不设置）。下表的域名均为阿里云或腾讯云自有域名，并非DCloud所属域名。

小程序开发工具的真机预览功能，必须添加上述域名白名单，否则无法调用云函数。模拟器的PC端预览、真机调试不受此影响。

如果遇到正确配置了合法域名但是依然报url not in domain list，请尝试删除手机上的小程序、清理小程序所在的客户端缓存、重启对应的小程序开发工具后重试

如果遇到invalid ip xxx, not in whitelist，请检查是否在小程序管理后台开启了域名白名单。如果没用到可以关闭，如果确认需要使用ip白名单，请参考：固定IP

HBuilderX内使用运行菜单运行到小程序时会连接本地调试服务，即使你运行之前就选择了连接云端云函数，小程序也会发送一条请求到本地调试服务检测调用云函数是本地还是云端。

即使在开发工具勾选了忽略域名校验，体验版与正式版不会忽略域名校验。如果要发布体验版或正式版，请务必在HBuilderX内使用发行菜单。uni-app项目发行与运行输出的目录不同，请注意不要选错了

请务必在HBuilderX内使用【发行】菜单打包小程序，【运行】菜单打包的代码只能用于本地调试，【发行】菜单打包的代码才能发布体验版和正式版。

如果域名白名单提示 127.0.0.1 这个ip没有加入白名单，那代表你点的就是【运行】菜单发布的体验版，请务必点【发行】发布小程序。uni-app项目发行与运行输出的目录不同，请注意不要选错了

云函数的域名是bspapp.com或tencentcloudapi.com。但开发者的web前端肯定是部署在其他域名下（含unicloud的前端网页托管）。那么Web前端js访问云函数就涉及跨域问题，导致前端js无法连接云函数服务器。

此时需要在uniCloud后台操作，为云函数绑定安全域名。哪个域名下的前端网页的js想访问云函数，就配置哪个域名。如使用unicloud前端网页托管，不管是自带测试域名还是开发者的域名，只要想访问云函数，都得把域名配在这里。

注意跨域配置需要带上端口信息。例如：前端页面运行于：www.xxx.com:5001，跨域配置内配置：www.xxx.com不会对此页面生效，需要配置为：www.xxx.com:5001，端口部分也支持通配符

如果是运行时期想突破跨域限制，还有如下方案：

运行到Web端时，使用HBuilderX内置浏览器，可以忽略跨域问题。

如果运行时，想使用外部浏览器运行，方案如下：

2021年9月16日之前阿里云跨域配置不对云存储及前端网页托管生效，表现为云存储中图片绘制到canvas会污染画布 ，前端网页托管的网页不可在iframe中使用。

2021年9月16日之后阿里云跨域配置可以对前端网页托管生效，仅对前端网页托管的自定义域名生效，不对默认域名生效，如何绑定自定义域名请参考：前端网页托管绑定自定义域名，设置之后可能需要几分钟才会生效。如果你在之前已经设置了跨域域名和前端网页托管的自定义域名，需要重新设置一次跨域域名才能生效。

2022年12月2日阿里云正式版跨域配置支持使用通配符，限制配置9个跨域域名。正式版默认允许localhost跨域

2023年2月3日阿里云正式版跨域配置对云存储生效，如果此前已配置跨域配置下次进行修改时会同步设置到云存储。

uniCloud支持前端静态网页托管，在HBuilderX中点发行菜单，生成Web，将生成的前端文件部署在uniCloud的前端网页托管内即可详情参考。

需要注意的是你仍需在uniCloud web控制台 配置绑定安全域名（见上一章节），这样前端网页的js才能访问云函数。

uniCloud通过云端一体的升级检测、管理端版本维护。详见

规模化的开发时，经常需要通过命令行发行，做持续集成。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql-cache-redis.html

**Contents:**
- # JQL Cache Redis
- # 原理
- # 配置方法
  - # 关于引号转义
  - # 注意事项
- # multiSend使用缓存
- # 联表查询
- # 删除redis缓存

新增于HBuilderX 3.5.2，需先开通redis

uniCloud 提供了 MongoDB 和 Redis 2种数据库。并且提供了联动机制，可以方便的将 MongoDB 中的数据缓存到 Redis 中。

需要频繁访问，但不会频繁修改的数据。比如更新不频繁的首页列表、banner、热搜、top排行等公共数据。

这些查询请求频次高，如果每次都去MongoDB读取，又慢又贵，还可能超时或超并发。

使用JQL Cache Redis，就可以方便的将这些查询结果缓存在 Redis 中。即提升了访问速度，又提升了并发性能，还减少了云函数运行时长和数据库读取次数。

在uniCloud/cloudfunctions/common/uni-config-center下创建uni-jql-cache-redis.json文件（注意此文件是标准json格式，不支持注释）

如未安装uni-config-center，请在插件市场导入，插件地址：uni-config-center

uni-jql-cache-redis.json文件是一个数组，其中每一项是一个缓存配置。示例内容如下

示例源码如下，请查看 pre > code 标签中的内容

expiresIn是缓存有效期，单位秒，有效期的开始时间为第一次cache到redis的时间（其实就是redis自带的有效期）。如果不填，就意味着不会根据时间失效。

配置成功后，客户端或云端JQL查询db.collection('test').limit(10).get()时，就会优先去redis中找，如果没找到，会从MongoDB中找然后自动cache到redis中。

命中缓存时，clientDB或使用了jql扩展的云函数/云对象会输出以下日志

示例源码如下，请查看 pre > code 标签中的内容

未命中缓存时，clientDB或使用了jql扩展的云函数/云对象会输出以下日志

示例源码如下，请查看 pre > code 标签中的内容

JQL Cache Redis会将缓存配置对应的查询结果缓存到key为unicloud:jql-cache:${id}:string的redis缓存内。可以在uniCloud web控制台的redis视图中找到。

配置"jql": "db.collection('test').limit(10).get()"时需注意，普通的JQL语句放在json的value中需要对引号转义，见下。

由于需要将查询语句放在json文件内，而json内字符串又需要引号包围，所以对于查询语句内使用双引号的场景需转义后再放到配置内。

示例源码如下，请查看 pre > code 标签中的内容

如果你的查询语句比较复杂，自己一个个加转义符比较麻烦。可以通过如下方式获取转义后的字符串

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用multiSend同时发送多条指令时，不支持将整个multiSend进行缓存。需要单独缓存每条指令。

示例源码如下，请查看 pre > code 标签中的内容

对上述数据库指令不能直接将缓存配置中的jql配置为const book = db.collection('book').limit(10).getTemp();const author = db.collection('author').limit(10).getTemp();db.multiSend(book,author)

需要单独配置book表的查询语句和author表的查询语句，注意getTemp方法也需要改为get方法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-jql-cache-redis.json缓存配置如下

示例源码如下，请查看 pre > code 标签中的内容

当MongoDB中的数据变更时，应该主动删除Redis中的缓存。

比如把banner轮播图的数据缓存在Redis中后，在admin中修改banner，应该同时在云函数中操作redis，将banner的缓存设为失效

使用redis删除命令传入缓存对应的key即可删除缓存。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
[{
	"id": "test-get", // 缓存id，不可重复，必填
	"jql": "db.collection('test').limit(10).get()", // 要缓存的数据库指令，必填
	"expiresIn": 3600 // 缓存有效期，单位秒，非必填
}]
```

Example 2 (json):
```json
[{
	"id": "test-get", // 缓存id，不可重复，必填
	"jql": "db.collection('test').limit(10).get()", // 要缓存的数据库指令，必填
	"expiresIn": 3600 // 缓存有效期，单位秒，非必填
}]
```

Example 3 (json):
```json
[{
	"id": "test-get", // 缓存id，不可重复，必填
	"jql": "db.collection('test').limit(10).get()", // 要缓存的数据库指令，必填
	"expiresIn": 3600 // 缓存有效期，单位秒，非必填
}]
```

Example 4 (json):
```json
[{
	"id": "test-get", // 缓存id，不可重复，必填
	"jql": "db.collection('test').limit(10).get()", // 要缓存的数据库指令，必填
	"expiresIn": 3600 // 缓存有效期，单位秒，非必填
}]
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database?id=limit

**Contents:**
- # 获取集合的引用
  - # 集合 Collection
  - # 记录 Record / Document
  - # 查询筛选指令 Query Command
  - # 字段更新指令 Update Command
- # 新增文档
- # 查询文档
  - # 添加查询条件
  - # 获取查询数量
  - # 设置记录数量

云函数中支持对云数据库的全部功能的操作。本章节主要讲解如何在云函数内通过传统api操作数据库，如需在云函数内使用JQL语法操作数据库，请参考：云函数内使用JQL语法

示例源码如下，请查看 pre > code 标签中的内容

通过 db.collection(name) 可以获取指定集合的引用，在集合上可以进行以下操作

查询及更新指令用于在 where 中指定字段需满足的条件，指令可通过 db.command 对象取得。

通过 db.collection(collectionName).doc(docId) 可以获取指定集合上指定 _id 的记录的引用，在记录上可以进行以下操作

doc(docId)方法的参数只能是字符串，即数据库默认的_id字段。

如需要匹配多个_id的记录，应使用where方法。可以在where方法里用in指令匹配一个包含_id的数组。

新增文档时数据库会自动生成_id字段，也可以自行将_id设置为其他值

如果你熟悉SQL，可查询mongodb与sql语句对照表 进行学习。

方法1： collection.add(data)

示例源码如下，请查看 pre > code 标签中的内容

方法2： collection.doc().set(data)

也可通过 set 方法新增一个文档，需先取得文档引用再调用 set 方法。 如果文档不存在，set 方法会创建一个新文档。

示例源码如下，请查看 pre > code 标签中的内容

支持 where()、limit()、skip()、orderBy()、get()、field()、count() 等操作。

只有当调用get()时才会真正发送查询请求。

limit，即返回记录的最大数量，默认值为100，也就是不设置limit的情况下默认返回100条数据。limit最大为1000条。

如果使用JQL语法传入getTree参数以返回树形数据也受上面的规则限制，不过此时limit方法仅对根节点生效（大量数据建议使用分层加载，不要使用getTree一次返回所有数据）

支付宝云中，使用where查询时，如果传入的参数是一个对象，将按照字段的值进行相等匹配，包含字段顺序。

示例源码如下，请查看 pre > code 标签中的内容

注意： 聚合操作中不能使用where，需使用match，关于聚合操作的更多介绍，详见

设置过滤条件，where 可接收对象作为参数，表示筛选出拥有和传入对象相同的 key-value 的文档。比如筛选出所有类型为计算机的、内存为 8g 的商品：

示例源码如下，请查看 pre > code 标签中的内容

如果要表达更复杂的查询，可使用高级查询指令，比如筛选出所有内存大于 8g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

where 还可以使用正则表达式来查询文档，比如一下示例查询所有name字段以ABC开头的用户

示例源码如下，请查看 pre > code 标签中的内容

mongoDB内按照数组内的值查询可以使用多种写法，以下面的数据为例

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内第一个元素的name为item-1的记录可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

如果想查询arr内某个元素的name为item-1的记录（可以是数组内的任意一条name为item-1）可以使用如下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.skip(value)

示例源码如下，请查看 pre > code 标签中的内容

注意：数据量很大的情况下，skip性能会很差，尽量使用其他方式替代，参考：skip性能优化

collection.orderBy(field, orderType)

如果需要对嵌套字段排序，需要用 "点表示法" 连接嵌套字段，比如 style.color 表示字段 style 里的嵌套字段 color。

同时也支持按多个字段排序，多次调用 orderBy 即可，多字段排序时的顺序会按照 orderBy 调用顺序先后对多个字段排序

示例源码如下，请查看 pre > code 标签中的内容

从查询结果中，过滤掉不需要的字段，或者指定要返回的字段。

示例源码如下，请查看 pre > code 标签中的内容

查询指令以dbCmd.开头，包括等于、不等于、大于、大于等于、小于、小于等于、in、nin、and、or。

示例源码如下，请查看 pre > code 标签中的内容

表示字段等于某个值。eq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

事实上在uniCloud的数据库中，等于有两种写法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 eq 指令有更大的灵活性，可以用于表示字段等于某个对象的情况，比如：

示例源码如下，请查看 pre > code 标签中的内容

字段不等于。neq 指令接受一个字面量 (literal)，可以是 number, boolean, string, object, array。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存为 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

筛选出内存不是 8g 或 16g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

如筛选出内存大于 4g 小于 32g 的计算机商品：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

表示需满足所有指定条件中的至少一个。如筛选出价格小于 4000 或在 6000-8000 之间的计算机：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果要跨字段 “或” 操作：(如筛选出内存 8g 或 cpu 3.2 ghz 的计算机)

示例源码如下，请查看 pre > code 标签中的内容

例如下面可以筛选出 version 字段开头是 "数字+s" 的记录，并且忽略大小写：

示例源码如下，请查看 pre > code 标签中的内容

假设数据表class内有以下数据，可以使用下面两种方式查询数组内包含指定值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc(_id).remove()

示例源码如下，请查看 pre > code 标签中的内容

collection.where().remove()

示例源码如下，请查看 pre > code 标签中的内容

示例：判断删除成功或失败，打印删除的记录数量

示例源码如下，请查看 pre > code 标签中的内容

使用腾讯云时更新方法必须搭配doc、where方法使用，db.collection('test').update()会报如下错误：param should have required property 'query'

collection.doc().update(Object data)

未使用set、remove更新操作符的情况下，此方法不会删除字段，仅将更新数据和已有数据合并。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新数组时，已数组下标作为key即可，比如以下示例将数组arr内下标为1的值修改为 uniCloud

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

collection.doc().set()

此方法会覆写已有字段，需注意与update表现不同，比如以下示例执行set之后follow字段会被删除

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口仅会操作一条数据，有多条数据匹配的情况下会只更新匹配的第一条并返回

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：只可确定数组内只会被匹配到一个的时候使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于设定字段等于指定值。这种方法相比传入纯 JS 对象的好处是能够指定字段等于一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于指示字段自增某个值，这是个原子操作，使用这个操作指令而不是先读数据、再加、再写回的好处是：

在文章阅读数+1、收藏+1等很多场景会用到它。如给收藏的商品数量加一：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意并没有直接提供减法操作符，如果要实现减法，仍通过inc实现。比如上述字段减1，

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请注意没有直接提供除法操作符，如果要实现除法，仍通过mul实现。比如上述字段除以10，

示例源码如下，请查看 pre > code 标签中的内容

更新指令。用于表示删除某个字段。如某人删除了自己一条商品评价中的评分：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组尾部追加元素，支持传入单个元素或数组

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

向数组头部添加元素，支持传入单个元素或数组。使用同push

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果需要对类型为地理位置的字段进行搜索，一定要建立地理位置索引。

用于表示地理位置点，用经纬度唯一标记一个点，这是一个特殊的数据存储类型。

签名：Point(longitude: number, latitude: number)

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理路径，是由两个或者更多的 Point 组成的线段。

签名：LineString(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示地理上的一个多边形（有洞或无洞均可），它是由一个或多个闭环 LineString 组成的几何图形。

由一个环组成的 Polygon 是没有洞的多边形，由多个环组成的是有洞的多边形。对由多个环（LineString）组成的多边形（Polygon），第一个环是外环，所有其他环是内环（洞）。

签名：Polygon(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

签名：MultiPoint(points: Point[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理路径 LineString 的集合。

签名：MultiLineString(lines: LineString[])

示例源码如下，请查看 pre > code 标签中的内容

用于表示多个地理多边形 Polygon 的集合。

签名：MultiPolygon(polygons: Polygon[])

示例源码如下，请查看 pre > code 标签中的内容

按从近到远的顺序，找出字段值在给定点的附近的记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

找出字段值在指定 Polygon / MultiPolygon 内的记录，无排序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过公共模块 uni-map-common 内的路线规划API，计算路线、距离、时间

事务通常用来在某个数据库操作失败之后进行回滚。

事务因为要锁行，是有时间限制的。从事务开始到事务提交/回滚，时间不可超过10秒。另外注意：如果多条事务同时处理同一行数据，可能存在写冲突，进而导致失败。

阿里云不支持此用法，请换成startTransaction以使用事务

发起事务。与startTransaction作用类似，接收参数类型不同

runTransaction 的形式如下：

示例源码如下，请查看 pre > code 标签中的内容

runTransaction返回一个Promise，此Promise.resolve的结果为callback事务执行函数的返回值，reject 的结果为事务执行过程中抛出的异常或者是 transaction.rollback 传入的值

事务执行函数由开发者传入，函数接收一个参数 transaction，其上提供 collection 方法和 rollback 方法。collection 方法用于取数据库集合记录引用进行操作，rollback 方法用于在不想继续执行事务时终止并回滚事务。

事务执行函数必须为 async 异步函数或返回 Promise 的函数，当事务执行函数返回时，uniCloud 会认为用户逻辑已完成，自动提交（commit）事务，因此务必确保用户事务逻辑完成后才在 async 异步函数中返回或 resolve Promise。

事务执行函数可能会被执行多次，在内部发现事务冲突时会自动重复执行，如果超过设定的执行次数上限，会报错退出。

在事务执行函数中发生的错误，都会认为事务执行失败而抛错。

事务执行函数返回的值会作为 runTransaction 返回的 Promise resolve 的值，在函数中抛出的异常会作为 runTransaction 返回的 Promise reject 的值，如果事务执行函数中调用了 transaction.rollback，则传入 rollback 函数的值会作为 runTransaction 返回的 Promise reject 的值。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

发起事务。与runTransaction作用类似，接收参数类型不同

startTransaction 形式如下

示例源码如下，请查看 pre > code 标签中的内容

返回一个Promise，此Promise resolve的结果为事务操作对象（注意这里与runTransaction的区别），其上可通过 collection API 操作数据库，通过 commit（使用startTransaction需要主动commit） 或 rollback 来结束或终止事务。

事务操作时为保障效率和并发性，只允许进行单记录操作，不允许进行批量操作，但可以在一个事务进行多次数据库操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 2 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 3 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

Example 4 (javascript):
```javascript
const db = uniCloud.database();
// 获取 `user` 集合的引用
const collection = db.collection('user');
```

---

## 数据库@db | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/known-issue.html

**Contents:**
- # 数据库
  - # 日期对象
    - # 腾讯云和阿里云云函数的差异
    - # 腾讯云和阿里云web控制台的差异
    - # clientDB
- # 云函数
  - # 异步行为

腾讯云和阿里云在日期处理方面的差异主要体现在对ISOString格式的日期字符串（例：2022-07-01T02:50:11.142Z）入库时。腾讯云在入库时不会进行特殊处理，会以字符串形式存储此字符串，阿里云会将此格式字符串转为日期对象存储。以下代码比较容易理解此问题

示例源码如下，请查看 pre > code 标签中的内容

同为日期对象，在web控制台腾讯云和阿里云展示的格式并不一致。以上述代码中的dateObj字段为例

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

clientDB在存储日期字符串及日期对象时和使用的云厂商表现一致。但是在取出日期对象时会得到ISOString格式的字符串

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。详情见：keepRunningAfterReturn

**Examples:**

Example 1 (javascript):
```javascript
// 云函数代码
'use strict';
const db = uniCloud.database()
function getType(val) {
  return Object.prototype.toString.call(val).slice(8, -1).toLowerCase()
}
exports.main = async (event, context) => {
  const addRes = await db.collection('date-test').add({
    dateStr: '2022-07-01T02:50:11.142Z',
    dateObj: new Date()
  })
  const getRes = await db.collection('date-test').doc(addRes.id).get()
  const {
    dateStr,
    dateObj
  } = getRes.data[0]
  console.log(getType(dateStr)) // 腾讯云：string，阿里云：date
  console.log(getType(dateObj)) // 腾讯云：date，阿里云：date
  return {}
};
```

Example 2 (javascript):
```javascript
// 云函数代码
'use strict';
const db = uniCloud.database()
function getType(val) {
  return Object.prototype.toString.call(val).slice(8, -1).toLowerCase()
}
exports.main = async (event, context) => {
  const addRes = await db.collection('date-test').add({
    dateStr: '2022-07-01T02:50:11.142Z',
    dateObj: new Date()
  })
  const getRes = await db.collection('date-test').doc(addRes.id).get()
  const {
    dateStr,
    dateObj
  } = getRes.data[0]
  console.log(getType(dateStr)) // 腾讯云：string，阿里云：date
  console.log(getType(dateObj)) // 腾讯云：date，阿里云：date
  return {}
};
```

Example 3 (javascript):
```javascript
// 云函数代码
'use strict';
const db = uniCloud.database()
function getType(val) {
  return Object.prototype.toString.call(val).slice(8, -1).toLowerCase()
}
exports.main = async (event, context) => {
  const addRes = await db.collection('date-test').add({
    dateStr: '2022-07-01T02:50:11.142Z',
    dateObj: new Date()
  })
  const getRes = await db.collection('date-test').doc(addRes.id).get()
  const {
    dateStr,
    dateObj
  } = getRes.data[0]
  console.log(getType(dateStr)) // 腾讯云：string，阿里云：date
  console.log(getType(dateObj)) // 腾讯云：date，阿里云：date
  return {}
};
```

Example 4 (javascript):
```javascript
// 云函数代码
'use strict';
const db = uniCloud.database()
function getType(val) {
  return Object.prototype.toString.call(val).slice(8, -1).toLowerCase()
}
exports.main = async (event, context) => {
  const addRes = await db.collection('date-test').add({
    dateStr: '2022-07-01T02:50:11.142Z',
    dateObj: new Date()
  })
  const getRes = await db.collection('date-test').doc(addRes.id).get()
  const {
    dateStr,
    dateObj
  } = getRes.data[0]
  console.log(getType(dateStr)) // 腾讯云：string，阿里云：date
  console.log(getType(dateObj)) // 腾讯云：date，阿里云：date
  return {}
};
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-im.html

**Contents:**
- # 简介
- # 案例
- # 快速部署体验
- # 前提条件
- # 体验示例项目
- # 部署到自己的项目
  - # 常见问题：
- # 限制普通用户向其他用户发起会话
- # 开发文档
- # 目录结构

uni-im 已开放需求征集和投票 点此前往

uni-im 是一款集云端一体、全平台支持、免费且开源的即时通讯系统

插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-im

应用名称：DCloud。此 App 的内置聊天模块即是基于 uni-im 开发的。

web端网址（支持PC宽屏和移动端）：https://im.dcloud.net.cn/index.html#/

下载地址为：https://im.dcloud.net.cn/uni-portal.html

uni-im相关功能建议或问题，可以加入由uni-im（本插件）搭建的交流群点此加入

注意：实际情况可能与视频存在差异，部分服务空间可能不会自动创建数据表。此时，需打开项目根目录下的：uniCloud/database 目录，右键上传所有DB Schema（含扩展库）

创建运行uni-im服务端代码的云服务环境

注意：这里和你自己项目服务端代码是什么语言开发的，以及运行在什么服务器环境无关。uni-im运行在专有的运行环境uniCloud（一种serverless 服务器 ）下。 你的项目服务端和uni-im的服务端之间分别“独立部署”，二者通过发送 http 请求并借助事件进行通讯。 当然，如果你的项目服务端也是基于uniCloud开发的，就可以部署在同一个服务空间内；通过云函数互调通讯。

公有云 开通地址：https://unicloud.dcloud.net.cn/ 服务商推荐选择“支付宝云”，性能更好。

私有云 普通中小企业项目使用公有云即可，但如果的项目存在特殊需求，例如：政务类、对信息保密性要求较高、用户都在海外的项目，这种情况下则需要进行私有化部署，详情可点击此处 。

下载示例项目 打开uni-im插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-im 点击使用HBuilderX导入示例项目

绑定项目的服务空间 在项目根目录uniCloud右键选择“关联云服务空间或项目”（注意：选择关联的服务空间，需在项目的 uni-push2.0的web控制台 被关联）

创建相关数据表 打开项目根目录：uniCloud/database 目录，右键上传所有DB Schema（含扩展库）

运行项目 在菜单运行->运行到浏览器 选择要运行的浏览器 这里需要运行到两个不同的浏览器（避免同一浏览器打开多个uni-im页面，引起socket占线)，注册账号并登录2个账号，体验对话效果

向指定用户发起会话 通过访问路径：/uni_modules/uni-im/pages/chat/chat?user_id= + 指定用户的id即可。 如果你不知道用户的id，可通过在浏览器控制台执行uni.imObservableData.currentUser._id可获取当前登录的账号id

注意：以上为连接本地云函数体验，如果要发行为正式项目，需要把uniCloud内的文件部署到云端。操作方式为：对项目根目录uniCloud点右键选择“云服务空间初始化向导”界面按提示部署项目

如果你的项目客户端，不是基于Vue3版本的uni-app + uniCloud + uni-id-pages 或对im的交互性能要求不高，或希望便捷快速地给你的项目增加个客服功能。建议直接使用uni-im-web-load部署（即：将uni-im打包发行为web页面，通过web-view的方式集成至项目）。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序端注意: uni-im 的“扩展插件功能“基于“动态组件”实现；而微信小程序并不支持“动态组件”，需要引入vite插件rollup-plugin-uniapp-cementing.js 实现“动态组件静态化”。

示例: 在项目根目录创建：vite.config.js，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

配置Schema扩展Js的公共模块或扩展库 先复制示例项目的/uni_modules/uni-id-pages/uniCloud/database/uni-id-users.schema.json文件覆盖到自己项目，解决表操作权限问题。 由于uni-im的数据库的触发器依赖了uni-im-utils，需要在目录uniCloud/database右键 -> 选择“配置Schema扩展Js的公共模块或扩展库” -> 在选择项目的公共模块中找到uni-im-utils并勾选 -> 点击确定，完成配置；然后在目录uniCloud/database右键 -> 上传Schema扩展Js的配置。

部署到uniCloud 在项目根目录uniCloud点右键，选择“云服务空间初始化向导” 按提示部署项目（注意：选择绑定的服务空间，须在uni-push2.0的web控制台 关联）

登录uni-im 基于uni-id-pages 实现用户体系的项目， 集成 uni-im 不需要考虑账号打通问题，用户登录项目后，不需要额外登录 uni-im。 其他项目，需要通过 uni-im 的客户端 sdk 的login方法，实现登录。

为什么不能实时接收到推送的消息，需要刷新或者关闭重新打开才能收到？ 答： uni-im通过uni-push实现消息实时送达，请检查是否已开通并正确配置，且在配置正常后重新登录

怎么样快速上手 答：先下载示例项目，部署并正确配置push后，体验没问题了再部署到自己的项目。

非unicloud项目提前导入用户数据 答：通过uni-im的httpapi调用login方法，实现用户数据导入。

客服场景下，我们希望管理员客服可以向任意用户发起会话。而普通用户的会话对象只能是客服。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-im-co 云函数（云对象）支持：在uni-app客户端及外部服务器调用。

示例源码如下，请查看 pre > code 标签中的内容

在实际应用中，常有外部服务器模拟用户执行向其他用户发消息、撤回消息、拉群等操作。 例如：创建一个名为“系统通知”的用户，通过接口向其他用户发送系统通知。

获取http请求的网络地址 在项目根目录的uniCloud目录右键，选择“打开uniCloud web控制台” -> 云函数/云对象 -> 云函数/云对象列表 -> 找到“云对象uni-im-co” -> 点击右侧的“详情”-> 在页面最下方可以看到“云函数URL化”点击“复制路径“。

实现安全通讯 为防止uni-im-co的url化链接，遭受非法HTTP请求，其默认设置为禁止访问。若要启用访问功能，需配置安全通讯密钥，以此建立可信的访问通道。

示例源码如下，请查看 pre > code 标签中的内容

此安全通讯基于uni-cloud-s2s实现，有：connectCode 和 数据签名2种安全通讯验证方式，这里以connectCode为例。如您希望通过数据签名验证详情参考

示例源码如下，请查看 pre > code 标签中的内容

完整的body 是一个长度为 2 的数组，且每一项都是对象：

示例源码如下，请查看 pre > code 标签中的内容

补充示例（为了方便进一步理解，以在uniCloud中请求外部接口为例）：

示例源码如下，请查看 pre > code 标签中的内容

已废弃。uni-im-co已支持通过http访问云对象内的任意方法，无需额外请求httpApi方法。详情查看在外部服务器调用uni-im-co

示例源码如下，请查看 pre > code 标签中的内容

注意：这是一个递归云对象，500个设备为一组批量向用户推送消息（该方法仅允许云对象或者触发器调用）

路径：/uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/uni-im/config.json

入口文件路径:@/uni_modules/uni-im/sdk/index.js

其中conversation,msg,friend,group,notification继承类/uni_modules/uni-im/sdk/ext/CloudData.class.js类，均拥有:

适用于非unicloud或用户体系前端非uni-id-pages的项目登录im，同时实现同步你项目的用户数据到uni-im的数据库中。

前提条件 ：需要配置uni-id的 tokenSecret tokenExpiresIn tokenExpiresThreshold详情查看

此方法根据uni-im服务端配置中get_external_userinfo字段的值，支持两种登录模式：

配置路径：uniCloud/cloudfunctions/common/uni-config-center/uni-im/config.json

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-im的会话列表和消息列表，需要显示实时的发生时间。而一个应用开启太多的定时器，会消耗较大的系统性能。 所以uni-im提供了一个每秒钟更新一次的响应式数据heartbeat，由uniImInit方法：启用一个定时器刷新，挂载在全局，所有应用场景引用这一个变量即可

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

加载系统消息数据 参数与获取系统消息数据一致

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

utils封装了uni-im常用方法的模块，路径：/uni_modules/uni-im/sdk/utils/index.js

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-im遵循uni-app的插件模块化规范，即：uni_modules 。

在项目根目录下的uni_modules目录下，以插件ID即uni-im为插件文件夹命名，在该目录右键也会看到“从插件市场更新”选项，点击即可更新该插件。也可以用插件市场web界面下载覆盖。

本许可协议，是数字天堂（北京）网络技术有限公司（以下简称DCloud）对其所拥有著作权的“DCloud uni-im”（以下简称软件），提供的使用许可协议。

您对“软件”的复制、使用、修改及分发受本许可协议的条款的约束，如您不接受本协议，则不能使用、复制、修改本软件。

a) 授予您永久性的、全球性的、免费的、非独占的、不可撤销的本软件的源码使用许可，您可以使用这些源码制作自己的应用。

b) 您只能在DCloud产品体系内使用本软件及其源码。您不能将源码修改后运行在DCloud产品体系之外的环境，比如客户端脱离uni-app，或服务端脱离uniCloud。

c) DCloud未向您授权商标使用许可。您在根据本软件源码制作自己的应用时，需以自己的名义发布软件，而不是以DCloud名义发布。

DCloud的责任限制 “软件”在提供时不带任何明示或默示的担保。在任何情况下，DCloud不对任何人因使用“软件”而引发的任何直接或间接损失承担责任，不论因何种原因导致或者基于何种法律理论,即使其曾被建议有此种损失的可能性。

b) 您在分发自己的应用时，不得侵犯DCloud商标和名誉权利。

c) 您不得进行破解、反编译、套壳等侵害DCloud知识产权的行为。您不得利用DCloud系统漏洞谋利或侵害DCloud利益，如您发现DCloud系统漏洞应第一时间通知DCloud。您不得进行攻击DCloud的服务器、网络等妨碍DCloud运营的行为。您不得利用DCloud的产品进行与DCloud争夺开发者的行为。

d) 如您违反本许可协议，需承担因此给DCloud造成的损失。

本协议签订地点为中华人民共和国北京市海淀区。

根据发展，DCloud可能会对本协议进行修改。修改时，DCloud会在产品或者网页中显著的位置发布相关信息以便及时通知到用户。如果您选择继续使用本框架，即表示您同意接受这些修改。

uni-im本身并不收费，实际使用中需要依赖uniCloud云服务，会产生费用；而uniCloud的价格很实惠：

更多计费参考：支付宝云版uniCloud按量计费文档

合计：1次云函数请求、2次数据库读操作、2次数据库写操作、1次uni-push2推送操作，即 (1 * 0.0133 + 2 * 0.015 + 2 * 0.05 + 1 * 0.0283)/10000 ≈ 0.000017元

合计：向500人群发送消息，会产生：1次云函数请求、4次数据库读操作、2次数据库写操作、1次uni-push2推送操作，即 (1 * 0.0133 + 4 * 0.015 + 2 * 0.05 + 1 * 0.0283)/10000 ≈ 0.000020元

相比市面上同类型产品，使用uni-im仅需花费如此便宜的uniCloud（serverless服务器）费用；在价格这块uni-im性价比极高。

注：由于uni-im会持续升级，其服务端运行逻辑也会不断优化，或新增其他逻辑，这可能导致上述费用计算方法中的数据库操作次数发生变化。因此，此处的费用算法仅作参考。

**Examples:**

Example 1 (html):
```html
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 2 (html):
```html
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 3 (javascript):
```javascript
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 4 (html):
```html
<script>
	//1. 导入uni身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm
	import uniIm from '@/uni_modules/uni-im/sdk/index.js';
	// 3.引入扩展插件（项目默认引入了，扩展插件uniImMsgReader用于展示消息是否已读）
	import MsgReaderExtension from '@/uni_modules/uni-im-msg-reader/extension.js'
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//4. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//5. 安装uniIm扩展插件
			MsgReaderExtension.install()
			//6. 初始化uniIm
			uniIm.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

---
