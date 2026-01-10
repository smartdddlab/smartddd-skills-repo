# Unicloud - Getting Started

**Pages:** 48

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema.html

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## 简介@intro | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-functions?id=eip

**Contents:**
- # 简介
- # 云函数的分类
- # 客户端和云函数的通信
  - # clientDB方式
  - # 云对象方式
  - # 普通云函数callFunction方式
  - # 云函数URL化方式
  - # 云函数请求中的中间状态通知通道
  - # uniCloud响应体规范
    - # HBuilderX 3.6.10及之后版本的错误规范

云函数是运行在云端的 JavaScript 代码，是基于 Node.js 的扩展。

在常规的 Node API 基础上，uniCloud的云函数环境内置了uniCloud对象，这个对象内置了网络、数据库等各种API。开发者未学习过 Node.js 也没有关系，只需要看uniCloud的文档，掌握这个uniCloud对象的API即可。

每个云函数是一个js包，在云函数被调用时，由 serverless 调度系统分配硬件资源启动一个 node 环境来运行这个云函数。

在HBuilderX中可以新建云函数（HBuilderX 3.4 同时可以新建云对象）。

每个云函数是一个目录，其中普通云函数有index.js入口文件，云对象的入口文件则是index.obj.js。

一个最简单的云函数只需要这个入口js文件，在里面编写代码即可。当然也可以在这个js中require该云函数目录下的其他js、json文件。

云函数的配置文件和 npm规范 相同，在云函数目录下可新建一个 package.json 来存放配置。uniCloud云函数扩展了 package.json，增加了一些特有的配置项。详见

云函数启动后实例会保留一段时间（如15分钟），超过保留期后若该云函数一直没有被再调用，那这个实例会被释放。所以云函数有冷启动的概念。不过由于js实例的启动要比php和java更快，所以js更适合serverless方式。

云函数有若干子概念，包括 普通云函数、云对象、公共模块、clientDB的action云函数、uniCloud扩展库。

HBuilderX中uniCloud项目的云函数均在项目的uniCloud/cloudfunctions目录下，目录结构如下：

uni-app客户端和传统服务器通信时，使用uni.request的ajax请求方式。uniCloud下不再使用它，有更好的云端一体的通信方式。

uniCloud体系里，客户端和服务端的云函数通信，有4种方式：

云函数是uniCloud的基础，本质上 clientDB 和 云对象 都是建立在云函数上针对特定场景的优化。

clientDB分API方式和组件方式，此处使用API方式来演示

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，学习clientDB需另见文档clientDB

如果客户端使用uni-app开发，且向uniCloud服务空间的请求主要是为了操作云数据库（无论增删改查），那么推荐使用clientDB方式，由uni-app客户端直接操作云数据库。

如果操作数据库的同时，还需要同时执行一些云端逻辑：HBuilderX 3.6.11以前使用action云函数；从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。

云对象和clientDB最大的区别，是云对象把数据库操作（以及其他逻辑）封装在云对象的方法里面。

它无法像clientDB那样无需开发服务器代码，它仍需在客户端和云端分别写代码。但它的应用场景不受限制。上文中不适用clientDB的情况，都可以使用云对象解决。

云端云对象代码，云对象名称：testco，有一个sum方法

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个testco对象，调用它的sum方法

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX 3.5.2之前，需要URL化和定时运行时，只能使用普通云函数；在HBuilderX 3.5.2+，云对象也支持了URL化和定时运行。

官方不推荐开发者使用云函数，有相关需求推荐使用云对象替代云函数。

目前官方还未提供基于云对象的router模式的框架，有相关需求可以使用三方框架。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，需另见文档云函数callfunction方式

可以让云函数/云对象生成一个HTTP URL。这样非uni-app应用，可以通过ajax请求和云函数/云对象通信。

在 uniCloud Web控制台进行URL化配置。

云函数在执行期间可以将中间状态发送给客户端，详情参考：云函数请求中的中间状态通知通道

uniCloud响应体规范（uniCloud response format），是DCloud制定的、服务器给客户端返回json数据的一种建议格式。

云对象、clientDB、uni-id公共模块均支持此规范。

uniCloud服务器给客户端返回的数据格式一般是json，但json的格式具体是什么没有约定。比如返回错误码，是叫code还是叫errCode？错误内容是message还是errMsg？内容的国际化如何处理？

如果没有一套统一的格式，在客户端将无法编写有效的网络拦截器，无法统一处理错误。

另外，如果不同的插件，云端返回的数据格式千差万别，那使用者整合这些插件也会非常麻烦。国际化更无法落地。

为此DCloud推出了uniCloud响应体规范。

为了与uni-app前端的API错误回调风格统一，uniCloud响应体规范定义的云端返回信息（尤其是报错时）应包含errCode和errMsg。

示例源码如下，请查看 pre > code 标签中的内容

errCode在成功时应返回数字0,失败时应返回一个以插件id开头的“字符串”，每个单词以连字符（-）分割。做出这样的规定是为了防止不同插件之间出现重复错误码

以'uni-id-account-banned'错误码为例，uni-id为插件id，account-banned为错误缩写。

如果业务开发的代码并不发布插件市场，那么为了避免下载了一个市场的插件产生冲突，推荐使用不包含“-”的字符串来做errCode（插件市场的所有插件ID必须包含“-”）。

后续uniCloud会提供自动根据errCode对errMsg进行国际化处理的功能，开发者仅需保证云函数返回值满足uniCloud响应体规范即可。

errMsg用于存放具体错误信息，包括展示给开发者、终端用户的错误信息

除此之外响应体规范还包含newToken字段，用于token的自动续期（云对象接收含有newToken的响应后会自动更新storage内存储的uni_id_token及uni_id_token_expired，此行为新增于HBuilderX 3.4.13）。开发者仅在自行调用uni-id-common的checkToken等会产生新token的接口时才需要返回新token，uni-app客户端和uni-id-co之间会自动管理token及续期。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX内使用代码块returnu可以快速输入以下代码（HBuilderX 3.4.0及以上版本）:

示例源码如下，请查看 pre > code 标签中的内容

云函数支持 js 和 nodejs 的标准API，如console.log()、setTimeout()，另见nodejs官网 。nodejs版本，详见云函数运行环境

除了标准API外，云函数环境中内置了uniCloud对象，扩展了一批新API，实际开发中更常用的是uniCloud的扩展API。见下：

云函数调用uniCloud接口时（包括请求云函数、云对象、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

云函数中支持访问本服务空间下的、或经授权的其他服务空间下的，数据库。

云函数中如需要请求其他http服务，则使用uniCloud.httpclient。无需额外依赖，就可以请求任何 HTTP 和 HTTPS 协议的 Web 服务。uniCloud.httpclient返回的是一个urllib实例 。

uniCloud.httpclient.request(URL,requestOptions)

默认情况下request接口不会处理返回的数据，即不传dataType参数时会返回buffer类型的数据，如需自动解析json格式的返回结果，需要将dataType设置为"json"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为简化http请求的调用uniCloud新增了uni.request调用方法类似的http请求接口uniCloud.request。

示例源码如下，请查看 pre > code 标签中的内容

实际业务中常有使用云函数发送formdata类型数据的需求，比如微信小程序提供的一些服务端接口（图片内容安全检测、识别图片二维码等），可以参考以下示例进行发送

示例源码如下，请查看 pre > code 标签中的内容

云函数无法作为websocket服务器使用，如有相关需求可以尝试使用uni-push 2.0实现，参考：uni-push 2.0。

本章节内容介绍云函数如何作为websocket客户端使用。为简化调用方式uniCloud新增了uni.connectSocket方法类似的接口uniCloud.connectSocket。

调用此接口返回SocketTask对象，见下一章节介绍

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

以下云函数示例代码，从websocket服务器获取消息拼接后返回给客户端，如果遇到错误会抛出错误

示例源码如下，请查看 pre > code 标签中的内容

由于存在单实例多并发的情况，实例级的uniCloud对象，和每个请求request是一对多的关系。

这也造成了与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了更好的管理请求和请求相关的上下文，uniCloud提供了下面一批API。

示例源码如下，请查看 pre > code 标签中的内容

如没有配置单实例多并发，数组里只会返回一项内容。配置后可能会多项，正在并发的所有请求的requestId都会返回。

当返回多项时，在uniCloud对象上无法明确当前请求是数组中的哪一个。所以提供了其他方法来获取当前请求：

HBuilderX 4.21版本客户端上传clientInfo信息时不会将所有信息都传到云端。具体字段白名单如下：'appId', 'appLanguage', 'appName', 'appVersion', 'appVersionCode', 'appWgtVersion', 'browserName', 'browserVersion', 'deviceBrand', 'deviceId', 'deviceModel', 'deviceType', 'osName', 'osVersion', 'romName', 'romVersion', 'ua', 'hostName', 'hostVersion', 'uniPlatform', 'uniRuntimeVersion', 'uniRuntimeVersionCode', 'uniCompilerVersion', 'uniCompilerVersionCode'。如需让客户端上传更多clientInfo字段到云端，可以使用客户端api：uniCloud.setCustomClientInfo

同理，考虑到单实例多并发，uniCloud.getClientInfos()获取客户端信息也是一个数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未开启单实例多并发，那么数组只有1项。单实例多并发场景下返回正在并发的所有请求的客户端信息列表。

getClientInfos返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

除了uniCloud.getClientInfos()API，在云函数context和云对象this中，也可以直接获取当前客户端信息。

同上，为了兼容并发场景，获取云端信息uniCloud.getCloudInfos()返回的也是数组。

示例源码如下，请查看 pre > code 标签中的内容

除了uniCloud.getCloudInfos()API，在云函数context和云对象this中，也可以直接获取当前请求的云端信息。

上述3个API，都因为单实例多并发而被设计成数组方式。实际上，大多数开发者并不使用单实例多并发。

在不考虑单实例多并发时，也可以直接使用uniCloud的getRequestList、getClientInfos、getCloudInfos方法中第一个数组项。

或者在云对象的this和云函数的context里获取相关上下文信息也可以。

uniCloud的api中，有些api对应的实现，其代码体积较大，且这些功能并不是每一个云函数都会使用。为了方便开发者控制云函数的体积，设计了uniCloud扩展库的概念。

开发者可以对云函数目录点右键，管理公共模块和扩展库依赖，在其中选择要加载的扩展库。这个可视化界面对应的数据在云函数目录下的 package.json 内的extensions字段下。

注意：未引用扩展库的，使用uniCloud相应api时会报错。

以下是一个开启了redis扩展库的云函数package.json示例，注意此文件不支持注释，下方示例中的注释仅为演示

示例源码如下，请查看 pre > code 标签中的内容

云函数支持公共模块。多个云函数/云对象的共享部分，可以抽离为公共模块，然后被多个云函数引用。由于篇幅较长，详见

云函数的运行环境是 Node.js，因此我们可以使用 npm 安装第三方依赖。

注意：阿里云目前仅支持全量上传云函数（整个node_modules文件夹全部上传，会在上传前自动在本地安装依赖，不会直接使用云函数目录下的node_modules），因此提醒开发者精简依赖，否则可能会每次上传时间很慢，影响开发体验。并且太大的npm库影响云函数的运行性能。

腾讯云、支付宝云会在上传云函数后自动安装需要的npm依赖。

由于云函数环境缺少一些系统级依赖，而部分npm依赖安装时会针对不同平台进行编译安装，导致无法正常编译。

以下为已知无法在云端云函数环境中运行的npm依赖：

用法同客户端调用云函数，仍然是uniCloud.callfunction，但不支持callback形式。

示例源码如下，请查看 pre > code 标签中的内容

由于调用方不是uni-app客户端，云函数的context、云对象的this.getClientInfo等API无法获取客户端信息，包括 uni-id-token。

可以在云函数互调时手动传递 token ，或者校验调用来源（source）为云函数（function）时不验证用户 token。

云函数/云对象互相调用时调用方会通过公网访问被调用方，访问速度不如直接将逻辑放在调用方执行。使用前请确保你确实需要此功能。

HBuilderX 3.4.0版本之前云函数右键本地运行时，里面的代码再次callFunction会调用云端的云函数而不是本地云函数，此bug后续版本已修复。

除了调用三方云函数，事实上云函数还可以递归调用自己。

当一个云函数实例的资源不能满足需求，或超时时间不够用时。比如要给10万个用户发送短信，而短信发送接口一次调用最多支持50个手机号码，这样最少需要调用2000次接口才能完成；而一个云函数实例完成不了2000次接口的调用。这种场景就可以使用云函数递归调用，分解任务实现。

示例源码如下，请查看 pre > code 标签中的内容

注意：如果不小心把递归云函数写成死循环，就把云函数的内容全部删除，重新上传覆盖即可

在支付宝云与腾讯云服务空间的云函数内支持获取同账号下其他服务空间的uniCloud实例，参考：一个应用访问多个服务空间，并使用此实例调用对应服务空间的云函数。

示例源码如下，请查看 pre > code 标签中的内容

serverless是动态分配计算资源的，由此会引发的出一批特有概念：冷启动、实例、并发请求、无状态、伪全局变量。

基于云函数按需执行的特点, 函数在不被触发的时候, 计算资源是不被激活的。

当一个云函数初次被触发时，其完整过程如下：

函数被调用时，执行这些完整步骤的过程称作冷启动, 冷启动的耗时一般在一秒左右。

一个云函数实例冷启动后，serverless调度中心会保留这个实例一定时间。在实例保留期间，客户端再次请求云函数，不会触发冷启动，速度会更快。实例的详细定义见下

云函数实例和执行进程都被复用的情况下称之为热启动, 热启动性能要好非常多，因为它只有一个步骤：

如果一个云函数实例长时间没有被再次调用，则该计算实例会被回收；后续再次调用该云函数时，就会再次触发云函数的冷启动。

直观的体验表现为：隔了很久不用的云函数，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

注：冷启动虽慢但也不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

三家云厂商仍然在优化冷启动问题。目前给开发者的建议是：

实例，指云函数的一个执行环境，可以简单的理解为一个node进程。

每次客户端发起请求（request）时，serverless的调度中心会查看已启动、且空闲的实例，分配一个实例来接收这个请求。如果没有空闲实例，则新起一个实例。

新起一个实例需要一定时间，也即上文说的冷启动问题。详见冷启动

一个实例启动后，一般在1秒内就会完成请求，但serverless调度中心会保留这个实例一定时间（时间见上一节）。在实例保留期间，客户端再次请求云函数，不会触发冷启动。

也就是说，在实例保留期间，1个实例会接受多个客户端请求。

请求（request），指一次连接云函数的网络请求。不同请求有不同的上下文信息（比如客户端UA）。

所以想要获取客户端信息，一定注意不是在实例的全局对象上获取，而是需要在请求的上下文中获取。详见

在uniCloud阿里云版与支付宝小程序版中还提供了1个实例的多并发请求配置，即同一时间多个请求可以并发执行。 也就是同一时间的请求发到云函数时，没有配置单实例多并发会新开一个云函数实例，配置了单实例多并发则不会新开实例，在一个实例中增加并发。 详见单实例多并发。

一个云函数，可以同时存在多个实例。比如cf1云函数，如未配置单实例多并发，10个请求同时达到云函数，就会开10个实例。

不管开了多少实例，云函数的计费是按请求计费的。实例响应请求后到保留期结束之间，如果不发生新请求是不会计费的。

因为实例可能第一次启动，也可能已经启动，所以云函数中的js全局变量其实是伪全局变量。也就是云函数是无状态的。

在云对象中，写在module.exports = {}之前，云函数写在exports.main = async (event, context) => {}之前的变量定义，是伪全局变量。

以如下代码为例，count作为全局变量，当多次调用该云函数时，可能会出现变量累加的情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面2个示例中，实例未复用时，也就是冷启动时，count的值每次都是0；若实例被复用，则可能返回1、2、3等各种意外情况。

当然，可以用这个方法来获知一个实例被重用了多少次请求。

require由于存在缓存，也存在同样的问题。尽量不要直接修改require返回的内容。

uniCloud全局对象也是跨请求的，与请求相关的内容不应该挂载到uniCloud全局对象上。

由于上节提到的，uniCloud全局对象是实例级的、跨请求的，1个实例内uniCloud只会在冷启动时进行一次初始化。

所以与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了让开发者清晰的了解实例和请求的关系，uniCloud提供了如下方案。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是uniCloud私有云， 如果想获取与请求相关的信息，比如这次请求的客户端UA，或云函数环境信息，无法直接在uniCloud全局对象中获取。

云函数入口入参包含一个event和一个context，这两个参数和请求相关，每次有新请求到云函数实例时就会有一个新的event对象和一个新的context对象

云对象的this和event、context类似，每个请求都对应一个单独的this。

默认情况下云函数仅支持单实例单并发，即同一时间一个实例仅可为一个请求服务（不同请求同一时间访问会被分派到不同实例进行处理）。不过在uniCloud web控制台中，阿里云可以通过修改云函数单实例并发度，可以修改云函数同一时间最多能处理多少请求。

当实例并发度设置为1时，需要创建3个实例来处理这3个请求，每个实例分别处理1个请求。而每开启一个实例都会引发云函数冷启动；

当云函数的实例并发度设置为10时（即1个实例可以同时处理10个请求），只需要创建1个实例就能处理这3个请求。这样后面2个并发请求不会有因云函数实例创建带来的冷启动问题。

相关文档：云函数实例及部分变量说明 、云函数的无状态

云函数详情页面配置单实例并发度即可，支持1-100之间的数值

旧版本uni-id公共模块指uni-id-common推出之前的版本。详见

示例源码如下，请查看 pre > code 标签中的内容

不同于旧版uni-id公共模块，新版uni-id-common不可直接require后使用，必须使用createInstance方法

开启单实例多并发后的全局变量复用并非一定是坏的结果，如果你很了解此行为，也可以对此进行有效的利用

例：ip-filter 中就利用云函数全局缓存一些ip访问信息来限制单ip访问频率，可以下载示例项目体验一下

受单实例多并发的影响，云函数全局存放与本次请求有关的信息会造成混乱。因此uniCloud提供了根据当前requestId获取客户端信息和云端信息。参考以下文档

云函数是运行在云端的代码，运行环境由云服务器弹性调配，这是和传统Node.js应用很大的区别。

换言之，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合。

所以，不建议使用node的fs文件系统相关的API。建议通过云数据库、云存储、redis的方案替代。

书写云函数时应注意async、await的使用，nodejs有内置模块util可以将符合error-first形式callback的函数转换为promise形式，详情参考 ，比如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果想在云函数内使用回调形式可以让云函数返回一个promise，如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

腾讯云因为按 GBS 对云函数计费，在 node12 时，尤其要注意，如果未有效终止云函数，会一直计费

云函数运行在 node 环境中。可以使用 node api process.version 获取 node 版本。

node版本可以在云函数的package.json文件的cloudfunction-config->runtime字段进行配置，详情参考：云函数package.json

支付宝云云端云函数使用的时区是UTC+8。

阿里云和腾讯云云端云函数使用的时区是UTC+0，而不是 UTC+8，在云函数中使用时间时需特别注意。

云函数在HBuilderX本地运行时，时区则是电脑的时区，很可能是 UTC+8。建议统一使用时间戳，可以规避时区问题。

云函数除了代码，还有配置。在uniCloud web控制台 可以配置；在HBuilderX项目中，云函数根目录的package.json也是存放配置的地方。

云函数运行内存为单个云函数实例使用的内存。

支付宝云云函数默认运行内存512MB，阿里云正式版默认512MB，腾讯云云函数默认运行内存大小为256MB

计算云函数GBs资源消耗时腾讯云会以此内存*运行时间（100ms为阶梯向上取整）得到消耗量。阿里云会以实际运行时间计算GBs，不会按100ms阶梯向上取整

阿里云一般场景（比如包含数据库访问时）不建议将内存配置为128MB。如果开发起见遇到数据库响应缓慢，在排除索引等因素的影响后可以检查下是不是云函数内存配置为了128MB，如果是建议调整为256MB

腾讯云个人版及入门版套餐自2025年8月31日起云函数运行内存固定为256MB，不支持修改，详见相关公告

支付宝云定时任务触发最大支持3小时超时时间（需开启异步超时），非定时触发时超时时间为180秒，客户端请求云函数如果超出180秒云函数断开连接后会停止运行。

阿里云定时任务触发最大支持7200秒超时时间，非定时触发时超时时间为120秒，客户端请求云函数如果超出120秒云函数断开连接后会停止运行。

腾讯云定时任务触发最大支持900秒超时时间。非定时触发时超时时间为60秒，客户端请求云函数时如果超出30秒云函数断开链接后会继续运行，最大能运行到配置的超时时间。

如果超时时间仍然不够用，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

本地云函数默认超时为10秒，超时后云函数会停止运行。

修改超时时间可以在HBuilderX的设置->运行设置->云函数本地运行配置 超时时间中修改，单位为秒。

serverless默认是没有固定的服务器IP的，因为有很多服务器资源在后台供随时调用，每次调用到哪个服务器、哪个ip都不固定。

但一些三方系统，要求配置固定ip白名单，比如微信公众号的js sdk，此时只能提供固定ip地址。

腾讯云199元/月以上的套餐，提供了云函数的固定出口ip，在uniCloud Web控制台 ，创建付费的腾讯云服务空间，选择一个云函数，在云函数的详情界面可以开启固定出口ip。开启后界面上会显示可用的固定ip。拿着这个ip去需要固定ip的界面（如微信公众号管理界面）配置即可。

示例源码如下，请查看 pre > code 标签中的内容

阿里云必须使用uniCloud.httpProxyForEip发送请求才会固定出口ip，其原理是通过代理请求获得固定出口IP的能力。IP为轮转不固定，因此三方服务要求使用白名单时开发者需要将代理服务器可能的IP均加入到白名单中，见下方代理服务器列表。此外对于代理的域名有限制，当前仅持weixin.qq.com泛域名。若开发者有其他域名代理需求，发送邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。

示例源码如下，请查看 pre > code 标签中的内容

如需在获取微信公众号access_token场景使用，请将上述ip配置到微信公众平台 -> 基本配置 -> IP白名单内，相关链接：微信公众平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，此接口以application/x-www-form-urlencoded格式发送数据而不是multipart/form-data

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以application/json格式post数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0版本之前，package.json只是一个标准的package.json，安装依赖或公共模块才需要。HBuilderX 3.0及以上版本，package.json也可以用来配置云函数。

uniCloud web控制台提供了很多云函数的设置，比如内存大小、url化、定时触发等，从HBuilderX 3.0起，在云函数的package.json里也可以编写这些设置。

开发者在本地编写云函数的设置，上传云函数，这些设置会自动在云端生效。（本地不生效）

在云端设置了非默认参数后，HBuilderX下载云函数到本地时，也会自动把设置项放入package.json中下载下来。

package.json是一个标准json文件，不可带注释。下面是一个package.json示例。

示例源码如下，请查看 pre > code 标签中的内容

其中cloudfunction-config字段是云函数配置，支持的配置如下

示例源码如下，请查看 pre > code 标签中的内容

阿里云：Nodejs12、Nodejs14、Nodejs16、Nodejs18、Nodejs20，默认Nodejs16

腾讯云：Nodejs8（即将下线，不推荐使用）、Nodejs12、Nodejs16、Nodejs18，默认Nodejs16

支付宝云：Nodejs16、Nodejs18，默认Nodejs18

阿里云Nodejs8已终止支持：终止支持阶段一：禁止新建（2024年06月01日）；终止支持阶段二：禁止新建和更新（2024年09月01日）。终止支持不影响函数继续运行。建议您及时升级。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

支付宝云与阿里云定时触发的cron表达式不支持代表年的第七位，但是在package.json内配置时仍需将第七位设置为*。

在web控制台配置trigger请参考：定时触发

package.json内统一了支付宝云、腾讯云、阿里云三家厂商的配置，三个平台都需要配置为如下形式

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。

示例源码如下，请查看 pre > code 标签中的内容

如果此云函数运行在阿里云或腾讯云nodejs8，setTimeout里面的console.log不会在本次云函数调用执行，但是可能在云函数实例再次被复用时继续执行。

如果此云函数运行在腾讯云nodejs12，setTimeout里面的console.log会在本次云函数调用内，同样的本次云函数**计费时间（与云函数GBs指标相关）**也会按照最终执行完成的时间计算（5000ms+return耗时）。但是前端无需等待5秒即可收到响应。注意：如果有未断开的长连接（例如：redis连接）会导致云函数一直运行到配置的超时时间

当在云函数package.json内的cloudfunction-config内配置了keepRunningAfterReturn: false时，可以改变腾讯云nodejs12的表现，云函数return之后将不再继续执行，未断开的长连接也不会增加云函数实际运行时间，云函数return后长连接也不会被中断，简单来说其表现和腾讯云nodejs8一致。

将上述示例中的setTimeout换成网络请求、调用其他云函数或数据库请求同理，如果在阿里云或腾讯云nodejs8直接return会导致网络请求可能无法发送（即使成功发送也是在下一次云函数实例被复用的时候），这是与传统开发不太一样的地方。

示例源码如下，请查看 pre > code 标签中的内容

由于redis需要和服务器建立连接，此连接会阻止云函数结束执行。如果没有云函数return之后还需要继续执行的需求，可以简单的在cloudfunction-config内配置keepRunningAfterReturn: false。这样redis的连接并不会中断，下次请求来时依然可以使用之前建立的连接。

如果需要return之后继续执行，那么需要在使用完毕后断开redis连接，调用redis.quit()方法即可断开连接。需要注意的是断开连接后之前建立的连接将不再可用，下个请求到来时需要使用uniCloud.redis()方法重新建立连接。

如未按照上述说明进行操作，redis连接将会一直占用云函数实例，导致云厂商持续计算云函数执行时间，可能会导致消耗大量云资源而产生额外费用

务必确定自己已理解此文档内容，因未按照文档说明使用导致的额外计费DCloud不承担任何责任

HBuilderX 2.9版本，uniCloud提供了cloudfunctions_init.json来方便开发者快速进行云函数的初始化操作。

注意：HBuilderX 3.0.0版本起不再使用cloudfunctions_init.json来初始化云函数。改为使用在云函数目录下通过package.json进行配置，具体见上个章节

不再使用cloudfunctions_init.json，内容被分散到每个云函数的package.json的cloudfunction-config字段下

package.json是一个标准json文件，不可带注释。下面是一个package.json示例

示例源码如下，请查看 pre > code 标签中的内容

cloudfunction-config说明如下

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0.0之前版本，请继续阅读下面文档

cloudfunctions_init.json形式如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 2 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 3 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

Example 4 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema?id=col-permission

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## 简介@intro | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-functions?id=runtime

**Contents:**
- # 简介
- # 云函数的分类
- # 客户端和云函数的通信
  - # clientDB方式
  - # 云对象方式
  - # 普通云函数callFunction方式
  - # 云函数URL化方式
  - # 云函数请求中的中间状态通知通道
  - # uniCloud响应体规范
    - # HBuilderX 3.6.10及之后版本的错误规范

云函数是运行在云端的 JavaScript 代码，是基于 Node.js 的扩展。

在常规的 Node API 基础上，uniCloud的云函数环境内置了uniCloud对象，这个对象内置了网络、数据库等各种API。开发者未学习过 Node.js 也没有关系，只需要看uniCloud的文档，掌握这个uniCloud对象的API即可。

每个云函数是一个js包，在云函数被调用时，由 serverless 调度系统分配硬件资源启动一个 node 环境来运行这个云函数。

在HBuilderX中可以新建云函数（HBuilderX 3.4 同时可以新建云对象）。

每个云函数是一个目录，其中普通云函数有index.js入口文件，云对象的入口文件则是index.obj.js。

一个最简单的云函数只需要这个入口js文件，在里面编写代码即可。当然也可以在这个js中require该云函数目录下的其他js、json文件。

云函数的配置文件和 npm规范 相同，在云函数目录下可新建一个 package.json 来存放配置。uniCloud云函数扩展了 package.json，增加了一些特有的配置项。详见

云函数启动后实例会保留一段时间（如15分钟），超过保留期后若该云函数一直没有被再调用，那这个实例会被释放。所以云函数有冷启动的概念。不过由于js实例的启动要比php和java更快，所以js更适合serverless方式。

云函数有若干子概念，包括 普通云函数、云对象、公共模块、clientDB的action云函数、uniCloud扩展库。

HBuilderX中uniCloud项目的云函数均在项目的uniCloud/cloudfunctions目录下，目录结构如下：

uni-app客户端和传统服务器通信时，使用uni.request的ajax请求方式。uniCloud下不再使用它，有更好的云端一体的通信方式。

uniCloud体系里，客户端和服务端的云函数通信，有4种方式：

云函数是uniCloud的基础，本质上 clientDB 和 云对象 都是建立在云函数上针对特定场景的优化。

clientDB分API方式和组件方式，此处使用API方式来演示

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，学习clientDB需另见文档clientDB

如果客户端使用uni-app开发，且向uniCloud服务空间的请求主要是为了操作云数据库（无论增删改查），那么推荐使用clientDB方式，由uni-app客户端直接操作云数据库。

如果操作数据库的同时，还需要同时执行一些云端逻辑：HBuilderX 3.6.11以前使用action云函数；从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。

云对象和clientDB最大的区别，是云对象把数据库操作（以及其他逻辑）封装在云对象的方法里面。

它无法像clientDB那样无需开发服务器代码，它仍需在客户端和云端分别写代码。但它的应用场景不受限制。上文中不适用clientDB的情况，都可以使用云对象解决。

云端云对象代码，云对象名称：testco，有一个sum方法

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个testco对象，调用它的sum方法

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX 3.5.2之前，需要URL化和定时运行时，只能使用普通云函数；在HBuilderX 3.5.2+，云对象也支持了URL化和定时运行。

官方不推荐开发者使用云函数，有相关需求推荐使用云对象替代云函数。

目前官方还未提供基于云对象的router模式的框架，有相关需求可以使用三方框架。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，需另见文档云函数callfunction方式

可以让云函数/云对象生成一个HTTP URL。这样非uni-app应用，可以通过ajax请求和云函数/云对象通信。

在 uniCloud Web控制台进行URL化配置。

云函数在执行期间可以将中间状态发送给客户端，详情参考：云函数请求中的中间状态通知通道

uniCloud响应体规范（uniCloud response format），是DCloud制定的、服务器给客户端返回json数据的一种建议格式。

云对象、clientDB、uni-id公共模块均支持此规范。

uniCloud服务器给客户端返回的数据格式一般是json，但json的格式具体是什么没有约定。比如返回错误码，是叫code还是叫errCode？错误内容是message还是errMsg？内容的国际化如何处理？

如果没有一套统一的格式，在客户端将无法编写有效的网络拦截器，无法统一处理错误。

另外，如果不同的插件，云端返回的数据格式千差万别，那使用者整合这些插件也会非常麻烦。国际化更无法落地。

为此DCloud推出了uniCloud响应体规范。

为了与uni-app前端的API错误回调风格统一，uniCloud响应体规范定义的云端返回信息（尤其是报错时）应包含errCode和errMsg。

示例源码如下，请查看 pre > code 标签中的内容

errCode在成功时应返回数字0,失败时应返回一个以插件id开头的“字符串”，每个单词以连字符（-）分割。做出这样的规定是为了防止不同插件之间出现重复错误码

以'uni-id-account-banned'错误码为例，uni-id为插件id，account-banned为错误缩写。

如果业务开发的代码并不发布插件市场，那么为了避免下载了一个市场的插件产生冲突，推荐使用不包含“-”的字符串来做errCode（插件市场的所有插件ID必须包含“-”）。

后续uniCloud会提供自动根据errCode对errMsg进行国际化处理的功能，开发者仅需保证云函数返回值满足uniCloud响应体规范即可。

errMsg用于存放具体错误信息，包括展示给开发者、终端用户的错误信息

除此之外响应体规范还包含newToken字段，用于token的自动续期（云对象接收含有newToken的响应后会自动更新storage内存储的uni_id_token及uni_id_token_expired，此行为新增于HBuilderX 3.4.13）。开发者仅在自行调用uni-id-common的checkToken等会产生新token的接口时才需要返回新token，uni-app客户端和uni-id-co之间会自动管理token及续期。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX内使用代码块returnu可以快速输入以下代码（HBuilderX 3.4.0及以上版本）:

示例源码如下，请查看 pre > code 标签中的内容

云函数支持 js 和 nodejs 的标准API，如console.log()、setTimeout()，另见nodejs官网 。nodejs版本，详见云函数运行环境

除了标准API外，云函数环境中内置了uniCloud对象，扩展了一批新API，实际开发中更常用的是uniCloud的扩展API。见下：

云函数调用uniCloud接口时（包括请求云函数、云对象、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

云函数中支持访问本服务空间下的、或经授权的其他服务空间下的，数据库。

云函数中如需要请求其他http服务，则使用uniCloud.httpclient。无需额外依赖，就可以请求任何 HTTP 和 HTTPS 协议的 Web 服务。uniCloud.httpclient返回的是一个urllib实例 。

uniCloud.httpclient.request(URL,requestOptions)

默认情况下request接口不会处理返回的数据，即不传dataType参数时会返回buffer类型的数据，如需自动解析json格式的返回结果，需要将dataType设置为"json"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为简化http请求的调用uniCloud新增了uni.request调用方法类似的http请求接口uniCloud.request。

示例源码如下，请查看 pre > code 标签中的内容

实际业务中常有使用云函数发送formdata类型数据的需求，比如微信小程序提供的一些服务端接口（图片内容安全检测、识别图片二维码等），可以参考以下示例进行发送

示例源码如下，请查看 pre > code 标签中的内容

云函数无法作为websocket服务器使用，如有相关需求可以尝试使用uni-push 2.0实现，参考：uni-push 2.0。

本章节内容介绍云函数如何作为websocket客户端使用。为简化调用方式uniCloud新增了uni.connectSocket方法类似的接口uniCloud.connectSocket。

调用此接口返回SocketTask对象，见下一章节介绍

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

以下云函数示例代码，从websocket服务器获取消息拼接后返回给客户端，如果遇到错误会抛出错误

示例源码如下，请查看 pre > code 标签中的内容

由于存在单实例多并发的情况，实例级的uniCloud对象，和每个请求request是一对多的关系。

这也造成了与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了更好的管理请求和请求相关的上下文，uniCloud提供了下面一批API。

示例源码如下，请查看 pre > code 标签中的内容

如没有配置单实例多并发，数组里只会返回一项内容。配置后可能会多项，正在并发的所有请求的requestId都会返回。

当返回多项时，在uniCloud对象上无法明确当前请求是数组中的哪一个。所以提供了其他方法来获取当前请求：

HBuilderX 4.21版本客户端上传clientInfo信息时不会将所有信息都传到云端。具体字段白名单如下：'appId', 'appLanguage', 'appName', 'appVersion', 'appVersionCode', 'appWgtVersion', 'browserName', 'browserVersion', 'deviceBrand', 'deviceId', 'deviceModel', 'deviceType', 'osName', 'osVersion', 'romName', 'romVersion', 'ua', 'hostName', 'hostVersion', 'uniPlatform', 'uniRuntimeVersion', 'uniRuntimeVersionCode', 'uniCompilerVersion', 'uniCompilerVersionCode'。如需让客户端上传更多clientInfo字段到云端，可以使用客户端api：uniCloud.setCustomClientInfo

同理，考虑到单实例多并发，uniCloud.getClientInfos()获取客户端信息也是一个数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未开启单实例多并发，那么数组只有1项。单实例多并发场景下返回正在并发的所有请求的客户端信息列表。

getClientInfos返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

除了uniCloud.getClientInfos()API，在云函数context和云对象this中，也可以直接获取当前客户端信息。

同上，为了兼容并发场景，获取云端信息uniCloud.getCloudInfos()返回的也是数组。

示例源码如下，请查看 pre > code 标签中的内容

除了uniCloud.getCloudInfos()API，在云函数context和云对象this中，也可以直接获取当前请求的云端信息。

上述3个API，都因为单实例多并发而被设计成数组方式。实际上，大多数开发者并不使用单实例多并发。

在不考虑单实例多并发时，也可以直接使用uniCloud的getRequestList、getClientInfos、getCloudInfos方法中第一个数组项。

或者在云对象的this和云函数的context里获取相关上下文信息也可以。

uniCloud的api中，有些api对应的实现，其代码体积较大，且这些功能并不是每一个云函数都会使用。为了方便开发者控制云函数的体积，设计了uniCloud扩展库的概念。

开发者可以对云函数目录点右键，管理公共模块和扩展库依赖，在其中选择要加载的扩展库。这个可视化界面对应的数据在云函数目录下的 package.json 内的extensions字段下。

注意：未引用扩展库的，使用uniCloud相应api时会报错。

以下是一个开启了redis扩展库的云函数package.json示例，注意此文件不支持注释，下方示例中的注释仅为演示

示例源码如下，请查看 pre > code 标签中的内容

云函数支持公共模块。多个云函数/云对象的共享部分，可以抽离为公共模块，然后被多个云函数引用。由于篇幅较长，详见

云函数的运行环境是 Node.js，因此我们可以使用 npm 安装第三方依赖。

注意：阿里云目前仅支持全量上传云函数（整个node_modules文件夹全部上传，会在上传前自动在本地安装依赖，不会直接使用云函数目录下的node_modules），因此提醒开发者精简依赖，否则可能会每次上传时间很慢，影响开发体验。并且太大的npm库影响云函数的运行性能。

腾讯云、支付宝云会在上传云函数后自动安装需要的npm依赖。

由于云函数环境缺少一些系统级依赖，而部分npm依赖安装时会针对不同平台进行编译安装，导致无法正常编译。

以下为已知无法在云端云函数环境中运行的npm依赖：

用法同客户端调用云函数，仍然是uniCloud.callfunction，但不支持callback形式。

示例源码如下，请查看 pre > code 标签中的内容

由于调用方不是uni-app客户端，云函数的context、云对象的this.getClientInfo等API无法获取客户端信息，包括 uni-id-token。

可以在云函数互调时手动传递 token ，或者校验调用来源（source）为云函数（function）时不验证用户 token。

云函数/云对象互相调用时调用方会通过公网访问被调用方，访问速度不如直接将逻辑放在调用方执行。使用前请确保你确实需要此功能。

HBuilderX 3.4.0版本之前云函数右键本地运行时，里面的代码再次callFunction会调用云端的云函数而不是本地云函数，此bug后续版本已修复。

除了调用三方云函数，事实上云函数还可以递归调用自己。

当一个云函数实例的资源不能满足需求，或超时时间不够用时。比如要给10万个用户发送短信，而短信发送接口一次调用最多支持50个手机号码，这样最少需要调用2000次接口才能完成；而一个云函数实例完成不了2000次接口的调用。这种场景就可以使用云函数递归调用，分解任务实现。

示例源码如下，请查看 pre > code 标签中的内容

注意：如果不小心把递归云函数写成死循环，就把云函数的内容全部删除，重新上传覆盖即可

在支付宝云与腾讯云服务空间的云函数内支持获取同账号下其他服务空间的uniCloud实例，参考：一个应用访问多个服务空间，并使用此实例调用对应服务空间的云函数。

示例源码如下，请查看 pre > code 标签中的内容

serverless是动态分配计算资源的，由此会引发的出一批特有概念：冷启动、实例、并发请求、无状态、伪全局变量。

基于云函数按需执行的特点, 函数在不被触发的时候, 计算资源是不被激活的。

当一个云函数初次被触发时，其完整过程如下：

函数被调用时，执行这些完整步骤的过程称作冷启动, 冷启动的耗时一般在一秒左右。

一个云函数实例冷启动后，serverless调度中心会保留这个实例一定时间。在实例保留期间，客户端再次请求云函数，不会触发冷启动，速度会更快。实例的详细定义见下

云函数实例和执行进程都被复用的情况下称之为热启动, 热启动性能要好非常多，因为它只有一个步骤：

如果一个云函数实例长时间没有被再次调用，则该计算实例会被回收；后续再次调用该云函数时，就会再次触发云函数的冷启动。

直观的体验表现为：隔了很久不用的云函数，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

注：冷启动虽慢但也不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

三家云厂商仍然在优化冷启动问题。目前给开发者的建议是：

实例，指云函数的一个执行环境，可以简单的理解为一个node进程。

每次客户端发起请求（request）时，serverless的调度中心会查看已启动、且空闲的实例，分配一个实例来接收这个请求。如果没有空闲实例，则新起一个实例。

新起一个实例需要一定时间，也即上文说的冷启动问题。详见冷启动

一个实例启动后，一般在1秒内就会完成请求，但serverless调度中心会保留这个实例一定时间（时间见上一节）。在实例保留期间，客户端再次请求云函数，不会触发冷启动。

也就是说，在实例保留期间，1个实例会接受多个客户端请求。

请求（request），指一次连接云函数的网络请求。不同请求有不同的上下文信息（比如客户端UA）。

所以想要获取客户端信息，一定注意不是在实例的全局对象上获取，而是需要在请求的上下文中获取。详见

在uniCloud阿里云版与支付宝小程序版中还提供了1个实例的多并发请求配置，即同一时间多个请求可以并发执行。 也就是同一时间的请求发到云函数时，没有配置单实例多并发会新开一个云函数实例，配置了单实例多并发则不会新开实例，在一个实例中增加并发。 详见单实例多并发。

一个云函数，可以同时存在多个实例。比如cf1云函数，如未配置单实例多并发，10个请求同时达到云函数，就会开10个实例。

不管开了多少实例，云函数的计费是按请求计费的。实例响应请求后到保留期结束之间，如果不发生新请求是不会计费的。

因为实例可能第一次启动，也可能已经启动，所以云函数中的js全局变量其实是伪全局变量。也就是云函数是无状态的。

在云对象中，写在module.exports = {}之前，云函数写在exports.main = async (event, context) => {}之前的变量定义，是伪全局变量。

以如下代码为例，count作为全局变量，当多次调用该云函数时，可能会出现变量累加的情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面2个示例中，实例未复用时，也就是冷启动时，count的值每次都是0；若实例被复用，则可能返回1、2、3等各种意外情况。

当然，可以用这个方法来获知一个实例被重用了多少次请求。

require由于存在缓存，也存在同样的问题。尽量不要直接修改require返回的内容。

uniCloud全局对象也是跨请求的，与请求相关的内容不应该挂载到uniCloud全局对象上。

由于上节提到的，uniCloud全局对象是实例级的、跨请求的，1个实例内uniCloud只会在冷启动时进行一次初始化。

所以与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了让开发者清晰的了解实例和请求的关系，uniCloud提供了如下方案。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是uniCloud私有云， 如果想获取与请求相关的信息，比如这次请求的客户端UA，或云函数环境信息，无法直接在uniCloud全局对象中获取。

云函数入口入参包含一个event和一个context，这两个参数和请求相关，每次有新请求到云函数实例时就会有一个新的event对象和一个新的context对象

云对象的this和event、context类似，每个请求都对应一个单独的this。

默认情况下云函数仅支持单实例单并发，即同一时间一个实例仅可为一个请求服务（不同请求同一时间访问会被分派到不同实例进行处理）。不过在uniCloud web控制台中，阿里云可以通过修改云函数单实例并发度，可以修改云函数同一时间最多能处理多少请求。

当实例并发度设置为1时，需要创建3个实例来处理这3个请求，每个实例分别处理1个请求。而每开启一个实例都会引发云函数冷启动；

当云函数的实例并发度设置为10时（即1个实例可以同时处理10个请求），只需要创建1个实例就能处理这3个请求。这样后面2个并发请求不会有因云函数实例创建带来的冷启动问题。

相关文档：云函数实例及部分变量说明 、云函数的无状态

云函数详情页面配置单实例并发度即可，支持1-100之间的数值

旧版本uni-id公共模块指uni-id-common推出之前的版本。详见

示例源码如下，请查看 pre > code 标签中的内容

不同于旧版uni-id公共模块，新版uni-id-common不可直接require后使用，必须使用createInstance方法

开启单实例多并发后的全局变量复用并非一定是坏的结果，如果你很了解此行为，也可以对此进行有效的利用

例：ip-filter 中就利用云函数全局缓存一些ip访问信息来限制单ip访问频率，可以下载示例项目体验一下

受单实例多并发的影响，云函数全局存放与本次请求有关的信息会造成混乱。因此uniCloud提供了根据当前requestId获取客户端信息和云端信息。参考以下文档

云函数是运行在云端的代码，运行环境由云服务器弹性调配，这是和传统Node.js应用很大的区别。

换言之，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合。

所以，不建议使用node的fs文件系统相关的API。建议通过云数据库、云存储、redis的方案替代。

书写云函数时应注意async、await的使用，nodejs有内置模块util可以将符合error-first形式callback的函数转换为promise形式，详情参考 ，比如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果想在云函数内使用回调形式可以让云函数返回一个promise，如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

腾讯云因为按 GBS 对云函数计费，在 node12 时，尤其要注意，如果未有效终止云函数，会一直计费

云函数运行在 node 环境中。可以使用 node api process.version 获取 node 版本。

node版本可以在云函数的package.json文件的cloudfunction-config->runtime字段进行配置，详情参考：云函数package.json

支付宝云云端云函数使用的时区是UTC+8。

阿里云和腾讯云云端云函数使用的时区是UTC+0，而不是 UTC+8，在云函数中使用时间时需特别注意。

云函数在HBuilderX本地运行时，时区则是电脑的时区，很可能是 UTC+8。建议统一使用时间戳，可以规避时区问题。

云函数除了代码，还有配置。在uniCloud web控制台 可以配置；在HBuilderX项目中，云函数根目录的package.json也是存放配置的地方。

云函数运行内存为单个云函数实例使用的内存。

支付宝云云函数默认运行内存512MB，阿里云正式版默认512MB，腾讯云云函数默认运行内存大小为256MB

计算云函数GBs资源消耗时腾讯云会以此内存*运行时间（100ms为阶梯向上取整）得到消耗量。阿里云会以实际运行时间计算GBs，不会按100ms阶梯向上取整

阿里云一般场景（比如包含数据库访问时）不建议将内存配置为128MB。如果开发起见遇到数据库响应缓慢，在排除索引等因素的影响后可以检查下是不是云函数内存配置为了128MB，如果是建议调整为256MB

腾讯云个人版及入门版套餐自2025年8月31日起云函数运行内存固定为256MB，不支持修改，详见相关公告

支付宝云定时任务触发最大支持3小时超时时间（需开启异步超时），非定时触发时超时时间为180秒，客户端请求云函数如果超出180秒云函数断开连接后会停止运行。

阿里云定时任务触发最大支持7200秒超时时间，非定时触发时超时时间为120秒，客户端请求云函数如果超出120秒云函数断开连接后会停止运行。

腾讯云定时任务触发最大支持900秒超时时间。非定时触发时超时时间为60秒，客户端请求云函数时如果超出30秒云函数断开链接后会继续运行，最大能运行到配置的超时时间。

如果超时时间仍然不够用，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

本地云函数默认超时为10秒，超时后云函数会停止运行。

修改超时时间可以在HBuilderX的设置->运行设置->云函数本地运行配置 超时时间中修改，单位为秒。

serverless默认是没有固定的服务器IP的，因为有很多服务器资源在后台供随时调用，每次调用到哪个服务器、哪个ip都不固定。

但一些三方系统，要求配置固定ip白名单，比如微信公众号的js sdk，此时只能提供固定ip地址。

腾讯云199元/月以上的套餐，提供了云函数的固定出口ip，在uniCloud Web控制台 ，创建付费的腾讯云服务空间，选择一个云函数，在云函数的详情界面可以开启固定出口ip。开启后界面上会显示可用的固定ip。拿着这个ip去需要固定ip的界面（如微信公众号管理界面）配置即可。

示例源码如下，请查看 pre > code 标签中的内容

阿里云必须使用uniCloud.httpProxyForEip发送请求才会固定出口ip，其原理是通过代理请求获得固定出口IP的能力。IP为轮转不固定，因此三方服务要求使用白名单时开发者需要将代理服务器可能的IP均加入到白名单中，见下方代理服务器列表。此外对于代理的域名有限制，当前仅持weixin.qq.com泛域名。若开发者有其他域名代理需求，发送邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。

示例源码如下，请查看 pre > code 标签中的内容

如需在获取微信公众号access_token场景使用，请将上述ip配置到微信公众平台 -> 基本配置 -> IP白名单内，相关链接：微信公众平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，此接口以application/x-www-form-urlencoded格式发送数据而不是multipart/form-data

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以application/json格式post数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0版本之前，package.json只是一个标准的package.json，安装依赖或公共模块才需要。HBuilderX 3.0及以上版本，package.json也可以用来配置云函数。

uniCloud web控制台提供了很多云函数的设置，比如内存大小、url化、定时触发等，从HBuilderX 3.0起，在云函数的package.json里也可以编写这些设置。

开发者在本地编写云函数的设置，上传云函数，这些设置会自动在云端生效。（本地不生效）

在云端设置了非默认参数后，HBuilderX下载云函数到本地时，也会自动把设置项放入package.json中下载下来。

package.json是一个标准json文件，不可带注释。下面是一个package.json示例。

示例源码如下，请查看 pre > code 标签中的内容

其中cloudfunction-config字段是云函数配置，支持的配置如下

示例源码如下，请查看 pre > code 标签中的内容

阿里云：Nodejs12、Nodejs14、Nodejs16、Nodejs18、Nodejs20，默认Nodejs16

腾讯云：Nodejs8（即将下线，不推荐使用）、Nodejs12、Nodejs16、Nodejs18，默认Nodejs16

支付宝云：Nodejs16、Nodejs18，默认Nodejs18

阿里云Nodejs8已终止支持：终止支持阶段一：禁止新建（2024年06月01日）；终止支持阶段二：禁止新建和更新（2024年09月01日）。终止支持不影响函数继续运行。建议您及时升级。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

支付宝云与阿里云定时触发的cron表达式不支持代表年的第七位，但是在package.json内配置时仍需将第七位设置为*。

在web控制台配置trigger请参考：定时触发

package.json内统一了支付宝云、腾讯云、阿里云三家厂商的配置，三个平台都需要配置为如下形式

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。

示例源码如下，请查看 pre > code 标签中的内容

如果此云函数运行在阿里云或腾讯云nodejs8，setTimeout里面的console.log不会在本次云函数调用执行，但是可能在云函数实例再次被复用时继续执行。

如果此云函数运行在腾讯云nodejs12，setTimeout里面的console.log会在本次云函数调用内，同样的本次云函数**计费时间（与云函数GBs指标相关）**也会按照最终执行完成的时间计算（5000ms+return耗时）。但是前端无需等待5秒即可收到响应。注意：如果有未断开的长连接（例如：redis连接）会导致云函数一直运行到配置的超时时间

当在云函数package.json内的cloudfunction-config内配置了keepRunningAfterReturn: false时，可以改变腾讯云nodejs12的表现，云函数return之后将不再继续执行，未断开的长连接也不会增加云函数实际运行时间，云函数return后长连接也不会被中断，简单来说其表现和腾讯云nodejs8一致。

将上述示例中的setTimeout换成网络请求、调用其他云函数或数据库请求同理，如果在阿里云或腾讯云nodejs8直接return会导致网络请求可能无法发送（即使成功发送也是在下一次云函数实例被复用的时候），这是与传统开发不太一样的地方。

示例源码如下，请查看 pre > code 标签中的内容

由于redis需要和服务器建立连接，此连接会阻止云函数结束执行。如果没有云函数return之后还需要继续执行的需求，可以简单的在cloudfunction-config内配置keepRunningAfterReturn: false。这样redis的连接并不会中断，下次请求来时依然可以使用之前建立的连接。

如果需要return之后继续执行，那么需要在使用完毕后断开redis连接，调用redis.quit()方法即可断开连接。需要注意的是断开连接后之前建立的连接将不再可用，下个请求到来时需要使用uniCloud.redis()方法重新建立连接。

如未按照上述说明进行操作，redis连接将会一直占用云函数实例，导致云厂商持续计算云函数执行时间，可能会导致消耗大量云资源而产生额外费用

务必确定自己已理解此文档内容，因未按照文档说明使用导致的额外计费DCloud不承担任何责任

HBuilderX 2.9版本，uniCloud提供了cloudfunctions_init.json来方便开发者快速进行云函数的初始化操作。

注意：HBuilderX 3.0.0版本起不再使用cloudfunctions_init.json来初始化云函数。改为使用在云函数目录下通过package.json进行配置，具体见上个章节

不再使用cloudfunctions_init.json，内容被分散到每个云函数的package.json的cloudfunction-config字段下

package.json是一个标准json文件，不可带注释。下面是一个package.json示例

示例源码如下，请查看 pre > code 标签中的内容

cloudfunction-config说明如下

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0.0之前版本，请继续阅读下面文档

cloudfunctions_init.json形式如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 2 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 3 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

Example 4 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema?id=trim

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## 功能概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-im-web-load.html

**Contents:**
- # 功能概述
  - # 时序图
  - # uni-im-web 页面
  - # getUserInfo接口
- # 使用教程
  - # 服务端
  - # 客户端
- # 常见问题

帮助开发者以 web-view 的方式，快速将 uni-im 模块集成至项目（支持非unicloud项目），实现客服等相关功能。

插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-im-web-load

此页面已集成在本插件，路径：/uni_modules/uni-im-web-load/pages/index/index.vue

由项目的服务端开发语言不同，分为以下两种情况：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

提示：在完成部署操作之后，可以在 插件部署记录 当中查看到刚刚部署的 uni-im的网络地址以及 httpApi 密钥等信息。

客户端无需编写额外代码。只需直接导入本插件，然后打开路径/uni_modules/uni-im-web-load/pages/index/index.vue，按照注释说明，选择或修改传递至uni-im模块的参数即可。

**Examples:**

Example 1 (json):
```json
{
	"token": "你在客户端传递的token",
	//... 其他你自定义传的参数例如user_id等
}
```

Example 2 (json):
```json
{
	"token": "你在客户端传递的token",
	//... 其他你自定义传的参数例如user_id等
}
```

Example 3 (json):
```json
{
	"token": "你在客户端传递的token",
	//... 其他你自定义传的参数例如user_id等
}
```

Example 4 (json):
```json
{
	"token": "你在客户端传递的token",
	//... 其他你自定义传的参数例如user_id等
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-starter.html

**Contents:**
- # 简介
- # uni-starter集成包括：
- # 快速体验部署流程
    - # 1. 开通uniCloud
    - # 2. 创建并配置uni-id的配置文件
    - # 3. 运行云服务空间初始化向导
- # 功能模块介绍
  - # 1.账户管理
  - # 2.路由管理
  - # 3.h5版在页面顶部引导用户点击下载App

以下为uni-starter v2的文档，新项目推荐直接使用。如果你的老项目使用的是uni-starter v1版，不想升级请查看：uni-starter v1 文档

uni-starter 已开放需求征集和投票 点此前往

uni-starter是集成商用项目常见功能的、云端一体应用快速开发项目模版。

一个应用有很多通用的功能，比如登录注册、个人中心、设置、权限管理、拦截器、banner... uni-starter将这些功能都已经集成好。

直接在HBuilderx新建项目选择uni-starter模板，即可在此基础上快速开发自己的特色业务。

有了uni-starter，再加上schema2code生成前端页面，一个简单应用就可以快速完成。

如果说uni-admin 是管理端项目的基本项目模版，那么uni-starter则是用户端、尤其是移动端的基础项目模板。

uni-starter + uni-admin 提供了用户端和管理端的全套模版，开箱即用，应用开发从未如此简单快捷！

阿里云版演示项目：https://uni-starter.dcloud.net.cn

支付宝云版演示项目：https://uni-starter.dcloud.net.cn/alipay/

下载地址：https://ext.dcloud.net.cn/plugin?id=5057

GitCode 仓库：https://gitcode.com/dcloud/uni-starter

uni-starter 使用 uni-id-pages实现：登录注册账户管理相关功能 详情查看

大多数应用，都会指定某些页面需要登录才能访问。以往开发者需要写不少代码。现在，只需在项目的pages.json内配置登录页路径、需要登录才能访问的页面等信息，uni-app框架的路由跳转，会自动在需要登录且客户端登录状态过期或未登录时跳转到登录页面。详情查看：uniIdRouter文档

把h5端用户引流到APP端，是一个非常实用的功能。相对于h5，APP端有更高的用户留存和更好的产品体验。 uni-starter集成了这个功能，你只需直接在项目根目录/uni-starter.config.js的"h5"->"openApp"中配置相关内容，即可开启全局悬浮的下载引导。 这也是一个演示开发者如何在h5端做全局悬浮块的例子。你也可以在/common/openApp.js中修改他的样式等代码等，注意它只支持原生js语法。

为了解决开发者维护多个 App 升级繁琐，重复逻辑过多，管理不便的问题，升级中心uni-upgrade-center应运而生。 提供了简单、易用、统一的 App 管理、App 版本管理、安装包发布管理，升级检测更新管理。

根据工业和信息化部关于开展APP侵害用户权益专项整治要求，App提交到应用市场必须满足以下条件：

配置弹出“隐私协议和政策”打开项目的manifest.json文件，切换到“源码视图”项 在manifest.json -> app-plus -> privacy 节点下添加 prompt节点

示例源码如下，请查看 pre > code 标签中的内容

更多Android平台隐私与政策提示框配置方法，详情

控制调试模式 配置路径：uni-starter/uni-starter.config.js 云对象请求fail时，开启调试模式将以showModal的模式弹出真实错误信息。关闭调试模式，则以showToast的模式模糊提示（弹出系统错误请稍后再试！）

裂变营销功能原理 当用户请求云对象uni-id-co的任何方式登录（含：注册并登录）功能时， 云对象拦截器逻辑内部：判断用户的剪切板是否包含uniInvitationCode:开头的邀请码，如果存在则在请求时带上此邀请码；实现裂变营销功能的用户关系绑定。

项目升级 uni-starter遵循uni-app的插件模块化规范，即：uni_modules 。它是个项目类型的插件。在项目的根目录下有一个符合uni_modules规范的package.json文件，在这个文件右键-从插件市场更新即可更新该插件。

插件升级 非项目类型的uni_modules插件在项目根目录下的uni_modules目录下。以插件ID为插件文件夹命名，在该目录右键也会看到“从插件市场更新”选项，点击即可更新该插件。

uni-starter内集成的uni-id-pages、uni-upgrade-center等插件都可以独立升级。

uni-starter支持多语言国际化，默认关闭，可以在uni-starter.config.js->i18n->enable中配置。

如果你启用了多语言国际化需要先阅读：uni-app多语言国际化

当用户首次在微信小程序中通过微信登录应用。uni-starter将获取用户的微信头像，设置为当前账号头像。

注意： 保存头像的过程是：先将微信头像的图片下载，再上传到uniCloud云存储。而小程序平台要求在管理后台配置小程序应用的联网服务器域名，否则无法联网。请确认已正确配置download、uploadFile合法域名详情查看

uni-starter提供了uni-starter.config.js，可配置选择登录注册方式及优先级等，可指定该应用是否强制登录才能进入某个页面。配置项内容如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (jsx):
```jsx
"privacy" : {
	"prompt" : "template",
	"template" : {
		"title" : "服务协议和隐私政策",
		"message" : "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"https://ask.dcloud.net.cn/protocol.html\">《服务协议》</a>和<a href=\"https://ask.dcloud.net.cn/protocol.html\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
		"buttonAccept" : "同意",
		"buttonRefuse" : "暂不同意"
	}
}
```

Example 2 (jsx):
```jsx
"privacy" : {
	"prompt" : "template",
	"template" : {
		"title" : "服务协议和隐私政策",
		"message" : "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"https://ask.dcloud.net.cn/protocol.html\">《服务协议》</a>和<a href=\"https://ask.dcloud.net.cn/protocol.html\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
		"buttonAccept" : "同意",
		"buttonRefuse" : "暂不同意"
	}
}
```

Example 3 (jsx):
```jsx
"privacy" : {
	"prompt" : "template",
	"template" : {
		"title" : "服务协议和隐私政策",
		"message" : "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"https://ask.dcloud.net.cn/protocol.html\">《服务协议》</a>和<a href=\"https://ask.dcloud.net.cn/protocol.html\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
		"buttonAccept" : "同意",
		"buttonRefuse" : "暂不同意"
	}
}
```

Example 4 (jsx):
```jsx
"privacy" : {
	"prompt" : "template",
	"template" : {
		"title" : "服务协议和隐私政策",
		"message" : "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"https://ask.dcloud.net.cn/protocol.html\">《服务协议》</a>和<a href=\"https://ask.dcloud.net.cn/protocol.html\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
		"buttonAccept" : "同意",
		"buttonRefuse" : "暂不同意"
	}
}
```

---

## unicloud-db组件简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-db?id=loadevent

**Contents:**
- # unicloud-db组件简介
- # 属性
- # v-slot:default
- # collection
- # where
- # orderby
- # loadtime
- # 事件
- # ssr-key
- # 方法

<unicloud-db> 组件是一个数据库查询组件，它是对clientDB的js库的再封装。

前端通过组件方式直接获取uniCloud的云端数据库中的数据，并绑定在界面上进行渲染。

在传统开发中，开发者需要在前端定义data、通过request联网获取接口数据、然后赋值给data。同时后端还需要写接口来查库和反馈数据。

有了<unicloud-db> 组件，上述工作只需要1行代码！写组件，设组件的属性，在属性中指定要查什么表、哪些字段、以及查询条件，就OK了！

HBuilderX中敲下udb代码块，得到如下代码，然后通过collection属性指定要查询表“table1”，通过field属性指定要查询字段“field1”，并且在where属性中指定查询id为1的数据。查询结果data就可以直接渲染在界面上。

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db> 组件尤其适用于列表、详情等展示类页面。开发效率可以大幅度的提升。

<unicloud-db> 组件的查询语法是jql，这是一种比sql语句和nosql语法更简洁、更符合js开发者习惯的查询语法。没学过sql或nosql的前端，也可以轻松掌握。jql详见

<unicloud-db> 组件不仅支持查询。还自带了add、remove、update方法，见下文方法章节

<unicloud-db> 由原 <uni-clientdb>插件 升级而来，从 HBuilderX 3.0 起<unicloud-db>内置到框架，与小程序基础库版本无关。

如果需要 HBuilderX3.0 以下版本使用clientDB组件，则需要从插件市场单独下载<uni-clientdb>插件，下载地址为：https://ext.dcloud.net.cn/plugin?id=3256 。但仍然推荐升级HBuilderX 3.0+。

TODO：暂不支持in子查询功能。后续会补充

注意：page-current/page-size 改变不重置数据(page-data="replace") 和 (loadtime="manual") 除外，collection/action/field/getcount/orderby/where 改变后清空已有数据

比如云数据库有个user的表，里面有字段id、name，查询id=1的数据，那么写法如下：

注意下面示例使用了getone会返回一条对象形式的data，如不使用getone，data将会是数组形式，即多一层

示例源码如下，请查看 pre > code 标签中的内容

注意：除非使用admin账户登录操作，否则需要在 uniCloud 控制台对要查询的表增加 Schema 权限配置。至少配置读取权限，否则无权在前端查询，详见 DB Schema

示例源码如下，请查看 pre > code 标签中的内容

提示：如果不指定分页模式， data 为多次查询的集合

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

where中指定要查询的条件。比如只查询某个字段的值符合一定条件的记录。

组件的where属性，与clientDB的JS API是一致的，且内容较多，所以详见js API中相关jql文档：详情

但组件与js API有一个差别，就是组件的属性中若使用js中的变量，需额外注意。

例如查询uni-id-users表，字段username的值由js变量指定，有如下几种方式：

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

方式2. 不在属性中写，而在js中拼接字符串

示例源码如下，请查看 pre > code 标签中的内容

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述示例使用的是==比较符，如需进行模糊搜索，则使用正则表达式。插件市场提供了完整的云端一体搜索模板，搜索类页面无需自行开发，可直接使用。详见

示例源码如下，请查看 pre > code 标签中的内容

再次强调，where条件内容较多，组件和api用法相同，完整的where条件文档在api文档中，另见：JQL文档

格式为 字段名 空格 asc(升序)/desc(降序)，多个字段用 , 分割，优先级为字段顺序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

load事件在查询执行后、渲染前触发，一般用于查询数据的二次加工。比如查库结果不能直接渲染时，可以在load事件里先对data进行预处理。

示例源码如下，请查看 pre > code 标签中的内容

数据库里的时间一般是时间戳，不能直接渲染。虽然可以在load事件中对时间格式化，但更简单的方式是使用<uni-dateformat>组件 ，无需写js处理。

error事件在查询报错时触发，比如联网失败。

示例源码如下，请查看 pre > code 标签中的内容

发行 H5 ssr 时有效，用于保证服务器端渲染和前端加载的数据对应

默认值：根据 (页面路径 + unicloud-db 组件代码中的行号)生成的唯一值

注意：页面同时出现2个及以上 unicloud-db 组件需要配置此属性，且要保证值整个应用唯一

当 <unicloud-db> 组件的 manual 属性设为 true 时，不会在页面初始化时联网查询数据，此时需要通过本方法在需要的时候手动加载数据。

示例源码如下，请查看 pre > code 标签中的内容

一般onLoad因时机太早取不到this.$refs.udb，在onReady里可以取到。

举例常见场景，页面pagea在url中获取参数id，然后加载数据

请求地址：/pages/pagea?id=123

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.loadData({clear: true}, callback)，

可选参数 clear: true，是否清空数据和分页信息，true表示清空，默认false

callback 是回调函数，加载数据完成后触发（即使加载失败）

示例源码如下，请查看 pre > code 标签中的内容

在列表的加载下一页场景下，使用ref方式访问组件方法，加载更多数据，每加载成功一次，当前页 +1

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.remove(id, options)

udb为unicloud-db组件的ref属性值

在列表页面，如果想删除一个item，原本要做很多事：

为减少重复开发，unicloud-db组件提供了remove方法，在列表渲染时绑定好index，直接调用remove方法即可一行代码完成上述5步。

首先在列表生成的时候给删除按钮绑定好id：

示例源码如下，请查看 pre > code 标签中的内容

然后confirmDelete方法里面只有一行代码：

示例源码如下，请查看 pre > code 标签中的内容

clientDB组件的remove方法的参数只支持传入数据库的_id进行删除，不支持其他where条件删除。

参数传入的_id支持单个，也支持多个，即可以批量删除。多个id的格式是：

示例源码如下，请查看 pre > code 标签中的内容

在uniCloud的web控制台的DB Schema界面，可自助生成数据表的admin管理插件，其中有多行数据批选批删示例。

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.add(value, options)

udb为unicloud-db组件的ref属性值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.update(id, value, options)

udb为unicloud-db组件的ref属性值

使用unicloud-db组件的update方法，除了更新云数据库中的数据外，也会同时更新当前页面的unicloud-db组件中的data数据，自然也会自动差量更新页面渲染的内容。同时update方法还封装了修改成功的toast提示。

示例源码如下，请查看 pre > code 标签中的内容

第一个参数 id 是数据的唯一标识，第二个参数 value 是需要修改的新数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在js中，获取<unicloud-db> 组件的data的方法如下：

示例源码如下，请查看 pre > code 标签中的内容

如果修改了dataList的值，组件渲染的界面也会同步变化。

但是在浏览器控制台里无法使用this来打印查看数据，为此特别新增了unidev.clientDB.data方法以优化调试体验。

H5平台，开发模式下浏览器控制台输入 unidev.clientDB.data，可查看组件内部数据，多个组件通过索引查看 unidev.clientDB.data[0]

联表查询有以下两种写法，对于数据量稍大的表推荐使用多个临时表组成的数组作为collection，可以在主表的getTemp内先进行过滤减小联表时的性能消耗。

更多关于联表查询的内容请参考：JQL联表查询

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件简化了列表分页的写法，只需简单的配置每页需要多少数据（默认是20条），不管是数据库的分页查询还是前端的列表分页展示，都自动封装了。

列表分页有2种模式，一种是手机上常见的拉到底部加载下一页，另一种是pc常见的底部列出页码，点击页码跳转页面。

下面的示例代码没有使用uList组件，实际开发时建议使用uList组件来避免长列表的性能问题。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用分页控件，常见于PC端。在uniCloud Admin 中，有完整的分页展示数据、新增删除数据的示例代码。

<unicloud-db> 组件支持嵌套。

子组件中访问父组件 data 时，需options传递数据

如下示例演示了2个组件的嵌套，以及在子组件中如何访问父组件 data

示例源码如下，请查看 pre > code 标签中的内容

完整项目示例见插件市场的示例项目: https://ext.dcloud.net.cn/plugin?id=2574

**Examples:**

Example 1 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 2 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 3 (json):
```json
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 4 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/price

**Contents:**
- # 概述
- # 阿里云
  - # 免费服务空间
  - # 包年包月套餐
    - # 套餐变配
    - # 包年包月套餐转按量计费
  - # 按量计费
  - # 按量计费每日资源上限设置
    - # 资源上限设置特别说明
  - # 各项资源释义说明

uniCloud的定价、套餐内容、服务SLA，是由云厂商直接公布的。DCloud公司不会加价。uniCloud已经上线近5年，DCloud一直以良心方式服务开发者，努力降低应用的开发门槛、提高应用的开发效率。

付费用户享受云厂商提供的服务协议SLA，详见

阿里云正式版需要使用HBuilderX 3.6.5+（正式版）或3.6.10+（Alpha版）或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

阿里云提供1个免费空间，付费空间提供包月、按量计费两种计费方式，具体说明如下：

包年包月套餐，适于业务稳定、套餐资源使用均衡的场景。

如果你难以预估会消耗多少云资源，或者业务波峰波谷变化较大，或者套餐中某些项目不够用、某些项目又用不完，此时推荐使用按量计费。

阿里云为每个账号提供了1个免费服务空间，以方便产品开发测试及体验。具体额度请阅读下方包年包月套餐中的开发者版。

套餐中的资源超标后服务空间会停服，需要及时升配或转按量计费才能恢复。

阿里云包年包月套餐支持升配和转换按量计费，不支持降配，且按量计费空间不支持转换为包年包月套餐。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud按量余额，以用于按量计费账单扣费。

注意： 按量计费不支持转换为包年包月，该操作不可逆，请谨慎操作。

按量计费，意味着不是每个月支付固定费用，而是根据使用量付费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从阿里云预存余额中扣除。

如果预存余额不足，则服务空间将不可用，需要立即充值。

如您担心按量计费会造成不可控的费用上升，也可以为各项资源设置用量上限。

资源上限可在web控制台 服务空间详情进行设置，该设置实时生效。

每项资源指标的数据更新延迟时间不同，当数据更新且某项资源用量超过阈值时，则该项服务便会单独停用。

上述指标，容量是累加的，其他指标则是按日计算。

例如，设置了每日云存储下载次数不能超过1万次。如当日超过该下载次数，则在超过的6小时后停止云存储的下载功能。

该设置为阿里云实验阶段功能，资源用量更新有延迟，待资源更新后达到设置的资源用量上限时，才会执行管控。管控执行亦有延迟性，所以存在实际用量超设置上限情况，需特别说明：

因上游储备不足，目前uniCloud阿里云版仍有一些限额。DCloud会持续推动限额的解除。目前有需求的开发者需向DCloud人工联系申请提高限额。

目前单个账号可创建20个正式版服务空间，如有更多需求需发邮件到service@dcloud.io申请。此外集合数量限制也可申请提升。邮件模板见下方：申请解除限制邮件模板

示例源码如下，请查看 pre > code 标签中的内容

云存储数据处理：图片裁剪、视频截帧等功能。现阶段免费，但不排除后续收费可能。

通过扩展数据库解除限制：若数据库集合数量、索引数量等限制已无法满足您的需求，则可以使用扩展数据库，扩展数据库没有内置数据库相关的限制。扩展数据库介绍

套餐指标超限： 包月套餐各项资源用量如有指标超出上限时，该项指标服务便会停服，其他服务不受影响。比如云存储CDN流量超套餐上限，则云存储文件无法访问，其他服务正常。如需恢复，可升级套餐来获取更高套餐额度或转换为按量计费，升配或转按量计费后，资源恢复大约有10分钟左右延迟。

套餐到期停服： 包月套餐在到期当天的0点10分左右开始停服，停服后服务空间无法正常使用，资源会保留15天。15天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 按量计费空间没有到期时间，是在账户欠费时开始停服。阿里云在每天上午9点左右出前一日账单，出账后如果账户发生欠费，按量计费服务空间则会被停服无法正常使用，资源会保留15天。15天内操作余额充正服务恢复正常（续费后大约有10分钟左右延迟），15天后会销毁空间资源且无法找回。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

腾讯云于2022年8月12日更新了计费方式。

新计费模式下，统一采用基础套餐+超限按量计费的模式，开发者可先购买带有一定配额的基础套餐，超出套餐配额部分按使用量付费。

腾讯云服务空间套餐将于2025年6月30日进行升级，升级针对部分套餐额度和能力进行了调整，详见相关公告

套餐在有效期内可随时进行升配，升配生效大约有10分钟延迟。在服务空间到期当天可操作降配，如已过期，需先续费后方可进行变配操作。

以下条目的消耗不属于套餐内资源，会从账号的腾讯云余额进行扣除。

注：当包年包月服务空间升级新套餐时，如果已开通前端网页托管，则前端网页托管会自动转为按量计费，请确保账号余额充足！

套餐到期第二天服务空间会进入隔离状态，服务空间不可用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），7天后会销毁空间资源且无法找回。

当服务空间通用按量余额欠费时，服务空间的云函数日志及超限按量将会自动关闭。如果服务空间套餐资源已超上限，则服务将会停服不可用。服务空间通用按量余额充正后需手动开启相关服务。

注意：部分老账号可能使用的是腾讯云按量余额，查看如何确认服务空间使用的余额类型？

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

支付宝云需要使用3.97+或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

支付宝云支持基础套餐+超限按量计费及纯按量计费两种计费模式，开发者可先购买带有一定配额的基础套餐（免费版也可以），超出套餐配额部分按使用量付费，也可以直接开通按量计费空间。

开通支付宝云服务空间之前，需DCloud账号实名认证的身份信息已有对应的支付宝账号。如果DCloud账号实名认证为企业，则需要注册该企业对应的支付宝账号，点此可前往注册支付宝 。目前暂不支持民办非企业单位。

支付宝云包年包月套餐支持升降配，升配或降配套餐，不会影响原来套餐的有效时长。

升降配的差价计算规则：高规格套餐的剩余时长价格 - 低规格套餐的剩余时长价格。剩余时长计算单位为月，剩余时长不足一个月时按一个月计算。

升配举例： 将套餐A升级至套餐B，假设原套餐A已经购买了3个月，在第2个月发起升配。则需要补充第2个月和第3个月的差价（不满1个月按1个月算） 即：补充差价 = 2 *（套餐B价格-套餐A价格），支付成功后，10分钟左右生效。

降配举例： 将套餐A降级至套餐B，假设原套餐 A 已经购买了3个月，在第2个月中发起降配。则自动退还第2个月后半个月和第3个月的差价 即：退还差价=1.5*（套餐A价格-套餐B价格），支付成功后，当月即生效。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud支付宝云账号余额，以用于按量计费账单扣费。

按量计费空间也可以转换为包年包月套餐（灰度中，后续会逐步开放），计费模式的转换一个月最多可操作三次。

支付宝云支持套餐+超限按量计费以及纯按量计费空间两种计费模式，即套餐用量超限额后、纯按量计费空间产生用量后，都会按照按量计费规则计费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从支付宝云按量余额或服务空间通用余额中扣除。查看如何确认服务空间使用的余额类型？

如果预存余额不足，则服务空间将不可用，需要立即充值。

资源上限可在web控制台 服务空间详情进行设置，该设置为每项资源用量基于套餐额度的百分比，该设置实时生效。

上述指标，在保证金及按量余额充足的情况下，可设置0-300%，0为无限制。

例如，设置了云存储下载次数为20%。如果下载次数超过 套餐云存储下载次数额度*0.2 后，在超过的2小时后会将服务空间停服。

支付宝云内置数据库有一定的兼容性问题，大致表现如下：

如果想要使用支付宝云的同时避开这些兼容性问题，推荐使用扩展数据库，扩展数据库是DCloud推出的用来解决内置数据库现有问题的解决方案。同时为您的业务提供高性能、高可用的数据库服务。查看详情

为了解决域名备案问题，支付宝云服务空间在过去90天累计消费满100元可分配一个阿里云备案码，消费满200元可分配两个阿里云备案码（需购买套餐或消耗余额，仅充值余额不算）。账单T+1出账，每个空间最多可申请两个备案码。

备案码申请入口：uniCloud控制台 --> 支付宝云服务空间详情 --> 扩展服务 --> 备案码管理，符合条件的服务空间可点击“申请备案码”来申请。申请成功后，再在列表页面点击“备案码授权“按钮，授权备案码给阿里云账号。这样就可以在阿里云域名备案页面输入备案码了。

阿里云官网对接入备案的域名有要求，会定期检查域名是否接入阿里云相关服务（即域名是否解析到阿里云服务器），未接入可能会被要求整改或被取消备案。针对这种情况，可以将一个二级域名绑定到uniCloud阿里云或支付宝云服务空间然后配置cname解析。

注意：申请备案码后服务空间不支持申请销毁退费

套餐指标超限： 包月套餐各项资源用量如有指标超上限时，服务空间会被停服。超上限的资源用量如果大于1分钱则会出账并从支付宝按量余额中扣除，如余额不足则会欠费。

套餐到期停服： 包月套餐在到期后第二天开始停服，停服后服务空间无法正常使用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 支付宝云在每天上午10点左右出前一日账单（T+1），出账后如果账户发生欠费，则无法操作新购、续费及变配并停服所有支付宝云服务空间，欠费后第7天释放所有按量计费服务空间。欠费充值余额正常后，大于有5分钟延迟来恢复停服空间。

服务空间停服后，云存储、数据库、前端网页托管等占用的容量如果超套餐用量仍会产生按量计费账单。如果开通了按量计费Redis，停服期间Redis实例会继续保留，同时仍会收取Redis按量费用。

注意： 如果一个支付宝关联了多个DCloud账号（最多可绑定5个）且支付宝云按量余额独立存在（无法合并至服务空间通用按量余额），当其中一个DCloud账号的支付宝按量余额欠费时，该支付宝账号关联的所有DCloud账号服务空间都会停服。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

按量计费时，涉及按量余额和保证金的概念。包年包月套餐不涉及这2个概念。

按量余额已升级为服务空间通用余额。由于历史原因，部分老账号下可能存在多个按量余额（阿里云按量余额、腾讯云按量余额、支付宝云按量余额），可升级合并为服务空间通用余额。查看如何进行按量余额合并

按量余额指开发者使用按量计费时提前充值的金额，发生资源消耗后，费用会从余额里扣除。

因按量计费空间不是实时计费，而是隔天出账，所以可能出现某天消耗过大、余额不足以支付昨日账单的情况。此时就会发生欠费。

开发者欠费时，DCloud仍需要向云厂商缴纳欠费。所以为了避免开发者不缴纳欠费，DCloud收取了200元保证金。

当开发者不再使用按量计费服务空间时，保证金可以退还。

由于保证金可以申请退还，所以不能申请开具发票，但可申请开具收据，申请方式：发送邮件到 fapiao@dcloud.io，一般15个工作日可开具，邮件内容：

示例源码如下，请查看 pre > code 标签中的内容

退还保证金申请路径：uniCloud控制台费用中心 自助申请退还。

申请时，如果保证金订单付款时间距今已未超出第三方支付原路退还时间（365天内），则原路实时退还； 否则，在申请时需填写收款支付宝的账号及姓名，我们将在1-3个工作日左右进行审核并操作支付宝转账来退还保证金。

当保证金充值订单付款方式为对公打款时，无法在线自助申请退还，需使用uniCloud注册邮箱发送邮件到 service@dcloud.io来申请，邮件内容模板：

示例源码如下，请查看 pre > code 标签中的内容

注意：如果您注册uniCloud账号使用的是qq号@qq.com这类邮箱，发送邮件时，请勿使用qq邮箱的域名邮箱，需更换为qq号@qq.com 这种邮箱发送邮件。

uniCloud提供了多维度、多渠道的资源监控及告警服务，监控告警设置入口：https://unicloud.dcloud.net.cn/pages/product-alarm/rule-list 。

uniCloud的监控告警服务，支持的资源项包括：

当你的线上系统故障时，可以参考此文档判断责任归属：如何判断是DCloud或云厂商（支付宝云、阿里云、腾讯云）的问题

贵。没有免费版，导致入门门槛高。稳定，商用保障强，因为与微信云开发复用，质控团队投入较大。适合愿意付出更多成本来追求稳定性的企业用户。

便宜。有一个免费空间，入门门槛低。较稳定。自研的数据库oceanBase在兼容MongoDB语法方面做的不够完善。适合追求性价比，且愿意适配oceanBase写法的开发者。

便宜。有一个免费空间，入门门槛低。稳定性在3家中最低，质控团队较小。三家中唯一直接使用MongoDB的厂商，MongoDB语法兼容性最好。适合对稳定性不敏感的开发者。

提示：上表中，如果云数据库改用扩展数据库，则没有上面数据库的限制。扩展数据库介绍

_id 在原生 MongoDB 中是24位的 ObjectId 类型，注意此类型在数据库存储时非字符串，通过该字段进行正则查询是会报错的

阿里云的数据库使用的是原生的 MongoDB，_id 是24位的 ObjectId 类型

腾讯云的数据库使用的是基于腾讯云改造的 MongoDB，_id 是32位的 字符串类型

支付宝云数据库使用的是基于支付宝云自研的兼容MongoDB协议的数据库，_id是24位的字符串类型，且在支付宝云数据库中不存在ObjectId 类型

如果在阿里云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库会强制转 ObjectId 类型，且会出现大写转小写的情况

如果在腾讯云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库部分情况下会强制转 ObjectId 类型，且还会导致根据该字段查询表数据时无法查到数据的问题

目前可以使用云数据库的导入导出进行迁移，迁移数据库之前可以使用导出db_init.json功能将所有集合及索引导出。再使用数据导入导出功能进行迁移。导入导出请参考：数据导入导出和备份

也可以直接使用第三方封装好的插件：unicloud数据库一键搬家工具，支持阿里云与腾讯云互转。支持跨账号转。

迁移数据可以通过在腾讯云服务空间导出数据表为json文件，在阿里云服务空间导入json文件到表的方式进行迁移。

由于此前腾讯云并未完全支持ObjectId类型的数据，在阿里云迁移到腾讯云时需要注意处理一下ObjectId类型的数据，包括自动生成的_id字段以及关联到其他表的_id的字段。简单来说就是将导出的数据内的ObjectId类型的数据处理成字符串且不满足ObjectId的格式。

示例源码如下，请查看 pre > code 标签中的内容

以下为一个简单的脚本示例用于处理导出的json文件

如果将此文件存储为parse.js，使用node parse.js 输入文件相对或绝对路径 输出文件相对或绝对路径即可处理导出的json文件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 2 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 3 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 4 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

---

## unicloud-db组件简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-db?id=page

**Contents:**
- # unicloud-db组件简介
- # 属性
- # v-slot:default
- # collection
- # where
- # orderby
- # loadtime
- # 事件
- # ssr-key
- # 方法

<unicloud-db> 组件是一个数据库查询组件，它是对clientDB的js库的再封装。

前端通过组件方式直接获取uniCloud的云端数据库中的数据，并绑定在界面上进行渲染。

在传统开发中，开发者需要在前端定义data、通过request联网获取接口数据、然后赋值给data。同时后端还需要写接口来查库和反馈数据。

有了<unicloud-db> 组件，上述工作只需要1行代码！写组件，设组件的属性，在属性中指定要查什么表、哪些字段、以及查询条件，就OK了！

HBuilderX中敲下udb代码块，得到如下代码，然后通过collection属性指定要查询表“table1”，通过field属性指定要查询字段“field1”，并且在where属性中指定查询id为1的数据。查询结果data就可以直接渲染在界面上。

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db> 组件尤其适用于列表、详情等展示类页面。开发效率可以大幅度的提升。

<unicloud-db> 组件的查询语法是jql，这是一种比sql语句和nosql语法更简洁、更符合js开发者习惯的查询语法。没学过sql或nosql的前端，也可以轻松掌握。jql详见

<unicloud-db> 组件不仅支持查询。还自带了add、remove、update方法，见下文方法章节

<unicloud-db> 由原 <uni-clientdb>插件 升级而来，从 HBuilderX 3.0 起<unicloud-db>内置到框架，与小程序基础库版本无关。

如果需要 HBuilderX3.0 以下版本使用clientDB组件，则需要从插件市场单独下载<uni-clientdb>插件，下载地址为：https://ext.dcloud.net.cn/plugin?id=3256 。但仍然推荐升级HBuilderX 3.0+。

TODO：暂不支持in子查询功能。后续会补充

注意：page-current/page-size 改变不重置数据(page-data="replace") 和 (loadtime="manual") 除外，collection/action/field/getcount/orderby/where 改变后清空已有数据

比如云数据库有个user的表，里面有字段id、name，查询id=1的数据，那么写法如下：

注意下面示例使用了getone会返回一条对象形式的data，如不使用getone，data将会是数组形式，即多一层

示例源码如下，请查看 pre > code 标签中的内容

注意：除非使用admin账户登录操作，否则需要在 uniCloud 控制台对要查询的表增加 Schema 权限配置。至少配置读取权限，否则无权在前端查询，详见 DB Schema

示例源码如下，请查看 pre > code 标签中的内容

提示：如果不指定分页模式， data 为多次查询的集合

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

where中指定要查询的条件。比如只查询某个字段的值符合一定条件的记录。

组件的where属性，与clientDB的JS API是一致的，且内容较多，所以详见js API中相关jql文档：详情

但组件与js API有一个差别，就是组件的属性中若使用js中的变量，需额外注意。

例如查询uni-id-users表，字段username的值由js变量指定，有如下几种方式：

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

方式2. 不在属性中写，而在js中拼接字符串

示例源码如下，请查看 pre > code 标签中的内容

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述示例使用的是==比较符，如需进行模糊搜索，则使用正则表达式。插件市场提供了完整的云端一体搜索模板，搜索类页面无需自行开发，可直接使用。详见

示例源码如下，请查看 pre > code 标签中的内容

再次强调，where条件内容较多，组件和api用法相同，完整的where条件文档在api文档中，另见：JQL文档

格式为 字段名 空格 asc(升序)/desc(降序)，多个字段用 , 分割，优先级为字段顺序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

load事件在查询执行后、渲染前触发，一般用于查询数据的二次加工。比如查库结果不能直接渲染时，可以在load事件里先对data进行预处理。

示例源码如下，请查看 pre > code 标签中的内容

数据库里的时间一般是时间戳，不能直接渲染。虽然可以在load事件中对时间格式化，但更简单的方式是使用<uni-dateformat>组件 ，无需写js处理。

error事件在查询报错时触发，比如联网失败。

示例源码如下，请查看 pre > code 标签中的内容

发行 H5 ssr 时有效，用于保证服务器端渲染和前端加载的数据对应

默认值：根据 (页面路径 + unicloud-db 组件代码中的行号)生成的唯一值

注意：页面同时出现2个及以上 unicloud-db 组件需要配置此属性，且要保证值整个应用唯一

当 <unicloud-db> 组件的 manual 属性设为 true 时，不会在页面初始化时联网查询数据，此时需要通过本方法在需要的时候手动加载数据。

示例源码如下，请查看 pre > code 标签中的内容

一般onLoad因时机太早取不到this.$refs.udb，在onReady里可以取到。

举例常见场景，页面pagea在url中获取参数id，然后加载数据

请求地址：/pages/pagea?id=123

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.loadData({clear: true}, callback)，

可选参数 clear: true，是否清空数据和分页信息，true表示清空，默认false

callback 是回调函数，加载数据完成后触发（即使加载失败）

示例源码如下，请查看 pre > code 标签中的内容

在列表的加载下一页场景下，使用ref方式访问组件方法，加载更多数据，每加载成功一次，当前页 +1

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.remove(id, options)

udb为unicloud-db组件的ref属性值

在列表页面，如果想删除一个item，原本要做很多事：

为减少重复开发，unicloud-db组件提供了remove方法，在列表渲染时绑定好index，直接调用remove方法即可一行代码完成上述5步。

首先在列表生成的时候给删除按钮绑定好id：

示例源码如下，请查看 pre > code 标签中的内容

然后confirmDelete方法里面只有一行代码：

示例源码如下，请查看 pre > code 标签中的内容

clientDB组件的remove方法的参数只支持传入数据库的_id进行删除，不支持其他where条件删除。

参数传入的_id支持单个，也支持多个，即可以批量删除。多个id的格式是：

示例源码如下，请查看 pre > code 标签中的内容

在uniCloud的web控制台的DB Schema界面，可自助生成数据表的admin管理插件，其中有多行数据批选批删示例。

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.add(value, options)

udb为unicloud-db组件的ref属性值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.update(id, value, options)

udb为unicloud-db组件的ref属性值

使用unicloud-db组件的update方法，除了更新云数据库中的数据外，也会同时更新当前页面的unicloud-db组件中的data数据，自然也会自动差量更新页面渲染的内容。同时update方法还封装了修改成功的toast提示。

示例源码如下，请查看 pre > code 标签中的内容

第一个参数 id 是数据的唯一标识，第二个参数 value 是需要修改的新数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在js中，获取<unicloud-db> 组件的data的方法如下：

示例源码如下，请查看 pre > code 标签中的内容

如果修改了dataList的值，组件渲染的界面也会同步变化。

但是在浏览器控制台里无法使用this来打印查看数据，为此特别新增了unidev.clientDB.data方法以优化调试体验。

H5平台，开发模式下浏览器控制台输入 unidev.clientDB.data，可查看组件内部数据，多个组件通过索引查看 unidev.clientDB.data[0]

联表查询有以下两种写法，对于数据量稍大的表推荐使用多个临时表组成的数组作为collection，可以在主表的getTemp内先进行过滤减小联表时的性能消耗。

更多关于联表查询的内容请参考：JQL联表查询

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件简化了列表分页的写法，只需简单的配置每页需要多少数据（默认是20条），不管是数据库的分页查询还是前端的列表分页展示，都自动封装了。

列表分页有2种模式，一种是手机上常见的拉到底部加载下一页，另一种是pc常见的底部列出页码，点击页码跳转页面。

下面的示例代码没有使用uList组件，实际开发时建议使用uList组件来避免长列表的性能问题。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用分页控件，常见于PC端。在uniCloud Admin 中，有完整的分页展示数据、新增删除数据的示例代码。

<unicloud-db> 组件支持嵌套。

子组件中访问父组件 data 时，需options传递数据

如下示例演示了2个组件的嵌套，以及在子组件中如何访问父组件 data

示例源码如下，请查看 pre > code 标签中的内容

完整项目示例见插件市场的示例项目: https://ext.dcloud.net.cn/plugin?id=2574

**Examples:**

Example 1 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 2 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 3 (json):
```json
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 4 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

---

## uniCloud快速上手 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/quickstart?id=calllocalfunction

**Contents:**
- # uniCloud快速上手
- # hello uniCloud
  - # 体验示例
  - # 运行 Hello uniCloud 源码
- # 开发自己的第一个uniCloud项目
- # cli项目中使用uniCloud
- # uni-app项目使用uniCloud
- # web控制台
  - # 编辑数据库数据注意事项
    - # 添加日期

Hello uniCloud，是一个示例，演示了 uniCloud 的各种能力。

这个示例目前只发布了h5版本和Android app版。

Hello uniCloud部署了3套，分别连接uniCloud的支付宝云版、阿里云版和腾讯云版。

h5版地址（发布在uniCloud的前端网页托管上）

由于该示例未适配pc宽屏，如使用pc浏览器打开地址，建议F12打开控制台，使用手机模式预览。

apk地址（发布在uniCloud的云存储上）

Hello uniCloud 的源码地址：https://ext.dcloud.net.cn/plugin?id=4082

在 HBuilderX 新建项目界面，选择uni-app项目，选择 Hello uniCloud 项目模板。

HBuilderX 会在项目创建后弹出 uniCloud初始化向导，根据向导部署

HBuilderX中新建项目，选择uni-app项目，并勾选启用uniCloud，在右侧选择服务供应商（支付宝云、阿里云、腾讯云）

项目名称随意，比如 firstunicloud

一个开发者可以拥有多个服务空间，每个服务空间都是一个独立的serverless云环境，不同服务空间之间的云函数、数据库、存储都是隔离的。

对项目根目录uniCloud点右键选择关联云服务空间，绑定之前创建的服务空间，或者新建一个服务空间。

uniCloud项目创建并绑定服务空间后，开发者可以创建云函数（云对象是云函数的一种，云函数可泛指普通云函数和云对象）。

在uniCloud/cloudfunctions目录右键创建云函数/云对象

如果该云函数/云对象还需要引入其他js，可在index.js入口文件中引用。

初学者，建议从云对象学起，比云函数更加简单直观。

在本教程中，我们创建一个云对象名为 helloco。

打开index.obj.js，我们为它添加一个 sum 方法，逻辑就是接收传入a和b2个参数，返回求和结果。

示例源码如下，请查看 pre > code 标签中的内容

在项目首页，pages/index/index.vue 里，添加一个按钮，点击后执行异步方法sum。

js 中 import 这个 helloco 对象，调用它的 sum 方法

示例源码如下，请查看 pre > code 标签中的内容

将项目运行到浏览器或其他平台，点页面上的按钮，控制台会打印结果：3

HBuilderX自带一个云函数本地运行环境，运行项目时也默认选择连接本地云函数。可以在底部控制台中的前端控制台右上角进行切换。

可以对helloco云对象点右键上传到uniCloud服务空间，然后在前端控制台右上角切换为连接云端云函数，那么此时客户端连接的就是真正的现网uniCloud服务器了。

到此为止，你已经开发了第一个 first uniCloud 项目，完成了客户端和服务器的第一次交互。

这个云对象只做了一个求和运算，实际开发中不需要在服务器求和，前端就可以求和。服务器应该做更复杂的事情。

但你可以通过这个示例感知uniCloud的开发，其实非常简单。尤其是云对象，打破了服务器做接口传json给前端的传统，让云端服务对象化，让服务器代码像写前端js一样、清晰。

接下来，建议通读文档，进一步学习掌握uniCloud。

如果要在cli项目中使用uniCloud，可以参考以下步骤

如果您有一个现有的 uni-app 项目，并希望将其与 uniCloud 集成，可以按照以下步骤操作：

打开HBuilderX后，点击菜单栏的 文件 > 导入 > 从本地目录导入（或者Git/SVN）

在项目根目录右键，选择创建uniCloud云服务空间， 选择具体云厂商后创建。

在uniCloud目录右键，选择关联服务空间或项目...，选择之前创建的服务空间。如没有服务空间，请在uniCloud控制台 创建。

在uniCloud目录右键，选择初始化向导，按照操作提示上传云函数和数据库schema。

在HBuilderX中运行项目，即可在前端调用云函数和操作数据库。

web控制台网址：https://unicloud.dcloud.net.cn

在HX中对 uniCloud 目录点右键，或者在帮助菜单中，均有入口链接。

在web控制台可以对数据库进行编辑。在json文档中，输入字符串、数字、bool值都是常规的操作。但有2种特殊数据类型，时间和地理位置，在编辑时有特殊的写法，请注意：

在web控制台添加/修改数据时，如果输入"2020-12-02 12:12:12"会变成字符串，而不是日期格式。此时需通过以下方式添加日期类型数据。

示例源码如下，请查看 pre > code 标签中的内容

注：时间戳无需如此复杂。时间戳只需直接输入不加引号的数字即可。

示例源码如下，请查看 pre > code 标签中的内容

文档已移至：Web中使用uniCloud的跨域处理

**Examples:**

Example 1 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 2 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 3 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 4 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

---

## uniCloud快速上手 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/quickstart

**Contents:**
- # uniCloud快速上手
- # hello uniCloud
  - # 体验示例
  - # 运行 Hello uniCloud 源码
- # 开发自己的第一个uniCloud项目
- # cli项目中使用uniCloud
- # uni-app项目使用uniCloud
- # web控制台
  - # 编辑数据库数据注意事项
    - # 添加日期

Hello uniCloud，是一个示例，演示了 uniCloud 的各种能力。

这个示例目前只发布了h5版本和Android app版。

Hello uniCloud部署了3套，分别连接uniCloud的支付宝云版、阿里云版和腾讯云版。

h5版地址（发布在uniCloud的前端网页托管上）

由于该示例未适配pc宽屏，如使用pc浏览器打开地址，建议F12打开控制台，使用手机模式预览。

apk地址（发布在uniCloud的云存储上）

Hello uniCloud 的源码地址：https://ext.dcloud.net.cn/plugin?id=4082

在 HBuilderX 新建项目界面，选择uni-app项目，选择 Hello uniCloud 项目模板。

HBuilderX 会在项目创建后弹出 uniCloud初始化向导，根据向导部署

HBuilderX中新建项目，选择uni-app项目，并勾选启用uniCloud，在右侧选择服务供应商（支付宝云、阿里云、腾讯云）

项目名称随意，比如 firstunicloud

一个开发者可以拥有多个服务空间，每个服务空间都是一个独立的serverless云环境，不同服务空间之间的云函数、数据库、存储都是隔离的。

对项目根目录uniCloud点右键选择关联云服务空间，绑定之前创建的服务空间，或者新建一个服务空间。

uniCloud项目创建并绑定服务空间后，开发者可以创建云函数（云对象是云函数的一种，云函数可泛指普通云函数和云对象）。

在uniCloud/cloudfunctions目录右键创建云函数/云对象

如果该云函数/云对象还需要引入其他js，可在index.js入口文件中引用。

初学者，建议从云对象学起，比云函数更加简单直观。

在本教程中，我们创建一个云对象名为 helloco。

打开index.obj.js，我们为它添加一个 sum 方法，逻辑就是接收传入a和b2个参数，返回求和结果。

示例源码如下，请查看 pre > code 标签中的内容

在项目首页，pages/index/index.vue 里，添加一个按钮，点击后执行异步方法sum。

js 中 import 这个 helloco 对象，调用它的 sum 方法

示例源码如下，请查看 pre > code 标签中的内容

将项目运行到浏览器或其他平台，点页面上的按钮，控制台会打印结果：3

HBuilderX自带一个云函数本地运行环境，运行项目时也默认选择连接本地云函数。可以在底部控制台中的前端控制台右上角进行切换。

可以对helloco云对象点右键上传到uniCloud服务空间，然后在前端控制台右上角切换为连接云端云函数，那么此时客户端连接的就是真正的现网uniCloud服务器了。

到此为止，你已经开发了第一个 first uniCloud 项目，完成了客户端和服务器的第一次交互。

这个云对象只做了一个求和运算，实际开发中不需要在服务器求和，前端就可以求和。服务器应该做更复杂的事情。

但你可以通过这个示例感知uniCloud的开发，其实非常简单。尤其是云对象，打破了服务器做接口传json给前端的传统，让云端服务对象化，让服务器代码像写前端js一样、清晰。

接下来，建议通读文档，进一步学习掌握uniCloud。

如果要在cli项目中使用uniCloud，可以参考以下步骤

如果您有一个现有的 uni-app 项目，并希望将其与 uniCloud 集成，可以按照以下步骤操作：

打开HBuilderX后，点击菜单栏的 文件 > 导入 > 从本地目录导入（或者Git/SVN）

在项目根目录右键，选择创建uniCloud云服务空间， 选择具体云厂商后创建。

在uniCloud目录右键，选择关联服务空间或项目...，选择之前创建的服务空间。如没有服务空间，请在uniCloud控制台 创建。

在uniCloud目录右键，选择初始化向导，按照操作提示上传云函数和数据库schema。

在HBuilderX中运行项目，即可在前端调用云函数和操作数据库。

web控制台网址：https://unicloud.dcloud.net.cn

在HX中对 uniCloud 目录点右键，或者在帮助菜单中，均有入口链接。

在web控制台可以对数据库进行编辑。在json文档中，输入字符串、数字、bool值都是常规的操作。但有2种特殊数据类型，时间和地理位置，在编辑时有特殊的写法，请注意：

在web控制台添加/修改数据时，如果输入"2020-12-02 12:12:12"会变成字符串，而不是日期格式。此时需通过以下方式添加日期类型数据。

示例源码如下，请查看 pre > code 标签中的内容

注：时间戳无需如此复杂。时间戳只需直接输入不加引号的数字即可。

示例源码如下，请查看 pre > code 标签中的内容

文档已移至：Web中使用uniCloud的跨域处理

**Examples:**

Example 1 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 2 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 3 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 4 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

---

## 简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-ai-chat.html

**Contents:**
- # 简介
- # 体验步骤
- # 配置
- # stream流式响应实现解析
  - # 注意事项
- # 营运专题
  - # 流程概述
- # 二次开发
  - # 实现通过支付获取积分
- # 常见错误

支持HBuilder版本，正式版 3.7.10+，Alpha版 3.8.0+

uni-ai-chat是基于uni-ai的聊天项目模板。它包含一个前端页面(路径：/pages/chat/chat.vue)和一个云对象(路径：uniCloud/cloudfunctions/uni-ai-chat/index.obj.js)

它支持上文总结、流式响应，把众多复杂的ai聊天逻辑都封装好了。

插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-ai-chat

文件路径 uniCloud/cloudfunctions/common/uni-config-center/uni-ai-chat/config.json

目前的配置文件包括是否开启内容安全，即是否检查用户输入和ai返回结果的合规性。开启后，会延缓一定的响应时间，但保证了合规性。

这里内置的内容安全是基于uni-sec-check插件，它是免费的，但有一些限制条件，请务必阅读该插件的文档：https://doc.dcloud.net.cn/uniCloud/uni-sec-check.html。

如果你需要使用其他的内容安全检测方案，请自行集成。

注意：如果对ai返回结果进行内容安全检查，会导致stream流式响应失效。

当访问 AI 接口时，如果生成的回复内容过大，响应时间会很长，导致前端用户需要等待很长时间才能收到结果。所以流式响应可以减少前端用户的等待，让ai回复的内容一个字或一段话逐步出现在前端用户的界面上。

uni-ai-chat的流式响应，调用的是uni-ai的llm API中的stream参数。

而stream参数是基于云函数的sse通道封装的。

而sse通道是基于uni-push2 封装的。

所以使用流式响应必须给应用开通uni-push。

流式响应的使用需客户端先通过 new uniCloud.SSEChannel() 创建 SSE 通道，并获得 channel 值（详情请参考：https://doc.dcloud.net.cn/uniCloud/sse-channel.html#create-sse-channel ）。在客户端向 uniCloud 云对象发起请求时，需要将该 channel 值作为参数一同携带；然后 uniCloud 云对象与 uni-ai 建立 流式响应(stream) 通讯，云对象监听 uni-ai 返回的分片数据，在接收到数据后再通过 sse-channel (反序列化消息通道 )向客户端推送消息。

v1.0.3起提供了商业化能力，与uni-ai对话消耗积分。

积分可通过看激励视频广告 获得。 如需要通过支付获取积分，可自行二次开发，接入uni-pay。

开通广告；在uni-ad 官网点击菜单广告设置在应用列表，找到你的应用点击开通广告

创建激励视频广告位；在应用列表 点击应用详情再点击新建广告位；如下图：广告类型选激励视频广告，配置服务器回调，选uni-ai-chat部署的uniCloud服务空间，回调云函数名称选：reward-video-callback

注意：因为广告服务器回调走的是云端，以上配置项，配置完成后记得上传。

示例源码如下，请查看 pre > code 标签中的内容

更多uniIdRouter自动路由详情参考：https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html#uni-id-router

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-ai相关错误请参考：uni-ai错误码

错误信息："certificate has expired" 请参考文档：云函数通过https访问其他服务器时出现“certificate has expired”

错误信息："Wx0e203209e27b1e66 插件未授权使用 添加插住(env: Windows,mp,1.06.2303060；1ib: 2.31.1)" 请参考文档：uni-ad微信小程序广告开通指南

DCloud基于uni-ai提供了很多开源模板，除了本项目uni-ai-chat，还有：

更多问题欢迎加入uni-ai官方交流群 QQ群号:699680439

**Examples:**

Example 1 (json):
```json
"uniIdRouter": {
	"loginPage": "uni_modules/uni-id-pages/pages/login/login-withoutpwd",
	"needLogin": [
		"pages/chat/chat"
	],
	"resToLogin": true
}
```

Example 2 (json):
```json
"uniIdRouter": {
	"loginPage": "uni_modules/uni-id-pages/pages/login/login-withoutpwd",
	"needLogin": [
		"pages/chat/chat"
	],
	"resToLogin": true
}
```

Example 3 (json):
```json
"uniIdRouter": {
	"loginPage": "uni_modules/uni-id-pages/pages/login/login-withoutpwd",
	"needLogin": [
		"pages/chat/chat"
	],
	"resToLogin": true
}
```

Example 4 (json):
```json
"uniIdRouter": {
	"loginPage": "uni_modules/uni-id-pages/pages/login/login-withoutpwd",
	"needLogin": [
		"pages/chat/chat"
	],
	"resToLogin": true
}
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema?id=validatefunction

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/price?id=price-month

**Contents:**
- # 概述
- # 阿里云
  - # 免费服务空间
  - # 包年包月套餐
    - # 套餐变配
    - # 包年包月套餐转按量计费
  - # 按量计费
  - # 按量计费每日资源上限设置
    - # 资源上限设置特别说明
  - # 各项资源释义说明

uniCloud的定价、套餐内容、服务SLA，是由云厂商直接公布的。DCloud公司不会加价。uniCloud已经上线近5年，DCloud一直以良心方式服务开发者，努力降低应用的开发门槛、提高应用的开发效率。

付费用户享受云厂商提供的服务协议SLA，详见

阿里云正式版需要使用HBuilderX 3.6.5+（正式版）或3.6.10+（Alpha版）或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

阿里云提供1个免费空间，付费空间提供包月、按量计费两种计费方式，具体说明如下：

包年包月套餐，适于业务稳定、套餐资源使用均衡的场景。

如果你难以预估会消耗多少云资源，或者业务波峰波谷变化较大，或者套餐中某些项目不够用、某些项目又用不完，此时推荐使用按量计费。

阿里云为每个账号提供了1个免费服务空间，以方便产品开发测试及体验。具体额度请阅读下方包年包月套餐中的开发者版。

套餐中的资源超标后服务空间会停服，需要及时升配或转按量计费才能恢复。

阿里云包年包月套餐支持升配和转换按量计费，不支持降配，且按量计费空间不支持转换为包年包月套餐。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud按量余额，以用于按量计费账单扣费。

注意： 按量计费不支持转换为包年包月，该操作不可逆，请谨慎操作。

按量计费，意味着不是每个月支付固定费用，而是根据使用量付费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从阿里云预存余额中扣除。

如果预存余额不足，则服务空间将不可用，需要立即充值。

如您担心按量计费会造成不可控的费用上升，也可以为各项资源设置用量上限。

资源上限可在web控制台 服务空间详情进行设置，该设置实时生效。

每项资源指标的数据更新延迟时间不同，当数据更新且某项资源用量超过阈值时，则该项服务便会单独停用。

上述指标，容量是累加的，其他指标则是按日计算。

例如，设置了每日云存储下载次数不能超过1万次。如当日超过该下载次数，则在超过的6小时后停止云存储的下载功能。

该设置为阿里云实验阶段功能，资源用量更新有延迟，待资源更新后达到设置的资源用量上限时，才会执行管控。管控执行亦有延迟性，所以存在实际用量超设置上限情况，需特别说明：

因上游储备不足，目前uniCloud阿里云版仍有一些限额。DCloud会持续推动限额的解除。目前有需求的开发者需向DCloud人工联系申请提高限额。

目前单个账号可创建20个正式版服务空间，如有更多需求需发邮件到service@dcloud.io申请。此外集合数量限制也可申请提升。邮件模板见下方：申请解除限制邮件模板

示例源码如下，请查看 pre > code 标签中的内容

云存储数据处理：图片裁剪、视频截帧等功能。现阶段免费，但不排除后续收费可能。

通过扩展数据库解除限制：若数据库集合数量、索引数量等限制已无法满足您的需求，则可以使用扩展数据库，扩展数据库没有内置数据库相关的限制。扩展数据库介绍

套餐指标超限： 包月套餐各项资源用量如有指标超出上限时，该项指标服务便会停服，其他服务不受影响。比如云存储CDN流量超套餐上限，则云存储文件无法访问，其他服务正常。如需恢复，可升级套餐来获取更高套餐额度或转换为按量计费，升配或转按量计费后，资源恢复大约有10分钟左右延迟。

套餐到期停服： 包月套餐在到期当天的0点10分左右开始停服，停服后服务空间无法正常使用，资源会保留15天。15天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 按量计费空间没有到期时间，是在账户欠费时开始停服。阿里云在每天上午9点左右出前一日账单，出账后如果账户发生欠费，按量计费服务空间则会被停服无法正常使用，资源会保留15天。15天内操作余额充正服务恢复正常（续费后大约有10分钟左右延迟），15天后会销毁空间资源且无法找回。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

腾讯云于2022年8月12日更新了计费方式。

新计费模式下，统一采用基础套餐+超限按量计费的模式，开发者可先购买带有一定配额的基础套餐，超出套餐配额部分按使用量付费。

腾讯云服务空间套餐将于2025年6月30日进行升级，升级针对部分套餐额度和能力进行了调整，详见相关公告

套餐在有效期内可随时进行升配，升配生效大约有10分钟延迟。在服务空间到期当天可操作降配，如已过期，需先续费后方可进行变配操作。

以下条目的消耗不属于套餐内资源，会从账号的腾讯云余额进行扣除。

注：当包年包月服务空间升级新套餐时，如果已开通前端网页托管，则前端网页托管会自动转为按量计费，请确保账号余额充足！

套餐到期第二天服务空间会进入隔离状态，服务空间不可用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），7天后会销毁空间资源且无法找回。

当服务空间通用按量余额欠费时，服务空间的云函数日志及超限按量将会自动关闭。如果服务空间套餐资源已超上限，则服务将会停服不可用。服务空间通用按量余额充正后需手动开启相关服务。

注意：部分老账号可能使用的是腾讯云按量余额，查看如何确认服务空间使用的余额类型？

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

支付宝云需要使用3.97+或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

支付宝云支持基础套餐+超限按量计费及纯按量计费两种计费模式，开发者可先购买带有一定配额的基础套餐（免费版也可以），超出套餐配额部分按使用量付费，也可以直接开通按量计费空间。

开通支付宝云服务空间之前，需DCloud账号实名认证的身份信息已有对应的支付宝账号。如果DCloud账号实名认证为企业，则需要注册该企业对应的支付宝账号，点此可前往注册支付宝 。目前暂不支持民办非企业单位。

支付宝云包年包月套餐支持升降配，升配或降配套餐，不会影响原来套餐的有效时长。

升降配的差价计算规则：高规格套餐的剩余时长价格 - 低规格套餐的剩余时长价格。剩余时长计算单位为月，剩余时长不足一个月时按一个月计算。

升配举例： 将套餐A升级至套餐B，假设原套餐A已经购买了3个月，在第2个月发起升配。则需要补充第2个月和第3个月的差价（不满1个月按1个月算） 即：补充差价 = 2 *（套餐B价格-套餐A价格），支付成功后，10分钟左右生效。

降配举例： 将套餐A降级至套餐B，假设原套餐 A 已经购买了3个月，在第2个月中发起降配。则自动退还第2个月后半个月和第3个月的差价 即：退还差价=1.5*（套餐A价格-套餐B价格），支付成功后，当月即生效。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud支付宝云账号余额，以用于按量计费账单扣费。

按量计费空间也可以转换为包年包月套餐（灰度中，后续会逐步开放），计费模式的转换一个月最多可操作三次。

支付宝云支持套餐+超限按量计费以及纯按量计费空间两种计费模式，即套餐用量超限额后、纯按量计费空间产生用量后，都会按照按量计费规则计费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从支付宝云按量余额或服务空间通用余额中扣除。查看如何确认服务空间使用的余额类型？

如果预存余额不足，则服务空间将不可用，需要立即充值。

资源上限可在web控制台 服务空间详情进行设置，该设置为每项资源用量基于套餐额度的百分比，该设置实时生效。

上述指标，在保证金及按量余额充足的情况下，可设置0-300%，0为无限制。

例如，设置了云存储下载次数为20%。如果下载次数超过 套餐云存储下载次数额度*0.2 后，在超过的2小时后会将服务空间停服。

支付宝云内置数据库有一定的兼容性问题，大致表现如下：

如果想要使用支付宝云的同时避开这些兼容性问题，推荐使用扩展数据库，扩展数据库是DCloud推出的用来解决内置数据库现有问题的解决方案。同时为您的业务提供高性能、高可用的数据库服务。查看详情

为了解决域名备案问题，支付宝云服务空间在过去90天累计消费满100元可分配一个阿里云备案码，消费满200元可分配两个阿里云备案码（需购买套餐或消耗余额，仅充值余额不算）。账单T+1出账，每个空间最多可申请两个备案码。

备案码申请入口：uniCloud控制台 --> 支付宝云服务空间详情 --> 扩展服务 --> 备案码管理，符合条件的服务空间可点击“申请备案码”来申请。申请成功后，再在列表页面点击“备案码授权“按钮，授权备案码给阿里云账号。这样就可以在阿里云域名备案页面输入备案码了。

阿里云官网对接入备案的域名有要求，会定期检查域名是否接入阿里云相关服务（即域名是否解析到阿里云服务器），未接入可能会被要求整改或被取消备案。针对这种情况，可以将一个二级域名绑定到uniCloud阿里云或支付宝云服务空间然后配置cname解析。

注意：申请备案码后服务空间不支持申请销毁退费

套餐指标超限： 包月套餐各项资源用量如有指标超上限时，服务空间会被停服。超上限的资源用量如果大于1分钱则会出账并从支付宝按量余额中扣除，如余额不足则会欠费。

套餐到期停服： 包月套餐在到期后第二天开始停服，停服后服务空间无法正常使用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 支付宝云在每天上午10点左右出前一日账单（T+1），出账后如果账户发生欠费，则无法操作新购、续费及变配并停服所有支付宝云服务空间，欠费后第7天释放所有按量计费服务空间。欠费充值余额正常后，大于有5分钟延迟来恢复停服空间。

服务空间停服后，云存储、数据库、前端网页托管等占用的容量如果超套餐用量仍会产生按量计费账单。如果开通了按量计费Redis，停服期间Redis实例会继续保留，同时仍会收取Redis按量费用。

注意： 如果一个支付宝关联了多个DCloud账号（最多可绑定5个）且支付宝云按量余额独立存在（无法合并至服务空间通用按量余额），当其中一个DCloud账号的支付宝按量余额欠费时，该支付宝账号关联的所有DCloud账号服务空间都会停服。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

按量计费时，涉及按量余额和保证金的概念。包年包月套餐不涉及这2个概念。

按量余额已升级为服务空间通用余额。由于历史原因，部分老账号下可能存在多个按量余额（阿里云按量余额、腾讯云按量余额、支付宝云按量余额），可升级合并为服务空间通用余额。查看如何进行按量余额合并

按量余额指开发者使用按量计费时提前充值的金额，发生资源消耗后，费用会从余额里扣除。

因按量计费空间不是实时计费，而是隔天出账，所以可能出现某天消耗过大、余额不足以支付昨日账单的情况。此时就会发生欠费。

开发者欠费时，DCloud仍需要向云厂商缴纳欠费。所以为了避免开发者不缴纳欠费，DCloud收取了200元保证金。

当开发者不再使用按量计费服务空间时，保证金可以退还。

由于保证金可以申请退还，所以不能申请开具发票，但可申请开具收据，申请方式：发送邮件到 fapiao@dcloud.io，一般15个工作日可开具，邮件内容：

示例源码如下，请查看 pre > code 标签中的内容

退还保证金申请路径：uniCloud控制台费用中心 自助申请退还。

申请时，如果保证金订单付款时间距今已未超出第三方支付原路退还时间（365天内），则原路实时退还； 否则，在申请时需填写收款支付宝的账号及姓名，我们将在1-3个工作日左右进行审核并操作支付宝转账来退还保证金。

当保证金充值订单付款方式为对公打款时，无法在线自助申请退还，需使用uniCloud注册邮箱发送邮件到 service@dcloud.io来申请，邮件内容模板：

示例源码如下，请查看 pre > code 标签中的内容

注意：如果您注册uniCloud账号使用的是qq号@qq.com这类邮箱，发送邮件时，请勿使用qq邮箱的域名邮箱，需更换为qq号@qq.com 这种邮箱发送邮件。

uniCloud提供了多维度、多渠道的资源监控及告警服务，监控告警设置入口：https://unicloud.dcloud.net.cn/pages/product-alarm/rule-list 。

uniCloud的监控告警服务，支持的资源项包括：

当你的线上系统故障时，可以参考此文档判断责任归属：如何判断是DCloud或云厂商（支付宝云、阿里云、腾讯云）的问题

贵。没有免费版，导致入门门槛高。稳定，商用保障强，因为与微信云开发复用，质控团队投入较大。适合愿意付出更多成本来追求稳定性的企业用户。

便宜。有一个免费空间，入门门槛低。较稳定。自研的数据库oceanBase在兼容MongoDB语法方面做的不够完善。适合追求性价比，且愿意适配oceanBase写法的开发者。

便宜。有一个免费空间，入门门槛低。稳定性在3家中最低，质控团队较小。三家中唯一直接使用MongoDB的厂商，MongoDB语法兼容性最好。适合对稳定性不敏感的开发者。

提示：上表中，如果云数据库改用扩展数据库，则没有上面数据库的限制。扩展数据库介绍

_id 在原生 MongoDB 中是24位的 ObjectId 类型，注意此类型在数据库存储时非字符串，通过该字段进行正则查询是会报错的

阿里云的数据库使用的是原生的 MongoDB，_id 是24位的 ObjectId 类型

腾讯云的数据库使用的是基于腾讯云改造的 MongoDB，_id 是32位的 字符串类型

支付宝云数据库使用的是基于支付宝云自研的兼容MongoDB协议的数据库，_id是24位的字符串类型，且在支付宝云数据库中不存在ObjectId 类型

如果在阿里云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库会强制转 ObjectId 类型，且会出现大写转小写的情况

如果在腾讯云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库部分情况下会强制转 ObjectId 类型，且还会导致根据该字段查询表数据时无法查到数据的问题

目前可以使用云数据库的导入导出进行迁移，迁移数据库之前可以使用导出db_init.json功能将所有集合及索引导出。再使用数据导入导出功能进行迁移。导入导出请参考：数据导入导出和备份

也可以直接使用第三方封装好的插件：unicloud数据库一键搬家工具，支持阿里云与腾讯云互转。支持跨账号转。

迁移数据可以通过在腾讯云服务空间导出数据表为json文件，在阿里云服务空间导入json文件到表的方式进行迁移。

由于此前腾讯云并未完全支持ObjectId类型的数据，在阿里云迁移到腾讯云时需要注意处理一下ObjectId类型的数据，包括自动生成的_id字段以及关联到其他表的_id的字段。简单来说就是将导出的数据内的ObjectId类型的数据处理成字符串且不满足ObjectId的格式。

示例源码如下，请查看 pre > code 标签中的内容

以下为一个简单的脚本示例用于处理导出的json文件

如果将此文件存储为parse.js，使用node parse.js 输入文件相对或绝对路径 输出文件相对或绝对路径即可处理导出的json文件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 2 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 3 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 4 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

---

## 简介@intro | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-functions

**Contents:**
- # 简介
- # 云函数的分类
- # 客户端和云函数的通信
  - # clientDB方式
  - # 云对象方式
  - # 普通云函数callFunction方式
  - # 云函数URL化方式
  - # 云函数请求中的中间状态通知通道
  - # uniCloud响应体规范
    - # HBuilderX 3.6.10及之后版本的错误规范

云函数是运行在云端的 JavaScript 代码，是基于 Node.js 的扩展。

在常规的 Node API 基础上，uniCloud的云函数环境内置了uniCloud对象，这个对象内置了网络、数据库等各种API。开发者未学习过 Node.js 也没有关系，只需要看uniCloud的文档，掌握这个uniCloud对象的API即可。

每个云函数是一个js包，在云函数被调用时，由 serverless 调度系统分配硬件资源启动一个 node 环境来运行这个云函数。

在HBuilderX中可以新建云函数（HBuilderX 3.4 同时可以新建云对象）。

每个云函数是一个目录，其中普通云函数有index.js入口文件，云对象的入口文件则是index.obj.js。

一个最简单的云函数只需要这个入口js文件，在里面编写代码即可。当然也可以在这个js中require该云函数目录下的其他js、json文件。

云函数的配置文件和 npm规范 相同，在云函数目录下可新建一个 package.json 来存放配置。uniCloud云函数扩展了 package.json，增加了一些特有的配置项。详见

云函数启动后实例会保留一段时间（如15分钟），超过保留期后若该云函数一直没有被再调用，那这个实例会被释放。所以云函数有冷启动的概念。不过由于js实例的启动要比php和java更快，所以js更适合serverless方式。

云函数有若干子概念，包括 普通云函数、云对象、公共模块、clientDB的action云函数、uniCloud扩展库。

HBuilderX中uniCloud项目的云函数均在项目的uniCloud/cloudfunctions目录下，目录结构如下：

uni-app客户端和传统服务器通信时，使用uni.request的ajax请求方式。uniCloud下不再使用它，有更好的云端一体的通信方式。

uniCloud体系里，客户端和服务端的云函数通信，有4种方式：

云函数是uniCloud的基础，本质上 clientDB 和 云对象 都是建立在云函数上针对特定场景的优化。

clientDB分API方式和组件方式，此处使用API方式来演示

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，学习clientDB需另见文档clientDB

如果客户端使用uni-app开发，且向uniCloud服务空间的请求主要是为了操作云数据库（无论增删改查），那么推荐使用clientDB方式，由uni-app客户端直接操作云数据库。

如果操作数据库的同时，还需要同时执行一些云端逻辑：HBuilderX 3.6.11以前使用action云函数；从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。

云对象和clientDB最大的区别，是云对象把数据库操作（以及其他逻辑）封装在云对象的方法里面。

它无法像clientDB那样无需开发服务器代码，它仍需在客户端和云端分别写代码。但它的应用场景不受限制。上文中不适用clientDB的情况，都可以使用云对象解决。

云端云对象代码，云对象名称：testco，有一个sum方法

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个testco对象，调用它的sum方法

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX 3.5.2之前，需要URL化和定时运行时，只能使用普通云函数；在HBuilderX 3.5.2+，云对象也支持了URL化和定时运行。

官方不推荐开发者使用云函数，有相关需求推荐使用云对象替代云函数。

目前官方还未提供基于云对象的router模式的框架，有相关需求可以使用三方框架。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，需另见文档云函数callfunction方式

可以让云函数/云对象生成一个HTTP URL。这样非uni-app应用，可以通过ajax请求和云函数/云对象通信。

在 uniCloud Web控制台进行URL化配置。

云函数在执行期间可以将中间状态发送给客户端，详情参考：云函数请求中的中间状态通知通道

uniCloud响应体规范（uniCloud response format），是DCloud制定的、服务器给客户端返回json数据的一种建议格式。

云对象、clientDB、uni-id公共模块均支持此规范。

uniCloud服务器给客户端返回的数据格式一般是json，但json的格式具体是什么没有约定。比如返回错误码，是叫code还是叫errCode？错误内容是message还是errMsg？内容的国际化如何处理？

如果没有一套统一的格式，在客户端将无法编写有效的网络拦截器，无法统一处理错误。

另外，如果不同的插件，云端返回的数据格式千差万别，那使用者整合这些插件也会非常麻烦。国际化更无法落地。

为此DCloud推出了uniCloud响应体规范。

为了与uni-app前端的API错误回调风格统一，uniCloud响应体规范定义的云端返回信息（尤其是报错时）应包含errCode和errMsg。

示例源码如下，请查看 pre > code 标签中的内容

errCode在成功时应返回数字0,失败时应返回一个以插件id开头的“字符串”，每个单词以连字符（-）分割。做出这样的规定是为了防止不同插件之间出现重复错误码

以'uni-id-account-banned'错误码为例，uni-id为插件id，account-banned为错误缩写。

如果业务开发的代码并不发布插件市场，那么为了避免下载了一个市场的插件产生冲突，推荐使用不包含“-”的字符串来做errCode（插件市场的所有插件ID必须包含“-”）。

后续uniCloud会提供自动根据errCode对errMsg进行国际化处理的功能，开发者仅需保证云函数返回值满足uniCloud响应体规范即可。

errMsg用于存放具体错误信息，包括展示给开发者、终端用户的错误信息

除此之外响应体规范还包含newToken字段，用于token的自动续期（云对象接收含有newToken的响应后会自动更新storage内存储的uni_id_token及uni_id_token_expired，此行为新增于HBuilderX 3.4.13）。开发者仅在自行调用uni-id-common的checkToken等会产生新token的接口时才需要返回新token，uni-app客户端和uni-id-co之间会自动管理token及续期。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX内使用代码块returnu可以快速输入以下代码（HBuilderX 3.4.0及以上版本）:

示例源码如下，请查看 pre > code 标签中的内容

云函数支持 js 和 nodejs 的标准API，如console.log()、setTimeout()，另见nodejs官网 。nodejs版本，详见云函数运行环境

除了标准API外，云函数环境中内置了uniCloud对象，扩展了一批新API，实际开发中更常用的是uniCloud的扩展API。见下：

云函数调用uniCloud接口时（包括请求云函数、云对象、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

云函数中支持访问本服务空间下的、或经授权的其他服务空间下的，数据库。

云函数中如需要请求其他http服务，则使用uniCloud.httpclient。无需额外依赖，就可以请求任何 HTTP 和 HTTPS 协议的 Web 服务。uniCloud.httpclient返回的是一个urllib实例 。

uniCloud.httpclient.request(URL,requestOptions)

默认情况下request接口不会处理返回的数据，即不传dataType参数时会返回buffer类型的数据，如需自动解析json格式的返回结果，需要将dataType设置为"json"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为简化http请求的调用uniCloud新增了uni.request调用方法类似的http请求接口uniCloud.request。

示例源码如下，请查看 pre > code 标签中的内容

实际业务中常有使用云函数发送formdata类型数据的需求，比如微信小程序提供的一些服务端接口（图片内容安全检测、识别图片二维码等），可以参考以下示例进行发送

示例源码如下，请查看 pre > code 标签中的内容

云函数无法作为websocket服务器使用，如有相关需求可以尝试使用uni-push 2.0实现，参考：uni-push 2.0。

本章节内容介绍云函数如何作为websocket客户端使用。为简化调用方式uniCloud新增了uni.connectSocket方法类似的接口uniCloud.connectSocket。

调用此接口返回SocketTask对象，见下一章节介绍

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

以下云函数示例代码，从websocket服务器获取消息拼接后返回给客户端，如果遇到错误会抛出错误

示例源码如下，请查看 pre > code 标签中的内容

由于存在单实例多并发的情况，实例级的uniCloud对象，和每个请求request是一对多的关系。

这也造成了与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了更好的管理请求和请求相关的上下文，uniCloud提供了下面一批API。

示例源码如下，请查看 pre > code 标签中的内容

如没有配置单实例多并发，数组里只会返回一项内容。配置后可能会多项，正在并发的所有请求的requestId都会返回。

当返回多项时，在uniCloud对象上无法明确当前请求是数组中的哪一个。所以提供了其他方法来获取当前请求：

HBuilderX 4.21版本客户端上传clientInfo信息时不会将所有信息都传到云端。具体字段白名单如下：'appId', 'appLanguage', 'appName', 'appVersion', 'appVersionCode', 'appWgtVersion', 'browserName', 'browserVersion', 'deviceBrand', 'deviceId', 'deviceModel', 'deviceType', 'osName', 'osVersion', 'romName', 'romVersion', 'ua', 'hostName', 'hostVersion', 'uniPlatform', 'uniRuntimeVersion', 'uniRuntimeVersionCode', 'uniCompilerVersion', 'uniCompilerVersionCode'。如需让客户端上传更多clientInfo字段到云端，可以使用客户端api：uniCloud.setCustomClientInfo

同理，考虑到单实例多并发，uniCloud.getClientInfos()获取客户端信息也是一个数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未开启单实例多并发，那么数组只有1项。单实例多并发场景下返回正在并发的所有请求的客户端信息列表。

getClientInfos返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

除了uniCloud.getClientInfos()API，在云函数context和云对象this中，也可以直接获取当前客户端信息。

同上，为了兼容并发场景，获取云端信息uniCloud.getCloudInfos()返回的也是数组。

示例源码如下，请查看 pre > code 标签中的内容

除了uniCloud.getCloudInfos()API，在云函数context和云对象this中，也可以直接获取当前请求的云端信息。

上述3个API，都因为单实例多并发而被设计成数组方式。实际上，大多数开发者并不使用单实例多并发。

在不考虑单实例多并发时，也可以直接使用uniCloud的getRequestList、getClientInfos、getCloudInfos方法中第一个数组项。

或者在云对象的this和云函数的context里获取相关上下文信息也可以。

uniCloud的api中，有些api对应的实现，其代码体积较大，且这些功能并不是每一个云函数都会使用。为了方便开发者控制云函数的体积，设计了uniCloud扩展库的概念。

开发者可以对云函数目录点右键，管理公共模块和扩展库依赖，在其中选择要加载的扩展库。这个可视化界面对应的数据在云函数目录下的 package.json 内的extensions字段下。

注意：未引用扩展库的，使用uniCloud相应api时会报错。

以下是一个开启了redis扩展库的云函数package.json示例，注意此文件不支持注释，下方示例中的注释仅为演示

示例源码如下，请查看 pre > code 标签中的内容

云函数支持公共模块。多个云函数/云对象的共享部分，可以抽离为公共模块，然后被多个云函数引用。由于篇幅较长，详见

云函数的运行环境是 Node.js，因此我们可以使用 npm 安装第三方依赖。

注意：阿里云目前仅支持全量上传云函数（整个node_modules文件夹全部上传，会在上传前自动在本地安装依赖，不会直接使用云函数目录下的node_modules），因此提醒开发者精简依赖，否则可能会每次上传时间很慢，影响开发体验。并且太大的npm库影响云函数的运行性能。

腾讯云、支付宝云会在上传云函数后自动安装需要的npm依赖。

由于云函数环境缺少一些系统级依赖，而部分npm依赖安装时会针对不同平台进行编译安装，导致无法正常编译。

以下为已知无法在云端云函数环境中运行的npm依赖：

用法同客户端调用云函数，仍然是uniCloud.callfunction，但不支持callback形式。

示例源码如下，请查看 pre > code 标签中的内容

由于调用方不是uni-app客户端，云函数的context、云对象的this.getClientInfo等API无法获取客户端信息，包括 uni-id-token。

可以在云函数互调时手动传递 token ，或者校验调用来源（source）为云函数（function）时不验证用户 token。

云函数/云对象互相调用时调用方会通过公网访问被调用方，访问速度不如直接将逻辑放在调用方执行。使用前请确保你确实需要此功能。

HBuilderX 3.4.0版本之前云函数右键本地运行时，里面的代码再次callFunction会调用云端的云函数而不是本地云函数，此bug后续版本已修复。

除了调用三方云函数，事实上云函数还可以递归调用自己。

当一个云函数实例的资源不能满足需求，或超时时间不够用时。比如要给10万个用户发送短信，而短信发送接口一次调用最多支持50个手机号码，这样最少需要调用2000次接口才能完成；而一个云函数实例完成不了2000次接口的调用。这种场景就可以使用云函数递归调用，分解任务实现。

示例源码如下，请查看 pre > code 标签中的内容

注意：如果不小心把递归云函数写成死循环，就把云函数的内容全部删除，重新上传覆盖即可

在支付宝云与腾讯云服务空间的云函数内支持获取同账号下其他服务空间的uniCloud实例，参考：一个应用访问多个服务空间，并使用此实例调用对应服务空间的云函数。

示例源码如下，请查看 pre > code 标签中的内容

serverless是动态分配计算资源的，由此会引发的出一批特有概念：冷启动、实例、并发请求、无状态、伪全局变量。

基于云函数按需执行的特点, 函数在不被触发的时候, 计算资源是不被激活的。

当一个云函数初次被触发时，其完整过程如下：

函数被调用时，执行这些完整步骤的过程称作冷启动, 冷启动的耗时一般在一秒左右。

一个云函数实例冷启动后，serverless调度中心会保留这个实例一定时间。在实例保留期间，客户端再次请求云函数，不会触发冷启动，速度会更快。实例的详细定义见下

云函数实例和执行进程都被复用的情况下称之为热启动, 热启动性能要好非常多，因为它只有一个步骤：

如果一个云函数实例长时间没有被再次调用，则该计算实例会被回收；后续再次调用该云函数时，就会再次触发云函数的冷启动。

直观的体验表现为：隔了很久不用的云函数，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

注：冷启动虽慢但也不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

三家云厂商仍然在优化冷启动问题。目前给开发者的建议是：

实例，指云函数的一个执行环境，可以简单的理解为一个node进程。

每次客户端发起请求（request）时，serverless的调度中心会查看已启动、且空闲的实例，分配一个实例来接收这个请求。如果没有空闲实例，则新起一个实例。

新起一个实例需要一定时间，也即上文说的冷启动问题。详见冷启动

一个实例启动后，一般在1秒内就会完成请求，但serverless调度中心会保留这个实例一定时间（时间见上一节）。在实例保留期间，客户端再次请求云函数，不会触发冷启动。

也就是说，在实例保留期间，1个实例会接受多个客户端请求。

请求（request），指一次连接云函数的网络请求。不同请求有不同的上下文信息（比如客户端UA）。

所以想要获取客户端信息，一定注意不是在实例的全局对象上获取，而是需要在请求的上下文中获取。详见

在uniCloud阿里云版与支付宝小程序版中还提供了1个实例的多并发请求配置，即同一时间多个请求可以并发执行。 也就是同一时间的请求发到云函数时，没有配置单实例多并发会新开一个云函数实例，配置了单实例多并发则不会新开实例，在一个实例中增加并发。 详见单实例多并发。

一个云函数，可以同时存在多个实例。比如cf1云函数，如未配置单实例多并发，10个请求同时达到云函数，就会开10个实例。

不管开了多少实例，云函数的计费是按请求计费的。实例响应请求后到保留期结束之间，如果不发生新请求是不会计费的。

因为实例可能第一次启动，也可能已经启动，所以云函数中的js全局变量其实是伪全局变量。也就是云函数是无状态的。

在云对象中，写在module.exports = {}之前，云函数写在exports.main = async (event, context) => {}之前的变量定义，是伪全局变量。

以如下代码为例，count作为全局变量，当多次调用该云函数时，可能会出现变量累加的情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面2个示例中，实例未复用时，也就是冷启动时，count的值每次都是0；若实例被复用，则可能返回1、2、3等各种意外情况。

当然，可以用这个方法来获知一个实例被重用了多少次请求。

require由于存在缓存，也存在同样的问题。尽量不要直接修改require返回的内容。

uniCloud全局对象也是跨请求的，与请求相关的内容不应该挂载到uniCloud全局对象上。

由于上节提到的，uniCloud全局对象是实例级的、跨请求的，1个实例内uniCloud只会在冷启动时进行一次初始化。

所以与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了让开发者清晰的了解实例和请求的关系，uniCloud提供了如下方案。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是uniCloud私有云， 如果想获取与请求相关的信息，比如这次请求的客户端UA，或云函数环境信息，无法直接在uniCloud全局对象中获取。

云函数入口入参包含一个event和一个context，这两个参数和请求相关，每次有新请求到云函数实例时就会有一个新的event对象和一个新的context对象

云对象的this和event、context类似，每个请求都对应一个单独的this。

默认情况下云函数仅支持单实例单并发，即同一时间一个实例仅可为一个请求服务（不同请求同一时间访问会被分派到不同实例进行处理）。不过在uniCloud web控制台中，阿里云可以通过修改云函数单实例并发度，可以修改云函数同一时间最多能处理多少请求。

当实例并发度设置为1时，需要创建3个实例来处理这3个请求，每个实例分别处理1个请求。而每开启一个实例都会引发云函数冷启动；

当云函数的实例并发度设置为10时（即1个实例可以同时处理10个请求），只需要创建1个实例就能处理这3个请求。这样后面2个并发请求不会有因云函数实例创建带来的冷启动问题。

相关文档：云函数实例及部分变量说明 、云函数的无状态

云函数详情页面配置单实例并发度即可，支持1-100之间的数值

旧版本uni-id公共模块指uni-id-common推出之前的版本。详见

示例源码如下，请查看 pre > code 标签中的内容

不同于旧版uni-id公共模块，新版uni-id-common不可直接require后使用，必须使用createInstance方法

开启单实例多并发后的全局变量复用并非一定是坏的结果，如果你很了解此行为，也可以对此进行有效的利用

例：ip-filter 中就利用云函数全局缓存一些ip访问信息来限制单ip访问频率，可以下载示例项目体验一下

受单实例多并发的影响，云函数全局存放与本次请求有关的信息会造成混乱。因此uniCloud提供了根据当前requestId获取客户端信息和云端信息。参考以下文档

云函数是运行在云端的代码，运行环境由云服务器弹性调配，这是和传统Node.js应用很大的区别。

换言之，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合。

所以，不建议使用node的fs文件系统相关的API。建议通过云数据库、云存储、redis的方案替代。

书写云函数时应注意async、await的使用，nodejs有内置模块util可以将符合error-first形式callback的函数转换为promise形式，详情参考 ，比如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果想在云函数内使用回调形式可以让云函数返回一个promise，如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

腾讯云因为按 GBS 对云函数计费，在 node12 时，尤其要注意，如果未有效终止云函数，会一直计费

云函数运行在 node 环境中。可以使用 node api process.version 获取 node 版本。

node版本可以在云函数的package.json文件的cloudfunction-config->runtime字段进行配置，详情参考：云函数package.json

支付宝云云端云函数使用的时区是UTC+8。

阿里云和腾讯云云端云函数使用的时区是UTC+0，而不是 UTC+8，在云函数中使用时间时需特别注意。

云函数在HBuilderX本地运行时，时区则是电脑的时区，很可能是 UTC+8。建议统一使用时间戳，可以规避时区问题。

云函数除了代码，还有配置。在uniCloud web控制台 可以配置；在HBuilderX项目中，云函数根目录的package.json也是存放配置的地方。

云函数运行内存为单个云函数实例使用的内存。

支付宝云云函数默认运行内存512MB，阿里云正式版默认512MB，腾讯云云函数默认运行内存大小为256MB

计算云函数GBs资源消耗时腾讯云会以此内存*运行时间（100ms为阶梯向上取整）得到消耗量。阿里云会以实际运行时间计算GBs，不会按100ms阶梯向上取整

阿里云一般场景（比如包含数据库访问时）不建议将内存配置为128MB。如果开发起见遇到数据库响应缓慢，在排除索引等因素的影响后可以检查下是不是云函数内存配置为了128MB，如果是建议调整为256MB

腾讯云个人版及入门版套餐自2025年8月31日起云函数运行内存固定为256MB，不支持修改，详见相关公告

支付宝云定时任务触发最大支持3小时超时时间（需开启异步超时），非定时触发时超时时间为180秒，客户端请求云函数如果超出180秒云函数断开连接后会停止运行。

阿里云定时任务触发最大支持7200秒超时时间，非定时触发时超时时间为120秒，客户端请求云函数如果超出120秒云函数断开连接后会停止运行。

腾讯云定时任务触发最大支持900秒超时时间。非定时触发时超时时间为60秒，客户端请求云函数时如果超出30秒云函数断开链接后会继续运行，最大能运行到配置的超时时间。

如果超时时间仍然不够用，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

本地云函数默认超时为10秒，超时后云函数会停止运行。

修改超时时间可以在HBuilderX的设置->运行设置->云函数本地运行配置 超时时间中修改，单位为秒。

serverless默认是没有固定的服务器IP的，因为有很多服务器资源在后台供随时调用，每次调用到哪个服务器、哪个ip都不固定。

但一些三方系统，要求配置固定ip白名单，比如微信公众号的js sdk，此时只能提供固定ip地址。

腾讯云199元/月以上的套餐，提供了云函数的固定出口ip，在uniCloud Web控制台 ，创建付费的腾讯云服务空间，选择一个云函数，在云函数的详情界面可以开启固定出口ip。开启后界面上会显示可用的固定ip。拿着这个ip去需要固定ip的界面（如微信公众号管理界面）配置即可。

示例源码如下，请查看 pre > code 标签中的内容

阿里云必须使用uniCloud.httpProxyForEip发送请求才会固定出口ip，其原理是通过代理请求获得固定出口IP的能力。IP为轮转不固定，因此三方服务要求使用白名单时开发者需要将代理服务器可能的IP均加入到白名单中，见下方代理服务器列表。此外对于代理的域名有限制，当前仅持weixin.qq.com泛域名。若开发者有其他域名代理需求，发送邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。

示例源码如下，请查看 pre > code 标签中的内容

如需在获取微信公众号access_token场景使用，请将上述ip配置到微信公众平台 -> 基本配置 -> IP白名单内，相关链接：微信公众平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，此接口以application/x-www-form-urlencoded格式发送数据而不是multipart/form-data

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以application/json格式post数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0版本之前，package.json只是一个标准的package.json，安装依赖或公共模块才需要。HBuilderX 3.0及以上版本，package.json也可以用来配置云函数。

uniCloud web控制台提供了很多云函数的设置，比如内存大小、url化、定时触发等，从HBuilderX 3.0起，在云函数的package.json里也可以编写这些设置。

开发者在本地编写云函数的设置，上传云函数，这些设置会自动在云端生效。（本地不生效）

在云端设置了非默认参数后，HBuilderX下载云函数到本地时，也会自动把设置项放入package.json中下载下来。

package.json是一个标准json文件，不可带注释。下面是一个package.json示例。

示例源码如下，请查看 pre > code 标签中的内容

其中cloudfunction-config字段是云函数配置，支持的配置如下

示例源码如下，请查看 pre > code 标签中的内容

阿里云：Nodejs12、Nodejs14、Nodejs16、Nodejs18、Nodejs20，默认Nodejs16

腾讯云：Nodejs8（即将下线，不推荐使用）、Nodejs12、Nodejs16、Nodejs18，默认Nodejs16

支付宝云：Nodejs16、Nodejs18，默认Nodejs18

阿里云Nodejs8已终止支持：终止支持阶段一：禁止新建（2024年06月01日）；终止支持阶段二：禁止新建和更新（2024年09月01日）。终止支持不影响函数继续运行。建议您及时升级。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

支付宝云与阿里云定时触发的cron表达式不支持代表年的第七位，但是在package.json内配置时仍需将第七位设置为*。

在web控制台配置trigger请参考：定时触发

package.json内统一了支付宝云、腾讯云、阿里云三家厂商的配置，三个平台都需要配置为如下形式

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。

示例源码如下，请查看 pre > code 标签中的内容

如果此云函数运行在阿里云或腾讯云nodejs8，setTimeout里面的console.log不会在本次云函数调用执行，但是可能在云函数实例再次被复用时继续执行。

如果此云函数运行在腾讯云nodejs12，setTimeout里面的console.log会在本次云函数调用内，同样的本次云函数**计费时间（与云函数GBs指标相关）**也会按照最终执行完成的时间计算（5000ms+return耗时）。但是前端无需等待5秒即可收到响应。注意：如果有未断开的长连接（例如：redis连接）会导致云函数一直运行到配置的超时时间

当在云函数package.json内的cloudfunction-config内配置了keepRunningAfterReturn: false时，可以改变腾讯云nodejs12的表现，云函数return之后将不再继续执行，未断开的长连接也不会增加云函数实际运行时间，云函数return后长连接也不会被中断，简单来说其表现和腾讯云nodejs8一致。

将上述示例中的setTimeout换成网络请求、调用其他云函数或数据库请求同理，如果在阿里云或腾讯云nodejs8直接return会导致网络请求可能无法发送（即使成功发送也是在下一次云函数实例被复用的时候），这是与传统开发不太一样的地方。

示例源码如下，请查看 pre > code 标签中的内容

由于redis需要和服务器建立连接，此连接会阻止云函数结束执行。如果没有云函数return之后还需要继续执行的需求，可以简单的在cloudfunction-config内配置keepRunningAfterReturn: false。这样redis的连接并不会中断，下次请求来时依然可以使用之前建立的连接。

如果需要return之后继续执行，那么需要在使用完毕后断开redis连接，调用redis.quit()方法即可断开连接。需要注意的是断开连接后之前建立的连接将不再可用，下个请求到来时需要使用uniCloud.redis()方法重新建立连接。

如未按照上述说明进行操作，redis连接将会一直占用云函数实例，导致云厂商持续计算云函数执行时间，可能会导致消耗大量云资源而产生额外费用

务必确定自己已理解此文档内容，因未按照文档说明使用导致的额外计费DCloud不承担任何责任

HBuilderX 2.9版本，uniCloud提供了cloudfunctions_init.json来方便开发者快速进行云函数的初始化操作。

注意：HBuilderX 3.0.0版本起不再使用cloudfunctions_init.json来初始化云函数。改为使用在云函数目录下通过package.json进行配置，具体见上个章节

不再使用cloudfunctions_init.json，内容被分散到每个云函数的package.json的cloudfunction-config字段下

package.json是一个标准json文件，不可带注释。下面是一个package.json示例

示例源码如下，请查看 pre > code 标签中的内容

cloudfunction-config说明如下

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0.0之前版本，请继续阅读下面文档

cloudfunctions_init.json形式如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 2 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 3 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

Example 4 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage/dev.html

**Contents:**
- # 概述
  - # 文件权限
  - # 目录支持
- # 客户端API
  - # uploadFile(Object object)
    - # 请求参数
    - # 响应参数
    - # 示例代码
  - # getTempFileURL(Object object)
    - # 请求参数

阿里云、腾讯云、支付宝云均支持设置文件权限。

腾讯云和阿里云支持设置云存储的文件权限。当上传的文件不希望被其他人访问时（比如身份证照片），需配置权限：

uniCloud支付宝云版支持云存储的文件夹权限，可以通过创建私有权限的文件夹，来保证改文件夹下的所有文件无法被公开读取，而必须通过uniCloud.getTempFileURL获取的临时URL来进行访问。

扩展存储 扩展存储支持文件级别的公有、私有权限设置，详见updateFileStatus

支付宝云和腾讯云支持以上传时指定的cloudPath作为文件路径进行文件存储。

阿里云在HBuilderX 3.8.5及之后版本支持以上传时指定的cloudPath作为文件路径进行文件存储，需要在上传时指定参数cloudPathAsRealPath: true来启用目录支持。为兼容旧版阿里云表现cloudPathAsRealPath默认为false。对于客户端和本地云函数此调整在HBuilderX 3.8.5及之后的版本生效，对于云端云函数此调整自2023年6月17日生效。

阿里云在cloudPathAsRealPath为false时传的文件都存储在cloudstorage目录下，2023年6月17日起访问uniCloud web控制台云存储页面可以看到目录结构。需要注意cloudPathAsRealPath为true时，云函数使用同样的cloudPath上传文件会覆盖旧文件，客户端使用同样的cloudPath则会报policy_does_not_allow_file_overwrite。

在uni-app前端进行云存储的操作（不是在云函数里操作），包括在前端上传、删除文件。

腾讯云支持配置云存储权限，需搭配腾讯云自定义登录使用，详情：自定义登录

支付宝云与阿里云不支持控制前端访问云储存的权限

云存储客户端api内部会使用uni.request、uni.uploadFile来发送请求，如果有这两个接口写拦截器务必准确区分要拦截的内容

客户端上传文件到云函数、云函数再上传文件到云存储，这样的过程会导致文件流量带宽耗费较大。所以一般上传文件都是客户端直传。

支付宝云、阿里云、腾讯云的单文件大小限制为5GB

支付宝小程序开发工具上传文件到腾讯云时可能会返回失败，请以真机为准

各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。参考

腾讯云使用自定义登录的方式确定用户身份。以下以默认权限”所有用户可读，仅创建者及管理员可写“为例进行讲解

默认情况下用户以匿名身份登录（为了方便暂时称此身份为“匿名用户A”）

匿名用户A身份过期之后再次获取的身份并不是”匿名用户A“（暂记为”匿名用户B“），这时匿名用户B是没有权限覆盖匿名用户A上传的文件的。

如果使用了自定义登录，那么云存储就可以确定用户身份，这时候用户可以覆盖自己上传的文件，删除同理。

示例源码如下，请查看 pre > code 标签中的内容

在客户端把文件的fileid转换为临时URL。临时URL有有效期限制，避免其他人获取URL后可以持续访问该文件。

若fileid对应的文件权限是公共权限，则此时获取到的URL是永久的。

自HBuilderX 3.1.0起阿里云也支持此接口，但仅为抹平和腾讯云的接口差异。因为阿里云的云存储不支持权限控制。

自HBuilderX 4.76版本起阿里云云存储支持权限控制。

示例源码如下，请查看 pre > code 标签中的内容

阿里云迁移服务空间后，旧云存储url需要通过此接口获取新服务空间的cdn链接

通过ui界面选择文件（图片/视频）并直接上传到云存储。

同时提供了选择回调事件，方便对选择后的图片进行压缩等二次处理，然后再上传。

此接口根据type不同接收兼容性也略有差异

onChooseFile(Object OnChooseFileRes)

选择图片的回调事件。方便对选择后的图片进行压缩、裁剪等二次处理，然后再上传。

示例源码如下，请查看 pre > code 标签中的内容

如果onChooseFile回调有返回值，此返回值会用来替换实际选择的文件，用以上传。可以在此回调内对文件进行额外的处理，通过在onChooseFile内返回一个promise来阻塞上传，在此期间可以对文件进行额外处理。

示例源码如下，请查看 pre > code 标签中的内容

OnUploadProgress(Object OnUploadProgressRes)

OnUploadProgressRes结构如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：仅腾讯云支持此API，且使用时，需搭配腾讯云提供的自定义登录和权限设置使用；阿里云、支付宝云不支持此API。

不建议使用此API。删除云存储文件是一个高危操作，应该由云函数进行权限校验后由云函数来删除云存储的文件。

示例源码如下，请查看 pre > code 标签中的内容

某些场景下需要使用客户端未关联的服务空间的云存储，此时可以通过uniCloud.init 方法获取对应空间的实例用于上传文件

示例源码如下，请查看 pre > code 标签中的内容

在云函数中操作云存储文件（不是在前端），包括在云函数里上传、删除云存储文件。

如果是从客户端上传文件，一般不建议先把文件从客户端上传到云函数，再由云函数上传到云存储，而是建议客户端直传云存储。详见：https://uniapp.dcloud.io/uniCloud/storage?id=uploadfile

HBuilderX 3.1.0之前版本如使用阿里云，请在客户端通过uniCloud.uploadFile进行上传

uploadFileOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

getTempFileURLOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

删除云存储文件是高危操作，不建议在客户端操作，而建议在云函数中操作。

deleteFileOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

云函数下载已上传至云存储的文件到云函数代码空间内。阿里云直接使用http请求url下载即可，无需使用downloadFile接口。

downloadFileOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

阿里云迁移服务空间后，旧云存储url需要通过此接口获取新服务空间的cdn链接

阿里云商用版目前仍可使用此功能，但是未来可能会进行计费

使用阿里云作为服务商时，云存储支持直接使用restful api对资源进行处理，下表列出支持的操作类型。

如果你的数据库及云函数使用腾讯云，也是可以使用阿里云云存储的。详细用法参考：连接多个服务空间

使用腾讯云作为服务商时，云存储通过数据万象提供图片缩放、图片水印等计算功能。

数据万象是腾讯云的一个按量计费产品，月初生成上个月的账单，并从账号余额中扣除相关费用。故若在腾讯云中使用图片缩放、图片水印等功能，首先需保证账号余额充足，否则可能会触发账号级停服风险！

说明：数据万象月初产生的账单，会从uniCloud账号余额中自动扣除，相关费用及单价完全和腾讯云保持一致，具体可参考数据万象 - 计费方式 。

**Examples:**

Example 1 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

Example 2 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

Example 3 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

Example 4 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage.html

**Contents:**
- # 概述
  - # 文件权限
  - # 目录支持
- # 客户端API
  - # uploadFile(Object object)
    - # 请求参数
    - # 响应参数
    - # 示例代码
  - # getTempFileURL(Object object)
    - # 请求参数

阿里云、腾讯云、支付宝云均支持设置文件权限。

腾讯云和阿里云支持设置云存储的文件权限。当上传的文件不希望被其他人访问时（比如身份证照片），需配置权限：

uniCloud支付宝云版支持云存储的文件夹权限，可以通过创建私有权限的文件夹，来保证改文件夹下的所有文件无法被公开读取，而必须通过uniCloud.getTempFileURL获取的临时URL来进行访问。

扩展存储 扩展存储支持文件级别的公有、私有权限设置，详见updateFileStatus

支付宝云和腾讯云支持以上传时指定的cloudPath作为文件路径进行文件存储。

阿里云在HBuilderX 3.8.5及之后版本支持以上传时指定的cloudPath作为文件路径进行文件存储，需要在上传时指定参数cloudPathAsRealPath: true来启用目录支持。为兼容旧版阿里云表现cloudPathAsRealPath默认为false。对于客户端和本地云函数此调整在HBuilderX 3.8.5及之后的版本生效，对于云端云函数此调整自2023年6月17日生效。

阿里云在cloudPathAsRealPath为false时传的文件都存储在cloudstorage目录下，2023年6月17日起访问uniCloud web控制台云存储页面可以看到目录结构。需要注意cloudPathAsRealPath为true时，云函数使用同样的cloudPath上传文件会覆盖旧文件，客户端使用同样的cloudPath则会报policy_does_not_allow_file_overwrite。

在uni-app前端进行云存储的操作（不是在云函数里操作），包括在前端上传、删除文件。

腾讯云支持配置云存储权限，需搭配腾讯云自定义登录使用，详情：自定义登录

支付宝云与阿里云不支持控制前端访问云储存的权限

云存储客户端api内部会使用uni.request、uni.uploadFile来发送请求，如果有这两个接口写拦截器务必准确区分要拦截的内容

客户端上传文件到云函数、云函数再上传文件到云存储，这样的过程会导致文件流量带宽耗费较大。所以一般上传文件都是客户端直传。

支付宝云、阿里云、腾讯云的单文件大小限制为5GB

支付宝小程序开发工具上传文件到腾讯云时可能会返回失败，请以真机为准

各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。参考

腾讯云使用自定义登录的方式确定用户身份。以下以默认权限”所有用户可读，仅创建者及管理员可写“为例进行讲解

默认情况下用户以匿名身份登录（为了方便暂时称此身份为“匿名用户A”）

匿名用户A身份过期之后再次获取的身份并不是”匿名用户A“（暂记为”匿名用户B“），这时匿名用户B是没有权限覆盖匿名用户A上传的文件的。

如果使用了自定义登录，那么云存储就可以确定用户身份，这时候用户可以覆盖自己上传的文件，删除同理。

示例源码如下，请查看 pre > code 标签中的内容

在客户端把文件的fileid转换为临时URL。临时URL有有效期限制，避免其他人获取URL后可以持续访问该文件。

若fileid对应的文件权限是公共权限，则此时获取到的URL是永久的。

自HBuilderX 3.1.0起阿里云也支持此接口，但仅为抹平和腾讯云的接口差异。因为阿里云的云存储不支持权限控制。

自HBuilderX 4.76版本起阿里云云存储支持权限控制。

示例源码如下，请查看 pre > code 标签中的内容

阿里云迁移服务空间后，旧云存储url需要通过此接口获取新服务空间的cdn链接

通过ui界面选择文件（图片/视频）并直接上传到云存储。

同时提供了选择回调事件，方便对选择后的图片进行压缩等二次处理，然后再上传。

此接口根据type不同接收兼容性也略有差异

onChooseFile(Object OnChooseFileRes)

选择图片的回调事件。方便对选择后的图片进行压缩、裁剪等二次处理，然后再上传。

示例源码如下，请查看 pre > code 标签中的内容

如果onChooseFile回调有返回值，此返回值会用来替换实际选择的文件，用以上传。可以在此回调内对文件进行额外的处理，通过在onChooseFile内返回一个promise来阻塞上传，在此期间可以对文件进行额外处理。

示例源码如下，请查看 pre > code 标签中的内容

OnUploadProgress(Object OnUploadProgressRes)

OnUploadProgressRes结构如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：仅腾讯云支持此API，且使用时，需搭配腾讯云提供的自定义登录和权限设置使用；阿里云、支付宝云不支持此API。

不建议使用此API。删除云存储文件是一个高危操作，应该由云函数进行权限校验后由云函数来删除云存储的文件。

示例源码如下，请查看 pre > code 标签中的内容

某些场景下需要使用客户端未关联的服务空间的云存储，此时可以通过uniCloud.init 方法获取对应空间的实例用于上传文件

示例源码如下，请查看 pre > code 标签中的内容

在云函数中操作云存储文件（不是在前端），包括在云函数里上传、删除云存储文件。

如果是从客户端上传文件，一般不建议先把文件从客户端上传到云函数，再由云函数上传到云存储，而是建议客户端直传云存储。详见：https://uniapp.dcloud.io/uniCloud/storage?id=uploadfile

HBuilderX 3.1.0之前版本如使用阿里云，请在客户端通过uniCloud.uploadFile进行上传

uploadFileOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

getTempFileURLOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

删除云存储文件是高危操作，不建议在客户端操作，而建议在云函数中操作。

deleteFileOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

云函数下载已上传至云存储的文件到云函数代码空间内。阿里云直接使用http请求url下载即可，无需使用downloadFile接口。

downloadFileOptions参数说明

示例源码如下，请查看 pre > code 标签中的内容

阿里云迁移服务空间后，旧云存储url需要通过此接口获取新服务空间的cdn链接

阿里云商用版目前仍可使用此功能，但是未来可能会进行计费

使用阿里云作为服务商时，云存储支持直接使用restful api对资源进行处理，下表列出支持的操作类型。

如果你的数据库及云函数使用腾讯云，也是可以使用阿里云云存储的。详细用法参考：连接多个服务空间

使用腾讯云作为服务商时，云存储通过数据万象提供图片缩放、图片水印等计算功能。

数据万象是腾讯云的一个按量计费产品，月初生成上个月的账单，并从账号余额中扣除相关费用。故若在腾讯云中使用图片缩放、图片水印等功能，首先需保证账号余额充足，否则可能会触发账号级停服风险！

说明：数据万象月初产生的账单，会从uniCloud账号余额中自动扣除，相关费用及单价完全和腾讯云保持一致，具体可参考数据万象 - 计费方式 。

**Examples:**

Example 1 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

Example 2 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

Example 3 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

Example 4 (javascript):
```javascript
//前端代码
uni.chooseImage({
  count: 1,
  success(res) {
    console.log(res);
    if (res.tempFilePaths.length > 0) {
      let filePath = res.tempFilePaths[0]
      //进行上传操作

      // promise方式
      const result = await uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        }
      });

      // callback方式，与promise方式二选一即可
      uniCloud.uploadFile({
        filePath: filePath,
        cloudPath: 'a.jpg',
        onUploadProgress: function(progressEvent) {
          console.log(progressEvent);
          var percentCompleted = Math.round(
            (progressEvent.loaded * 100) / progressEvent.total
          );
        },
        success() {},
        fail() {},
        complete() {}
      });

    }
  }
});
```

---

## 简介@intro | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-functions?id=concurrency

**Contents:**
- # 简介
- # 云函数的分类
- # 客户端和云函数的通信
  - # clientDB方式
  - # 云对象方式
  - # 普通云函数callFunction方式
  - # 云函数URL化方式
  - # 云函数请求中的中间状态通知通道
  - # uniCloud响应体规范
    - # HBuilderX 3.6.10及之后版本的错误规范

云函数是运行在云端的 JavaScript 代码，是基于 Node.js 的扩展。

在常规的 Node API 基础上，uniCloud的云函数环境内置了uniCloud对象，这个对象内置了网络、数据库等各种API。开发者未学习过 Node.js 也没有关系，只需要看uniCloud的文档，掌握这个uniCloud对象的API即可。

每个云函数是一个js包，在云函数被调用时，由 serverless 调度系统分配硬件资源启动一个 node 环境来运行这个云函数。

在HBuilderX中可以新建云函数（HBuilderX 3.4 同时可以新建云对象）。

每个云函数是一个目录，其中普通云函数有index.js入口文件，云对象的入口文件则是index.obj.js。

一个最简单的云函数只需要这个入口js文件，在里面编写代码即可。当然也可以在这个js中require该云函数目录下的其他js、json文件。

云函数的配置文件和 npm规范 相同，在云函数目录下可新建一个 package.json 来存放配置。uniCloud云函数扩展了 package.json，增加了一些特有的配置项。详见

云函数启动后实例会保留一段时间（如15分钟），超过保留期后若该云函数一直没有被再调用，那这个实例会被释放。所以云函数有冷启动的概念。不过由于js实例的启动要比php和java更快，所以js更适合serverless方式。

云函数有若干子概念，包括 普通云函数、云对象、公共模块、clientDB的action云函数、uniCloud扩展库。

HBuilderX中uniCloud项目的云函数均在项目的uniCloud/cloudfunctions目录下，目录结构如下：

uni-app客户端和传统服务器通信时，使用uni.request的ajax请求方式。uniCloud下不再使用它，有更好的云端一体的通信方式。

uniCloud体系里，客户端和服务端的云函数通信，有4种方式：

云函数是uniCloud的基础，本质上 clientDB 和 云对象 都是建立在云函数上针对特定场景的优化。

clientDB分API方式和组件方式，此处使用API方式来演示

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，学习clientDB需另见文档clientDB

如果客户端使用uni-app开发，且向uniCloud服务空间的请求主要是为了操作云数据库（无论增删改查），那么推荐使用clientDB方式，由uni-app客户端直接操作云数据库。

如果操作数据库的同时，还需要同时执行一些云端逻辑：HBuilderX 3.6.11以前使用action云函数；从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。

云对象和clientDB最大的区别，是云对象把数据库操作（以及其他逻辑）封装在云对象的方法里面。

它无法像clientDB那样无需开发服务器代码，它仍需在客户端和云端分别写代码。但它的应用场景不受限制。上文中不适用clientDB的情况，都可以使用云对象解决。

云端云对象代码，云对象名称：testco，有一个sum方法

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个testco对象，调用它的sum方法

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX 3.5.2之前，需要URL化和定时运行时，只能使用普通云函数；在HBuilderX 3.5.2+，云对象也支持了URL化和定时运行。

官方不推荐开发者使用云函数，有相关需求推荐使用云对象替代云函数。

目前官方还未提供基于云对象的router模式的框架，有相关需求可以使用三方框架。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，需另见文档云函数callfunction方式

可以让云函数/云对象生成一个HTTP URL。这样非uni-app应用，可以通过ajax请求和云函数/云对象通信。

在 uniCloud Web控制台进行URL化配置。

云函数在执行期间可以将中间状态发送给客户端，详情参考：云函数请求中的中间状态通知通道

uniCloud响应体规范（uniCloud response format），是DCloud制定的、服务器给客户端返回json数据的一种建议格式。

云对象、clientDB、uni-id公共模块均支持此规范。

uniCloud服务器给客户端返回的数据格式一般是json，但json的格式具体是什么没有约定。比如返回错误码，是叫code还是叫errCode？错误内容是message还是errMsg？内容的国际化如何处理？

如果没有一套统一的格式，在客户端将无法编写有效的网络拦截器，无法统一处理错误。

另外，如果不同的插件，云端返回的数据格式千差万别，那使用者整合这些插件也会非常麻烦。国际化更无法落地。

为此DCloud推出了uniCloud响应体规范。

为了与uni-app前端的API错误回调风格统一，uniCloud响应体规范定义的云端返回信息（尤其是报错时）应包含errCode和errMsg。

示例源码如下，请查看 pre > code 标签中的内容

errCode在成功时应返回数字0,失败时应返回一个以插件id开头的“字符串”，每个单词以连字符（-）分割。做出这样的规定是为了防止不同插件之间出现重复错误码

以'uni-id-account-banned'错误码为例，uni-id为插件id，account-banned为错误缩写。

如果业务开发的代码并不发布插件市场，那么为了避免下载了一个市场的插件产生冲突，推荐使用不包含“-”的字符串来做errCode（插件市场的所有插件ID必须包含“-”）。

后续uniCloud会提供自动根据errCode对errMsg进行国际化处理的功能，开发者仅需保证云函数返回值满足uniCloud响应体规范即可。

errMsg用于存放具体错误信息，包括展示给开发者、终端用户的错误信息

除此之外响应体规范还包含newToken字段，用于token的自动续期（云对象接收含有newToken的响应后会自动更新storage内存储的uni_id_token及uni_id_token_expired，此行为新增于HBuilderX 3.4.13）。开发者仅在自行调用uni-id-common的checkToken等会产生新token的接口时才需要返回新token，uni-app客户端和uni-id-co之间会自动管理token及续期。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX内使用代码块returnu可以快速输入以下代码（HBuilderX 3.4.0及以上版本）:

示例源码如下，请查看 pre > code 标签中的内容

云函数支持 js 和 nodejs 的标准API，如console.log()、setTimeout()，另见nodejs官网 。nodejs版本，详见云函数运行环境

除了标准API外，云函数环境中内置了uniCloud对象，扩展了一批新API，实际开发中更常用的是uniCloud的扩展API。见下：

云函数调用uniCloud接口时（包括请求云函数、云对象、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

云函数中支持访问本服务空间下的、或经授权的其他服务空间下的，数据库。

云函数中如需要请求其他http服务，则使用uniCloud.httpclient。无需额外依赖，就可以请求任何 HTTP 和 HTTPS 协议的 Web 服务。uniCloud.httpclient返回的是一个urllib实例 。

uniCloud.httpclient.request(URL,requestOptions)

默认情况下request接口不会处理返回的数据，即不传dataType参数时会返回buffer类型的数据，如需自动解析json格式的返回结果，需要将dataType设置为"json"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为简化http请求的调用uniCloud新增了uni.request调用方法类似的http请求接口uniCloud.request。

示例源码如下，请查看 pre > code 标签中的内容

实际业务中常有使用云函数发送formdata类型数据的需求，比如微信小程序提供的一些服务端接口（图片内容安全检测、识别图片二维码等），可以参考以下示例进行发送

示例源码如下，请查看 pre > code 标签中的内容

云函数无法作为websocket服务器使用，如有相关需求可以尝试使用uni-push 2.0实现，参考：uni-push 2.0。

本章节内容介绍云函数如何作为websocket客户端使用。为简化调用方式uniCloud新增了uni.connectSocket方法类似的接口uniCloud.connectSocket。

调用此接口返回SocketTask对象，见下一章节介绍

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

以下云函数示例代码，从websocket服务器获取消息拼接后返回给客户端，如果遇到错误会抛出错误

示例源码如下，请查看 pre > code 标签中的内容

由于存在单实例多并发的情况，实例级的uniCloud对象，和每个请求request是一对多的关系。

这也造成了与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了更好的管理请求和请求相关的上下文，uniCloud提供了下面一批API。

示例源码如下，请查看 pre > code 标签中的内容

如没有配置单实例多并发，数组里只会返回一项内容。配置后可能会多项，正在并发的所有请求的requestId都会返回。

当返回多项时，在uniCloud对象上无法明确当前请求是数组中的哪一个。所以提供了其他方法来获取当前请求：

HBuilderX 4.21版本客户端上传clientInfo信息时不会将所有信息都传到云端。具体字段白名单如下：'appId', 'appLanguage', 'appName', 'appVersion', 'appVersionCode', 'appWgtVersion', 'browserName', 'browserVersion', 'deviceBrand', 'deviceId', 'deviceModel', 'deviceType', 'osName', 'osVersion', 'romName', 'romVersion', 'ua', 'hostName', 'hostVersion', 'uniPlatform', 'uniRuntimeVersion', 'uniRuntimeVersionCode', 'uniCompilerVersion', 'uniCompilerVersionCode'。如需让客户端上传更多clientInfo字段到云端，可以使用客户端api：uniCloud.setCustomClientInfo

同理，考虑到单实例多并发，uniCloud.getClientInfos()获取客户端信息也是一个数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未开启单实例多并发，那么数组只有1项。单实例多并发场景下返回正在并发的所有请求的客户端信息列表。

getClientInfos返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

除了uniCloud.getClientInfos()API，在云函数context和云对象this中，也可以直接获取当前客户端信息。

同上，为了兼容并发场景，获取云端信息uniCloud.getCloudInfos()返回的也是数组。

示例源码如下，请查看 pre > code 标签中的内容

除了uniCloud.getCloudInfos()API，在云函数context和云对象this中，也可以直接获取当前请求的云端信息。

上述3个API，都因为单实例多并发而被设计成数组方式。实际上，大多数开发者并不使用单实例多并发。

在不考虑单实例多并发时，也可以直接使用uniCloud的getRequestList、getClientInfos、getCloudInfos方法中第一个数组项。

或者在云对象的this和云函数的context里获取相关上下文信息也可以。

uniCloud的api中，有些api对应的实现，其代码体积较大，且这些功能并不是每一个云函数都会使用。为了方便开发者控制云函数的体积，设计了uniCloud扩展库的概念。

开发者可以对云函数目录点右键，管理公共模块和扩展库依赖，在其中选择要加载的扩展库。这个可视化界面对应的数据在云函数目录下的 package.json 内的extensions字段下。

注意：未引用扩展库的，使用uniCloud相应api时会报错。

以下是一个开启了redis扩展库的云函数package.json示例，注意此文件不支持注释，下方示例中的注释仅为演示

示例源码如下，请查看 pre > code 标签中的内容

云函数支持公共模块。多个云函数/云对象的共享部分，可以抽离为公共模块，然后被多个云函数引用。由于篇幅较长，详见

云函数的运行环境是 Node.js，因此我们可以使用 npm 安装第三方依赖。

注意：阿里云目前仅支持全量上传云函数（整个node_modules文件夹全部上传，会在上传前自动在本地安装依赖，不会直接使用云函数目录下的node_modules），因此提醒开发者精简依赖，否则可能会每次上传时间很慢，影响开发体验。并且太大的npm库影响云函数的运行性能。

腾讯云、支付宝云会在上传云函数后自动安装需要的npm依赖。

由于云函数环境缺少一些系统级依赖，而部分npm依赖安装时会针对不同平台进行编译安装，导致无法正常编译。

以下为已知无法在云端云函数环境中运行的npm依赖：

用法同客户端调用云函数，仍然是uniCloud.callfunction，但不支持callback形式。

示例源码如下，请查看 pre > code 标签中的内容

由于调用方不是uni-app客户端，云函数的context、云对象的this.getClientInfo等API无法获取客户端信息，包括 uni-id-token。

可以在云函数互调时手动传递 token ，或者校验调用来源（source）为云函数（function）时不验证用户 token。

云函数/云对象互相调用时调用方会通过公网访问被调用方，访问速度不如直接将逻辑放在调用方执行。使用前请确保你确实需要此功能。

HBuilderX 3.4.0版本之前云函数右键本地运行时，里面的代码再次callFunction会调用云端的云函数而不是本地云函数，此bug后续版本已修复。

除了调用三方云函数，事实上云函数还可以递归调用自己。

当一个云函数实例的资源不能满足需求，或超时时间不够用时。比如要给10万个用户发送短信，而短信发送接口一次调用最多支持50个手机号码，这样最少需要调用2000次接口才能完成；而一个云函数实例完成不了2000次接口的调用。这种场景就可以使用云函数递归调用，分解任务实现。

示例源码如下，请查看 pre > code 标签中的内容

注意：如果不小心把递归云函数写成死循环，就把云函数的内容全部删除，重新上传覆盖即可

在支付宝云与腾讯云服务空间的云函数内支持获取同账号下其他服务空间的uniCloud实例，参考：一个应用访问多个服务空间，并使用此实例调用对应服务空间的云函数。

示例源码如下，请查看 pre > code 标签中的内容

serverless是动态分配计算资源的，由此会引发的出一批特有概念：冷启动、实例、并发请求、无状态、伪全局变量。

基于云函数按需执行的特点, 函数在不被触发的时候, 计算资源是不被激活的。

当一个云函数初次被触发时，其完整过程如下：

函数被调用时，执行这些完整步骤的过程称作冷启动, 冷启动的耗时一般在一秒左右。

一个云函数实例冷启动后，serverless调度中心会保留这个实例一定时间。在实例保留期间，客户端再次请求云函数，不会触发冷启动，速度会更快。实例的详细定义见下

云函数实例和执行进程都被复用的情况下称之为热启动, 热启动性能要好非常多，因为它只有一个步骤：

如果一个云函数实例长时间没有被再次调用，则该计算实例会被回收；后续再次调用该云函数时，就会再次触发云函数的冷启动。

直观的体验表现为：隔了很久不用的云函数，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

注：冷启动虽慢但也不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

三家云厂商仍然在优化冷启动问题。目前给开发者的建议是：

实例，指云函数的一个执行环境，可以简单的理解为一个node进程。

每次客户端发起请求（request）时，serverless的调度中心会查看已启动、且空闲的实例，分配一个实例来接收这个请求。如果没有空闲实例，则新起一个实例。

新起一个实例需要一定时间，也即上文说的冷启动问题。详见冷启动

一个实例启动后，一般在1秒内就会完成请求，但serverless调度中心会保留这个实例一定时间（时间见上一节）。在实例保留期间，客户端再次请求云函数，不会触发冷启动。

也就是说，在实例保留期间，1个实例会接受多个客户端请求。

请求（request），指一次连接云函数的网络请求。不同请求有不同的上下文信息（比如客户端UA）。

所以想要获取客户端信息，一定注意不是在实例的全局对象上获取，而是需要在请求的上下文中获取。详见

在uniCloud阿里云版与支付宝小程序版中还提供了1个实例的多并发请求配置，即同一时间多个请求可以并发执行。 也就是同一时间的请求发到云函数时，没有配置单实例多并发会新开一个云函数实例，配置了单实例多并发则不会新开实例，在一个实例中增加并发。 详见单实例多并发。

一个云函数，可以同时存在多个实例。比如cf1云函数，如未配置单实例多并发，10个请求同时达到云函数，就会开10个实例。

不管开了多少实例，云函数的计费是按请求计费的。实例响应请求后到保留期结束之间，如果不发生新请求是不会计费的。

因为实例可能第一次启动，也可能已经启动，所以云函数中的js全局变量其实是伪全局变量。也就是云函数是无状态的。

在云对象中，写在module.exports = {}之前，云函数写在exports.main = async (event, context) => {}之前的变量定义，是伪全局变量。

以如下代码为例，count作为全局变量，当多次调用该云函数时，可能会出现变量累加的情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面2个示例中，实例未复用时，也就是冷启动时，count的值每次都是0；若实例被复用，则可能返回1、2、3等各种意外情况。

当然，可以用这个方法来获知一个实例被重用了多少次请求。

require由于存在缓存，也存在同样的问题。尽量不要直接修改require返回的内容。

uniCloud全局对象也是跨请求的，与请求相关的内容不应该挂载到uniCloud全局对象上。

由于上节提到的，uniCloud全局对象是实例级的、跨请求的，1个实例内uniCloud只会在冷启动时进行一次初始化。

所以与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了让开发者清晰的了解实例和请求的关系，uniCloud提供了如下方案。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是uniCloud私有云， 如果想获取与请求相关的信息，比如这次请求的客户端UA，或云函数环境信息，无法直接在uniCloud全局对象中获取。

云函数入口入参包含一个event和一个context，这两个参数和请求相关，每次有新请求到云函数实例时就会有一个新的event对象和一个新的context对象

云对象的this和event、context类似，每个请求都对应一个单独的this。

默认情况下云函数仅支持单实例单并发，即同一时间一个实例仅可为一个请求服务（不同请求同一时间访问会被分派到不同实例进行处理）。不过在uniCloud web控制台中，阿里云可以通过修改云函数单实例并发度，可以修改云函数同一时间最多能处理多少请求。

当实例并发度设置为1时，需要创建3个实例来处理这3个请求，每个实例分别处理1个请求。而每开启一个实例都会引发云函数冷启动；

当云函数的实例并发度设置为10时（即1个实例可以同时处理10个请求），只需要创建1个实例就能处理这3个请求。这样后面2个并发请求不会有因云函数实例创建带来的冷启动问题。

相关文档：云函数实例及部分变量说明 、云函数的无状态

云函数详情页面配置单实例并发度即可，支持1-100之间的数值

旧版本uni-id公共模块指uni-id-common推出之前的版本。详见

示例源码如下，请查看 pre > code 标签中的内容

不同于旧版uni-id公共模块，新版uni-id-common不可直接require后使用，必须使用createInstance方法

开启单实例多并发后的全局变量复用并非一定是坏的结果，如果你很了解此行为，也可以对此进行有效的利用

例：ip-filter 中就利用云函数全局缓存一些ip访问信息来限制单ip访问频率，可以下载示例项目体验一下

受单实例多并发的影响，云函数全局存放与本次请求有关的信息会造成混乱。因此uniCloud提供了根据当前requestId获取客户端信息和云端信息。参考以下文档

云函数是运行在云端的代码，运行环境由云服务器弹性调配，这是和传统Node.js应用很大的区别。

换言之，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合。

所以，不建议使用node的fs文件系统相关的API。建议通过云数据库、云存储、redis的方案替代。

书写云函数时应注意async、await的使用，nodejs有内置模块util可以将符合error-first形式callback的函数转换为promise形式，详情参考 ，比如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果想在云函数内使用回调形式可以让云函数返回一个promise，如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

腾讯云因为按 GBS 对云函数计费，在 node12 时，尤其要注意，如果未有效终止云函数，会一直计费

云函数运行在 node 环境中。可以使用 node api process.version 获取 node 版本。

node版本可以在云函数的package.json文件的cloudfunction-config->runtime字段进行配置，详情参考：云函数package.json

支付宝云云端云函数使用的时区是UTC+8。

阿里云和腾讯云云端云函数使用的时区是UTC+0，而不是 UTC+8，在云函数中使用时间时需特别注意。

云函数在HBuilderX本地运行时，时区则是电脑的时区，很可能是 UTC+8。建议统一使用时间戳，可以规避时区问题。

云函数除了代码，还有配置。在uniCloud web控制台 可以配置；在HBuilderX项目中，云函数根目录的package.json也是存放配置的地方。

云函数运行内存为单个云函数实例使用的内存。

支付宝云云函数默认运行内存512MB，阿里云正式版默认512MB，腾讯云云函数默认运行内存大小为256MB

计算云函数GBs资源消耗时腾讯云会以此内存*运行时间（100ms为阶梯向上取整）得到消耗量。阿里云会以实际运行时间计算GBs，不会按100ms阶梯向上取整

阿里云一般场景（比如包含数据库访问时）不建议将内存配置为128MB。如果开发起见遇到数据库响应缓慢，在排除索引等因素的影响后可以检查下是不是云函数内存配置为了128MB，如果是建议调整为256MB

腾讯云个人版及入门版套餐自2025年8月31日起云函数运行内存固定为256MB，不支持修改，详见相关公告

支付宝云定时任务触发最大支持3小时超时时间（需开启异步超时），非定时触发时超时时间为180秒，客户端请求云函数如果超出180秒云函数断开连接后会停止运行。

阿里云定时任务触发最大支持7200秒超时时间，非定时触发时超时时间为120秒，客户端请求云函数如果超出120秒云函数断开连接后会停止运行。

腾讯云定时任务触发最大支持900秒超时时间。非定时触发时超时时间为60秒，客户端请求云函数时如果超出30秒云函数断开链接后会继续运行，最大能运行到配置的超时时间。

如果超时时间仍然不够用，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

本地云函数默认超时为10秒，超时后云函数会停止运行。

修改超时时间可以在HBuilderX的设置->运行设置->云函数本地运行配置 超时时间中修改，单位为秒。

serverless默认是没有固定的服务器IP的，因为有很多服务器资源在后台供随时调用，每次调用到哪个服务器、哪个ip都不固定。

但一些三方系统，要求配置固定ip白名单，比如微信公众号的js sdk，此时只能提供固定ip地址。

腾讯云199元/月以上的套餐，提供了云函数的固定出口ip，在uniCloud Web控制台 ，创建付费的腾讯云服务空间，选择一个云函数，在云函数的详情界面可以开启固定出口ip。开启后界面上会显示可用的固定ip。拿着这个ip去需要固定ip的界面（如微信公众号管理界面）配置即可。

示例源码如下，请查看 pre > code 标签中的内容

阿里云必须使用uniCloud.httpProxyForEip发送请求才会固定出口ip，其原理是通过代理请求获得固定出口IP的能力。IP为轮转不固定，因此三方服务要求使用白名单时开发者需要将代理服务器可能的IP均加入到白名单中，见下方代理服务器列表。此外对于代理的域名有限制，当前仅持weixin.qq.com泛域名。若开发者有其他域名代理需求，发送邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。

示例源码如下，请查看 pre > code 标签中的内容

如需在获取微信公众号access_token场景使用，请将上述ip配置到微信公众平台 -> 基本配置 -> IP白名单内，相关链接：微信公众平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，此接口以application/x-www-form-urlencoded格式发送数据而不是multipart/form-data

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以application/json格式post数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0版本之前，package.json只是一个标准的package.json，安装依赖或公共模块才需要。HBuilderX 3.0及以上版本，package.json也可以用来配置云函数。

uniCloud web控制台提供了很多云函数的设置，比如内存大小、url化、定时触发等，从HBuilderX 3.0起，在云函数的package.json里也可以编写这些设置。

开发者在本地编写云函数的设置，上传云函数，这些设置会自动在云端生效。（本地不生效）

在云端设置了非默认参数后，HBuilderX下载云函数到本地时，也会自动把设置项放入package.json中下载下来。

package.json是一个标准json文件，不可带注释。下面是一个package.json示例。

示例源码如下，请查看 pre > code 标签中的内容

其中cloudfunction-config字段是云函数配置，支持的配置如下

示例源码如下，请查看 pre > code 标签中的内容

阿里云：Nodejs12、Nodejs14、Nodejs16、Nodejs18、Nodejs20，默认Nodejs16

腾讯云：Nodejs8（即将下线，不推荐使用）、Nodejs12、Nodejs16、Nodejs18，默认Nodejs16

支付宝云：Nodejs16、Nodejs18，默认Nodejs18

阿里云Nodejs8已终止支持：终止支持阶段一：禁止新建（2024年06月01日）；终止支持阶段二：禁止新建和更新（2024年09月01日）。终止支持不影响函数继续运行。建议您及时升级。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

支付宝云与阿里云定时触发的cron表达式不支持代表年的第七位，但是在package.json内配置时仍需将第七位设置为*。

在web控制台配置trigger请参考：定时触发

package.json内统一了支付宝云、腾讯云、阿里云三家厂商的配置，三个平台都需要配置为如下形式

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。

示例源码如下，请查看 pre > code 标签中的内容

如果此云函数运行在阿里云或腾讯云nodejs8，setTimeout里面的console.log不会在本次云函数调用执行，但是可能在云函数实例再次被复用时继续执行。

如果此云函数运行在腾讯云nodejs12，setTimeout里面的console.log会在本次云函数调用内，同样的本次云函数**计费时间（与云函数GBs指标相关）**也会按照最终执行完成的时间计算（5000ms+return耗时）。但是前端无需等待5秒即可收到响应。注意：如果有未断开的长连接（例如：redis连接）会导致云函数一直运行到配置的超时时间

当在云函数package.json内的cloudfunction-config内配置了keepRunningAfterReturn: false时，可以改变腾讯云nodejs12的表现，云函数return之后将不再继续执行，未断开的长连接也不会增加云函数实际运行时间，云函数return后长连接也不会被中断，简单来说其表现和腾讯云nodejs8一致。

将上述示例中的setTimeout换成网络请求、调用其他云函数或数据库请求同理，如果在阿里云或腾讯云nodejs8直接return会导致网络请求可能无法发送（即使成功发送也是在下一次云函数实例被复用的时候），这是与传统开发不太一样的地方。

示例源码如下，请查看 pre > code 标签中的内容

由于redis需要和服务器建立连接，此连接会阻止云函数结束执行。如果没有云函数return之后还需要继续执行的需求，可以简单的在cloudfunction-config内配置keepRunningAfterReturn: false。这样redis的连接并不会中断，下次请求来时依然可以使用之前建立的连接。

如果需要return之后继续执行，那么需要在使用完毕后断开redis连接，调用redis.quit()方法即可断开连接。需要注意的是断开连接后之前建立的连接将不再可用，下个请求到来时需要使用uniCloud.redis()方法重新建立连接。

如未按照上述说明进行操作，redis连接将会一直占用云函数实例，导致云厂商持续计算云函数执行时间，可能会导致消耗大量云资源而产生额外费用

务必确定自己已理解此文档内容，因未按照文档说明使用导致的额外计费DCloud不承担任何责任

HBuilderX 2.9版本，uniCloud提供了cloudfunctions_init.json来方便开发者快速进行云函数的初始化操作。

注意：HBuilderX 3.0.0版本起不再使用cloudfunctions_init.json来初始化云函数。改为使用在云函数目录下通过package.json进行配置，具体见上个章节

不再使用cloudfunctions_init.json，内容被分散到每个云函数的package.json的cloudfunction-config字段下

package.json是一个标准json文件，不可带注释。下面是一个package.json示例

示例源码如下，请查看 pre > code 标签中的内容

cloudfunction-config说明如下

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0.0之前版本，请继续阅读下面文档

cloudfunctions_init.json形式如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 2 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 3 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

Example 4 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema?id=enum

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## 简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage/policy-tcb.html

**Contents:**
- # 简介
- # 安全规则示例
- # 配置说明
- # 云存储操作类型
- # 表达式
  - # 变量
  - # 运算符

本文档是腾讯云自定义登录的配套权限说明问题。uniCloud中并不推荐这种用法，详见。

如需在前端直接删除云存储，那么为了数据安全，需要一套权限规则，开发者可以在uniCloud web控制台上自定义安全规则，限制客户端对云存储的访问权限。本文档主要介绍如何配置安全规则以及表达式的相关说明。

示例源码如下，请查看 pre > code 标签中的内容

开发者可以在uniCloud控制台设置云存储权限。如下图所示，可以使用默认的四条规则，也可以点击切换到安全规则自行配置JSON格式的权限规则。

表达式是伪代码的语句，配置的时候不能过长。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
// 云存储
// 所有人可读，仅创建者可写
{
  "read": true,
  "write": "resource.openid == auth.uid"
}
// 非匿名用户可读，仅创建者可写
{
  "read": "auth.loginType != 'ANONYMOUS'",
  "write": "resource.openid == auth.uid"
}
```

Example 2 (json):
```json
// 云存储
// 所有人可读，仅创建者可写
{
  "read": true,
  "write": "resource.openid == auth.uid"
}
// 非匿名用户可读，仅创建者可写
{
  "read": "auth.loginType != 'ANONYMOUS'",
  "write": "resource.openid == auth.uid"
}
```

Example 3 (json):
```json
// 云存储
// 所有人可读，仅创建者可写
{
  "read": true,
  "write": "resource.openid == auth.uid"
}
// 非匿名用户可读，仅创建者可写
{
  "read": "auth.loginType != 'ANONYMOUS'",
  "write": "resource.openid == auth.uid"
}
```

Example 4 (json):
```json
// 云存储
// 所有人可读，仅创建者可写
{
  "read": true,
  "write": "resource.openid == auth.uid"
}
// 非匿名用户可读，仅创建者可写
{
  "read": "auth.loginType != 'ANONYMOUS'",
  "write": "resource.openid == auth.uid"
}
```

---

## 简介@intro | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-functions.html

**Contents:**
- # 简介
- # 云函数的分类
- # 客户端和云函数的通信
  - # clientDB方式
  - # 云对象方式
  - # 普通云函数callFunction方式
  - # 云函数URL化方式
  - # 云函数请求中的中间状态通知通道
  - # uniCloud响应体规范
    - # HBuilderX 3.6.10及之后版本的错误规范

云函数是运行在云端的 JavaScript 代码，是基于 Node.js 的扩展。

在常规的 Node API 基础上，uniCloud的云函数环境内置了uniCloud对象，这个对象内置了网络、数据库等各种API。开发者未学习过 Node.js 也没有关系，只需要看uniCloud的文档，掌握这个uniCloud对象的API即可。

每个云函数是一个js包，在云函数被调用时，由 serverless 调度系统分配硬件资源启动一个 node 环境来运行这个云函数。

在HBuilderX中可以新建云函数（HBuilderX 3.4 同时可以新建云对象）。

每个云函数是一个目录，其中普通云函数有index.js入口文件，云对象的入口文件则是index.obj.js。

一个最简单的云函数只需要这个入口js文件，在里面编写代码即可。当然也可以在这个js中require该云函数目录下的其他js、json文件。

云函数的配置文件和 npm规范 相同，在云函数目录下可新建一个 package.json 来存放配置。uniCloud云函数扩展了 package.json，增加了一些特有的配置项。详见

云函数启动后实例会保留一段时间（如15分钟），超过保留期后若该云函数一直没有被再调用，那这个实例会被释放。所以云函数有冷启动的概念。不过由于js实例的启动要比php和java更快，所以js更适合serverless方式。

云函数有若干子概念，包括 普通云函数、云对象、公共模块、clientDB的action云函数、uniCloud扩展库。

HBuilderX中uniCloud项目的云函数均在项目的uniCloud/cloudfunctions目录下，目录结构如下：

uni-app客户端和传统服务器通信时，使用uni.request的ajax请求方式。uniCloud下不再使用它，有更好的云端一体的通信方式。

uniCloud体系里，客户端和服务端的云函数通信，有4种方式：

云函数是uniCloud的基础，本质上 clientDB 和 云对象 都是建立在云函数上针对特定场景的优化。

clientDB分API方式和组件方式，此处使用API方式来演示

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，学习clientDB需另见文档clientDB

如果客户端使用uni-app开发，且向uniCloud服务空间的请求主要是为了操作云数据库（无论增删改查），那么推荐使用clientDB方式，由uni-app客户端直接操作云数据库。

如果操作数据库的同时，还需要同时执行一些云端逻辑：HBuilderX 3.6.11以前使用action云函数；从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。

云对象和clientDB最大的区别，是云对象把数据库操作（以及其他逻辑）封装在云对象的方法里面。

它无法像clientDB那样无需开发服务器代码，它仍需在客户端和云端分别写代码。但它的应用场景不受限制。上文中不适用clientDB的情况，都可以使用云对象解决。

云端云对象代码，云对象名称：testco，有一个sum方法

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个testco对象，调用它的sum方法

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX 3.5.2之前，需要URL化和定时运行时，只能使用普通云函数；在HBuilderX 3.5.2+，云对象也支持了URL化和定时运行。

官方不推荐开发者使用云函数，有相关需求推荐使用云对象替代云函数。

目前官方还未提供基于云对象的router模式的框架，有相关需求可以使用三方框架。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，需另见文档云函数callfunction方式

可以让云函数/云对象生成一个HTTP URL。这样非uni-app应用，可以通过ajax请求和云函数/云对象通信。

在 uniCloud Web控制台进行URL化配置。

云函数在执行期间可以将中间状态发送给客户端，详情参考：云函数请求中的中间状态通知通道

uniCloud响应体规范（uniCloud response format），是DCloud制定的、服务器给客户端返回json数据的一种建议格式。

云对象、clientDB、uni-id公共模块均支持此规范。

uniCloud服务器给客户端返回的数据格式一般是json，但json的格式具体是什么没有约定。比如返回错误码，是叫code还是叫errCode？错误内容是message还是errMsg？内容的国际化如何处理？

如果没有一套统一的格式，在客户端将无法编写有效的网络拦截器，无法统一处理错误。

另外，如果不同的插件，云端返回的数据格式千差万别，那使用者整合这些插件也会非常麻烦。国际化更无法落地。

为此DCloud推出了uniCloud响应体规范。

为了与uni-app前端的API错误回调风格统一，uniCloud响应体规范定义的云端返回信息（尤其是报错时）应包含errCode和errMsg。

示例源码如下，请查看 pre > code 标签中的内容

errCode在成功时应返回数字0,失败时应返回一个以插件id开头的“字符串”，每个单词以连字符（-）分割。做出这样的规定是为了防止不同插件之间出现重复错误码

以'uni-id-account-banned'错误码为例，uni-id为插件id，account-banned为错误缩写。

如果业务开发的代码并不发布插件市场，那么为了避免下载了一个市场的插件产生冲突，推荐使用不包含“-”的字符串来做errCode（插件市场的所有插件ID必须包含“-”）。

后续uniCloud会提供自动根据errCode对errMsg进行国际化处理的功能，开发者仅需保证云函数返回值满足uniCloud响应体规范即可。

errMsg用于存放具体错误信息，包括展示给开发者、终端用户的错误信息

除此之外响应体规范还包含newToken字段，用于token的自动续期（云对象接收含有newToken的响应后会自动更新storage内存储的uni_id_token及uni_id_token_expired，此行为新增于HBuilderX 3.4.13）。开发者仅在自行调用uni-id-common的checkToken等会产生新token的接口时才需要返回新token，uni-app客户端和uni-id-co之间会自动管理token及续期。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX内使用代码块returnu可以快速输入以下代码（HBuilderX 3.4.0及以上版本）:

示例源码如下，请查看 pre > code 标签中的内容

云函数支持 js 和 nodejs 的标准API，如console.log()、setTimeout()，另见nodejs官网 。nodejs版本，详见云函数运行环境

除了标准API外，云函数环境中内置了uniCloud对象，扩展了一批新API，实际开发中更常用的是uniCloud的扩展API。见下：

云函数调用uniCloud接口时（包括请求云函数、云对象、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

云函数中支持访问本服务空间下的、或经授权的其他服务空间下的，数据库。

云函数中如需要请求其他http服务，则使用uniCloud.httpclient。无需额外依赖，就可以请求任何 HTTP 和 HTTPS 协议的 Web 服务。uniCloud.httpclient返回的是一个urllib实例 。

uniCloud.httpclient.request(URL,requestOptions)

默认情况下request接口不会处理返回的数据，即不传dataType参数时会返回buffer类型的数据，如需自动解析json格式的返回结果，需要将dataType设置为"json"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为简化http请求的调用uniCloud新增了uni.request调用方法类似的http请求接口uniCloud.request。

示例源码如下，请查看 pre > code 标签中的内容

实际业务中常有使用云函数发送formdata类型数据的需求，比如微信小程序提供的一些服务端接口（图片内容安全检测、识别图片二维码等），可以参考以下示例进行发送

示例源码如下，请查看 pre > code 标签中的内容

云函数无法作为websocket服务器使用，如有相关需求可以尝试使用uni-push 2.0实现，参考：uni-push 2.0。

本章节内容介绍云函数如何作为websocket客户端使用。为简化调用方式uniCloud新增了uni.connectSocket方法类似的接口uniCloud.connectSocket。

调用此接口返回SocketTask对象，见下一章节介绍

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

以下云函数示例代码，从websocket服务器获取消息拼接后返回给客户端，如果遇到错误会抛出错误

示例源码如下，请查看 pre > code 标签中的内容

由于存在单实例多并发的情况，实例级的uniCloud对象，和每个请求request是一对多的关系。

这也造成了与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了更好的管理请求和请求相关的上下文，uniCloud提供了下面一批API。

示例源码如下，请查看 pre > code 标签中的内容

如没有配置单实例多并发，数组里只会返回一项内容。配置后可能会多项，正在并发的所有请求的requestId都会返回。

当返回多项时，在uniCloud对象上无法明确当前请求是数组中的哪一个。所以提供了其他方法来获取当前请求：

HBuilderX 4.21版本客户端上传clientInfo信息时不会将所有信息都传到云端。具体字段白名单如下：'appId', 'appLanguage', 'appName', 'appVersion', 'appVersionCode', 'appWgtVersion', 'browserName', 'browserVersion', 'deviceBrand', 'deviceId', 'deviceModel', 'deviceType', 'osName', 'osVersion', 'romName', 'romVersion', 'ua', 'hostName', 'hostVersion', 'uniPlatform', 'uniRuntimeVersion', 'uniRuntimeVersionCode', 'uniCompilerVersion', 'uniCompilerVersionCode'。如需让客户端上传更多clientInfo字段到云端，可以使用客户端api：uniCloud.setCustomClientInfo

同理，考虑到单实例多并发，uniCloud.getClientInfos()获取客户端信息也是一个数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未开启单实例多并发，那么数组只有1项。单实例多并发场景下返回正在并发的所有请求的客户端信息列表。

getClientInfos返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

除了uniCloud.getClientInfos()API，在云函数context和云对象this中，也可以直接获取当前客户端信息。

同上，为了兼容并发场景，获取云端信息uniCloud.getCloudInfos()返回的也是数组。

示例源码如下，请查看 pre > code 标签中的内容

除了uniCloud.getCloudInfos()API，在云函数context和云对象this中，也可以直接获取当前请求的云端信息。

上述3个API，都因为单实例多并发而被设计成数组方式。实际上，大多数开发者并不使用单实例多并发。

在不考虑单实例多并发时，也可以直接使用uniCloud的getRequestList、getClientInfos、getCloudInfos方法中第一个数组项。

或者在云对象的this和云函数的context里获取相关上下文信息也可以。

uniCloud的api中，有些api对应的实现，其代码体积较大，且这些功能并不是每一个云函数都会使用。为了方便开发者控制云函数的体积，设计了uniCloud扩展库的概念。

开发者可以对云函数目录点右键，管理公共模块和扩展库依赖，在其中选择要加载的扩展库。这个可视化界面对应的数据在云函数目录下的 package.json 内的extensions字段下。

注意：未引用扩展库的，使用uniCloud相应api时会报错。

以下是一个开启了redis扩展库的云函数package.json示例，注意此文件不支持注释，下方示例中的注释仅为演示

示例源码如下，请查看 pre > code 标签中的内容

云函数支持公共模块。多个云函数/云对象的共享部分，可以抽离为公共模块，然后被多个云函数引用。由于篇幅较长，详见

云函数的运行环境是 Node.js，因此我们可以使用 npm 安装第三方依赖。

注意：阿里云目前仅支持全量上传云函数（整个node_modules文件夹全部上传，会在上传前自动在本地安装依赖，不会直接使用云函数目录下的node_modules），因此提醒开发者精简依赖，否则可能会每次上传时间很慢，影响开发体验。并且太大的npm库影响云函数的运行性能。

腾讯云、支付宝云会在上传云函数后自动安装需要的npm依赖。

由于云函数环境缺少一些系统级依赖，而部分npm依赖安装时会针对不同平台进行编译安装，导致无法正常编译。

以下为已知无法在云端云函数环境中运行的npm依赖：

用法同客户端调用云函数，仍然是uniCloud.callfunction，但不支持callback形式。

示例源码如下，请查看 pre > code 标签中的内容

由于调用方不是uni-app客户端，云函数的context、云对象的this.getClientInfo等API无法获取客户端信息，包括 uni-id-token。

可以在云函数互调时手动传递 token ，或者校验调用来源（source）为云函数（function）时不验证用户 token。

云函数/云对象互相调用时调用方会通过公网访问被调用方，访问速度不如直接将逻辑放在调用方执行。使用前请确保你确实需要此功能。

HBuilderX 3.4.0版本之前云函数右键本地运行时，里面的代码再次callFunction会调用云端的云函数而不是本地云函数，此bug后续版本已修复。

除了调用三方云函数，事实上云函数还可以递归调用自己。

当一个云函数实例的资源不能满足需求，或超时时间不够用时。比如要给10万个用户发送短信，而短信发送接口一次调用最多支持50个手机号码，这样最少需要调用2000次接口才能完成；而一个云函数实例完成不了2000次接口的调用。这种场景就可以使用云函数递归调用，分解任务实现。

示例源码如下，请查看 pre > code 标签中的内容

注意：如果不小心把递归云函数写成死循环，就把云函数的内容全部删除，重新上传覆盖即可

在支付宝云与腾讯云服务空间的云函数内支持获取同账号下其他服务空间的uniCloud实例，参考：一个应用访问多个服务空间，并使用此实例调用对应服务空间的云函数。

示例源码如下，请查看 pre > code 标签中的内容

serverless是动态分配计算资源的，由此会引发的出一批特有概念：冷启动、实例、并发请求、无状态、伪全局变量。

基于云函数按需执行的特点, 函数在不被触发的时候, 计算资源是不被激活的。

当一个云函数初次被触发时，其完整过程如下：

函数被调用时，执行这些完整步骤的过程称作冷启动, 冷启动的耗时一般在一秒左右。

一个云函数实例冷启动后，serverless调度中心会保留这个实例一定时间。在实例保留期间，客户端再次请求云函数，不会触发冷启动，速度会更快。实例的详细定义见下

云函数实例和执行进程都被复用的情况下称之为热启动, 热启动性能要好非常多，因为它只有一个步骤：

如果一个云函数实例长时间没有被再次调用，则该计算实例会被回收；后续再次调用该云函数时，就会再次触发云函数的冷启动。

直观的体验表现为：隔了很久不用的云函数，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

注：冷启动虽慢但也不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

三家云厂商仍然在优化冷启动问题。目前给开发者的建议是：

实例，指云函数的一个执行环境，可以简单的理解为一个node进程。

每次客户端发起请求（request）时，serverless的调度中心会查看已启动、且空闲的实例，分配一个实例来接收这个请求。如果没有空闲实例，则新起一个实例。

新起一个实例需要一定时间，也即上文说的冷启动问题。详见冷启动

一个实例启动后，一般在1秒内就会完成请求，但serverless调度中心会保留这个实例一定时间（时间见上一节）。在实例保留期间，客户端再次请求云函数，不会触发冷启动。

也就是说，在实例保留期间，1个实例会接受多个客户端请求。

请求（request），指一次连接云函数的网络请求。不同请求有不同的上下文信息（比如客户端UA）。

所以想要获取客户端信息，一定注意不是在实例的全局对象上获取，而是需要在请求的上下文中获取。详见

在uniCloud阿里云版与支付宝小程序版中还提供了1个实例的多并发请求配置，即同一时间多个请求可以并发执行。 也就是同一时间的请求发到云函数时，没有配置单实例多并发会新开一个云函数实例，配置了单实例多并发则不会新开实例，在一个实例中增加并发。 详见单实例多并发。

一个云函数，可以同时存在多个实例。比如cf1云函数，如未配置单实例多并发，10个请求同时达到云函数，就会开10个实例。

不管开了多少实例，云函数的计费是按请求计费的。实例响应请求后到保留期结束之间，如果不发生新请求是不会计费的。

因为实例可能第一次启动，也可能已经启动，所以云函数中的js全局变量其实是伪全局变量。也就是云函数是无状态的。

在云对象中，写在module.exports = {}之前，云函数写在exports.main = async (event, context) => {}之前的变量定义，是伪全局变量。

以如下代码为例，count作为全局变量，当多次调用该云函数时，可能会出现变量累加的情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面2个示例中，实例未复用时，也就是冷启动时，count的值每次都是0；若实例被复用，则可能返回1、2、3等各种意外情况。

当然，可以用这个方法来获知一个实例被重用了多少次请求。

require由于存在缓存，也存在同样的问题。尽量不要直接修改require返回的内容。

uniCloud全局对象也是跨请求的，与请求相关的内容不应该挂载到uniCloud全局对象上。

由于上节提到的，uniCloud全局对象是实例级的、跨请求的，1个实例内uniCloud只会在冷启动时进行一次初始化。

所以与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了让开发者清晰的了解实例和请求的关系，uniCloud提供了如下方案。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是uniCloud私有云， 如果想获取与请求相关的信息，比如这次请求的客户端UA，或云函数环境信息，无法直接在uniCloud全局对象中获取。

云函数入口入参包含一个event和一个context，这两个参数和请求相关，每次有新请求到云函数实例时就会有一个新的event对象和一个新的context对象

云对象的this和event、context类似，每个请求都对应一个单独的this。

默认情况下云函数仅支持单实例单并发，即同一时间一个实例仅可为一个请求服务（不同请求同一时间访问会被分派到不同实例进行处理）。不过在uniCloud web控制台中，阿里云可以通过修改云函数单实例并发度，可以修改云函数同一时间最多能处理多少请求。

当实例并发度设置为1时，需要创建3个实例来处理这3个请求，每个实例分别处理1个请求。而每开启一个实例都会引发云函数冷启动；

当云函数的实例并发度设置为10时（即1个实例可以同时处理10个请求），只需要创建1个实例就能处理这3个请求。这样后面2个并发请求不会有因云函数实例创建带来的冷启动问题。

相关文档：云函数实例及部分变量说明 、云函数的无状态

云函数详情页面配置单实例并发度即可，支持1-100之间的数值

旧版本uni-id公共模块指uni-id-common推出之前的版本。详见

示例源码如下，请查看 pre > code 标签中的内容

不同于旧版uni-id公共模块，新版uni-id-common不可直接require后使用，必须使用createInstance方法

开启单实例多并发后的全局变量复用并非一定是坏的结果，如果你很了解此行为，也可以对此进行有效的利用

例：ip-filter 中就利用云函数全局缓存一些ip访问信息来限制单ip访问频率，可以下载示例项目体验一下

受单实例多并发的影响，云函数全局存放与本次请求有关的信息会造成混乱。因此uniCloud提供了根据当前requestId获取客户端信息和云端信息。参考以下文档

云函数是运行在云端的代码，运行环境由云服务器弹性调配，这是和传统Node.js应用很大的区别。

换言之，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合。

所以，不建议使用node的fs文件系统相关的API。建议通过云数据库、云存储、redis的方案替代。

书写云函数时应注意async、await的使用，nodejs有内置模块util可以将符合error-first形式callback的函数转换为promise形式，详情参考 ，比如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果想在云函数内使用回调形式可以让云函数返回一个promise，如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

腾讯云因为按 GBS 对云函数计费，在 node12 时，尤其要注意，如果未有效终止云函数，会一直计费

云函数运行在 node 环境中。可以使用 node api process.version 获取 node 版本。

node版本可以在云函数的package.json文件的cloudfunction-config->runtime字段进行配置，详情参考：云函数package.json

支付宝云云端云函数使用的时区是UTC+8。

阿里云和腾讯云云端云函数使用的时区是UTC+0，而不是 UTC+8，在云函数中使用时间时需特别注意。

云函数在HBuilderX本地运行时，时区则是电脑的时区，很可能是 UTC+8。建议统一使用时间戳，可以规避时区问题。

云函数除了代码，还有配置。在uniCloud web控制台 可以配置；在HBuilderX项目中，云函数根目录的package.json也是存放配置的地方。

云函数运行内存为单个云函数实例使用的内存。

支付宝云云函数默认运行内存512MB，阿里云正式版默认512MB，腾讯云云函数默认运行内存大小为256MB

计算云函数GBs资源消耗时腾讯云会以此内存*运行时间（100ms为阶梯向上取整）得到消耗量。阿里云会以实际运行时间计算GBs，不会按100ms阶梯向上取整

阿里云一般场景（比如包含数据库访问时）不建议将内存配置为128MB。如果开发起见遇到数据库响应缓慢，在排除索引等因素的影响后可以检查下是不是云函数内存配置为了128MB，如果是建议调整为256MB

腾讯云个人版及入门版套餐自2025年8月31日起云函数运行内存固定为256MB，不支持修改，详见相关公告

支付宝云定时任务触发最大支持3小时超时时间（需开启异步超时），非定时触发时超时时间为180秒，客户端请求云函数如果超出180秒云函数断开连接后会停止运行。

阿里云定时任务触发最大支持7200秒超时时间，非定时触发时超时时间为120秒，客户端请求云函数如果超出120秒云函数断开连接后会停止运行。

腾讯云定时任务触发最大支持900秒超时时间。非定时触发时超时时间为60秒，客户端请求云函数时如果超出30秒云函数断开链接后会继续运行，最大能运行到配置的超时时间。

如果超时时间仍然不够用，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

本地云函数默认超时为10秒，超时后云函数会停止运行。

修改超时时间可以在HBuilderX的设置->运行设置->云函数本地运行配置 超时时间中修改，单位为秒。

serverless默认是没有固定的服务器IP的，因为有很多服务器资源在后台供随时调用，每次调用到哪个服务器、哪个ip都不固定。

但一些三方系统，要求配置固定ip白名单，比如微信公众号的js sdk，此时只能提供固定ip地址。

腾讯云199元/月以上的套餐，提供了云函数的固定出口ip，在uniCloud Web控制台 ，创建付费的腾讯云服务空间，选择一个云函数，在云函数的详情界面可以开启固定出口ip。开启后界面上会显示可用的固定ip。拿着这个ip去需要固定ip的界面（如微信公众号管理界面）配置即可。

示例源码如下，请查看 pre > code 标签中的内容

阿里云必须使用uniCloud.httpProxyForEip发送请求才会固定出口ip，其原理是通过代理请求获得固定出口IP的能力。IP为轮转不固定，因此三方服务要求使用白名单时开发者需要将代理服务器可能的IP均加入到白名单中，见下方代理服务器列表。此外对于代理的域名有限制，当前仅持weixin.qq.com泛域名。若开发者有其他域名代理需求，发送邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。

示例源码如下，请查看 pre > code 标签中的内容

如需在获取微信公众号access_token场景使用，请将上述ip配置到微信公众平台 -> 基本配置 -> IP白名单内，相关链接：微信公众平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，此接口以application/x-www-form-urlencoded格式发送数据而不是multipart/form-data

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以application/json格式post数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0版本之前，package.json只是一个标准的package.json，安装依赖或公共模块才需要。HBuilderX 3.0及以上版本，package.json也可以用来配置云函数。

uniCloud web控制台提供了很多云函数的设置，比如内存大小、url化、定时触发等，从HBuilderX 3.0起，在云函数的package.json里也可以编写这些设置。

开发者在本地编写云函数的设置，上传云函数，这些设置会自动在云端生效。（本地不生效）

在云端设置了非默认参数后，HBuilderX下载云函数到本地时，也会自动把设置项放入package.json中下载下来。

package.json是一个标准json文件，不可带注释。下面是一个package.json示例。

示例源码如下，请查看 pre > code 标签中的内容

其中cloudfunction-config字段是云函数配置，支持的配置如下

示例源码如下，请查看 pre > code 标签中的内容

阿里云：Nodejs12、Nodejs14、Nodejs16、Nodejs18、Nodejs20，默认Nodejs16

腾讯云：Nodejs8（即将下线，不推荐使用）、Nodejs12、Nodejs16、Nodejs18，默认Nodejs16

支付宝云：Nodejs16、Nodejs18，默认Nodejs18

阿里云Nodejs8已终止支持：终止支持阶段一：禁止新建（2024年06月01日）；终止支持阶段二：禁止新建和更新（2024年09月01日）。终止支持不影响函数继续运行。建议您及时升级。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

支付宝云与阿里云定时触发的cron表达式不支持代表年的第七位，但是在package.json内配置时仍需将第七位设置为*。

在web控制台配置trigger请参考：定时触发

package.json内统一了支付宝云、腾讯云、阿里云三家厂商的配置，三个平台都需要配置为如下形式

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。

示例源码如下，请查看 pre > code 标签中的内容

如果此云函数运行在阿里云或腾讯云nodejs8，setTimeout里面的console.log不会在本次云函数调用执行，但是可能在云函数实例再次被复用时继续执行。

如果此云函数运行在腾讯云nodejs12，setTimeout里面的console.log会在本次云函数调用内，同样的本次云函数**计费时间（与云函数GBs指标相关）**也会按照最终执行完成的时间计算（5000ms+return耗时）。但是前端无需等待5秒即可收到响应。注意：如果有未断开的长连接（例如：redis连接）会导致云函数一直运行到配置的超时时间

当在云函数package.json内的cloudfunction-config内配置了keepRunningAfterReturn: false时，可以改变腾讯云nodejs12的表现，云函数return之后将不再继续执行，未断开的长连接也不会增加云函数实际运行时间，云函数return后长连接也不会被中断，简单来说其表现和腾讯云nodejs8一致。

将上述示例中的setTimeout换成网络请求、调用其他云函数或数据库请求同理，如果在阿里云或腾讯云nodejs8直接return会导致网络请求可能无法发送（即使成功发送也是在下一次云函数实例被复用的时候），这是与传统开发不太一样的地方。

示例源码如下，请查看 pre > code 标签中的内容

由于redis需要和服务器建立连接，此连接会阻止云函数结束执行。如果没有云函数return之后还需要继续执行的需求，可以简单的在cloudfunction-config内配置keepRunningAfterReturn: false。这样redis的连接并不会中断，下次请求来时依然可以使用之前建立的连接。

如果需要return之后继续执行，那么需要在使用完毕后断开redis连接，调用redis.quit()方法即可断开连接。需要注意的是断开连接后之前建立的连接将不再可用，下个请求到来时需要使用uniCloud.redis()方法重新建立连接。

如未按照上述说明进行操作，redis连接将会一直占用云函数实例，导致云厂商持续计算云函数执行时间，可能会导致消耗大量云资源而产生额外费用

务必确定自己已理解此文档内容，因未按照文档说明使用导致的额外计费DCloud不承担任何责任

HBuilderX 2.9版本，uniCloud提供了cloudfunctions_init.json来方便开发者快速进行云函数的初始化操作。

注意：HBuilderX 3.0.0版本起不再使用cloudfunctions_init.json来初始化云函数。改为使用在云函数目录下通过package.json进行配置，具体见上个章节

不再使用cloudfunctions_init.json，内容被分散到每个云函数的package.json的cloudfunction-config字段下

package.json是一个标准json文件，不可带注释。下面是一个package.json示例

示例源码如下，请查看 pre > code 标签中的内容

cloudfunction-config说明如下

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0.0之前版本，请继续阅读下面文档

cloudfunctions_init.json形式如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 2 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 3 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

Example 4 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/price?id=price-info

**Contents:**
- # 概述
- # 阿里云
  - # 免费服务空间
  - # 包年包月套餐
    - # 套餐变配
    - # 包年包月套餐转按量计费
  - # 按量计费
  - # 按量计费每日资源上限设置
    - # 资源上限设置特别说明
  - # 各项资源释义说明

uniCloud的定价、套餐内容、服务SLA，是由云厂商直接公布的。DCloud公司不会加价。uniCloud已经上线近5年，DCloud一直以良心方式服务开发者，努力降低应用的开发门槛、提高应用的开发效率。

付费用户享受云厂商提供的服务协议SLA，详见

阿里云正式版需要使用HBuilderX 3.6.5+（正式版）或3.6.10+（Alpha版）或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

阿里云提供1个免费空间，付费空间提供包月、按量计费两种计费方式，具体说明如下：

包年包月套餐，适于业务稳定、套餐资源使用均衡的场景。

如果你难以预估会消耗多少云资源，或者业务波峰波谷变化较大，或者套餐中某些项目不够用、某些项目又用不完，此时推荐使用按量计费。

阿里云为每个账号提供了1个免费服务空间，以方便产品开发测试及体验。具体额度请阅读下方包年包月套餐中的开发者版。

套餐中的资源超标后服务空间会停服，需要及时升配或转按量计费才能恢复。

阿里云包年包月套餐支持升配和转换按量计费，不支持降配，且按量计费空间不支持转换为包年包月套餐。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud按量余额，以用于按量计费账单扣费。

注意： 按量计费不支持转换为包年包月，该操作不可逆，请谨慎操作。

按量计费，意味着不是每个月支付固定费用，而是根据使用量付费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从阿里云预存余额中扣除。

如果预存余额不足，则服务空间将不可用，需要立即充值。

如您担心按量计费会造成不可控的费用上升，也可以为各项资源设置用量上限。

资源上限可在web控制台 服务空间详情进行设置，该设置实时生效。

每项资源指标的数据更新延迟时间不同，当数据更新且某项资源用量超过阈值时，则该项服务便会单独停用。

上述指标，容量是累加的，其他指标则是按日计算。

例如，设置了每日云存储下载次数不能超过1万次。如当日超过该下载次数，则在超过的6小时后停止云存储的下载功能。

该设置为阿里云实验阶段功能，资源用量更新有延迟，待资源更新后达到设置的资源用量上限时，才会执行管控。管控执行亦有延迟性，所以存在实际用量超设置上限情况，需特别说明：

因上游储备不足，目前uniCloud阿里云版仍有一些限额。DCloud会持续推动限额的解除。目前有需求的开发者需向DCloud人工联系申请提高限额。

目前单个账号可创建20个正式版服务空间，如有更多需求需发邮件到service@dcloud.io申请。此外集合数量限制也可申请提升。邮件模板见下方：申请解除限制邮件模板

示例源码如下，请查看 pre > code 标签中的内容

云存储数据处理：图片裁剪、视频截帧等功能。现阶段免费，但不排除后续收费可能。

通过扩展数据库解除限制：若数据库集合数量、索引数量等限制已无法满足您的需求，则可以使用扩展数据库，扩展数据库没有内置数据库相关的限制。扩展数据库介绍

套餐指标超限： 包月套餐各项资源用量如有指标超出上限时，该项指标服务便会停服，其他服务不受影响。比如云存储CDN流量超套餐上限，则云存储文件无法访问，其他服务正常。如需恢复，可升级套餐来获取更高套餐额度或转换为按量计费，升配或转按量计费后，资源恢复大约有10分钟左右延迟。

套餐到期停服： 包月套餐在到期当天的0点10分左右开始停服，停服后服务空间无法正常使用，资源会保留15天。15天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 按量计费空间没有到期时间，是在账户欠费时开始停服。阿里云在每天上午9点左右出前一日账单，出账后如果账户发生欠费，按量计费服务空间则会被停服无法正常使用，资源会保留15天。15天内操作余额充正服务恢复正常（续费后大约有10分钟左右延迟），15天后会销毁空间资源且无法找回。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

腾讯云于2022年8月12日更新了计费方式。

新计费模式下，统一采用基础套餐+超限按量计费的模式，开发者可先购买带有一定配额的基础套餐，超出套餐配额部分按使用量付费。

腾讯云服务空间套餐将于2025年6月30日进行升级，升级针对部分套餐额度和能力进行了调整，详见相关公告

套餐在有效期内可随时进行升配，升配生效大约有10分钟延迟。在服务空间到期当天可操作降配，如已过期，需先续费后方可进行变配操作。

以下条目的消耗不属于套餐内资源，会从账号的腾讯云余额进行扣除。

注：当包年包月服务空间升级新套餐时，如果已开通前端网页托管，则前端网页托管会自动转为按量计费，请确保账号余额充足！

套餐到期第二天服务空间会进入隔离状态，服务空间不可用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），7天后会销毁空间资源且无法找回。

当服务空间通用按量余额欠费时，服务空间的云函数日志及超限按量将会自动关闭。如果服务空间套餐资源已超上限，则服务将会停服不可用。服务空间通用按量余额充正后需手动开启相关服务。

注意：部分老账号可能使用的是腾讯云按量余额，查看如何确认服务空间使用的余额类型？

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

支付宝云需要使用3.97+或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

支付宝云支持基础套餐+超限按量计费及纯按量计费两种计费模式，开发者可先购买带有一定配额的基础套餐（免费版也可以），超出套餐配额部分按使用量付费，也可以直接开通按量计费空间。

开通支付宝云服务空间之前，需DCloud账号实名认证的身份信息已有对应的支付宝账号。如果DCloud账号实名认证为企业，则需要注册该企业对应的支付宝账号，点此可前往注册支付宝 。目前暂不支持民办非企业单位。

支付宝云包年包月套餐支持升降配，升配或降配套餐，不会影响原来套餐的有效时长。

升降配的差价计算规则：高规格套餐的剩余时长价格 - 低规格套餐的剩余时长价格。剩余时长计算单位为月，剩余时长不足一个月时按一个月计算。

升配举例： 将套餐A升级至套餐B，假设原套餐A已经购买了3个月，在第2个月发起升配。则需要补充第2个月和第3个月的差价（不满1个月按1个月算） 即：补充差价 = 2 *（套餐B价格-套餐A价格），支付成功后，10分钟左右生效。

降配举例： 将套餐A降级至套餐B，假设原套餐 A 已经购买了3个月，在第2个月中发起降配。则自动退还第2个月后半个月和第3个月的差价 即：退还差价=1.5*（套餐A价格-套餐B价格），支付成功后，当月即生效。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud支付宝云账号余额，以用于按量计费账单扣费。

按量计费空间也可以转换为包年包月套餐（灰度中，后续会逐步开放），计费模式的转换一个月最多可操作三次。

支付宝云支持套餐+超限按量计费以及纯按量计费空间两种计费模式，即套餐用量超限额后、纯按量计费空间产生用量后，都会按照按量计费规则计费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从支付宝云按量余额或服务空间通用余额中扣除。查看如何确认服务空间使用的余额类型？

如果预存余额不足，则服务空间将不可用，需要立即充值。

资源上限可在web控制台 服务空间详情进行设置，该设置为每项资源用量基于套餐额度的百分比，该设置实时生效。

上述指标，在保证金及按量余额充足的情况下，可设置0-300%，0为无限制。

例如，设置了云存储下载次数为20%。如果下载次数超过 套餐云存储下载次数额度*0.2 后，在超过的2小时后会将服务空间停服。

支付宝云内置数据库有一定的兼容性问题，大致表现如下：

如果想要使用支付宝云的同时避开这些兼容性问题，推荐使用扩展数据库，扩展数据库是DCloud推出的用来解决内置数据库现有问题的解决方案。同时为您的业务提供高性能、高可用的数据库服务。查看详情

为了解决域名备案问题，支付宝云服务空间在过去90天累计消费满100元可分配一个阿里云备案码，消费满200元可分配两个阿里云备案码（需购买套餐或消耗余额，仅充值余额不算）。账单T+1出账，每个空间最多可申请两个备案码。

备案码申请入口：uniCloud控制台 --> 支付宝云服务空间详情 --> 扩展服务 --> 备案码管理，符合条件的服务空间可点击“申请备案码”来申请。申请成功后，再在列表页面点击“备案码授权“按钮，授权备案码给阿里云账号。这样就可以在阿里云域名备案页面输入备案码了。

阿里云官网对接入备案的域名有要求，会定期检查域名是否接入阿里云相关服务（即域名是否解析到阿里云服务器），未接入可能会被要求整改或被取消备案。针对这种情况，可以将一个二级域名绑定到uniCloud阿里云或支付宝云服务空间然后配置cname解析。

注意：申请备案码后服务空间不支持申请销毁退费

套餐指标超限： 包月套餐各项资源用量如有指标超上限时，服务空间会被停服。超上限的资源用量如果大于1分钱则会出账并从支付宝按量余额中扣除，如余额不足则会欠费。

套餐到期停服： 包月套餐在到期后第二天开始停服，停服后服务空间无法正常使用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 支付宝云在每天上午10点左右出前一日账单（T+1），出账后如果账户发生欠费，则无法操作新购、续费及变配并停服所有支付宝云服务空间，欠费后第7天释放所有按量计费服务空间。欠费充值余额正常后，大于有5分钟延迟来恢复停服空间。

服务空间停服后，云存储、数据库、前端网页托管等占用的容量如果超套餐用量仍会产生按量计费账单。如果开通了按量计费Redis，停服期间Redis实例会继续保留，同时仍会收取Redis按量费用。

注意： 如果一个支付宝关联了多个DCloud账号（最多可绑定5个）且支付宝云按量余额独立存在（无法合并至服务空间通用按量余额），当其中一个DCloud账号的支付宝按量余额欠费时，该支付宝账号关联的所有DCloud账号服务空间都会停服。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

按量计费时，涉及按量余额和保证金的概念。包年包月套餐不涉及这2个概念。

按量余额已升级为服务空间通用余额。由于历史原因，部分老账号下可能存在多个按量余额（阿里云按量余额、腾讯云按量余额、支付宝云按量余额），可升级合并为服务空间通用余额。查看如何进行按量余额合并

按量余额指开发者使用按量计费时提前充值的金额，发生资源消耗后，费用会从余额里扣除。

因按量计费空间不是实时计费，而是隔天出账，所以可能出现某天消耗过大、余额不足以支付昨日账单的情况。此时就会发生欠费。

开发者欠费时，DCloud仍需要向云厂商缴纳欠费。所以为了避免开发者不缴纳欠费，DCloud收取了200元保证金。

当开发者不再使用按量计费服务空间时，保证金可以退还。

由于保证金可以申请退还，所以不能申请开具发票，但可申请开具收据，申请方式：发送邮件到 fapiao@dcloud.io，一般15个工作日可开具，邮件内容：

示例源码如下，请查看 pre > code 标签中的内容

退还保证金申请路径：uniCloud控制台费用中心 自助申请退还。

申请时，如果保证金订单付款时间距今已未超出第三方支付原路退还时间（365天内），则原路实时退还； 否则，在申请时需填写收款支付宝的账号及姓名，我们将在1-3个工作日左右进行审核并操作支付宝转账来退还保证金。

当保证金充值订单付款方式为对公打款时，无法在线自助申请退还，需使用uniCloud注册邮箱发送邮件到 service@dcloud.io来申请，邮件内容模板：

示例源码如下，请查看 pre > code 标签中的内容

注意：如果您注册uniCloud账号使用的是qq号@qq.com这类邮箱，发送邮件时，请勿使用qq邮箱的域名邮箱，需更换为qq号@qq.com 这种邮箱发送邮件。

uniCloud提供了多维度、多渠道的资源监控及告警服务，监控告警设置入口：https://unicloud.dcloud.net.cn/pages/product-alarm/rule-list 。

uniCloud的监控告警服务，支持的资源项包括：

当你的线上系统故障时，可以参考此文档判断责任归属：如何判断是DCloud或云厂商（支付宝云、阿里云、腾讯云）的问题

贵。没有免费版，导致入门门槛高。稳定，商用保障强，因为与微信云开发复用，质控团队投入较大。适合愿意付出更多成本来追求稳定性的企业用户。

便宜。有一个免费空间，入门门槛低。较稳定。自研的数据库oceanBase在兼容MongoDB语法方面做的不够完善。适合追求性价比，且愿意适配oceanBase写法的开发者。

便宜。有一个免费空间，入门门槛低。稳定性在3家中最低，质控团队较小。三家中唯一直接使用MongoDB的厂商，MongoDB语法兼容性最好。适合对稳定性不敏感的开发者。

提示：上表中，如果云数据库改用扩展数据库，则没有上面数据库的限制。扩展数据库介绍

_id 在原生 MongoDB 中是24位的 ObjectId 类型，注意此类型在数据库存储时非字符串，通过该字段进行正则查询是会报错的

阿里云的数据库使用的是原生的 MongoDB，_id 是24位的 ObjectId 类型

腾讯云的数据库使用的是基于腾讯云改造的 MongoDB，_id 是32位的 字符串类型

支付宝云数据库使用的是基于支付宝云自研的兼容MongoDB协议的数据库，_id是24位的字符串类型，且在支付宝云数据库中不存在ObjectId 类型

如果在阿里云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库会强制转 ObjectId 类型，且会出现大写转小写的情况

如果在腾讯云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库部分情况下会强制转 ObjectId 类型，且还会导致根据该字段查询表数据时无法查到数据的问题

目前可以使用云数据库的导入导出进行迁移，迁移数据库之前可以使用导出db_init.json功能将所有集合及索引导出。再使用数据导入导出功能进行迁移。导入导出请参考：数据导入导出和备份

也可以直接使用第三方封装好的插件：unicloud数据库一键搬家工具，支持阿里云与腾讯云互转。支持跨账号转。

迁移数据可以通过在腾讯云服务空间导出数据表为json文件，在阿里云服务空间导入json文件到表的方式进行迁移。

由于此前腾讯云并未完全支持ObjectId类型的数据，在阿里云迁移到腾讯云时需要注意处理一下ObjectId类型的数据，包括自动生成的_id字段以及关联到其他表的_id的字段。简单来说就是将导出的数据内的ObjectId类型的数据处理成字符串且不满足ObjectId的格式。

示例源码如下，请查看 pre > code 标签中的内容

以下为一个简单的脚本示例用于处理导出的json文件

如果将此文件存储为parse.js，使用node parse.js 输入文件相对或绝对路径 输出文件相对或绝对路径即可处理导出的json文件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 2 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 3 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 4 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

---

## unicloud-db组件简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-db?id=props

**Contents:**
- # unicloud-db组件简介
- # 属性
- # v-slot:default
- # collection
- # where
- # orderby
- # loadtime
- # 事件
- # ssr-key
- # 方法

<unicloud-db> 组件是一个数据库查询组件，它是对clientDB的js库的再封装。

前端通过组件方式直接获取uniCloud的云端数据库中的数据，并绑定在界面上进行渲染。

在传统开发中，开发者需要在前端定义data、通过request联网获取接口数据、然后赋值给data。同时后端还需要写接口来查库和反馈数据。

有了<unicloud-db> 组件，上述工作只需要1行代码！写组件，设组件的属性，在属性中指定要查什么表、哪些字段、以及查询条件，就OK了！

HBuilderX中敲下udb代码块，得到如下代码，然后通过collection属性指定要查询表“table1”，通过field属性指定要查询字段“field1”，并且在where属性中指定查询id为1的数据。查询结果data就可以直接渲染在界面上。

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db> 组件尤其适用于列表、详情等展示类页面。开发效率可以大幅度的提升。

<unicloud-db> 组件的查询语法是jql，这是一种比sql语句和nosql语法更简洁、更符合js开发者习惯的查询语法。没学过sql或nosql的前端，也可以轻松掌握。jql详见

<unicloud-db> 组件不仅支持查询。还自带了add、remove、update方法，见下文方法章节

<unicloud-db> 由原 <uni-clientdb>插件 升级而来，从 HBuilderX 3.0 起<unicloud-db>内置到框架，与小程序基础库版本无关。

如果需要 HBuilderX3.0 以下版本使用clientDB组件，则需要从插件市场单独下载<uni-clientdb>插件，下载地址为：https://ext.dcloud.net.cn/plugin?id=3256 。但仍然推荐升级HBuilderX 3.0+。

TODO：暂不支持in子查询功能。后续会补充

注意：page-current/page-size 改变不重置数据(page-data="replace") 和 (loadtime="manual") 除外，collection/action/field/getcount/orderby/where 改变后清空已有数据

比如云数据库有个user的表，里面有字段id、name，查询id=1的数据，那么写法如下：

注意下面示例使用了getone会返回一条对象形式的data，如不使用getone，data将会是数组形式，即多一层

示例源码如下，请查看 pre > code 标签中的内容

注意：除非使用admin账户登录操作，否则需要在 uniCloud 控制台对要查询的表增加 Schema 权限配置。至少配置读取权限，否则无权在前端查询，详见 DB Schema

示例源码如下，请查看 pre > code 标签中的内容

提示：如果不指定分页模式， data 为多次查询的集合

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

where中指定要查询的条件。比如只查询某个字段的值符合一定条件的记录。

组件的where属性，与clientDB的JS API是一致的，且内容较多，所以详见js API中相关jql文档：详情

但组件与js API有一个差别，就是组件的属性中若使用js中的变量，需额外注意。

例如查询uni-id-users表，字段username的值由js变量指定，有如下几种方式：

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

方式2. 不在属性中写，而在js中拼接字符串

示例源码如下，请查看 pre > code 标签中的内容

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述示例使用的是==比较符，如需进行模糊搜索，则使用正则表达式。插件市场提供了完整的云端一体搜索模板，搜索类页面无需自行开发，可直接使用。详见

示例源码如下，请查看 pre > code 标签中的内容

再次强调，where条件内容较多，组件和api用法相同，完整的where条件文档在api文档中，另见：JQL文档

格式为 字段名 空格 asc(升序)/desc(降序)，多个字段用 , 分割，优先级为字段顺序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

load事件在查询执行后、渲染前触发，一般用于查询数据的二次加工。比如查库结果不能直接渲染时，可以在load事件里先对data进行预处理。

示例源码如下，请查看 pre > code 标签中的内容

数据库里的时间一般是时间戳，不能直接渲染。虽然可以在load事件中对时间格式化，但更简单的方式是使用<uni-dateformat>组件 ，无需写js处理。

error事件在查询报错时触发，比如联网失败。

示例源码如下，请查看 pre > code 标签中的内容

发行 H5 ssr 时有效，用于保证服务器端渲染和前端加载的数据对应

默认值：根据 (页面路径 + unicloud-db 组件代码中的行号)生成的唯一值

注意：页面同时出现2个及以上 unicloud-db 组件需要配置此属性，且要保证值整个应用唯一

当 <unicloud-db> 组件的 manual 属性设为 true 时，不会在页面初始化时联网查询数据，此时需要通过本方法在需要的时候手动加载数据。

示例源码如下，请查看 pre > code 标签中的内容

一般onLoad因时机太早取不到this.$refs.udb，在onReady里可以取到。

举例常见场景，页面pagea在url中获取参数id，然后加载数据

请求地址：/pages/pagea?id=123

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.loadData({clear: true}, callback)，

可选参数 clear: true，是否清空数据和分页信息，true表示清空，默认false

callback 是回调函数，加载数据完成后触发（即使加载失败）

示例源码如下，请查看 pre > code 标签中的内容

在列表的加载下一页场景下，使用ref方式访问组件方法，加载更多数据，每加载成功一次，当前页 +1

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.remove(id, options)

udb为unicloud-db组件的ref属性值

在列表页面，如果想删除一个item，原本要做很多事：

为减少重复开发，unicloud-db组件提供了remove方法，在列表渲染时绑定好index，直接调用remove方法即可一行代码完成上述5步。

首先在列表生成的时候给删除按钮绑定好id：

示例源码如下，请查看 pre > code 标签中的内容

然后confirmDelete方法里面只有一行代码：

示例源码如下，请查看 pre > code 标签中的内容

clientDB组件的remove方法的参数只支持传入数据库的_id进行删除，不支持其他where条件删除。

参数传入的_id支持单个，也支持多个，即可以批量删除。多个id的格式是：

示例源码如下，请查看 pre > code 标签中的内容

在uniCloud的web控制台的DB Schema界面，可自助生成数据表的admin管理插件，其中有多行数据批选批删示例。

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.add(value, options)

udb为unicloud-db组件的ref属性值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.update(id, value, options)

udb为unicloud-db组件的ref属性值

使用unicloud-db组件的update方法，除了更新云数据库中的数据外，也会同时更新当前页面的unicloud-db组件中的data数据，自然也会自动差量更新页面渲染的内容。同时update方法还封装了修改成功的toast提示。

示例源码如下，请查看 pre > code 标签中的内容

第一个参数 id 是数据的唯一标识，第二个参数 value 是需要修改的新数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在js中，获取<unicloud-db> 组件的data的方法如下：

示例源码如下，请查看 pre > code 标签中的内容

如果修改了dataList的值，组件渲染的界面也会同步变化。

但是在浏览器控制台里无法使用this来打印查看数据，为此特别新增了unidev.clientDB.data方法以优化调试体验。

H5平台，开发模式下浏览器控制台输入 unidev.clientDB.data，可查看组件内部数据，多个组件通过索引查看 unidev.clientDB.data[0]

联表查询有以下两种写法，对于数据量稍大的表推荐使用多个临时表组成的数组作为collection，可以在主表的getTemp内先进行过滤减小联表时的性能消耗。

更多关于联表查询的内容请参考：JQL联表查询

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件简化了列表分页的写法，只需简单的配置每页需要多少数据（默认是20条），不管是数据库的分页查询还是前端的列表分页展示，都自动封装了。

列表分页有2种模式，一种是手机上常见的拉到底部加载下一页，另一种是pc常见的底部列出页码，点击页码跳转页面。

下面的示例代码没有使用uList组件，实际开发时建议使用uList组件来避免长列表的性能问题。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用分页控件，常见于PC端。在uniCloud Admin 中，有完整的分页展示数据、新增删除数据的示例代码。

<unicloud-db> 组件支持嵌套。

子组件中访问父组件 data 时，需options传递数据

如下示例演示了2个组件的嵌套，以及在子组件中如何访问父组件 data

示例源码如下，请查看 pre > code 标签中的内容

完整项目示例见插件市场的示例项目: https://ext.dcloud.net.cn/plugin?id=2574

**Examples:**

Example 1 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 2 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 3 (json):
```json
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 4 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

---

## 简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/hosting.html

**Contents:**
- # 简介
- # 案例
- # 开通
- # 使用
- # 基础配置
  - # 配置域名
    - # 域名备案
  - # 路由规则
  - # 缓存配置
  - # 刷新缓存

DCloud为开发者提供了uni发布平台，包括网站发布、App发布和统一门户页面。

前端网页托管基于uniCloud的能力，为开发者的html网页提供更快速、更安全、更省心、更便宜的网站发布。

首先开发者需要开通uniCloud，登录https://unicloud.dcloud.net.cn/ 。

最后在上述网页左侧导航点击前端网页托管，即可开始使用。

前端网页托管和云函数没有绑定关系，可以和云函数部署在一个服务空间，也可以是不同的空间，甚至是不同云服务商的空间。

开通后，需要把开发者的前端网页，上传到uniCloud的前端网页托管中。

方式1. 通过uniCloud控制台 ，在web界面上传。

上传时，可以按文件上传，也可以按文件夹上传。

如果是按文件夹上传，可以选择上传后的目录是否包含上传文件夹的根目录。

方式2. 通过HBuilderX工具上传。

HBuilderX 2.8+起，支持在HBuilderX中直接上传前端网页到uniCloud阿里云版；3.5.1起，支持uniCloud腾讯云版。

HBuilderX 2.8.9+，支持前端网页托管管理器管理uniCloud阿里云版，3.5.1起，支持uniCloud腾讯云版。

在菜单视图中，或者在左下角状态栏中，点击前端网页托管，可在左侧打开前端网页托管管理器。如下图

在前端网页托管管理器中，可以看到当前用户的服务空间列表，置灰表示该服务空间还没有开通前端网页托管，点击后可根据提示开通。（如上图中置灰的ali1服务空间）。

点击可用的服务空间，在右侧可以看到远端的资源管理器，把本地文件拖进入，即可上传文件。

本章节介绍前端网页托管提供的各种配置项目说明。其中配置域名、网站首页、404页面，是阿里云和腾讯云均支持的，其他配置仅腾讯云支持。

前端网页托管，自带一个测试域名，仅用于产品体验及测试可快速体验前端网页部署的完整流程，该域名有如下限制：

业务如要上线商用，请配置自己的正式域名，配置自己的正式域名后，将不受上述测试域名的限制。（尤其注意阿里云测试域名是公共的，任意一个服务空间如果有上传恶意文件被投诉，会导致测试域名被微信内置浏览器整体禁封）

1、登录uniCloud控制台 。 2、进入前端网页托管页面，选择【基础设置】，单击【添加域名】，进行域名添加，（注意：域名是需要自行购买的）如下图所示：

3、添加后，系统会自动分配一个 CNAME 域名，CNAME 域名不能直接访问，您需要在域名服务提供商处完成 CNAME 配置（将添加的域名CNAME到此域名），配置生效后，新域名即可使用。

阿里云现已支持http强制跳转https，在上述添加界面打开对应开关即可

如果你已经有备案过的域名，直接解析过来即可；如果你要新注册域名，首先自行在网上购买，然后注意域名如果想在国内正常绑定阿里云或腾讯云，需要域名备案。 这里的备案流程和传统云主机略有不同，涉及uniCloud没有固定ip的问题。

域名如果使用https，则需要证书。证书签发后，可下载到本地，然后将内容复制黏贴到uniCloud web控制台。

注意：各运营商下载证书的后缀可能不同，一般来说，.key文件对应私钥，.pem或.crt文件对应证书。这几种类型文件都是文本内容，可选择记事本打开查看内容。

务必注意，如果你是在腾讯购买并备案的域名需要保留一个到腾讯ip的解析，否则备案会被撤销，阿里云同理。具体细节可以咨询购买域名的云厂商

如需在阿里云正式版支持history模式，请将404页面配置为网站首页。注意正式版404页面不支持目录，即阿里云仅能在根目录下支持history模式

例：将404错误码重定向至index.html，需做如下配置（uni-app项目使用history模式发行到h5时可以使用此配置）：

例：当您删除了images/文件夹（即删除了具有前缀images/的所有对象）。您可以添加重定向规则，将具有前缀images/的任何对象的请求重定向至test.html页面。

例：当您将文件夹从docs/重命名为documents/后，用户在访问docs/文件夹会产生错误。所以，您可以将前缀docs/的请求重定向至documents/。

腾讯云需要填写要刷新的链接，针对填写的链接进行刷新。阿里云对默认域名和自定义域名一键刷新。支付宝云需填写要刷新的文件夹或文件路径，以/结尾。

防盗链支持域名 / IP 规则，匹配方式为前缀匹配（仅支持路径情况下，域名的前缀匹配不支持），即假设配置名单为www.abc.com，则www.abc.com/123匹配，www.abc.com.cn不匹配；假设配置名单为127.0.0.1，则127.0.0.1/123也会匹配。 防盗链支持通配符匹配，即假设名单为*.qq.com，则www.qq.com、a.qq.com均会匹配。

用户端 IP 匹配黑名单中的 IP 或 IP 段时 ，访问 CDN 节点时将直接返回403状态码。

用户端 IP 未匹配白名单中的 IP 或 IP 段时 ，访问 CDN 节点时将直接返回403状态码。

注意：腾讯云和支付宝云的默认域名不限制IP访问数量，故不需要加IP白名单

为保障默认域名不被滥用，阿里云对默认域名做出了如下限制：每天前10个IP可以直接访问，超出10个IP后需要配置IP白名单才可以访问

仅支持配置ipv4，可以配置IP或者IP网段，掩码位数取值范围24-31。最多可同时配置三个，多个之间用逗号隔开，如：123.120.5.235/24,123.123.123.123

当访问IP超限或不在白名单时，前端网页托管将拒绝访问请求，并在页面输出错误码为ClientIpNotAllowed的提示：Your clientIp xxx does not in the whitelist.

您可以通过配置自定义域名并使用自定义域名访问来规避此问题。

web浏览器有跨域限制，A域名的网站如果通过js请求另一个域名B，且另一个B域名并没有放开跨域策略，那么浏览器就会报跨域错误。

在前端网页托管里，托管前端网页的网站就是A域名。要连接的服务器接口就是B域名。

也就是业务后台也在uniCloud的云函数或云对象上。此时需要在uniCloud的web控制台 的跨域配置中，把A域名填写在Web安全域名中。

服务空间已默认支持localhost及前端网页托管默认域名跨域请求云函数，如果需要使用内网地址或者前端网页托管绑定的自定义域名访问云函数，需单独添加跨域设置。内网地址需填写带端口的完整地址，如192.168.10.11:5173。

阿里云跨域配置支持通配符*，即所有域名均可请求云函数，最多可添加9条跨域配置规则，其他云厂商不支持仅配置通配符*。腾讯云跨域配置生效较慢，需要10分钟左右。

需要在开发者自己的传统服务器上配置跨域，允许A域名跨域访问自己。

如果在更新页面后浏览器访问到的仍是旧页面，可以通过如下流程排查

uni-app项目根据路由模式不同需要做不同的配置

使用hash模式时，无需特别的配置即可正常使用

手动部署uni-app项目时需要注意将文件部署在配置的h5基础路径下。HBuilderX一键部署时会自动按照manifest.json内配置的基础路径进行部署

如果部署多个项目到一个服务空间可以使用不同的基础路径来区分，需要注意的是这多个项目中只有一个项目可以使用history模式。

以一个admin项目和一个用户端项目为例，可以将用户端项目部署在前端网页托管的根目录下，admin项目部署在/admin目录下。通过https://xxx.com/访问用户端项目，通过https://xxx.com/admin/来访问admin项目

阿里云前端网页托管在绑定自定义域名后，支持配置CDN安全策略：https://doc.dcloud.net.cn/uniCloud/cdn-security-policy.html

---

## uniCloud概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/

**Contents:**
- # uniCloud概述
  - # uniCloud 的价值
  - # 看视频，只需25分钟，快速入门uniCloud
  - # uniCloud是什么和不是什么
  - # 什么是serverless？
  - # uniCloud为何可降低云服务租用成本
  - # uniCloud降低前端掌握后端的门槛
  - # uniCloud如何提升10倍开发效率？
    - # 一个故事
    - # 第一层提效：提供众多现成的轮子

uniCloud 是 DCloud 联合阿里云、腾讯云、支付宝云，为开发者提供的基于 serverless 模式和 js 编程的云开发平台。

uniCloud 的 web控制台地址：https://unicloud.dcloud.net.cn

uniCloud为每个开发者提供2个免费服务空间（阿里云和支付宝云各1个），让你也可以拥有自己的服务器。

uniCloud是DCloud在阿里云、腾讯云、支付宝云等的serverless服务上封装而成的。

它包含IaaS层（由阿里云、腾讯云、支付宝云提供硬件和网络）和PaaS层（由DCloud提供开发环境）。

开发者可以自主选择uniCloud的硬件和网络资源的供应商，在不同云厂商之间切换。

开户和付费虽然通过DCloud渠道，但实际上开发者自动在云厂商处建立了账户和充值了余额。价格是云厂商的标准定价，DCloud只获取云服务厂商的返佣。

开发时虽使用DCloud的工具，但应用上线时，客户端是直连阿里云或腾讯云的serverless，不经由DCloud的服务器。

serverless是目前很火的概念，它是下一代云技术，是真正的“云”。

传统的云服务，让开发者免于购买实体服务器硬件，改为购买虚拟机。但开发者仍然要自己装操作系统、web服务器、数据库，自己处理热备，自己新购服务器来应对高并发，自己抗DDOS攻击...

真正的云计算，就像用水用电，没有复杂的门槛，即用即有、按需付费。

简单回顾下用电的历史。几十年前，很多单位都有专门管电的工程师，当单位的电力负荷不够时，就需要找这个管电的工程师扩容发电机。

现在这个管电工程师的岗位已经淘汰了，电已经变成随用随取、按需付费了。

传统云模式下，开发商仍然需要一个管服务器的工程师，当用户量激增或被攻击时，甚至需要半夜把工程师叫醒来扩容。这当然不合理。

serverless的云，真正的把计算、存储的能力进行了云化，开发者只需要按量租用这些计算和存储能力，再也不用关心扩容和攻击。

开发者不再有“服务器”的概念，因为没有一台具体的机器。就像现在的你再也找不到自己的发电机一样。

当用户量激增时，开发者什么都不用做，系统自动承载更高并发。开发者只需要按照对资源的消耗付费即可。

同理，如果没有用户使用，即没有资源消耗，则根本无需为云资源付费。

开发者写好云端业务代码，即js编写的云函数，通过HBuilderX部署到uniCloud上即可。

云端庞大的serverless资源池，有无数个node进程待命。当手机用户发起请求时，serverless系统会调配闲置的资源来运行开发者相应的云函数。

serverless在国外兴起，但国内的发展速度已经超过了国外。微信、支付宝、百度、抖音、快应用联盟都上线了自己的serverless云开发。

目前国内已经有超过60万开发者在使用serverless云开发，包括腾讯、阿里、DCloud的很多自有业务都在使用。

就像uni-app可跨端一样，uniCloud可跨云。基于uniCloud，无需担心使用云开发被绑定到专用的小程序平台。uni-app + uniCloud 是跨端跨云的开发方案。

1、传统云服务的租用，按占用的硬件资源的上限值+固定时长来租用。

传统云是按配置买服务器，买了之后不管用不用都要交钱。而serverless是按量计费，如果没有使用，一分钱都不用交。

传统云选择CPU和内存的配置，不到满配时，资源是浪费的，接近满配就需要立即扩容新的配置。

serverless不是传统云，它不需要开发者选择CPU和内存配置，也没有操作系统的选择。开发者编写云函数代码，上传到uniCloud的阿里云版或腾讯云版。

阿里云和腾讯云搭建了巨大的serverless资源池，有众多node进程用于云函数的运行。

这些资源是复用和共享的，并不存在某个开发者租用了3G CPU和8G内存，这些硬件就只能为他所用。

因为共享大资源池，云服务厂商的成本大幅下降，开发者无需为闲置资源付费，云函数被调用才计费。

从技术原理上serverless就有明显成本优势，所以租用serverless比租用传统云要便宜的多。

在阿里云和腾讯云的官网可以看到长长的收费产品列表，比如负载均衡、高防、cdn回源、安全中心...

这个计费项又贵又让开发者头晕。在uniCloud的世界，简单清晰，没有这些收费项。

只需按对计算资源、存储资源的消耗计费，只需关心业务，无需关心其他各种名目的增值产品，也无需为它们付费。

要知道一个用于防DDoS的高防套餐，每个月至少几万元。而这些费用，在uniCloud中无需支付。

展开说下uniCloud为什么不用买高防也不害怕DDoS：由于阿里云和腾讯云的serverless有巨大的资源池，且serverless没有固定ip，云函数使用的是阿里云和腾讯云的自有域名，前端网页托管在cdn上，DDoS攻击者打不起、也打不挂uniCloud。

uniCloud阿里云版、支付宝云版各为每个开发者提供1个免费的服务空间。传统云可没有这种优惠。

DCloud拥有国内广泛的开发者，可以与云厂商谈判拿到非常低的价格。所以不管是服务器计算资源、还是短信、实人认证、一键登陆等云能力，uniCloud里的定价均低于阿里腾讯等云厂商的定价。

基于以上4点原因，uniCloud大幅降低了开发者云资源的租用成本。

除了云资源的成本，uniCloud还可以减少开发商的人工成本、招聘成本、沟通管理成本，这些成本更远大于云资源成本。

而有了uniCloud，这些门槛全都降了下去：

所以说，uniCloud是前端变全栈的最佳机会，只需花点时间熟读uniCloud的文档，你就可以成为全栈！

uniCloud最吸引人的是，它将开发效率提升了10倍以上。

在uniCloud推出的3年时间里，uni-app + uniCloud 已经变成了一个庞大的生态。包括非常多的工具、模块。

开发效率提升10倍，并非某个杀手功能的功劳，而是庞大的生态共同的作用。本章节篇幅较长，请耐心阅读。

2020年初，uniCloud刚发布，新冠肺炎突然来袭，各地涌现大量抗疫项目需求。

uni-app + uniCloud成为大家和病毒抢时间的重要利器。

各地迅速涌现了数百个基于uni体系的抗疫项目。详见：https://www.dcloud.io/ncp.html

当时一个抗疫项目的开发，仍然需要几十人天。

以出入管理登记 的项目为例，第一版做了10天，有4-5位全职或兼职工程师参与。

一年后的2021年春节，各地又大量出现了返乡人员信息登记 的需求。

项目需求类似，但此时的uniCloud生态建设已经完善，基于各种利器，返乡人员登记系统的开发人天数大幅削减，只花费0.0625人天！

uni云端一体生态的内容太多，让我们抽丝剥茧、归纳分类，以容易理解的方式讲解开发效率是怎么提升的。

这是云端一体生态里最容易理解的价值：大量开源模块。

以前的开源模块，基本端是端、云是云，没听说过云端一体的开源模块。

以用户模块为例，其实它有前端、也有云端。前端有注册、登录、修改密码等页面，云端有对应的逻辑代码和数据库。

现在有了uni-id，一个开源的、功能完善的、云端一体的用户模块。立即节省数人月的开发工作量。

上面的轮子，是与业务无关的通用轮子。除此之外，还有大量的云端一体的项目模板。 使用这些现成的项目模板，那开发效率更是极大幅的提升。过去5、6人月的项目，现在几天就能搞定上线！

在这里，我们还必须提到2个新概念：uni_module和datacom。

如果在第一层提效中，找不到现成的轮子，需要自己写代码时。那么首先要做的，是使用schema2code这个神器，自动生成代码。

uniCloud云数据的schema，是一项重要的创新。 为数据表编写schema，可以实现非常多功能：数据结构定义、权限管理、数据值域管理，以及非常神奇的功能 -- 《schema2code》

在传统开发中，有了数据库，可以生成crud后台接口。然后前端再写代码调用接口。

但在uni云端一体生态中，有了数据库的schema，可以直接生成云端一体的页面。而不仅仅是只生成接口。

schema2code，可以生成手机端的列表、详情或增删改页面，也可以生成admin管理端的所有数据管理功能的页面。

如下是schema2code的操作演示视频：

可以实战体验这个云端一体通讯录 的项目，几乎没有单独写代码。设计好通讯录的表schema，用schema2code即可生成这个项目。

前述提到的返乡人员管理项目，之所以只花费了半小时就可以做好，也是schema2code的功劳。

数据的权限管理也很简单，在schema中可以快速定义指定的数据记录或字段，只能由什么样角色或权限的人来操作。

数据入库的值域校验就更简单了。传统开发中，一个手机号的校验，需要在前端页面写一遍，服务器入库前再检查一遍，很多余。既然云端协同了，自然会优化掉这个问题。

现在只需在DB Schema中定义好手机号这个字段的可选值域，比如一个正则，那么schema2code将自动生成前端表单，且遵循schema的定义，只接受相同正则。

这样不但提高了开发效率，还可以避免传统开发中各种漏洞，保持严谨和一致性。

schema2code生成的代码清晰易读，易于二次开发。这比低代码平台更有效率、且完全开放开源，随意扩展。

如果schema2code仍不能满足你的需求，需要单独开发，那么只要操作数据库，clientDB 就是推荐使用的利器。

传统开发中，前端写request联网，后台写接收请求去查库，再返给前端，然后前台再绑定到data上....天天干这么枯燥的事情不烦吗？

uni-app提供了<unicloud-db>组件（代码块触发键是udb），在前端直接访问数据库，前所未有的高效和简洁，在大多数场景下完全不用写服务器代码！

比如uniCloud的云数据库有个user表，里面有字段id、name，查询id=1的用户数据，把名字显示在界面上，写法如下：

示例源码如下，请查看 pre > code 标签中的内容

是的，仅需5行代码，就可以完成过去前后端合计得写几十行代码才能完成的事情，代码量大幅减少到原来的十分之一。

无需担心前端直接访问数据库会造成安全隐患，上一节提过了DB Schema，在云端的schema中可以定义什么角色可以操作数据库。详见

clientDB技术，有前端的JS API和前端组件，为了进一步提高开发效率，clientDB还提供了几大利器： JQL是一种基于js的数据库操作语言，它改进了SQL语言的诸多不便之处。

可以看出，在uni云端一体生态中，开发者不但提高了效率、减少了成本，还得到了更强大的赋能工具。

如果clientDB仍然不能满足需求，必须编写云端代码，那么云对象的出现，彻底改变了后端开发json接口和前端联调的低效局面。

云对象把云端的代码变成对象方式，让前端js直接import这个对象，然后使用这个对象的方法，就像使用前端的js对象一样顺畅。

云端新加一个todo云对象，写一个add方法，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个todo对象，调用它的add方法

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX、uni-app、uniCloud是三位一体、高效协同的。

HBuilderX提升了uni-app的开发效率，自然也将提升uniCloud的开发效率。并且三位一体，实现了以前无法想象的新突破。

在传统开发中，item是一个通过request返回的json，ide是不可能知道这个json的数据结构的，也就无法提示。

由于三位一体协同，HBuilderX可以解析本地schema文件，直接提示item后面的数据结构。避免开发者写错代码、减少服务器联调工作。

云对象的方法，HBuilderX同样可以完美解析，让编写客户端代码时直接提示云对象的方法、参数。

前端和云端都使用js编程语言，提高了沟通效率。

js和其他服务器语言，比如php或java，在过去需要Mock来翻译，这很多余。

在实际开发中，开发商应该安排人员按业务分工，专注于业务，一个业务模块的前端后端都由一个人负责。开发效率会比以前更高。

由于统一了技术栈，招聘效率、管理效率也会相应提升。

代码量减少到原来的十分之一，这自然可以让code review效率和白盒测试的效率也提升了十倍。

黑盒测试中，前后端对不齐的bug、权限漏洞等发生的概率也大幅减少。

因为serverless的免运维特点，开发商再也不用操心扩容、高并发、ddos攻击、安全漏洞补丁等一系列麻烦事。只需专注于自己的业务。

uniCloud是开发界的革命。在HBuilderX、uni-app、uniCloud三位一体的协同下、创新的功能设计下、丰富的生态和轮子支持下，开发者的开发效率，超过传统开发10倍以上。

目前uniCloud已发展3年多，活跃服务空间数万，云函数日请求数量过亿。请放心使用。

多年php/java工程师纷纷改用uniCloud，来看他们怎么说 https://mp.weixin.qq.com/s/p9GbRqRQuvEbmbpHJhZGmw

前端如何快速升级为全栈？- uniCloud开发者采访纪实 https://mp.weixin.qq.com/s/5Q7ulHlBzgjVl1bnGTI06Q

**Examples:**

Example 1 (html):
```html
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

Example 2 (html):
```html
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

Example 3 (json):
```json
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

Example 4 (html):
```html
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

---

## uni-ad-admin 插件概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-ad-admin.html

**Contents:**
- # uni-ad-admin 插件概述
- # 安装部署
  - # 下载插件
  - # 注册菜单
  - # 上传 schema
  - # 配置签名秘钥
  - # 上传云函数
- # 收益数据同步
- # 插件源码解读
  - # 表结构

uni-ad-admin 是基于uni-admin 的uni-ad插件。

uni-ad-admin主要包括两个功能：

uni-ad-admin是开源的，你可以自由定制，比如：

前往插件市场 ， 找到 uni-ad-admin 插件，点击 下载插件并导入HBuilderX ，在 HBuilderX 中选择对应的 uni-admin项目，HBuilderX会自动完成插件下载及文件合并。

uni-ad-admin 插件新增的文件主要包括：

在HBuilderX中找到 opendb-admin-menus.init_data.json 文件，右键 初始化云数据库数据，可完成左侧导航菜单的注册。

如果你只有国内广告，没有海外广告，可在opendb-admin-menus.init_data.json文件中删除如下海外广告菜单后，再右键初始化云数据库数据。

示例源码如下，请查看 pre > code 标签中的内容

schema 位于 uniCloud/database 目录下，在 database 目录右键点击 上传所有DB Schema 菜单，将 schema 上传到云端服务空间。

为保证数据安全，数据从uni-ad云端同步到你的服务空间时，会使用秘钥加密传输，该秘钥需你自己配置。

配置文件：uniCloud/cloudfunctions/uni-ad-admin-receiver/config/config.json

在HBuilderX中，选择uniCloud/cloudfunctions/uni-ad-admin-receiver，右键上传部署。

登录uni-ad控制台 ，在右上角点击 uni-ad-admin 按钮，在弹出框中选择已部署含uni-ad-admin插件的uni-admin项目空间：

注意：secret是数据同步过程中的加密秘钥，务必和uniCloud/cloudfunctions/uni-ad-admin-receiver/config/config.json文件中配置的scrert保持一致。

如果你的原服务空间过期或其它原因需要变更收益数据的服务空间，则需再次登录uni-ad控制台 ，点击右上角 uni-ad-admin 按钮，在弹出对话框中选择新的服务空间即可。

你也可以在该弹出框中，点击左下角的关闭收益同步按钮，关闭该项功能。

在uni-ad-admin的应用收益详情中，可查看数据同步日志。如有同步失败的，可点击重新同步。

uni-ad-admin插件包含4个数据表：

uni-ad-adp-revenues收益数据，广告位维度

uni-ad-app-revenues日汇总收益表

uni-ad-sync-logs数据同步日志表

计算公式：CPM = 总收益 / 展示量 * 1000

下方仅展示 uni-ad-admin 插件相关的文件夹及文件。

示例源码如下，请查看 pre > code 标签中的内容

1. 申请数据同步后，何时可以查看报表数据 ？

答：数据同步服务每日下午3点启动，如您在下午3点后申请，在次日下午3点才会启动同步。

答：数据同步和 uni-ad 后台一样，今日出昨日的预估收益。

3. 子账号需要赋予哪些表的权限才能正常查看uni-ad统计？

第一步：添加用户角色权限 1、去权限管理添加一个权限id为： READ_UNI_AD 的权限 2、去角色管理添加一个角色id为： READ_UNI_AD 的角色 3、去用户管理赋予子账号角色 READ_UNI_AD 角色

第二步：给相关的表设置read权限 涉及表如下： 1、uni-ad-sync-logs 2、uni-ad-positions 3、uni-ad-position-revenues 4、uni-ad-day-revenues 5、opendb-app-list

需要赋予上面的表的 read 权限全部设置为

示例源码如下，请查看 pre > code 标签中的内容

第三步：前往菜单管理，对每一个uni-ad统计的页面（包含子页面）设置下权限 READ_UNI_AD（菜单只有拥有对应权限才会显示）

**Examples:**

Example 1 (json):
```json
[	
	{
		"parent_id": "uni-ad",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global",
		"name": "国际广告",
		"icon": "",
		"url": "",
		"sort": 2300,
		"create_date": 1638356902516,
		"_id": "uni-ad-global"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-home",
		"name": "概况",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/index/index",
		"sort": 2211,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-home"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-revenue",
		"name": "数据收益",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/revenue/revenue",
		"sort": 2212,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-revenue"
	}
]
```

Example 2 (json):
```json
[	
	{
		"parent_id": "uni-ad",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global",
		"name": "国际广告",
		"icon": "",
		"url": "",
		"sort": 2300,
		"create_date": 1638356902516,
		"_id": "uni-ad-global"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-home",
		"name": "概况",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/index/index",
		"sort": 2211,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-home"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-revenue",
		"name": "数据收益",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/revenue/revenue",
		"sort": 2212,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-revenue"
	}
]
```

Example 3 (json):
```json
[	
	{
		"parent_id": "uni-ad",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global",
		"name": "国际广告",
		"icon": "",
		"url": "",
		"sort": 2300,
		"create_date": 1638356902516,
		"_id": "uni-ad-global"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-home",
		"name": "概况",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/index/index",
		"sort": 2211,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-home"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-revenue",
		"name": "数据收益",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/revenue/revenue",
		"sort": 2212,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-revenue"
	}
]
```

Example 4 (json):
```json
[	
	{
		"parent_id": "uni-ad",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global",
		"name": "国际广告",
		"icon": "",
		"url": "",
		"sort": 2300,
		"create_date": 1638356902516,
		"_id": "uni-ad-global"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-home",
		"name": "概况",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/index/index",
		"sort": 2211,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-home"
	},
	{
		"parent_id": "uni-ad-global",
		"permission": [],
		"enable": true,
		"menu_id": "uni-ad-global-revenue",
		"name": "数据收益",
		"icon": "",
		"url": "/uni_modules/uni-ad-admin/pages/global/revenue/revenue",
		"sort": 2212,
		"create_date": 1638356902516,
		"_id": "uni-ad-global-revenue"
	}
]
```

---

## 简介@intro | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-functions?id=intro

**Contents:**
- # 简介
- # 云函数的分类
- # 客户端和云函数的通信
  - # clientDB方式
  - # 云对象方式
  - # 普通云函数callFunction方式
  - # 云函数URL化方式
  - # 云函数请求中的中间状态通知通道
  - # uniCloud响应体规范
    - # HBuilderX 3.6.10及之后版本的错误规范

云函数是运行在云端的 JavaScript 代码，是基于 Node.js 的扩展。

在常规的 Node API 基础上，uniCloud的云函数环境内置了uniCloud对象，这个对象内置了网络、数据库等各种API。开发者未学习过 Node.js 也没有关系，只需要看uniCloud的文档，掌握这个uniCloud对象的API即可。

每个云函数是一个js包，在云函数被调用时，由 serverless 调度系统分配硬件资源启动一个 node 环境来运行这个云函数。

在HBuilderX中可以新建云函数（HBuilderX 3.4 同时可以新建云对象）。

每个云函数是一个目录，其中普通云函数有index.js入口文件，云对象的入口文件则是index.obj.js。

一个最简单的云函数只需要这个入口js文件，在里面编写代码即可。当然也可以在这个js中require该云函数目录下的其他js、json文件。

云函数的配置文件和 npm规范 相同，在云函数目录下可新建一个 package.json 来存放配置。uniCloud云函数扩展了 package.json，增加了一些特有的配置项。详见

云函数启动后实例会保留一段时间（如15分钟），超过保留期后若该云函数一直没有被再调用，那这个实例会被释放。所以云函数有冷启动的概念。不过由于js实例的启动要比php和java更快，所以js更适合serverless方式。

云函数有若干子概念，包括 普通云函数、云对象、公共模块、clientDB的action云函数、uniCloud扩展库。

HBuilderX中uniCloud项目的云函数均在项目的uniCloud/cloudfunctions目录下，目录结构如下：

uni-app客户端和传统服务器通信时，使用uni.request的ajax请求方式。uniCloud下不再使用它，有更好的云端一体的通信方式。

uniCloud体系里，客户端和服务端的云函数通信，有4种方式：

云函数是uniCloud的基础，本质上 clientDB 和 云对象 都是建立在云函数上针对特定场景的优化。

clientDB分API方式和组件方式，此处使用API方式来演示

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，学习clientDB需另见文档clientDB

如果客户端使用uni-app开发，且向uniCloud服务空间的请求主要是为了操作云数据库（无论增删改查），那么推荐使用clientDB方式，由uni-app客户端直接操作云数据库。

如果操作数据库的同时，还需要同时执行一些云端逻辑：HBuilderX 3.6.11以前使用action云函数；从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。

云对象和clientDB最大的区别，是云对象把数据库操作（以及其他逻辑）封装在云对象的方法里面。

它无法像clientDB那样无需开发服务器代码，它仍需在客户端和云端分别写代码。但它的应用场景不受限制。上文中不适用clientDB的情况，都可以使用云对象解决。

云端云对象代码，云对象名称：testco，有一个sum方法

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个testco对象，调用它的sum方法

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX 3.5.2之前，需要URL化和定时运行时，只能使用普通云函数；在HBuilderX 3.5.2+，云对象也支持了URL化和定时运行。

官方不推荐开发者使用云函数，有相关需求推荐使用云对象替代云函数。

目前官方还未提供基于云对象的router模式的框架，有相关需求可以使用三方框架。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，需另见文档云函数callfunction方式

可以让云函数/云对象生成一个HTTP URL。这样非uni-app应用，可以通过ajax请求和云函数/云对象通信。

在 uniCloud Web控制台进行URL化配置。

云函数在执行期间可以将中间状态发送给客户端，详情参考：云函数请求中的中间状态通知通道

uniCloud响应体规范（uniCloud response format），是DCloud制定的、服务器给客户端返回json数据的一种建议格式。

云对象、clientDB、uni-id公共模块均支持此规范。

uniCloud服务器给客户端返回的数据格式一般是json，但json的格式具体是什么没有约定。比如返回错误码，是叫code还是叫errCode？错误内容是message还是errMsg？内容的国际化如何处理？

如果没有一套统一的格式，在客户端将无法编写有效的网络拦截器，无法统一处理错误。

另外，如果不同的插件，云端返回的数据格式千差万别，那使用者整合这些插件也会非常麻烦。国际化更无法落地。

为此DCloud推出了uniCloud响应体规范。

为了与uni-app前端的API错误回调风格统一，uniCloud响应体规范定义的云端返回信息（尤其是报错时）应包含errCode和errMsg。

示例源码如下，请查看 pre > code 标签中的内容

errCode在成功时应返回数字0,失败时应返回一个以插件id开头的“字符串”，每个单词以连字符（-）分割。做出这样的规定是为了防止不同插件之间出现重复错误码

以'uni-id-account-banned'错误码为例，uni-id为插件id，account-banned为错误缩写。

如果业务开发的代码并不发布插件市场，那么为了避免下载了一个市场的插件产生冲突，推荐使用不包含“-”的字符串来做errCode（插件市场的所有插件ID必须包含“-”）。

后续uniCloud会提供自动根据errCode对errMsg进行国际化处理的功能，开发者仅需保证云函数返回值满足uniCloud响应体规范即可。

errMsg用于存放具体错误信息，包括展示给开发者、终端用户的错误信息

除此之外响应体规范还包含newToken字段，用于token的自动续期（云对象接收含有newToken的响应后会自动更新storage内存储的uni_id_token及uni_id_token_expired，此行为新增于HBuilderX 3.4.13）。开发者仅在自行调用uni-id-common的checkToken等会产生新token的接口时才需要返回新token，uni-app客户端和uni-id-co之间会自动管理token及续期。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX内使用代码块returnu可以快速输入以下代码（HBuilderX 3.4.0及以上版本）:

示例源码如下，请查看 pre > code 标签中的内容

云函数支持 js 和 nodejs 的标准API，如console.log()、setTimeout()，另见nodejs官网 。nodejs版本，详见云函数运行环境

除了标准API外，云函数环境中内置了uniCloud对象，扩展了一批新API，实际开发中更常用的是uniCloud的扩展API。见下：

云函数调用uniCloud接口时（包括请求云函数、云对象、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

云函数中支持访问本服务空间下的、或经授权的其他服务空间下的，数据库。

云函数中如需要请求其他http服务，则使用uniCloud.httpclient。无需额外依赖，就可以请求任何 HTTP 和 HTTPS 协议的 Web 服务。uniCloud.httpclient返回的是一个urllib实例 。

uniCloud.httpclient.request(URL,requestOptions)

默认情况下request接口不会处理返回的数据，即不传dataType参数时会返回buffer类型的数据，如需自动解析json格式的返回结果，需要将dataType设置为"json"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为简化http请求的调用uniCloud新增了uni.request调用方法类似的http请求接口uniCloud.request。

示例源码如下，请查看 pre > code 标签中的内容

实际业务中常有使用云函数发送formdata类型数据的需求，比如微信小程序提供的一些服务端接口（图片内容安全检测、识别图片二维码等），可以参考以下示例进行发送

示例源码如下，请查看 pre > code 标签中的内容

云函数无法作为websocket服务器使用，如有相关需求可以尝试使用uni-push 2.0实现，参考：uni-push 2.0。

本章节内容介绍云函数如何作为websocket客户端使用。为简化调用方式uniCloud新增了uni.connectSocket方法类似的接口uniCloud.connectSocket。

调用此接口返回SocketTask对象，见下一章节介绍

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

以下云函数示例代码，从websocket服务器获取消息拼接后返回给客户端，如果遇到错误会抛出错误

示例源码如下，请查看 pre > code 标签中的内容

由于存在单实例多并发的情况，实例级的uniCloud对象，和每个请求request是一对多的关系。

这也造成了与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了更好的管理请求和请求相关的上下文，uniCloud提供了下面一批API。

示例源码如下，请查看 pre > code 标签中的内容

如没有配置单实例多并发，数组里只会返回一项内容。配置后可能会多项，正在并发的所有请求的requestId都会返回。

当返回多项时，在uniCloud对象上无法明确当前请求是数组中的哪一个。所以提供了其他方法来获取当前请求：

HBuilderX 4.21版本客户端上传clientInfo信息时不会将所有信息都传到云端。具体字段白名单如下：'appId', 'appLanguage', 'appName', 'appVersion', 'appVersionCode', 'appWgtVersion', 'browserName', 'browserVersion', 'deviceBrand', 'deviceId', 'deviceModel', 'deviceType', 'osName', 'osVersion', 'romName', 'romVersion', 'ua', 'hostName', 'hostVersion', 'uniPlatform', 'uniRuntimeVersion', 'uniRuntimeVersionCode', 'uniCompilerVersion', 'uniCompilerVersionCode'。如需让客户端上传更多clientInfo字段到云端，可以使用客户端api：uniCloud.setCustomClientInfo

同理，考虑到单实例多并发，uniCloud.getClientInfos()获取客户端信息也是一个数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未开启单实例多并发，那么数组只有1项。单实例多并发场景下返回正在并发的所有请求的客户端信息列表。

getClientInfos返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

除了uniCloud.getClientInfos()API，在云函数context和云对象this中，也可以直接获取当前客户端信息。

同上，为了兼容并发场景，获取云端信息uniCloud.getCloudInfos()返回的也是数组。

示例源码如下，请查看 pre > code 标签中的内容

除了uniCloud.getCloudInfos()API，在云函数context和云对象this中，也可以直接获取当前请求的云端信息。

上述3个API，都因为单实例多并发而被设计成数组方式。实际上，大多数开发者并不使用单实例多并发。

在不考虑单实例多并发时，也可以直接使用uniCloud的getRequestList、getClientInfos、getCloudInfos方法中第一个数组项。

或者在云对象的this和云函数的context里获取相关上下文信息也可以。

uniCloud的api中，有些api对应的实现，其代码体积较大，且这些功能并不是每一个云函数都会使用。为了方便开发者控制云函数的体积，设计了uniCloud扩展库的概念。

开发者可以对云函数目录点右键，管理公共模块和扩展库依赖，在其中选择要加载的扩展库。这个可视化界面对应的数据在云函数目录下的 package.json 内的extensions字段下。

注意：未引用扩展库的，使用uniCloud相应api时会报错。

以下是一个开启了redis扩展库的云函数package.json示例，注意此文件不支持注释，下方示例中的注释仅为演示

示例源码如下，请查看 pre > code 标签中的内容

云函数支持公共模块。多个云函数/云对象的共享部分，可以抽离为公共模块，然后被多个云函数引用。由于篇幅较长，详见

云函数的运行环境是 Node.js，因此我们可以使用 npm 安装第三方依赖。

注意：阿里云目前仅支持全量上传云函数（整个node_modules文件夹全部上传，会在上传前自动在本地安装依赖，不会直接使用云函数目录下的node_modules），因此提醒开发者精简依赖，否则可能会每次上传时间很慢，影响开发体验。并且太大的npm库影响云函数的运行性能。

腾讯云、支付宝云会在上传云函数后自动安装需要的npm依赖。

由于云函数环境缺少一些系统级依赖，而部分npm依赖安装时会针对不同平台进行编译安装，导致无法正常编译。

以下为已知无法在云端云函数环境中运行的npm依赖：

用法同客户端调用云函数，仍然是uniCloud.callfunction，但不支持callback形式。

示例源码如下，请查看 pre > code 标签中的内容

由于调用方不是uni-app客户端，云函数的context、云对象的this.getClientInfo等API无法获取客户端信息，包括 uni-id-token。

可以在云函数互调时手动传递 token ，或者校验调用来源（source）为云函数（function）时不验证用户 token。

云函数/云对象互相调用时调用方会通过公网访问被调用方，访问速度不如直接将逻辑放在调用方执行。使用前请确保你确实需要此功能。

HBuilderX 3.4.0版本之前云函数右键本地运行时，里面的代码再次callFunction会调用云端的云函数而不是本地云函数，此bug后续版本已修复。

除了调用三方云函数，事实上云函数还可以递归调用自己。

当一个云函数实例的资源不能满足需求，或超时时间不够用时。比如要给10万个用户发送短信，而短信发送接口一次调用最多支持50个手机号码，这样最少需要调用2000次接口才能完成；而一个云函数实例完成不了2000次接口的调用。这种场景就可以使用云函数递归调用，分解任务实现。

示例源码如下，请查看 pre > code 标签中的内容

注意：如果不小心把递归云函数写成死循环，就把云函数的内容全部删除，重新上传覆盖即可

在支付宝云与腾讯云服务空间的云函数内支持获取同账号下其他服务空间的uniCloud实例，参考：一个应用访问多个服务空间，并使用此实例调用对应服务空间的云函数。

示例源码如下，请查看 pre > code 标签中的内容

serverless是动态分配计算资源的，由此会引发的出一批特有概念：冷启动、实例、并发请求、无状态、伪全局变量。

基于云函数按需执行的特点, 函数在不被触发的时候, 计算资源是不被激活的。

当一个云函数初次被触发时，其完整过程如下：

函数被调用时，执行这些完整步骤的过程称作冷启动, 冷启动的耗时一般在一秒左右。

一个云函数实例冷启动后，serverless调度中心会保留这个实例一定时间。在实例保留期间，客户端再次请求云函数，不会触发冷启动，速度会更快。实例的详细定义见下

云函数实例和执行进程都被复用的情况下称之为热启动, 热启动性能要好非常多，因为它只有一个步骤：

如果一个云函数实例长时间没有被再次调用，则该计算实例会被回收；后续再次调用该云函数时，就会再次触发云函数的冷启动。

直观的体验表现为：隔了很久不用的云函数，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

注：冷启动虽慢但也不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

三家云厂商仍然在优化冷启动问题。目前给开发者的建议是：

实例，指云函数的一个执行环境，可以简单的理解为一个node进程。

每次客户端发起请求（request）时，serverless的调度中心会查看已启动、且空闲的实例，分配一个实例来接收这个请求。如果没有空闲实例，则新起一个实例。

新起一个实例需要一定时间，也即上文说的冷启动问题。详见冷启动

一个实例启动后，一般在1秒内就会完成请求，但serverless调度中心会保留这个实例一定时间（时间见上一节）。在实例保留期间，客户端再次请求云函数，不会触发冷启动。

也就是说，在实例保留期间，1个实例会接受多个客户端请求。

请求（request），指一次连接云函数的网络请求。不同请求有不同的上下文信息（比如客户端UA）。

所以想要获取客户端信息，一定注意不是在实例的全局对象上获取，而是需要在请求的上下文中获取。详见

在uniCloud阿里云版与支付宝小程序版中还提供了1个实例的多并发请求配置，即同一时间多个请求可以并发执行。 也就是同一时间的请求发到云函数时，没有配置单实例多并发会新开一个云函数实例，配置了单实例多并发则不会新开实例，在一个实例中增加并发。 详见单实例多并发。

一个云函数，可以同时存在多个实例。比如cf1云函数，如未配置单实例多并发，10个请求同时达到云函数，就会开10个实例。

不管开了多少实例，云函数的计费是按请求计费的。实例响应请求后到保留期结束之间，如果不发生新请求是不会计费的。

因为实例可能第一次启动，也可能已经启动，所以云函数中的js全局变量其实是伪全局变量。也就是云函数是无状态的。

在云对象中，写在module.exports = {}之前，云函数写在exports.main = async (event, context) => {}之前的变量定义，是伪全局变量。

以如下代码为例，count作为全局变量，当多次调用该云函数时，可能会出现变量累加的情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面2个示例中，实例未复用时，也就是冷启动时，count的值每次都是0；若实例被复用，则可能返回1、2、3等各种意外情况。

当然，可以用这个方法来获知一个实例被重用了多少次请求。

require由于存在缓存，也存在同样的问题。尽量不要直接修改require返回的内容。

uniCloud全局对象也是跨请求的，与请求相关的内容不应该挂载到uniCloud全局对象上。

由于上节提到的，uniCloud全局对象是实例级的、跨请求的，1个实例内uniCloud只会在冷启动时进行一次初始化。

所以与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了让开发者清晰的了解实例和请求的关系，uniCloud提供了如下方案。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是uniCloud私有云， 如果想获取与请求相关的信息，比如这次请求的客户端UA，或云函数环境信息，无法直接在uniCloud全局对象中获取。

云函数入口入参包含一个event和一个context，这两个参数和请求相关，每次有新请求到云函数实例时就会有一个新的event对象和一个新的context对象

云对象的this和event、context类似，每个请求都对应一个单独的this。

默认情况下云函数仅支持单实例单并发，即同一时间一个实例仅可为一个请求服务（不同请求同一时间访问会被分派到不同实例进行处理）。不过在uniCloud web控制台中，阿里云可以通过修改云函数单实例并发度，可以修改云函数同一时间最多能处理多少请求。

当实例并发度设置为1时，需要创建3个实例来处理这3个请求，每个实例分别处理1个请求。而每开启一个实例都会引发云函数冷启动；

当云函数的实例并发度设置为10时（即1个实例可以同时处理10个请求），只需要创建1个实例就能处理这3个请求。这样后面2个并发请求不会有因云函数实例创建带来的冷启动问题。

相关文档：云函数实例及部分变量说明 、云函数的无状态

云函数详情页面配置单实例并发度即可，支持1-100之间的数值

旧版本uni-id公共模块指uni-id-common推出之前的版本。详见

示例源码如下，请查看 pre > code 标签中的内容

不同于旧版uni-id公共模块，新版uni-id-common不可直接require后使用，必须使用createInstance方法

开启单实例多并发后的全局变量复用并非一定是坏的结果，如果你很了解此行为，也可以对此进行有效的利用

例：ip-filter 中就利用云函数全局缓存一些ip访问信息来限制单ip访问频率，可以下载示例项目体验一下

受单实例多并发的影响，云函数全局存放与本次请求有关的信息会造成混乱。因此uniCloud提供了根据当前requestId获取客户端信息和云端信息。参考以下文档

云函数是运行在云端的代码，运行环境由云服务器弹性调配，这是和传统Node.js应用很大的区别。

换言之，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合。

所以，不建议使用node的fs文件系统相关的API。建议通过云数据库、云存储、redis的方案替代。

书写云函数时应注意async、await的使用，nodejs有内置模块util可以将符合error-first形式callback的函数转换为promise形式，详情参考 ，比如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果想在云函数内使用回调形式可以让云函数返回一个promise，如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

腾讯云因为按 GBS 对云函数计费，在 node12 时，尤其要注意，如果未有效终止云函数，会一直计费

云函数运行在 node 环境中。可以使用 node api process.version 获取 node 版本。

node版本可以在云函数的package.json文件的cloudfunction-config->runtime字段进行配置，详情参考：云函数package.json

支付宝云云端云函数使用的时区是UTC+8。

阿里云和腾讯云云端云函数使用的时区是UTC+0，而不是 UTC+8，在云函数中使用时间时需特别注意。

云函数在HBuilderX本地运行时，时区则是电脑的时区，很可能是 UTC+8。建议统一使用时间戳，可以规避时区问题。

云函数除了代码，还有配置。在uniCloud web控制台 可以配置；在HBuilderX项目中，云函数根目录的package.json也是存放配置的地方。

云函数运行内存为单个云函数实例使用的内存。

支付宝云云函数默认运行内存512MB，阿里云正式版默认512MB，腾讯云云函数默认运行内存大小为256MB

计算云函数GBs资源消耗时腾讯云会以此内存*运行时间（100ms为阶梯向上取整）得到消耗量。阿里云会以实际运行时间计算GBs，不会按100ms阶梯向上取整

阿里云一般场景（比如包含数据库访问时）不建议将内存配置为128MB。如果开发起见遇到数据库响应缓慢，在排除索引等因素的影响后可以检查下是不是云函数内存配置为了128MB，如果是建议调整为256MB

腾讯云个人版及入门版套餐自2025年8月31日起云函数运行内存固定为256MB，不支持修改，详见相关公告

支付宝云定时任务触发最大支持3小时超时时间（需开启异步超时），非定时触发时超时时间为180秒，客户端请求云函数如果超出180秒云函数断开连接后会停止运行。

阿里云定时任务触发最大支持7200秒超时时间，非定时触发时超时时间为120秒，客户端请求云函数如果超出120秒云函数断开连接后会停止运行。

腾讯云定时任务触发最大支持900秒超时时间。非定时触发时超时时间为60秒，客户端请求云函数时如果超出30秒云函数断开链接后会继续运行，最大能运行到配置的超时时间。

如果超时时间仍然不够用，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

本地云函数默认超时为10秒，超时后云函数会停止运行。

修改超时时间可以在HBuilderX的设置->运行设置->云函数本地运行配置 超时时间中修改，单位为秒。

serverless默认是没有固定的服务器IP的，因为有很多服务器资源在后台供随时调用，每次调用到哪个服务器、哪个ip都不固定。

但一些三方系统，要求配置固定ip白名单，比如微信公众号的js sdk，此时只能提供固定ip地址。

腾讯云199元/月以上的套餐，提供了云函数的固定出口ip，在uniCloud Web控制台 ，创建付费的腾讯云服务空间，选择一个云函数，在云函数的详情界面可以开启固定出口ip。开启后界面上会显示可用的固定ip。拿着这个ip去需要固定ip的界面（如微信公众号管理界面）配置即可。

示例源码如下，请查看 pre > code 标签中的内容

阿里云必须使用uniCloud.httpProxyForEip发送请求才会固定出口ip，其原理是通过代理请求获得固定出口IP的能力。IP为轮转不固定，因此三方服务要求使用白名单时开发者需要将代理服务器可能的IP均加入到白名单中，见下方代理服务器列表。此外对于代理的域名有限制，当前仅持weixin.qq.com泛域名。若开发者有其他域名代理需求，发送邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。

示例源码如下，请查看 pre > code 标签中的内容

如需在获取微信公众号access_token场景使用，请将上述ip配置到微信公众平台 -> 基本配置 -> IP白名单内，相关链接：微信公众平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，此接口以application/x-www-form-urlencoded格式发送数据而不是multipart/form-data

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以application/json格式post数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0版本之前，package.json只是一个标准的package.json，安装依赖或公共模块才需要。HBuilderX 3.0及以上版本，package.json也可以用来配置云函数。

uniCloud web控制台提供了很多云函数的设置，比如内存大小、url化、定时触发等，从HBuilderX 3.0起，在云函数的package.json里也可以编写这些设置。

开发者在本地编写云函数的设置，上传云函数，这些设置会自动在云端生效。（本地不生效）

在云端设置了非默认参数后，HBuilderX下载云函数到本地时，也会自动把设置项放入package.json中下载下来。

package.json是一个标准json文件，不可带注释。下面是一个package.json示例。

示例源码如下，请查看 pre > code 标签中的内容

其中cloudfunction-config字段是云函数配置，支持的配置如下

示例源码如下，请查看 pre > code 标签中的内容

阿里云：Nodejs12、Nodejs14、Nodejs16、Nodejs18、Nodejs20，默认Nodejs16

腾讯云：Nodejs8（即将下线，不推荐使用）、Nodejs12、Nodejs16、Nodejs18，默认Nodejs16

支付宝云：Nodejs16、Nodejs18，默认Nodejs18

阿里云Nodejs8已终止支持：终止支持阶段一：禁止新建（2024年06月01日）；终止支持阶段二：禁止新建和更新（2024年09月01日）。终止支持不影响函数继续运行。建议您及时升级。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

支付宝云与阿里云定时触发的cron表达式不支持代表年的第七位，但是在package.json内配置时仍需将第七位设置为*。

在web控制台配置trigger请参考：定时触发

package.json内统一了支付宝云、腾讯云、阿里云三家厂商的配置，三个平台都需要配置为如下形式

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。

示例源码如下，请查看 pre > code 标签中的内容

如果此云函数运行在阿里云或腾讯云nodejs8，setTimeout里面的console.log不会在本次云函数调用执行，但是可能在云函数实例再次被复用时继续执行。

如果此云函数运行在腾讯云nodejs12，setTimeout里面的console.log会在本次云函数调用内，同样的本次云函数**计费时间（与云函数GBs指标相关）**也会按照最终执行完成的时间计算（5000ms+return耗时）。但是前端无需等待5秒即可收到响应。注意：如果有未断开的长连接（例如：redis连接）会导致云函数一直运行到配置的超时时间

当在云函数package.json内的cloudfunction-config内配置了keepRunningAfterReturn: false时，可以改变腾讯云nodejs12的表现，云函数return之后将不再继续执行，未断开的长连接也不会增加云函数实际运行时间，云函数return后长连接也不会被中断，简单来说其表现和腾讯云nodejs8一致。

将上述示例中的setTimeout换成网络请求、调用其他云函数或数据库请求同理，如果在阿里云或腾讯云nodejs8直接return会导致网络请求可能无法发送（即使成功发送也是在下一次云函数实例被复用的时候），这是与传统开发不太一样的地方。

示例源码如下，请查看 pre > code 标签中的内容

由于redis需要和服务器建立连接，此连接会阻止云函数结束执行。如果没有云函数return之后还需要继续执行的需求，可以简单的在cloudfunction-config内配置keepRunningAfterReturn: false。这样redis的连接并不会中断，下次请求来时依然可以使用之前建立的连接。

如果需要return之后继续执行，那么需要在使用完毕后断开redis连接，调用redis.quit()方法即可断开连接。需要注意的是断开连接后之前建立的连接将不再可用，下个请求到来时需要使用uniCloud.redis()方法重新建立连接。

如未按照上述说明进行操作，redis连接将会一直占用云函数实例，导致云厂商持续计算云函数执行时间，可能会导致消耗大量云资源而产生额外费用

务必确定自己已理解此文档内容，因未按照文档说明使用导致的额外计费DCloud不承担任何责任

HBuilderX 2.9版本，uniCloud提供了cloudfunctions_init.json来方便开发者快速进行云函数的初始化操作。

注意：HBuilderX 3.0.0版本起不再使用cloudfunctions_init.json来初始化云函数。改为使用在云函数目录下通过package.json进行配置，具体见上个章节

不再使用cloudfunctions_init.json，内容被分散到每个云函数的package.json的cloudfunction-config字段下

package.json是一个标准json文件，不可带注释。下面是一个package.json示例

示例源码如下，请查看 pre > code 标签中的内容

cloudfunction-config说明如下

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0.0之前版本，请继续阅读下面文档

cloudfunctions_init.json形式如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 2 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 3 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

Example 4 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

---

## 简介@intro | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-functions?id=packagejson

**Contents:**
- # 简介
- # 云函数的分类
- # 客户端和云函数的通信
  - # clientDB方式
  - # 云对象方式
  - # 普通云函数callFunction方式
  - # 云函数URL化方式
  - # 云函数请求中的中间状态通知通道
  - # uniCloud响应体规范
    - # HBuilderX 3.6.10及之后版本的错误规范

云函数是运行在云端的 JavaScript 代码，是基于 Node.js 的扩展。

在常规的 Node API 基础上，uniCloud的云函数环境内置了uniCloud对象，这个对象内置了网络、数据库等各种API。开发者未学习过 Node.js 也没有关系，只需要看uniCloud的文档，掌握这个uniCloud对象的API即可。

每个云函数是一个js包，在云函数被调用时，由 serverless 调度系统分配硬件资源启动一个 node 环境来运行这个云函数。

在HBuilderX中可以新建云函数（HBuilderX 3.4 同时可以新建云对象）。

每个云函数是一个目录，其中普通云函数有index.js入口文件，云对象的入口文件则是index.obj.js。

一个最简单的云函数只需要这个入口js文件，在里面编写代码即可。当然也可以在这个js中require该云函数目录下的其他js、json文件。

云函数的配置文件和 npm规范 相同，在云函数目录下可新建一个 package.json 来存放配置。uniCloud云函数扩展了 package.json，增加了一些特有的配置项。详见

云函数启动后实例会保留一段时间（如15分钟），超过保留期后若该云函数一直没有被再调用，那这个实例会被释放。所以云函数有冷启动的概念。不过由于js实例的启动要比php和java更快，所以js更适合serverless方式。

云函数有若干子概念，包括 普通云函数、云对象、公共模块、clientDB的action云函数、uniCloud扩展库。

HBuilderX中uniCloud项目的云函数均在项目的uniCloud/cloudfunctions目录下，目录结构如下：

uni-app客户端和传统服务器通信时，使用uni.request的ajax请求方式。uniCloud下不再使用它，有更好的云端一体的通信方式。

uniCloud体系里，客户端和服务端的云函数通信，有4种方式：

云函数是uniCloud的基础，本质上 clientDB 和 云对象 都是建立在云函数上针对特定场景的优化。

clientDB分API方式和组件方式，此处使用API方式来演示

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，学习clientDB需另见文档clientDB

如果客户端使用uni-app开发，且向uniCloud服务空间的请求主要是为了操作云数据库（无论增删改查），那么推荐使用clientDB方式，由uni-app客户端直接操作云数据库。

如果操作数据库的同时，还需要同时执行一些云端逻辑：HBuilderX 3.6.11以前使用action云函数；从HBuilderX 3.6.11开始，推荐使用数据库触发器替代action云函数。

云对象和clientDB最大的区别，是云对象把数据库操作（以及其他逻辑）封装在云对象的方法里面。

它无法像clientDB那样无需开发服务器代码，它仍需在客户端和云端分别写代码。但它的应用场景不受限制。上文中不适用clientDB的情况，都可以使用云对象解决。

云端云对象代码，云对象名称：testco，有一个sum方法

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个testco对象，调用它的sum方法

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX 3.5.2之前，需要URL化和定时运行时，只能使用普通云函数；在HBuilderX 3.5.2+，云对象也支持了URL化和定时运行。

官方不推荐开发者使用云函数，有相关需求推荐使用云对象替代云函数。

目前官方还未提供基于云对象的router模式的框架，有相关需求可以使用三方框架。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于篇幅较长，需另见文档云函数callfunction方式

可以让云函数/云对象生成一个HTTP URL。这样非uni-app应用，可以通过ajax请求和云函数/云对象通信。

在 uniCloud Web控制台进行URL化配置。

云函数在执行期间可以将中间状态发送给客户端，详情参考：云函数请求中的中间状态通知通道

uniCloud响应体规范（uniCloud response format），是DCloud制定的、服务器给客户端返回json数据的一种建议格式。

云对象、clientDB、uni-id公共模块均支持此规范。

uniCloud服务器给客户端返回的数据格式一般是json，但json的格式具体是什么没有约定。比如返回错误码，是叫code还是叫errCode？错误内容是message还是errMsg？内容的国际化如何处理？

如果没有一套统一的格式，在客户端将无法编写有效的网络拦截器，无法统一处理错误。

另外，如果不同的插件，云端返回的数据格式千差万别，那使用者整合这些插件也会非常麻烦。国际化更无法落地。

为此DCloud推出了uniCloud响应体规范。

为了与uni-app前端的API错误回调风格统一，uniCloud响应体规范定义的云端返回信息（尤其是报错时）应包含errCode和errMsg。

示例源码如下，请查看 pre > code 标签中的内容

errCode在成功时应返回数字0,失败时应返回一个以插件id开头的“字符串”，每个单词以连字符（-）分割。做出这样的规定是为了防止不同插件之间出现重复错误码

以'uni-id-account-banned'错误码为例，uni-id为插件id，account-banned为错误缩写。

如果业务开发的代码并不发布插件市场，那么为了避免下载了一个市场的插件产生冲突，推荐使用不包含“-”的字符串来做errCode（插件市场的所有插件ID必须包含“-”）。

后续uniCloud会提供自动根据errCode对errMsg进行国际化处理的功能，开发者仅需保证云函数返回值满足uniCloud响应体规范即可。

errMsg用于存放具体错误信息，包括展示给开发者、终端用户的错误信息

除此之外响应体规范还包含newToken字段，用于token的自动续期（云对象接收含有newToken的响应后会自动更新storage内存储的uni_id_token及uni_id_token_expired，此行为新增于HBuilderX 3.4.13）。开发者仅在自行调用uni-id-common的checkToken等会产生新token的接口时才需要返回新token，uni-app客户端和uni-id-co之间会自动管理token及续期。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX内使用代码块returnu可以快速输入以下代码（HBuilderX 3.4.0及以上版本）:

示例源码如下，请查看 pre > code 标签中的内容

云函数支持 js 和 nodejs 的标准API，如console.log()、setTimeout()，另见nodejs官网 。nodejs版本，详见云函数运行环境

除了标准API外，云函数环境中内置了uniCloud对象，扩展了一批新API，实际开发中更常用的是uniCloud的扩展API。见下：

云函数调用uniCloud接口时（包括请求云函数、云对象、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

云函数中支持访问本服务空间下的、或经授权的其他服务空间下的，数据库。

云函数中如需要请求其他http服务，则使用uniCloud.httpclient。无需额外依赖，就可以请求任何 HTTP 和 HTTPS 协议的 Web 服务。uniCloud.httpclient返回的是一个urllib实例 。

uniCloud.httpclient.request(URL,requestOptions)

默认情况下request接口不会处理返回的数据，即不传dataType参数时会返回buffer类型的数据，如需自动解析json格式的返回结果，需要将dataType设置为"json"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为简化http请求的调用uniCloud新增了uni.request调用方法类似的http请求接口uniCloud.request。

示例源码如下，请查看 pre > code 标签中的内容

实际业务中常有使用云函数发送formdata类型数据的需求，比如微信小程序提供的一些服务端接口（图片内容安全检测、识别图片二维码等），可以参考以下示例进行发送

示例源码如下，请查看 pre > code 标签中的内容

云函数无法作为websocket服务器使用，如有相关需求可以尝试使用uni-push 2.0实现，参考：uni-push 2.0。

本章节内容介绍云函数如何作为websocket客户端使用。为简化调用方式uniCloud新增了uni.connectSocket方法类似的接口uniCloud.connectSocket。

调用此接口返回SocketTask对象，见下一章节介绍

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

以下云函数示例代码，从websocket服务器获取消息拼接后返回给客户端，如果遇到错误会抛出错误

示例源码如下，请查看 pre > code 标签中的内容

由于存在单实例多并发的情况，实例级的uniCloud对象，和每个请求request是一对多的关系。

这也造成了与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了更好的管理请求和请求相关的上下文，uniCloud提供了下面一批API。

示例源码如下，请查看 pre > code 标签中的内容

如没有配置单实例多并发，数组里只会返回一项内容。配置后可能会多项，正在并发的所有请求的requestId都会返回。

当返回多项时，在uniCloud对象上无法明确当前请求是数组中的哪一个。所以提供了其他方法来获取当前请求：

HBuilderX 4.21版本客户端上传clientInfo信息时不会将所有信息都传到云端。具体字段白名单如下：'appId', 'appLanguage', 'appName', 'appVersion', 'appVersionCode', 'appWgtVersion', 'browserName', 'browserVersion', 'deviceBrand', 'deviceId', 'deviceModel', 'deviceType', 'osName', 'osVersion', 'romName', 'romVersion', 'ua', 'hostName', 'hostVersion', 'uniPlatform', 'uniRuntimeVersion', 'uniRuntimeVersionCode', 'uniCompilerVersion', 'uniCompilerVersionCode'。如需让客户端上传更多clientInfo字段到云端，可以使用客户端api：uniCloud.setCustomClientInfo

同理，考虑到单实例多并发，uniCloud.getClientInfos()获取客户端信息也是一个数组。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未开启单实例多并发，那么数组只有1项。单实例多并发场景下返回正在并发的所有请求的客户端信息列表。

getClientInfos返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

除了uniCloud.getClientInfos()API，在云函数context和云对象this中，也可以直接获取当前客户端信息。

同上，为了兼容并发场景，获取云端信息uniCloud.getCloudInfos()返回的也是数组。

示例源码如下，请查看 pre > code 标签中的内容

除了uniCloud.getCloudInfos()API，在云函数context和云对象this中，也可以直接获取当前请求的云端信息。

上述3个API，都因为单实例多并发而被设计成数组方式。实际上，大多数开发者并不使用单实例多并发。

在不考虑单实例多并发时，也可以直接使用uniCloud的getRequestList、getClientInfos、getCloudInfos方法中第一个数组项。

或者在云对象的this和云函数的context里获取相关上下文信息也可以。

uniCloud的api中，有些api对应的实现，其代码体积较大，且这些功能并不是每一个云函数都会使用。为了方便开发者控制云函数的体积，设计了uniCloud扩展库的概念。

开发者可以对云函数目录点右键，管理公共模块和扩展库依赖，在其中选择要加载的扩展库。这个可视化界面对应的数据在云函数目录下的 package.json 内的extensions字段下。

注意：未引用扩展库的，使用uniCloud相应api时会报错。

以下是一个开启了redis扩展库的云函数package.json示例，注意此文件不支持注释，下方示例中的注释仅为演示

示例源码如下，请查看 pre > code 标签中的内容

云函数支持公共模块。多个云函数/云对象的共享部分，可以抽离为公共模块，然后被多个云函数引用。由于篇幅较长，详见

云函数的运行环境是 Node.js，因此我们可以使用 npm 安装第三方依赖。

注意：阿里云目前仅支持全量上传云函数（整个node_modules文件夹全部上传，会在上传前自动在本地安装依赖，不会直接使用云函数目录下的node_modules），因此提醒开发者精简依赖，否则可能会每次上传时间很慢，影响开发体验。并且太大的npm库影响云函数的运行性能。

腾讯云、支付宝云会在上传云函数后自动安装需要的npm依赖。

由于云函数环境缺少一些系统级依赖，而部分npm依赖安装时会针对不同平台进行编译安装，导致无法正常编译。

以下为已知无法在云端云函数环境中运行的npm依赖：

用法同客户端调用云函数，仍然是uniCloud.callfunction，但不支持callback形式。

示例源码如下，请查看 pre > code 标签中的内容

由于调用方不是uni-app客户端，云函数的context、云对象的this.getClientInfo等API无法获取客户端信息，包括 uni-id-token。

可以在云函数互调时手动传递 token ，或者校验调用来源（source）为云函数（function）时不验证用户 token。

云函数/云对象互相调用时调用方会通过公网访问被调用方，访问速度不如直接将逻辑放在调用方执行。使用前请确保你确实需要此功能。

HBuilderX 3.4.0版本之前云函数右键本地运行时，里面的代码再次callFunction会调用云端的云函数而不是本地云函数，此bug后续版本已修复。

除了调用三方云函数，事实上云函数还可以递归调用自己。

当一个云函数实例的资源不能满足需求，或超时时间不够用时。比如要给10万个用户发送短信，而短信发送接口一次调用最多支持50个手机号码，这样最少需要调用2000次接口才能完成；而一个云函数实例完成不了2000次接口的调用。这种场景就可以使用云函数递归调用，分解任务实现。

示例源码如下，请查看 pre > code 标签中的内容

注意：如果不小心把递归云函数写成死循环，就把云函数的内容全部删除，重新上传覆盖即可

在支付宝云与腾讯云服务空间的云函数内支持获取同账号下其他服务空间的uniCloud实例，参考：一个应用访问多个服务空间，并使用此实例调用对应服务空间的云函数。

示例源码如下，请查看 pre > code 标签中的内容

serverless是动态分配计算资源的，由此会引发的出一批特有概念：冷启动、实例、并发请求、无状态、伪全局变量。

基于云函数按需执行的特点, 函数在不被触发的时候, 计算资源是不被激活的。

当一个云函数初次被触发时，其完整过程如下：

函数被调用时，执行这些完整步骤的过程称作冷启动, 冷启动的耗时一般在一秒左右。

一个云函数实例冷启动后，serverless调度中心会保留这个实例一定时间。在实例保留期间，客户端再次请求云函数，不会触发冷启动，速度会更快。实例的详细定义见下

云函数实例和执行进程都被复用的情况下称之为热启动, 热启动性能要好非常多，因为它只有一个步骤：

如果一个云函数实例长时间没有被再次调用，则该计算实例会被回收；后续再次调用该云函数时，就会再次触发云函数的冷启动。

直观的体验表现为：隔了很久不用的云函数，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

注：冷启动虽慢但也不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

三家云厂商仍然在优化冷启动问题。目前给开发者的建议是：

实例，指云函数的一个执行环境，可以简单的理解为一个node进程。

每次客户端发起请求（request）时，serverless的调度中心会查看已启动、且空闲的实例，分配一个实例来接收这个请求。如果没有空闲实例，则新起一个实例。

新起一个实例需要一定时间，也即上文说的冷启动问题。详见冷启动

一个实例启动后，一般在1秒内就会完成请求，但serverless调度中心会保留这个实例一定时间（时间见上一节）。在实例保留期间，客户端再次请求云函数，不会触发冷启动。

也就是说，在实例保留期间，1个实例会接受多个客户端请求。

请求（request），指一次连接云函数的网络请求。不同请求有不同的上下文信息（比如客户端UA）。

所以想要获取客户端信息，一定注意不是在实例的全局对象上获取，而是需要在请求的上下文中获取。详见

在uniCloud阿里云版与支付宝小程序版中还提供了1个实例的多并发请求配置，即同一时间多个请求可以并发执行。 也就是同一时间的请求发到云函数时，没有配置单实例多并发会新开一个云函数实例，配置了单实例多并发则不会新开实例，在一个实例中增加并发。 详见单实例多并发。

一个云函数，可以同时存在多个实例。比如cf1云函数，如未配置单实例多并发，10个请求同时达到云函数，就会开10个实例。

不管开了多少实例，云函数的计费是按请求计费的。实例响应请求后到保留期结束之间，如果不发生新请求是不会计费的。

因为实例可能第一次启动，也可能已经启动，所以云函数中的js全局变量其实是伪全局变量。也就是云函数是无状态的。

在云对象中，写在module.exports = {}之前，云函数写在exports.main = async (event, context) => {}之前的变量定义，是伪全局变量。

以如下代码为例，count作为全局变量，当多次调用该云函数时，可能会出现变量累加的情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面2个示例中，实例未复用时，也就是冷启动时，count的值每次都是0；若实例被复用，则可能返回1、2、3等各种意外情况。

当然，可以用这个方法来获知一个实例被重用了多少次请求。

require由于存在缓存，也存在同样的问题。尽量不要直接修改require返回的内容。

uniCloud全局对象也是跨请求的，与请求相关的内容不应该挂载到uniCloud全局对象上。

由于上节提到的，uniCloud全局对象是实例级的、跨请求的，1个实例内uniCloud只会在冷启动时进行一次初始化。

所以与请求相关的上下文，比如客户端信息，需要通过请求来获取。

为了让开发者清晰的了解实例和请求的关系，uniCloud提供了如下方案。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是uniCloud私有云， 如果想获取与请求相关的信息，比如这次请求的客户端UA，或云函数环境信息，无法直接在uniCloud全局对象中获取。

云函数入口入参包含一个event和一个context，这两个参数和请求相关，每次有新请求到云函数实例时就会有一个新的event对象和一个新的context对象

云对象的this和event、context类似，每个请求都对应一个单独的this。

默认情况下云函数仅支持单实例单并发，即同一时间一个实例仅可为一个请求服务（不同请求同一时间访问会被分派到不同实例进行处理）。不过在uniCloud web控制台中，阿里云可以通过修改云函数单实例并发度，可以修改云函数同一时间最多能处理多少请求。

当实例并发度设置为1时，需要创建3个实例来处理这3个请求，每个实例分别处理1个请求。而每开启一个实例都会引发云函数冷启动；

当云函数的实例并发度设置为10时（即1个实例可以同时处理10个请求），只需要创建1个实例就能处理这3个请求。这样后面2个并发请求不会有因云函数实例创建带来的冷启动问题。

相关文档：云函数实例及部分变量说明 、云函数的无状态

云函数详情页面配置单实例并发度即可，支持1-100之间的数值

旧版本uni-id公共模块指uni-id-common推出之前的版本。详见

示例源码如下，请查看 pre > code 标签中的内容

不同于旧版uni-id公共模块，新版uni-id-common不可直接require后使用，必须使用createInstance方法

开启单实例多并发后的全局变量复用并非一定是坏的结果，如果你很了解此行为，也可以对此进行有效的利用

例：ip-filter 中就利用云函数全局缓存一些ip访问信息来限制单ip访问频率，可以下载示例项目体验一下

受单实例多并发的影响，云函数全局存放与本次请求有关的信息会造成混乱。因此uniCloud提供了根据当前requestId获取客户端信息和云端信息。参考以下文档

云函数是运行在云端的代码，运行环境由云服务器弹性调配，这是和传统Node.js应用很大的区别。

换言之，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合。

所以，不建议使用node的fs文件系统相关的API。建议通过云数据库、云存储、redis的方案替代。

书写云函数时应注意async、await的使用，nodejs有内置模块util可以将符合error-first形式callback的函数转换为promise形式，详情参考 ，比如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果想在云函数内使用回调形式可以让云函数返回一个promise，如以下示例：

示例源码如下，请查看 pre > code 标签中的内容

腾讯云因为按 GBS 对云函数计费，在 node12 时，尤其要注意，如果未有效终止云函数，会一直计费

云函数运行在 node 环境中。可以使用 node api process.version 获取 node 版本。

node版本可以在云函数的package.json文件的cloudfunction-config->runtime字段进行配置，详情参考：云函数package.json

支付宝云云端云函数使用的时区是UTC+8。

阿里云和腾讯云云端云函数使用的时区是UTC+0，而不是 UTC+8，在云函数中使用时间时需特别注意。

云函数在HBuilderX本地运行时，时区则是电脑的时区，很可能是 UTC+8。建议统一使用时间戳，可以规避时区问题。

云函数除了代码，还有配置。在uniCloud web控制台 可以配置；在HBuilderX项目中，云函数根目录的package.json也是存放配置的地方。

云函数运行内存为单个云函数实例使用的内存。

支付宝云云函数默认运行内存512MB，阿里云正式版默认512MB，腾讯云云函数默认运行内存大小为256MB

计算云函数GBs资源消耗时腾讯云会以此内存*运行时间（100ms为阶梯向上取整）得到消耗量。阿里云会以实际运行时间计算GBs，不会按100ms阶梯向上取整

阿里云一般场景（比如包含数据库访问时）不建议将内存配置为128MB。如果开发起见遇到数据库响应缓慢，在排除索引等因素的影响后可以检查下是不是云函数内存配置为了128MB，如果是建议调整为256MB

腾讯云个人版及入门版套餐自2025年8月31日起云函数运行内存固定为256MB，不支持修改，详见相关公告

支付宝云定时任务触发最大支持3小时超时时间（需开启异步超时），非定时触发时超时时间为180秒，客户端请求云函数如果超出180秒云函数断开连接后会停止运行。

阿里云定时任务触发最大支持7200秒超时时间，非定时触发时超时时间为120秒，客户端请求云函数如果超出120秒云函数断开连接后会停止运行。

腾讯云定时任务触发最大支持900秒超时时间。非定时触发时超时时间为60秒，客户端请求云函数时如果超出30秒云函数断开链接后会继续运行，最大能运行到配置的超时时间。

如果超时时间仍然不够用，可以参考云函数递归调用，连续执行多个云函数处理一个任务详情查看

本地云函数默认超时为10秒，超时后云函数会停止运行。

修改超时时间可以在HBuilderX的设置->运行设置->云函数本地运行配置 超时时间中修改，单位为秒。

serverless默认是没有固定的服务器IP的，因为有很多服务器资源在后台供随时调用，每次调用到哪个服务器、哪个ip都不固定。

但一些三方系统，要求配置固定ip白名单，比如微信公众号的js sdk，此时只能提供固定ip地址。

腾讯云199元/月以上的套餐，提供了云函数的固定出口ip，在uniCloud Web控制台 ，创建付费的腾讯云服务空间，选择一个云函数，在云函数的详情界面可以开启固定出口ip。开启后界面上会显示可用的固定ip。拿着这个ip去需要固定ip的界面（如微信公众号管理界面）配置即可。

示例源码如下，请查看 pre > code 标签中的内容

阿里云必须使用uniCloud.httpProxyForEip发送请求才会固定出口ip，其原理是通过代理请求获得固定出口IP的能力。IP为轮转不固定，因此三方服务要求使用白名单时开发者需要将代理服务器可能的IP均加入到白名单中，见下方代理服务器列表。此外对于代理的域名有限制，当前仅持weixin.qq.com泛域名。若开发者有其他域名代理需求，发送邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。

示例源码如下，请查看 pre > code 标签中的内容

如需在获取微信公众号access_token场景使用，请将上述ip配置到微信公众平台 -> 基本配置 -> IP白名单内，相关链接：微信公众平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，此接口以application/x-www-form-urlencoded格式发送数据而不是multipart/form-data

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以application/json格式post数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0版本之前，package.json只是一个标准的package.json，安装依赖或公共模块才需要。HBuilderX 3.0及以上版本，package.json也可以用来配置云函数。

uniCloud web控制台提供了很多云函数的设置，比如内存大小、url化、定时触发等，从HBuilderX 3.0起，在云函数的package.json里也可以编写这些设置。

开发者在本地编写云函数的设置，上传云函数，这些设置会自动在云端生效。（本地不生效）

在云端设置了非默认参数后，HBuilderX下载云函数到本地时，也会自动把设置项放入package.json中下载下来。

package.json是一个标准json文件，不可带注释。下面是一个package.json示例。

示例源码如下，请查看 pre > code 标签中的内容

其中cloudfunction-config字段是云函数配置，支持的配置如下

示例源码如下，请查看 pre > code 标签中的内容

阿里云：Nodejs12、Nodejs14、Nodejs16、Nodejs18、Nodejs20，默认Nodejs16

腾讯云：Nodejs8（即将下线，不推荐使用）、Nodejs12、Nodejs16、Nodejs18，默认Nodejs16

支付宝云：Nodejs16、Nodejs18，默认Nodejs18

阿里云Nodejs8已终止支持：终止支持阶段一：禁止新建（2024年06月01日）；终止支持阶段二：禁止新建和更新（2024年09月01日）。终止支持不影响函数继续运行。建议您及时升级。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

支付宝云与阿里云定时触发的cron表达式不支持代表年的第七位，但是在package.json内配置时仍需将第七位设置为*。

在web控制台配置trigger请参考：定时触发

package.json内统一了支付宝云、腾讯云、阿里云三家厂商的配置，三个平台都需要配置为如下形式

示例源码如下，请查看 pre > code 标签中的内容

阿里云、腾讯云nodejs8在云函数return之后其余逻辑会被冻结不再执行。腾讯云nodejs12表现恰好相反，云函数return之后还会等待其余逻辑执行后才会将此云函数实例空闲出来。

示例源码如下，请查看 pre > code 标签中的内容

如果此云函数运行在阿里云或腾讯云nodejs8，setTimeout里面的console.log不会在本次云函数调用执行，但是可能在云函数实例再次被复用时继续执行。

如果此云函数运行在腾讯云nodejs12，setTimeout里面的console.log会在本次云函数调用内，同样的本次云函数**计费时间（与云函数GBs指标相关）**也会按照最终执行完成的时间计算（5000ms+return耗时）。但是前端无需等待5秒即可收到响应。注意：如果有未断开的长连接（例如：redis连接）会导致云函数一直运行到配置的超时时间

当在云函数package.json内的cloudfunction-config内配置了keepRunningAfterReturn: false时，可以改变腾讯云nodejs12的表现，云函数return之后将不再继续执行，未断开的长连接也不会增加云函数实际运行时间，云函数return后长连接也不会被中断，简单来说其表现和腾讯云nodejs8一致。

将上述示例中的setTimeout换成网络请求、调用其他云函数或数据库请求同理，如果在阿里云或腾讯云nodejs8直接return会导致网络请求可能无法发送（即使成功发送也是在下一次云函数实例被复用的时候），这是与传统开发不太一样的地方。

示例源码如下，请查看 pre > code 标签中的内容

由于redis需要和服务器建立连接，此连接会阻止云函数结束执行。如果没有云函数return之后还需要继续执行的需求，可以简单的在cloudfunction-config内配置keepRunningAfterReturn: false。这样redis的连接并不会中断，下次请求来时依然可以使用之前建立的连接。

如果需要return之后继续执行，那么需要在使用完毕后断开redis连接，调用redis.quit()方法即可断开连接。需要注意的是断开连接后之前建立的连接将不再可用，下个请求到来时需要使用uniCloud.redis()方法重新建立连接。

如未按照上述说明进行操作，redis连接将会一直占用云函数实例，导致云厂商持续计算云函数执行时间，可能会导致消耗大量云资源而产生额外费用

务必确定自己已理解此文档内容，因未按照文档说明使用导致的额外计费DCloud不承担任何责任

HBuilderX 2.9版本，uniCloud提供了cloudfunctions_init.json来方便开发者快速进行云函数的初始化操作。

注意：HBuilderX 3.0.0版本起不再使用cloudfunctions_init.json来初始化云函数。改为使用在云函数目录下通过package.json进行配置，具体见上个章节

不再使用cloudfunctions_init.json，内容被分散到每个云函数的package.json的cloudfunction-config字段下

package.json是一个标准json文件，不可带注释。下面是一个package.json示例

示例源码如下，请查看 pre > code 标签中的内容

cloudfunction-config说明如下

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.0.0之前版本，请继续阅读下面文档

cloudfunctions_init.json形式如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 2 (unknown):
```unknown
|——— cloudfunctions               云函数目录
|   │───common                    云函数公用模块目录 详情
|   |   └──hello-common           云函数公用模块
|   |      │──index.js            公用模块代码
|   |      └──package.json        公用模块package.json
|   │───uni-clientDB-actions      （推荐用数据库触发器替代action云函数）
|   │      └──new_action.js       clientDB action代码 详情
|   │───function-name             云函数目录
|   │     │──index.js             云函数代码
|   │     └──package.json         包含云函数的配置信息，如url化、定时设置、可用内存等内容 详情
|   └───object-name               云对象目录
|         │──index.obj.js         云对象代码
|         └──package.json         包含云对象的配置信息，可用内存等内容 详情
```

Example 3 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

Example 4 (javascript):
```javascript
// 客户端js直接操作云数据库，查询list表的数据。无需服务器代码
const db = uniCloud.database() // 获取云数据库的引用
db.collection('list').get()
  .then((res)=>{
    // res 为数据库查询结果
  }).catch((err)=>{
    console.log(err);
  })
```

---

## 简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-pay/wxpay-virtual.html

**Contents:**
- # 简介
- # Api 列表
  - # 充值代币、道具直购
  - # 查询用户代币余额
  - # 扣减代币（一般用于代币支付）
  - # 代币支付退款（currencyPay接口的逆操作）
  - # 代币赠送

此文档是微信小程序虚拟支付的云端API补充，使用此文档的API需要先安装 uni-pay 插件才能使用，仅 uni-app 项目可用，uni-app-x 项目暂不支持微信支付，也不支持微信小程序虚拟支付

提示：微信虚拟支付有很多API，当前仅支持以下几个常用的API，后面会陆续增加其他API

以下API均只能在云端调用，不可以在前端调用

充值代币 和 道具直购 涉及到前端API，需要搭配 uni-pay 组件使用，详情见 充值代币文档 、道具直购文档

示例源码如下，请查看 pre > code 标签中的内容

此API需要用到用户的 sessionKey，如果用户长时间没有活跃过小程序，则无法请求扣减代币接口，会报用户sessionKey不存在或已过期，请重新登录的错误

微信小程序虚拟支付退款后，如果退款的是代币充值订单，则退款成功后原本用户充值的代币不会自动扣减，需要执行此API才能扣减，而用户长时间没有活跃过小程序，则无法请求扣减代币接口，因此需要注意退款时间，时间相隔太长可能会导致出现无法扣减代币的尴尬情况

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
// 引入 uni-pay-co 云对象
const uniPayCo = uniCloud.importObject("uni-pay-co");
// 请求微信虚拟支付API
let res = await uniPayCo.requestWxpayVirtualApi({
	method: "queryUserBalance", // 请求方法
	// 请求参数
	data: {
		openid: "", // 用户openid
		userIp: "", // 用户IP
	}
});
console.log('res: ', res);
```

Example 2 (javascript):
```javascript
// 引入 uni-pay-co 云对象
const uniPayCo = uniCloud.importObject("uni-pay-co");
// 请求微信虚拟支付API
let res = await uniPayCo.requestWxpayVirtualApi({
	method: "queryUserBalance", // 请求方法
	// 请求参数
	data: {
		openid: "", // 用户openid
		userIp: "", // 用户IP
	}
});
console.log('res: ', res);
```

Example 3 (javascript):
```javascript
// 引入 uni-pay-co 云对象
const uniPayCo = uniCloud.importObject("uni-pay-co");
// 请求微信虚拟支付API
let res = await uniPayCo.requestWxpayVirtualApi({
	method: "queryUserBalance", // 请求方法
	// 请求参数
	data: {
		openid: "", // 用户openid
		userIp: "", // 用户IP
	}
});
console.log('res: ', res);
```

Example 4 (javascript):
```javascript
// 引入 uni-pay-co 云对象
const uniPayCo = uniCloud.importObject("uni-pay-co");
// 请求微信虚拟支付API
let res = await uniPayCo.requestWxpayVirtualApi({
	method: "queryUserBalance", // 请求方法
	// 请求参数
	data: {
		openid: "", // 用户openid
		userIp: "", // 用户IP
	}
});
console.log('res: ', res);
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema?id=field-rules

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-database?id=start-transaction

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

## 简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-ai-x.html

**Contents:**
- # 简介
- # 项目背景：
- # 功能和特点
  - # Android端demo：
- # 安装步骤
- # 常见问题
- # 交流群
- # 声明

uni-ai x，是一个开源的、全平台的、原生的、云端一体的ai聊天套件。

能够连接ai大模型，真流式接收和输出内容，原生渲染markdown。 基于跨平台原生开发框架 uni-app x 可以被编译为不同平台的编程语言，如：

市面上开源的AI聊天套件大多以Web端为主，像ChatGPT、DeepSeek等的App端并不开源。 而通过Web-view接入AI的体验差强人意，自己开发面临如下核心挑战：

uni-ai x由此应运而生，专注攻克全平台原生AI聊天场景的技术痛点。

uni-ai x功能上参考 deepseek 的客户端设计，并扩展了更多平台。

各端效果如下截图，依次平台为：iOS、Android、鸿蒙 web pc端：

前提条件：uni-ai x 支持的大语言模型服务商为阿里百炼 ，需要先注册账户并创建 API-Key

下载示例项目 打开uni-ai x插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-ai-x

不基于unicloud的项目，需要根据文档 提供获取临时鉴权 token 接口。并配置到/uni_modules/uni-ai-x/config.uts，bailian -> getToken 内

基于unicloud的项目，默认将通过 uni-ai-x-co 获取；

示例源码如下，请查看 pre > code 标签中的内容

默认例子（顶部被注释的代码）适用于基于 unicloud + uni-id-pages-x 的项目的，解开注释即可使用。 非 unicloud 项目，参考此示例简单修改即可

Provider 服务商 @Provider

LLMModel 模型 @LLMModel

更多问题欢迎点此 加入uni-ai官方交流群

当前项目正在快速迭代UI体验，请关注本项目，订阅更新通知。

**Examples:**

Example 1 (json):
```json
{
    "apiKey":{
        "bailian": "sk-2****7"
    } 
}
```

Example 2 (json):
```json
{
    "apiKey":{
        "bailian": "sk-2****7"
    } 
}
```

Example 3 (json):
```json
{
    "apiKey":{
        "bailian": "sk-2****7"
    } 
}
```

Example 4 (json):
```json
{
    "apiKey":{
        "bailian": "sk-2****7"
    } 
}
```

---

## uniCloud概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/README

**Contents:**
- # uniCloud概述
  - # uniCloud 的价值
  - # 看视频，只需25分钟，快速入门uniCloud
  - # uniCloud是什么和不是什么
  - # 什么是serverless？
  - # uniCloud为何可降低云服务租用成本
  - # uniCloud降低前端掌握后端的门槛
  - # uniCloud如何提升10倍开发效率？
    - # 一个故事
    - # 第一层提效：提供众多现成的轮子

uniCloud 是 DCloud 联合阿里云、腾讯云、支付宝云，为开发者提供的基于 serverless 模式和 js 编程的云开发平台。

uniCloud 的 web控制台地址：https://unicloud.dcloud.net.cn

uniCloud为每个开发者提供2个免费服务空间（阿里云和支付宝云各1个），让你也可以拥有自己的服务器。

uniCloud是DCloud在阿里云、腾讯云、支付宝云等的serverless服务上封装而成的。

它包含IaaS层（由阿里云、腾讯云、支付宝云提供硬件和网络）和PaaS层（由DCloud提供开发环境）。

开发者可以自主选择uniCloud的硬件和网络资源的供应商，在不同云厂商之间切换。

开户和付费虽然通过DCloud渠道，但实际上开发者自动在云厂商处建立了账户和充值了余额。价格是云厂商的标准定价，DCloud只获取云服务厂商的返佣。

开发时虽使用DCloud的工具，但应用上线时，客户端是直连阿里云或腾讯云的serverless，不经由DCloud的服务器。

serverless是目前很火的概念，它是下一代云技术，是真正的“云”。

传统的云服务，让开发者免于购买实体服务器硬件，改为购买虚拟机。但开发者仍然要自己装操作系统、web服务器、数据库，自己处理热备，自己新购服务器来应对高并发，自己抗DDOS攻击...

真正的云计算，就像用水用电，没有复杂的门槛，即用即有、按需付费。

简单回顾下用电的历史。几十年前，很多单位都有专门管电的工程师，当单位的电力负荷不够时，就需要找这个管电的工程师扩容发电机。

现在这个管电工程师的岗位已经淘汰了，电已经变成随用随取、按需付费了。

传统云模式下，开发商仍然需要一个管服务器的工程师，当用户量激增或被攻击时，甚至需要半夜把工程师叫醒来扩容。这当然不合理。

serverless的云，真正的把计算、存储的能力进行了云化，开发者只需要按量租用这些计算和存储能力，再也不用关心扩容和攻击。

开发者不再有“服务器”的概念，因为没有一台具体的机器。就像现在的你再也找不到自己的发电机一样。

当用户量激增时，开发者什么都不用做，系统自动承载更高并发。开发者只需要按照对资源的消耗付费即可。

同理，如果没有用户使用，即没有资源消耗，则根本无需为云资源付费。

开发者写好云端业务代码，即js编写的云函数，通过HBuilderX部署到uniCloud上即可。

云端庞大的serverless资源池，有无数个node进程待命。当手机用户发起请求时，serverless系统会调配闲置的资源来运行开发者相应的云函数。

serverless在国外兴起，但国内的发展速度已经超过了国外。微信、支付宝、百度、抖音、快应用联盟都上线了自己的serverless云开发。

目前国内已经有超过60万开发者在使用serverless云开发，包括腾讯、阿里、DCloud的很多自有业务都在使用。

就像uni-app可跨端一样，uniCloud可跨云。基于uniCloud，无需担心使用云开发被绑定到专用的小程序平台。uni-app + uniCloud 是跨端跨云的开发方案。

1、传统云服务的租用，按占用的硬件资源的上限值+固定时长来租用。

传统云是按配置买服务器，买了之后不管用不用都要交钱。而serverless是按量计费，如果没有使用，一分钱都不用交。

传统云选择CPU和内存的配置，不到满配时，资源是浪费的，接近满配就需要立即扩容新的配置。

serverless不是传统云，它不需要开发者选择CPU和内存配置，也没有操作系统的选择。开发者编写云函数代码，上传到uniCloud的阿里云版或腾讯云版。

阿里云和腾讯云搭建了巨大的serverless资源池，有众多node进程用于云函数的运行。

这些资源是复用和共享的，并不存在某个开发者租用了3G CPU和8G内存，这些硬件就只能为他所用。

因为共享大资源池，云服务厂商的成本大幅下降，开发者无需为闲置资源付费，云函数被调用才计费。

从技术原理上serverless就有明显成本优势，所以租用serverless比租用传统云要便宜的多。

在阿里云和腾讯云的官网可以看到长长的收费产品列表，比如负载均衡、高防、cdn回源、安全中心...

这个计费项又贵又让开发者头晕。在uniCloud的世界，简单清晰，没有这些收费项。

只需按对计算资源、存储资源的消耗计费，只需关心业务，无需关心其他各种名目的增值产品，也无需为它们付费。

要知道一个用于防DDoS的高防套餐，每个月至少几万元。而这些费用，在uniCloud中无需支付。

展开说下uniCloud为什么不用买高防也不害怕DDoS：由于阿里云和腾讯云的serverless有巨大的资源池，且serverless没有固定ip，云函数使用的是阿里云和腾讯云的自有域名，前端网页托管在cdn上，DDoS攻击者打不起、也打不挂uniCloud。

uniCloud阿里云版、支付宝云版各为每个开发者提供1个免费的服务空间。传统云可没有这种优惠。

DCloud拥有国内广泛的开发者，可以与云厂商谈判拿到非常低的价格。所以不管是服务器计算资源、还是短信、实人认证、一键登陆等云能力，uniCloud里的定价均低于阿里腾讯等云厂商的定价。

基于以上4点原因，uniCloud大幅降低了开发者云资源的租用成本。

除了云资源的成本，uniCloud还可以减少开发商的人工成本、招聘成本、沟通管理成本，这些成本更远大于云资源成本。

而有了uniCloud，这些门槛全都降了下去：

所以说，uniCloud是前端变全栈的最佳机会，只需花点时间熟读uniCloud的文档，你就可以成为全栈！

uniCloud最吸引人的是，它将开发效率提升了10倍以上。

在uniCloud推出的3年时间里，uni-app + uniCloud 已经变成了一个庞大的生态。包括非常多的工具、模块。

开发效率提升10倍，并非某个杀手功能的功劳，而是庞大的生态共同的作用。本章节篇幅较长，请耐心阅读。

2020年初，uniCloud刚发布，新冠肺炎突然来袭，各地涌现大量抗疫项目需求。

uni-app + uniCloud成为大家和病毒抢时间的重要利器。

各地迅速涌现了数百个基于uni体系的抗疫项目。详见：https://www.dcloud.io/ncp.html

当时一个抗疫项目的开发，仍然需要几十人天。

以出入管理登记 的项目为例，第一版做了10天，有4-5位全职或兼职工程师参与。

一年后的2021年春节，各地又大量出现了返乡人员信息登记 的需求。

项目需求类似，但此时的uniCloud生态建设已经完善，基于各种利器，返乡人员登记系统的开发人天数大幅削减，只花费0.0625人天！

uni云端一体生态的内容太多，让我们抽丝剥茧、归纳分类，以容易理解的方式讲解开发效率是怎么提升的。

这是云端一体生态里最容易理解的价值：大量开源模块。

以前的开源模块，基本端是端、云是云，没听说过云端一体的开源模块。

以用户模块为例，其实它有前端、也有云端。前端有注册、登录、修改密码等页面，云端有对应的逻辑代码和数据库。

现在有了uni-id，一个开源的、功能完善的、云端一体的用户模块。立即节省数人月的开发工作量。

上面的轮子，是与业务无关的通用轮子。除此之外，还有大量的云端一体的项目模板。 使用这些现成的项目模板，那开发效率更是极大幅的提升。过去5、6人月的项目，现在几天就能搞定上线！

在这里，我们还必须提到2个新概念：uni_module和datacom。

如果在第一层提效中，找不到现成的轮子，需要自己写代码时。那么首先要做的，是使用schema2code这个神器，自动生成代码。

uniCloud云数据的schema，是一项重要的创新。 为数据表编写schema，可以实现非常多功能：数据结构定义、权限管理、数据值域管理，以及非常神奇的功能 -- 《schema2code》

在传统开发中，有了数据库，可以生成crud后台接口。然后前端再写代码调用接口。

但在uni云端一体生态中，有了数据库的schema，可以直接生成云端一体的页面。而不仅仅是只生成接口。

schema2code，可以生成手机端的列表、详情或增删改页面，也可以生成admin管理端的所有数据管理功能的页面。

如下是schema2code的操作演示视频：

可以实战体验这个云端一体通讯录 的项目，几乎没有单独写代码。设计好通讯录的表schema，用schema2code即可生成这个项目。

前述提到的返乡人员管理项目，之所以只花费了半小时就可以做好，也是schema2code的功劳。

数据的权限管理也很简单，在schema中可以快速定义指定的数据记录或字段，只能由什么样角色或权限的人来操作。

数据入库的值域校验就更简单了。传统开发中，一个手机号的校验，需要在前端页面写一遍，服务器入库前再检查一遍，很多余。既然云端协同了，自然会优化掉这个问题。

现在只需在DB Schema中定义好手机号这个字段的可选值域，比如一个正则，那么schema2code将自动生成前端表单，且遵循schema的定义，只接受相同正则。

这样不但提高了开发效率，还可以避免传统开发中各种漏洞，保持严谨和一致性。

schema2code生成的代码清晰易读，易于二次开发。这比低代码平台更有效率、且完全开放开源，随意扩展。

如果schema2code仍不能满足你的需求，需要单独开发，那么只要操作数据库，clientDB 就是推荐使用的利器。

传统开发中，前端写request联网，后台写接收请求去查库，再返给前端，然后前台再绑定到data上....天天干这么枯燥的事情不烦吗？

uni-app提供了<unicloud-db>组件（代码块触发键是udb），在前端直接访问数据库，前所未有的高效和简洁，在大多数场景下完全不用写服务器代码！

比如uniCloud的云数据库有个user表，里面有字段id、name，查询id=1的用户数据，把名字显示在界面上，写法如下：

示例源码如下，请查看 pre > code 标签中的内容

是的，仅需5行代码，就可以完成过去前后端合计得写几十行代码才能完成的事情，代码量大幅减少到原来的十分之一。

无需担心前端直接访问数据库会造成安全隐患，上一节提过了DB Schema，在云端的schema中可以定义什么角色可以操作数据库。详见

clientDB技术，有前端的JS API和前端组件，为了进一步提高开发效率，clientDB还提供了几大利器： JQL是一种基于js的数据库操作语言，它改进了SQL语言的诸多不便之处。

可以看出，在uni云端一体生态中，开发者不但提高了效率、减少了成本，还得到了更强大的赋能工具。

如果clientDB仍然不能满足需求，必须编写云端代码，那么云对象的出现，彻底改变了后端开发json接口和前端联调的低效局面。

云对象把云端的代码变成对象方式，让前端js直接import这个对象，然后使用这个对象的方法，就像使用前端的js对象一样顺畅。

云端新加一个todo云对象，写一个add方法，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个todo对象，调用它的add方法

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX、uni-app、uniCloud是三位一体、高效协同的。

HBuilderX提升了uni-app的开发效率，自然也将提升uniCloud的开发效率。并且三位一体，实现了以前无法想象的新突破。

在传统开发中，item是一个通过request返回的json，ide是不可能知道这个json的数据结构的，也就无法提示。

由于三位一体协同，HBuilderX可以解析本地schema文件，直接提示item后面的数据结构。避免开发者写错代码、减少服务器联调工作。

云对象的方法，HBuilderX同样可以完美解析，让编写客户端代码时直接提示云对象的方法、参数。

前端和云端都使用js编程语言，提高了沟通效率。

js和其他服务器语言，比如php或java，在过去需要Mock来翻译，这很多余。

在实际开发中，开发商应该安排人员按业务分工，专注于业务，一个业务模块的前端后端都由一个人负责。开发效率会比以前更高。

由于统一了技术栈，招聘效率、管理效率也会相应提升。

代码量减少到原来的十分之一，这自然可以让code review效率和白盒测试的效率也提升了十倍。

黑盒测试中，前后端对不齐的bug、权限漏洞等发生的概率也大幅减少。

因为serverless的免运维特点，开发商再也不用操心扩容、高并发、ddos攻击、安全漏洞补丁等一系列麻烦事。只需专注于自己的业务。

uniCloud是开发界的革命。在HBuilderX、uni-app、uniCloud三位一体的协同下、创新的功能设计下、丰富的生态和轮子支持下，开发者的开发效率，超过传统开发10倍以上。

目前uniCloud已发展3年多，活跃服务空间数万，云函数日请求数量过亿。请放心使用。

多年php/java工程师纷纷改用uniCloud，来看他们怎么说 https://mp.weixin.qq.com/s/p9GbRqRQuvEbmbpHJhZGmw

前端如何快速升级为全栈？- uniCloud开发者采访纪实 https://mp.weixin.qq.com/s/5Q7ulHlBzgjVl1bnGTI06Q

**Examples:**

Example 1 (html):
```html
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

Example 2 (html):
```html
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

Example 3 (json):
```json
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

Example 4 (html):
```html
<template>
  <view>
    <unicloud-db v-slot:default="{data, loading, error, options}" collection="user" field="name" :getone="true" where="id=='1'">
      <view>
          {{ data.name}}
      </view>
    </unicloud-db>
  </view>
</template>
```

---

## 简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/hosting?id=routing

**Contents:**
- # 简介
- # 案例
- # 开通
- # 使用
- # 基础配置
  - # 配置域名
    - # 域名备案
  - # 路由规则
  - # 缓存配置
  - # 刷新缓存

DCloud为开发者提供了uni发布平台，包括网站发布、App发布和统一门户页面。

前端网页托管基于uniCloud的能力，为开发者的html网页提供更快速、更安全、更省心、更便宜的网站发布。

首先开发者需要开通uniCloud，登录https://unicloud.dcloud.net.cn/ 。

最后在上述网页左侧导航点击前端网页托管，即可开始使用。

前端网页托管和云函数没有绑定关系，可以和云函数部署在一个服务空间，也可以是不同的空间，甚至是不同云服务商的空间。

开通后，需要把开发者的前端网页，上传到uniCloud的前端网页托管中。

方式1. 通过uniCloud控制台 ，在web界面上传。

上传时，可以按文件上传，也可以按文件夹上传。

如果是按文件夹上传，可以选择上传后的目录是否包含上传文件夹的根目录。

方式2. 通过HBuilderX工具上传。

HBuilderX 2.8+起，支持在HBuilderX中直接上传前端网页到uniCloud阿里云版；3.5.1起，支持uniCloud腾讯云版。

HBuilderX 2.8.9+，支持前端网页托管管理器管理uniCloud阿里云版，3.5.1起，支持uniCloud腾讯云版。

在菜单视图中，或者在左下角状态栏中，点击前端网页托管，可在左侧打开前端网页托管管理器。如下图

在前端网页托管管理器中，可以看到当前用户的服务空间列表，置灰表示该服务空间还没有开通前端网页托管，点击后可根据提示开通。（如上图中置灰的ali1服务空间）。

点击可用的服务空间，在右侧可以看到远端的资源管理器，把本地文件拖进入，即可上传文件。

本章节介绍前端网页托管提供的各种配置项目说明。其中配置域名、网站首页、404页面，是阿里云和腾讯云均支持的，其他配置仅腾讯云支持。

前端网页托管，自带一个测试域名，仅用于产品体验及测试可快速体验前端网页部署的完整流程，该域名有如下限制：

业务如要上线商用，请配置自己的正式域名，配置自己的正式域名后，将不受上述测试域名的限制。（尤其注意阿里云测试域名是公共的，任意一个服务空间如果有上传恶意文件被投诉，会导致测试域名被微信内置浏览器整体禁封）

1、登录uniCloud控制台 。 2、进入前端网页托管页面，选择【基础设置】，单击【添加域名】，进行域名添加，（注意：域名是需要自行购买的）如下图所示：

3、添加后，系统会自动分配一个 CNAME 域名，CNAME 域名不能直接访问，您需要在域名服务提供商处完成 CNAME 配置（将添加的域名CNAME到此域名），配置生效后，新域名即可使用。

阿里云现已支持http强制跳转https，在上述添加界面打开对应开关即可

如果你已经有备案过的域名，直接解析过来即可；如果你要新注册域名，首先自行在网上购买，然后注意域名如果想在国内正常绑定阿里云或腾讯云，需要域名备案。 这里的备案流程和传统云主机略有不同，涉及uniCloud没有固定ip的问题。

域名如果使用https，则需要证书。证书签发后，可下载到本地，然后将内容复制黏贴到uniCloud web控制台。

注意：各运营商下载证书的后缀可能不同，一般来说，.key文件对应私钥，.pem或.crt文件对应证书。这几种类型文件都是文本内容，可选择记事本打开查看内容。

务必注意，如果你是在腾讯购买并备案的域名需要保留一个到腾讯ip的解析，否则备案会被撤销，阿里云同理。具体细节可以咨询购买域名的云厂商

如需在阿里云正式版支持history模式，请将404页面配置为网站首页。注意正式版404页面不支持目录，即阿里云仅能在根目录下支持history模式

例：将404错误码重定向至index.html，需做如下配置（uni-app项目使用history模式发行到h5时可以使用此配置）：

例：当您删除了images/文件夹（即删除了具有前缀images/的所有对象）。您可以添加重定向规则，将具有前缀images/的任何对象的请求重定向至test.html页面。

例：当您将文件夹从docs/重命名为documents/后，用户在访问docs/文件夹会产生错误。所以，您可以将前缀docs/的请求重定向至documents/。

腾讯云需要填写要刷新的链接，针对填写的链接进行刷新。阿里云对默认域名和自定义域名一键刷新。支付宝云需填写要刷新的文件夹或文件路径，以/结尾。

防盗链支持域名 / IP 规则，匹配方式为前缀匹配（仅支持路径情况下，域名的前缀匹配不支持），即假设配置名单为www.abc.com，则www.abc.com/123匹配，www.abc.com.cn不匹配；假设配置名单为127.0.0.1，则127.0.0.1/123也会匹配。 防盗链支持通配符匹配，即假设名单为*.qq.com，则www.qq.com、a.qq.com均会匹配。

用户端 IP 匹配黑名单中的 IP 或 IP 段时 ，访问 CDN 节点时将直接返回403状态码。

用户端 IP 未匹配白名单中的 IP 或 IP 段时 ，访问 CDN 节点时将直接返回403状态码。

注意：腾讯云和支付宝云的默认域名不限制IP访问数量，故不需要加IP白名单

为保障默认域名不被滥用，阿里云对默认域名做出了如下限制：每天前10个IP可以直接访问，超出10个IP后需要配置IP白名单才可以访问

仅支持配置ipv4，可以配置IP或者IP网段，掩码位数取值范围24-31。最多可同时配置三个，多个之间用逗号隔开，如：123.120.5.235/24,123.123.123.123

当访问IP超限或不在白名单时，前端网页托管将拒绝访问请求，并在页面输出错误码为ClientIpNotAllowed的提示：Your clientIp xxx does not in the whitelist.

您可以通过配置自定义域名并使用自定义域名访问来规避此问题。

web浏览器有跨域限制，A域名的网站如果通过js请求另一个域名B，且另一个B域名并没有放开跨域策略，那么浏览器就会报跨域错误。

在前端网页托管里，托管前端网页的网站就是A域名。要连接的服务器接口就是B域名。

也就是业务后台也在uniCloud的云函数或云对象上。此时需要在uniCloud的web控制台 的跨域配置中，把A域名填写在Web安全域名中。

服务空间已默认支持localhost及前端网页托管默认域名跨域请求云函数，如果需要使用内网地址或者前端网页托管绑定的自定义域名访问云函数，需单独添加跨域设置。内网地址需填写带端口的完整地址，如192.168.10.11:5173。

阿里云跨域配置支持通配符*，即所有域名均可请求云函数，最多可添加9条跨域配置规则，其他云厂商不支持仅配置通配符*。腾讯云跨域配置生效较慢，需要10分钟左右。

需要在开发者自己的传统服务器上配置跨域，允许A域名跨域访问自己。

如果在更新页面后浏览器访问到的仍是旧页面，可以通过如下流程排查

uni-app项目根据路由模式不同需要做不同的配置

使用hash模式时，无需特别的配置即可正常使用

手动部署uni-app项目时需要注意将文件部署在配置的h5基础路径下。HBuilderX一键部署时会自动按照manifest.json内配置的基础路径进行部署

如果部署多个项目到一个服务空间可以使用不同的基础路径来区分，需要注意的是这多个项目中只有一个项目可以使用history模式。

以一个admin项目和一个用户端项目为例，可以将用户端项目部署在前端网页托管的根目录下，admin项目部署在/admin目录下。通过https://xxx.com/访问用户端项目，通过https://xxx.com/admin/来访问admin项目

阿里云前端网页托管在绑定自定义域名后，支持配置CDN安全策略：https://doc.dcloud.net.cn/uniCloud/cdn-security-policy.html

---

## 快速入门 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-live/quick-start.html

**Contents:**
- # 快速入门
- # 快速开始
  - # 开通服务
  - # 步骤一 添加推流域名与拉流域名
  - # 步骤二 配置推拉流域名CNAME
    - # CNAME 生效验证
    - # 配置 SSL 证书（可选）
  - # 步骤三 生成推流地址和拉流地址
  - # 步骤四 直播推流
    - # live-pusher 组件推流

uni直播提供了推拉流、直播回放、直播统计等功能。本文档将指导您快速开始使用uni直播。

参考uni直播服务开通文档，了解如何开通uni直播服务。

使用uni直播服务前，您需要拥有至少一个已备案的域名。推流域名与拉流域名不能是同一个域名，但可以是同一域名下的两个不同子域名。

完成上一步骤后，在域名管理页面，您会看到推流域名和拉流域名的CNAME信息。

现在您需要在域名服务商处添加CNAME解析，将您的推流域名和拉流域名指向uni直播的CDN加速域名。

以下以阿里云为例，说明如何添加CNAME解析：

可以通过阿里云网络拨测工具 来验证您的CNAME解析是否生效。

输入您的推流域名或拉流域名，点击立即检测按钮，查看解析结果。

解析结果中应显示uni直播提供的CNAME地址，表示CNAME解析已成功生效。

由于原生浏览器的安全要求，若您需要在浏览器进行直播播放，您需要为推流、播放域名配置SSL证书，具体请参见

推流地址和拉流地址是用于推送直播流和拉取直播流播放的域名，您可以在uni直播控制台中生成，具体生成步骤如下：

uni-app和uni-app x 均支持使用 live-pusher 组件推流， 也可以在其他第三方推流软件中使用，详见

参考 uni-app live-pusher 或uni-app x live-pusher 组件文档，在您的应用中使用live-pusher组件进行直播推流。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在uni-app 中，小程序端使用live-player 组件进行直播拉流；web/app端，使用video 组件进行直播拉流。

在uni-app x中，app端和小程序都使用live-player 组件进行直播拉流。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

您可以在uni直播控制台 或者使用uni直播扩展库生成这些地址。

泛指直播音视频数据的传输，它能够被作为一个稳定的和连续的流通过网络传输给观众观看。

直播地址中的URL域名，通过URL域名进行直播业务VDN分发和加速，域名类型分为RTMP推流、RTMP播放、HLS播放、TS切片、HDL播放及直播封面域名。

指主播通过业务服务端从直播云平台获取到的推流地址，将采集的流媒体通过推流地址实时的推送至直播云接收端。

拉流是指通过直播云平台到用户指定的源站拉取直播流的过程。

业务服务端从直播云平台获取到RTMP协议的URL地址，用来进行直播推流及加速。

指观众在观看直播时，播放器使用的播放地址，亦指播放端拉流地址。

通过对推流、播放及对直播流相关处理的URL进行加密，验证用户访问权限。

直播转码是将视频码流转换成另一个视频码流功能。通过转码，可以改变原始码流的编码格式、分辨率和码率等参数，从而适应不同终端和网络环境的播放。以适配不同的网络带宽、不同的终端处理能力、不同的延时要求，满足不同的用户需求。

H.264是由ITU-T视频编码专家组（VCEG）和ISO/IEC动态图像专家组（MPEG）联合组成的联合视频组（JVT）提出的，高度压缩数字视频编解码器标准，同时也是MPEG-4第十部分。拥有低码率、图像质量高、容错能力强和网络适应性强等优点。

H.265是ITU-T视频编码专家组（VCEG）继H.264之后所制定的新的视频编码标准。H.265标准围绕着现有的视频编码标准H.264，保留原来的某些技术，同时对一些相关的技术加以改进。新技术使用先进的技术用以改善码流、编码质量、延时和算法复杂度之间的关系，达到最优化设置。

RTMP（Real-Time Messaging Protocol）是一种用于音视频数据传输的协议，广泛应用于直播推流。

SRT（Secure Reliable Transport）是一种低延迟、高可靠性的传输协议，适用于直播推流。

WHIP（WebRTC HTTP Ingest Protocol）是一种基于HTTP的推流协议，适用于WebRTC直播推流。

RTMP（Real-Time Messaging Protocol）是一种用于音视频数据传输的协议，广泛应用于直播拉流。

HLS（HTTP Live Streaming）是一种基于HTTP的流媒体传输协议，适用于直播拉流。

FLV（Flash Video）是一种基于Flash的流媒体传输协议，适用于直播拉流。

DASH（Dynamic Adaptive Streaming over HTTP）是一种基于HTTP的自适应流媒体传输协议，适用于直播拉流。

WHEP（WebRTC HTTP Egress Protocol）是一种基于HTTP的拉流协议，适用于WebRTC直播拉流。

SRT（Secure Reliable Transport）是一种低延迟、高可靠性的传输协议，适用于直播拉流。

**Examples:**

Example 1 (html):
```html
<live-pusher
    id='livePusher'
    ref="livePusher"
    class="livePusher"
    url=""
    mode="SD"
    :muted="true"
    :enable-camera="true"
    :auto-focus="true"
    :beauty="1"
    whiteness="2"
    aspect="9:16"
    @statechange="statechange"
    @netstatus="netstatus"
    @error = "error"
></live-pusher>
```

Example 2 (html):
```html
<live-pusher
    id='livePusher'
    ref="livePusher"
    class="livePusher"
    url=""
    mode="SD"
    :muted="true"
    :enable-camera="true"
    :auto-focus="true"
    :beauty="1"
    whiteness="2"
    aspect="9:16"
    @statechange="statechange"
    @netstatus="netstatus"
    @error = "error"
></live-pusher>
```

Example 3 (json):
```json
<live-pusher
    id='livePusher'
    ref="livePusher"
    class="livePusher"
    url=""
    mode="SD"
    :muted="true"
    :enable-camera="true"
    :auto-focus="true"
    :beauty="1"
    whiteness="2"
    aspect="9:16"
    @statechange="statechange"
    @netstatus="netstatus"
    @error = "error"
></live-pusher>
```

Example 4 (html):
```html
<live-pusher
    id='livePusher'
    ref="livePusher"
    class="livePusher"
    url=""
    mode="SD"
    :muted="true"
    :enable-camera="true"
    :auto-focus="true"
    :beauty="1"
    whiteness="2"
    aspect="9:16"
    @statechange="statechange"
    @netstatus="netstatus"
    @error = "error"
></live-pusher>
```

---

## unicloud-db组件简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-db.html

**Contents:**
- # unicloud-db组件简介
- # 属性
- # v-slot:default
- # collection
- # where
- # orderby
- # loadtime
- # 事件
- # ssr-key
- # 方法

<unicloud-db> 组件是一个数据库查询组件，它是对clientDB的js库的再封装。

前端通过组件方式直接获取uniCloud的云端数据库中的数据，并绑定在界面上进行渲染。

在传统开发中，开发者需要在前端定义data、通过request联网获取接口数据、然后赋值给data。同时后端还需要写接口来查库和反馈数据。

有了<unicloud-db> 组件，上述工作只需要1行代码！写组件，设组件的属性，在属性中指定要查什么表、哪些字段、以及查询条件，就OK了！

HBuilderX中敲下udb代码块，得到如下代码，然后通过collection属性指定要查询表“table1”，通过field属性指定要查询字段“field1”，并且在where属性中指定查询id为1的数据。查询结果data就可以直接渲染在界面上。

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db> 组件尤其适用于列表、详情等展示类页面。开发效率可以大幅度的提升。

<unicloud-db> 组件的查询语法是jql，这是一种比sql语句和nosql语法更简洁、更符合js开发者习惯的查询语法。没学过sql或nosql的前端，也可以轻松掌握。jql详见

<unicloud-db> 组件不仅支持查询。还自带了add、remove、update方法，见下文方法章节

<unicloud-db> 由原 <uni-clientdb>插件 升级而来，从 HBuilderX 3.0 起<unicloud-db>内置到框架，与小程序基础库版本无关。

如果需要 HBuilderX3.0 以下版本使用clientDB组件，则需要从插件市场单独下载<uni-clientdb>插件，下载地址为：https://ext.dcloud.net.cn/plugin?id=3256 。但仍然推荐升级HBuilderX 3.0+。

TODO：暂不支持in子查询功能。后续会补充

注意：page-current/page-size 改变不重置数据(page-data="replace") 和 (loadtime="manual") 除外，collection/action/field/getcount/orderby/where 改变后清空已有数据

比如云数据库有个user的表，里面有字段id、name，查询id=1的数据，那么写法如下：

注意下面示例使用了getone会返回一条对象形式的data，如不使用getone，data将会是数组形式，即多一层

示例源码如下，请查看 pre > code 标签中的内容

注意：除非使用admin账户登录操作，否则需要在 uniCloud 控制台对要查询的表增加 Schema 权限配置。至少配置读取权限，否则无权在前端查询，详见 DB Schema

示例源码如下，请查看 pre > code 标签中的内容

提示：如果不指定分页模式， data 为多次查询的集合

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

where中指定要查询的条件。比如只查询某个字段的值符合一定条件的记录。

组件的where属性，与clientDB的JS API是一致的，且内容较多，所以详见js API中相关jql文档：详情

但组件与js API有一个差别，就是组件的属性中若使用js中的变量，需额外注意。

例如查询uni-id-users表，字段username的值由js变量指定，有如下几种方式：

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

方式2. 不在属性中写，而在js中拼接字符串

示例源码如下，请查看 pre > code 标签中的内容

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述示例使用的是==比较符，如需进行模糊搜索，则使用正则表达式。插件市场提供了完整的云端一体搜索模板，搜索类页面无需自行开发，可直接使用。详见

示例源码如下，请查看 pre > code 标签中的内容

再次强调，where条件内容较多，组件和api用法相同，完整的where条件文档在api文档中，另见：JQL文档

格式为 字段名 空格 asc(升序)/desc(降序)，多个字段用 , 分割，优先级为字段顺序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

load事件在查询执行后、渲染前触发，一般用于查询数据的二次加工。比如查库结果不能直接渲染时，可以在load事件里先对data进行预处理。

示例源码如下，请查看 pre > code 标签中的内容

数据库里的时间一般是时间戳，不能直接渲染。虽然可以在load事件中对时间格式化，但更简单的方式是使用<uni-dateformat>组件 ，无需写js处理。

error事件在查询报错时触发，比如联网失败。

示例源码如下，请查看 pre > code 标签中的内容

发行 H5 ssr 时有效，用于保证服务器端渲染和前端加载的数据对应

默认值：根据 (页面路径 + unicloud-db 组件代码中的行号)生成的唯一值

注意：页面同时出现2个及以上 unicloud-db 组件需要配置此属性，且要保证值整个应用唯一

当 <unicloud-db> 组件的 manual 属性设为 true 时，不会在页面初始化时联网查询数据，此时需要通过本方法在需要的时候手动加载数据。

示例源码如下，请查看 pre > code 标签中的内容

一般onLoad因时机太早取不到this.$refs.udb，在onReady里可以取到。

举例常见场景，页面pagea在url中获取参数id，然后加载数据

请求地址：/pages/pagea?id=123

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.loadData({clear: true}, callback)，

可选参数 clear: true，是否清空数据和分页信息，true表示清空，默认false

callback 是回调函数，加载数据完成后触发（即使加载失败）

示例源码如下，请查看 pre > code 标签中的内容

在列表的加载下一页场景下，使用ref方式访问组件方法，加载更多数据，每加载成功一次，当前页 +1

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.remove(id, options)

udb为unicloud-db组件的ref属性值

在列表页面，如果想删除一个item，原本要做很多事：

为减少重复开发，unicloud-db组件提供了remove方法，在列表渲染时绑定好index，直接调用remove方法即可一行代码完成上述5步。

首先在列表生成的时候给删除按钮绑定好id：

示例源码如下，请查看 pre > code 标签中的内容

然后confirmDelete方法里面只有一行代码：

示例源码如下，请查看 pre > code 标签中的内容

clientDB组件的remove方法的参数只支持传入数据库的_id进行删除，不支持其他where条件删除。

参数传入的_id支持单个，也支持多个，即可以批量删除。多个id的格式是：

示例源码如下，请查看 pre > code 标签中的内容

在uniCloud的web控制台的DB Schema界面，可自助生成数据表的admin管理插件，其中有多行数据批选批删示例。

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.add(value, options)

udb为unicloud-db组件的ref属性值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.update(id, value, options)

udb为unicloud-db组件的ref属性值

使用unicloud-db组件的update方法，除了更新云数据库中的数据外，也会同时更新当前页面的unicloud-db组件中的data数据，自然也会自动差量更新页面渲染的内容。同时update方法还封装了修改成功的toast提示。

示例源码如下，请查看 pre > code 标签中的内容

第一个参数 id 是数据的唯一标识，第二个参数 value 是需要修改的新数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在js中，获取<unicloud-db> 组件的data的方法如下：

示例源码如下，请查看 pre > code 标签中的内容

如果修改了dataList的值，组件渲染的界面也会同步变化。

但是在浏览器控制台里无法使用this来打印查看数据，为此特别新增了unidev.clientDB.data方法以优化调试体验。

H5平台，开发模式下浏览器控制台输入 unidev.clientDB.data，可查看组件内部数据，多个组件通过索引查看 unidev.clientDB.data[0]

联表查询有以下两种写法，对于数据量稍大的表推荐使用多个临时表组成的数组作为collection，可以在主表的getTemp内先进行过滤减小联表时的性能消耗。

更多关于联表查询的内容请参考：JQL联表查询

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件简化了列表分页的写法，只需简单的配置每页需要多少数据（默认是20条），不管是数据库的分页查询还是前端的列表分页展示，都自动封装了。

列表分页有2种模式，一种是手机上常见的拉到底部加载下一页，另一种是pc常见的底部列出页码，点击页码跳转页面。

下面的示例代码没有使用uList组件，实际开发时建议使用uList组件来避免长列表的性能问题。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用分页控件，常见于PC端。在uniCloud Admin 中，有完整的分页展示数据、新增删除数据的示例代码。

<unicloud-db> 组件支持嵌套。

子组件中访问父组件 data 时，需options传递数据

如下示例演示了2个组件的嵌套，以及在子组件中如何访问父组件 data

示例源码如下，请查看 pre > code 标签中的内容

完整项目示例见插件市场的示例项目: https://ext.dcloud.net.cn/plugin?id=2574

**Examples:**

Example 1 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 2 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 3 (json):
```json
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 4 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/cloud-common.html

**Contents:**
- # 概述
- # API列表
  - # 创建uni-id实例
  - # token校验
  - # 主动刷新token
  - # 生成token

云函数公共模块是不同云函数共享代码的一种方式。如果你不了解什么是云函数公共模块，请另读文档公共模块

uni-id-common是uni-id体系中用于token管理的公共模块。

旧版本uni-id公共模块是一个大而全的公共模块，不适用被众多云函数引用。

新版的uni-id-common仅包含token校验、生成及刷新功能。而用户注册、登录、忘记密码等实现都挪到了uni-id-co云对象中。

这样不仅减小了公共模块的体积，也简化了学习成本。

从HBuilderX 3.5起，新建uniCloud项目时，会自动加载 uni-id-common 依赖。也就是 uni-id-common 默认内置在每个项目中。

一般开发者无需了解uni-id-common公共模块的API，直接使用uni-id-pages云端一体页面模板即可。

如果想了解uni-id-common公共模块内部实现，可以阅读本章节。

注意：不同于旧版本uni-id公共模块，uni-id-common必须调用此接口创建实例后才可以调用checkToken等接口

用法：uniID.createInstance(Object CreateInstanceOptions);

CreateInstanceOptions内可以传入云函数context，也可以传入clientInfo参数，作用和context类似。方便在云对象内获取clientInfo后直接传入，什么是云对象？。

示例源码如下，请查看 pre > code 标签中的内容

默认情况下uni-id-common某些接口会自动从全局context内获取客户端的PLATFORM（平台，如：app、h5、mp-weixin）等信息。

在云函数单实例多并发的场景下可能无法正确获取（全局对象会被后面的请求覆盖，可能会导致前面一次请求使用了后面一次请求的PLATFORM信息）。因此推荐在开启云函数单实例多并发后，自行为uni-id传入context。

此外云函数url化时无法获取客户端信息，也需要使用这种方式将客户端信息传入uni-id。

一个校验客户端发起请求（uniCloud.callFunction）自带的uniIdToken，获得用户的uid、token、token的过期时间、角色、权限的API。

这是非常高频且重要的API通常用于换取操作当前云函数的用户Id。

如果你并没有服务端开发经验，可能会想：为什么需要通过token去换取用户Id，而不是让客户端直接传递用户Id更方便？ 这里就涉及到安全问题，有一句话叫做：“前端传递的参数都是不可信任的”。比如：你去银行取款，柜台会要求出示你的身份证来证明你是谁，而不是你直接告诉银行柜台你是谁就管用。否则这是一个极大的安全漏洞。 综上所述：所有服务端操作涉及账户信息相关内容，都需要使用token来获得，而不是使用前端传递的参数。

用法：await uniIDIns.checkToken(String token, Object checkTokenOptions)

uni-id使用jwt生成token，jwt所生成的token包含三部分，其中存储的信息为明文信息，uni-id只根据tokenSecret来校验客户端token是否合法。

角色权限将被缓存在token中，此举能减少或消除checkToken的查库次数（有效节省费用、减少响应时间）

用法：uniIDIns.refreshToken(Object RefreshTokenOptions);

示例源码如下，请查看 pre > code 标签中的内容

用法：uniIDIns.createToken(Object CreateTokenOptions)

**Examples:**

Example 1 (javascript):
```javascript
// 云函数代码，传入context
const uniID = require('uni-id-common')
exports.main = async function(event,context) {
  context.APPID = '__UNI__xxxxxxx' // 替换为当前客户端的APPID，通过客户端callFunction请求的场景可以使用context.APPID获取
  context.PLATFORM = 'web' // 替换为当前客户端的平台类型，通过客户端callFunction请求的场景可以使用context.PLATFORM获取
  context.LOCALE = 'zh-Hans' // 替换为当前客户端的语言代码，通过客户端callFunction请求的场景可以使用context.LOCALE获取
  const uniIDIns = uniID.createInstance({ // 创建uni-id实例
    context: context,
    // config: {} // 完整uni-id配置信息，使用config.json进行配置时无需传此参数
  })
  payload = await uniIDIns.checkToken(event.uniIdToken) // 后续使用uniIDIns调用相关接口
  if (payload.code) {
  	return payload
  }
}

// 云对象代码传入clientInfo
const uniID = require('uni-id-common')
module.exports = {
	_before() {
		const clientInfo = this.getClientInfo()
		this.uniID = uniID.createInstance({ // 创建uni-id实例，其上方法同uniID
			clientInfo
		})
	},
	refreshToken() {
		// ...
    // this.uniID.refreshToken()
	}
}
```

Example 2 (javascript):
```javascript
// 云函数代码，传入context
const uniID = require('uni-id-common')
exports.main = async function(event,context) {
  context.APPID = '__UNI__xxxxxxx' // 替换为当前客户端的APPID，通过客户端callFunction请求的场景可以使用context.APPID获取
  context.PLATFORM = 'web' // 替换为当前客户端的平台类型，通过客户端callFunction请求的场景可以使用context.PLATFORM获取
  context.LOCALE = 'zh-Hans' // 替换为当前客户端的语言代码，通过客户端callFunction请求的场景可以使用context.LOCALE获取
  const uniIDIns = uniID.createInstance({ // 创建uni-id实例
    context: context,
    // config: {} // 完整uni-id配置信息，使用config.json进行配置时无需传此参数
  })
  payload = await uniIDIns.checkToken(event.uniIdToken) // 后续使用uniIDIns调用相关接口
  if (payload.code) {
  	return payload
  }
}

// 云对象代码传入clientInfo
const uniID = require('uni-id-common')
module.exports = {
	_before() {
		const clientInfo = this.getClientInfo()
		this.uniID = uniID.createInstance({ // 创建uni-id实例，其上方法同uniID
			clientInfo
		})
	},
	refreshToken() {
		// ...
    // this.uniID.refreshToken()
	}
}
```

Example 3 (javascript):
```javascript
// 云函数代码，传入context
const uniID = require('uni-id-common')
exports.main = async function(event,context) {
  context.APPID = '__UNI__xxxxxxx' // 替换为当前客户端的APPID，通过客户端callFunction请求的场景可以使用context.APPID获取
  context.PLATFORM = 'web' // 替换为当前客户端的平台类型，通过客户端callFunction请求的场景可以使用context.PLATFORM获取
  context.LOCALE = 'zh-Hans' // 替换为当前客户端的语言代码，通过客户端callFunction请求的场景可以使用context.LOCALE获取
  const uniIDIns = uniID.createInstance({ // 创建uni-id实例
    context: context,
    // config: {} // 完整uni-id配置信息，使用config.json进行配置时无需传此参数
  })
  payload = await uniIDIns.checkToken(event.uniIdToken) // 后续使用uniIDIns调用相关接口
  if (payload.code) {
  	return payload
  }
}

// 云对象代码传入clientInfo
const uniID = require('uni-id-common')
module.exports = {
	_before() {
		const clientInfo = this.getClientInfo()
		this.uniID = uniID.createInstance({ // 创建uni-id实例，其上方法同uniID
			clientInfo
		})
	},
	refreshToken() {
		// ...
    // this.uniID.refreshToken()
	}
}
```

Example 4 (javascript):
```javascript
// 云函数代码，传入context
const uniID = require('uni-id-common')
exports.main = async function(event,context) {
  context.APPID = '__UNI__xxxxxxx' // 替换为当前客户端的APPID，通过客户端callFunction请求的场景可以使用context.APPID获取
  context.PLATFORM = 'web' // 替换为当前客户端的平台类型，通过客户端callFunction请求的场景可以使用context.PLATFORM获取
  context.LOCALE = 'zh-Hans' // 替换为当前客户端的语言代码，通过客户端callFunction请求的场景可以使用context.LOCALE获取
  const uniIDIns = uniID.createInstance({ // 创建uni-id实例
    context: context,
    // config: {} // 完整uni-id配置信息，使用config.json进行配置时无需传此参数
  })
  payload = await uniIDIns.checkToken(event.uniIdToken) // 后续使用uniIDIns调用相关接口
  if (payload.code) {
  	return payload
  }
}

// 云对象代码传入clientInfo
const uniID = require('uni-id-common')
module.exports = {
	_before() {
		const clientInfo = this.getClientInfo()
		this.uniID = uniID.createInstance({ // 创建uni-id实例，其上方法同uniID
			clientInfo
		})
	},
	refreshToken() {
		// ...
    // this.uniID.refreshToken()
	}
}
```

---

## 简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/concepts/space.html

**Contents:**
- # 简介
- # 多人协作
  - # 一、协作者权限体系
    - # 管理员
    - # 普通成员
  - # 二、权限明细表
  - # 三、协作者设置步骤
  - # 四、注意事项
- # 应用和服务空间的关系
  - # 多应用共用服务空间

一个服务空间对应一整套独立的云开发资源，包括云数据库、云存储、云函数等资源。服务空间之间彼此隔离。

每个服务空间都有一个全局唯一的space ID。

在 uniCloud 目录右键菜单中创建服务空间

创建服务空间后，在同样的 uniCloud 目录右键菜单中关联该服务空间。只有项目关联好服务空间后，才能上传云函数、操作服务空间下的云数据库、云存储等资源。

web控制台可以新建、删除服务空间，管理线上的服务空间资源。

2022年7月18日前，服务空间的多人协作是在 dev.dcloud.net.cn 的 app 协作中设置。在2022年7月18日后，改为在 unicloud.dcloud.net.cn 设置。

一个服务空间仅有一个 创建者，但可以设置多个 协作成员，以实现多人协作开发。

项目涉及多人开发时，在uniCloud WEB控制台 设置协作者（选择服务空间->成员管理），实现多人共同使用一个云服务空间。

登录 uniCloud Web 控制台 ，选择目标服务空间

输入协作者邮箱并点击 搜索，确认后点击 添加成员

在下方 成员列表 中，可查看协作者，并对其进行权限编辑或移除操作。

每个uni-app应用都有一个appid，每个服务空间都有一个spaceid。

服务空间和手机端项目是多对多绑定关系。同DCloud账号下，一个应用可以关联到多个服务空间。一个服务空间也可以被多个项目访问。

随着用户使用uniCloud开发的项目越来越多， 部分用户遇到了新的问题。

两个、多个项目想共用一个云服务空间，比如一个系统，有用户端项目、管理admin项目，两个项目需要公共服务空间。还有司机端、乘客端、用户端、骑手端....很多类似的问题。

如果每个项目目录下都存在多个重复的云函数文件。 每个项目都要做 同步云函数列表， 下载云函数等操作。 繁琐，而且很容易冲突。

针对上面出现的问题， 提供了一云多项目的解决方案。

选中项目下的uniCloud-alipay|aliyun|tcb目录， 右键菜单，点击 【关联云服务空间或项目... 】 ，可以关联云服务空间、绑定其它项目的服务空间：

选择关联项目，此时显示的是所有的uniapp项目。用户选择任一uniapp项目进行关联, 关联效果如下图：

以阿里云举例， 绑定其它项目的服务空间 指的是关联其他项目的当前使用的阿里云服务空间。

若应用仅连接一个服务空间，在HBuilderX中做好服务空间关联即可。开发者无需手动做初始化工作（可理解为类调用）。

示例源码如下，请查看 pre > code 标签中的内容

若一个应用需要同时连接更多服务空间，HBuilderX中无法绑定更多服务空间。此时需开发者在客户端代码中，手动调用初始化方法uniCloud.init，连接其他服务空间。

uniCloud.init方法会返回一个uniCloud实例，之后云函数API的调用都需要通过该uniCloud实例发起（类似实例调用）。

示例源码如下，请查看 pre > code 标签中的内容

uniCloud.init方法接受一个options参数，返回uniCloud实例，uniCloud实例可调用云函数、云存储相关API。

示例源码如下，请查看 pre > code 标签中的内容

uniCloud还支持跨服务空间的云数据库访问，另见文档

**Examples:**

Example 1 (javascript):
```javascript
//项目仅连接了一个服务空间，则无需初始化
//可通过uniCloud直接调用云开发的API
uniCloud.callFunction()
uniCloud.uploadFile()
```

Example 2 (javascript):
```javascript
//项目仅连接了一个服务空间，则无需初始化
//可通过uniCloud直接调用云开发的API
uniCloud.callFunction()
uniCloud.uploadFile()
```

Example 3 (unknown):
```unknown
//项目仅连接了一个服务空间，则无需初始化
//可通过uniCloud直接调用云开发的API
uniCloud.callFunction()
uniCloud.uploadFile()
```

Example 4 (javascript):
```javascript
//项目仅连接了一个服务空间，则无需初始化
//可通过uniCloud直接调用云开发的API
uniCloud.callFunction()
uniCloud.uploadFile()
```

---

## uniCloud快速上手 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/quickstart.html

**Contents:**
- # uniCloud快速上手
- # hello uniCloud
  - # 体验示例
  - # 运行 Hello uniCloud 源码
- # 开发自己的第一个uniCloud项目
- # cli项目中使用uniCloud
- # uni-app项目使用uniCloud
- # web控制台
  - # 编辑数据库数据注意事项
    - # 添加日期

Hello uniCloud，是一个示例，演示了 uniCloud 的各种能力。

这个示例目前只发布了h5版本和Android app版。

Hello uniCloud部署了3套，分别连接uniCloud的支付宝云版、阿里云版和腾讯云版。

h5版地址（发布在uniCloud的前端网页托管上）

由于该示例未适配pc宽屏，如使用pc浏览器打开地址，建议F12打开控制台，使用手机模式预览。

apk地址（发布在uniCloud的云存储上）

Hello uniCloud 的源码地址：https://ext.dcloud.net.cn/plugin?id=4082

在 HBuilderX 新建项目界面，选择uni-app项目，选择 Hello uniCloud 项目模板。

HBuilderX 会在项目创建后弹出 uniCloud初始化向导，根据向导部署

HBuilderX中新建项目，选择uni-app项目，并勾选启用uniCloud，在右侧选择服务供应商（支付宝云、阿里云、腾讯云）

项目名称随意，比如 firstunicloud

一个开发者可以拥有多个服务空间，每个服务空间都是一个独立的serverless云环境，不同服务空间之间的云函数、数据库、存储都是隔离的。

对项目根目录uniCloud点右键选择关联云服务空间，绑定之前创建的服务空间，或者新建一个服务空间。

uniCloud项目创建并绑定服务空间后，开发者可以创建云函数（云对象是云函数的一种，云函数可泛指普通云函数和云对象）。

在uniCloud/cloudfunctions目录右键创建云函数/云对象

如果该云函数/云对象还需要引入其他js，可在index.js入口文件中引用。

初学者，建议从云对象学起，比云函数更加简单直观。

在本教程中，我们创建一个云对象名为 helloco。

打开index.obj.js，我们为它添加一个 sum 方法，逻辑就是接收传入a和b2个参数，返回求和结果。

示例源码如下，请查看 pre > code 标签中的内容

在项目首页，pages/index/index.vue 里，添加一个按钮，点击后执行异步方法sum。

js 中 import 这个 helloco 对象，调用它的 sum 方法

示例源码如下，请查看 pre > code 标签中的内容

将项目运行到浏览器或其他平台，点页面上的按钮，控制台会打印结果：3

HBuilderX自带一个云函数本地运行环境，运行项目时也默认选择连接本地云函数。可以在底部控制台中的前端控制台右上角进行切换。

可以对helloco云对象点右键上传到uniCloud服务空间，然后在前端控制台右上角切换为连接云端云函数，那么此时客户端连接的就是真正的现网uniCloud服务器了。

到此为止，你已经开发了第一个 first uniCloud 项目，完成了客户端和服务器的第一次交互。

这个云对象只做了一个求和运算，实际开发中不需要在服务器求和，前端就可以求和。服务器应该做更复杂的事情。

但你可以通过这个示例感知uniCloud的开发，其实非常简单。尤其是云对象，打破了服务器做接口传json给前端的传统，让云端服务对象化，让服务器代码像写前端js一样、清晰。

接下来，建议通读文档，进一步学习掌握uniCloud。

如果要在cli项目中使用uniCloud，可以参考以下步骤

如果您有一个现有的 uni-app 项目，并希望将其与 uniCloud 集成，可以按照以下步骤操作：

打开HBuilderX后，点击菜单栏的 文件 > 导入 > 从本地目录导入（或者Git/SVN）

在项目根目录右键，选择创建uniCloud云服务空间， 选择具体云厂商后创建。

在uniCloud目录右键，选择关联服务空间或项目...，选择之前创建的服务空间。如没有服务空间，请在uniCloud控制台 创建。

在uniCloud目录右键，选择初始化向导，按照操作提示上传云函数和数据库schema。

在HBuilderX中运行项目，即可在前端调用云函数和操作数据库。

web控制台网址：https://unicloud.dcloud.net.cn

在HX中对 uniCloud 目录点右键，或者在帮助菜单中，均有入口链接。

在web控制台可以对数据库进行编辑。在json文档中，输入字符串、数字、bool值都是常规的操作。但有2种特殊数据类型，时间和地理位置，在编辑时有特殊的写法，请注意：

在web控制台添加/修改数据时，如果输入"2020-12-02 12:12:12"会变成字符串，而不是日期格式。此时需通过以下方式添加日期类型数据。

示例源码如下，请查看 pre > code 标签中的内容

注：时间戳无需如此复杂。时间戳只需直接输入不加引号的数字即可。

示例源码如下，请查看 pre > code 标签中的内容

文档已移至：Web中使用uniCloud的跨域处理

**Examples:**

Example 1 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 2 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 3 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 4 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema?id=segment

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## unicloud-db组件简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-db?id=add

**Contents:**
- # unicloud-db组件简介
- # 属性
- # v-slot:default
- # collection
- # where
- # orderby
- # loadtime
- # 事件
- # ssr-key
- # 方法

<unicloud-db> 组件是一个数据库查询组件，它是对clientDB的js库的再封装。

前端通过组件方式直接获取uniCloud的云端数据库中的数据，并绑定在界面上进行渲染。

在传统开发中，开发者需要在前端定义data、通过request联网获取接口数据、然后赋值给data。同时后端还需要写接口来查库和反馈数据。

有了<unicloud-db> 组件，上述工作只需要1行代码！写组件，设组件的属性，在属性中指定要查什么表、哪些字段、以及查询条件，就OK了！

HBuilderX中敲下udb代码块，得到如下代码，然后通过collection属性指定要查询表“table1”，通过field属性指定要查询字段“field1”，并且在where属性中指定查询id为1的数据。查询结果data就可以直接渲染在界面上。

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db> 组件尤其适用于列表、详情等展示类页面。开发效率可以大幅度的提升。

<unicloud-db> 组件的查询语法是jql，这是一种比sql语句和nosql语法更简洁、更符合js开发者习惯的查询语法。没学过sql或nosql的前端，也可以轻松掌握。jql详见

<unicloud-db> 组件不仅支持查询。还自带了add、remove、update方法，见下文方法章节

<unicloud-db> 由原 <uni-clientdb>插件 升级而来，从 HBuilderX 3.0 起<unicloud-db>内置到框架，与小程序基础库版本无关。

如果需要 HBuilderX3.0 以下版本使用clientDB组件，则需要从插件市场单独下载<uni-clientdb>插件，下载地址为：https://ext.dcloud.net.cn/plugin?id=3256 。但仍然推荐升级HBuilderX 3.0+。

TODO：暂不支持in子查询功能。后续会补充

注意：page-current/page-size 改变不重置数据(page-data="replace") 和 (loadtime="manual") 除外，collection/action/field/getcount/orderby/where 改变后清空已有数据

比如云数据库有个user的表，里面有字段id、name，查询id=1的数据，那么写法如下：

注意下面示例使用了getone会返回一条对象形式的data，如不使用getone，data将会是数组形式，即多一层

示例源码如下，请查看 pre > code 标签中的内容

注意：除非使用admin账户登录操作，否则需要在 uniCloud 控制台对要查询的表增加 Schema 权限配置。至少配置读取权限，否则无权在前端查询，详见 DB Schema

示例源码如下，请查看 pre > code 标签中的内容

提示：如果不指定分页模式， data 为多次查询的集合

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

where中指定要查询的条件。比如只查询某个字段的值符合一定条件的记录。

组件的where属性，与clientDB的JS API是一致的，且内容较多，所以详见js API中相关jql文档：详情

但组件与js API有一个差别，就是组件的属性中若使用js中的变量，需额外注意。

例如查询uni-id-users表，字段username的值由js变量指定，有如下几种方式：

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

方式2. 不在属性中写，而在js中拼接字符串

示例源码如下，请查看 pre > code 标签中的内容

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述示例使用的是==比较符，如需进行模糊搜索，则使用正则表达式。插件市场提供了完整的云端一体搜索模板，搜索类页面无需自行开发，可直接使用。详见

示例源码如下，请查看 pre > code 标签中的内容

再次强调，where条件内容较多，组件和api用法相同，完整的where条件文档在api文档中，另见：JQL文档

格式为 字段名 空格 asc(升序)/desc(降序)，多个字段用 , 分割，优先级为字段顺序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

load事件在查询执行后、渲染前触发，一般用于查询数据的二次加工。比如查库结果不能直接渲染时，可以在load事件里先对data进行预处理。

示例源码如下，请查看 pre > code 标签中的内容

数据库里的时间一般是时间戳，不能直接渲染。虽然可以在load事件中对时间格式化，但更简单的方式是使用<uni-dateformat>组件 ，无需写js处理。

error事件在查询报错时触发，比如联网失败。

示例源码如下，请查看 pre > code 标签中的内容

发行 H5 ssr 时有效，用于保证服务器端渲染和前端加载的数据对应

默认值：根据 (页面路径 + unicloud-db 组件代码中的行号)生成的唯一值

注意：页面同时出现2个及以上 unicloud-db 组件需要配置此属性，且要保证值整个应用唯一

当 <unicloud-db> 组件的 manual 属性设为 true 时，不会在页面初始化时联网查询数据，此时需要通过本方法在需要的时候手动加载数据。

示例源码如下，请查看 pre > code 标签中的内容

一般onLoad因时机太早取不到this.$refs.udb，在onReady里可以取到。

举例常见场景，页面pagea在url中获取参数id，然后加载数据

请求地址：/pages/pagea?id=123

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.loadData({clear: true}, callback)，

可选参数 clear: true，是否清空数据和分页信息，true表示清空，默认false

callback 是回调函数，加载数据完成后触发（即使加载失败）

示例源码如下，请查看 pre > code 标签中的内容

在列表的加载下一页场景下，使用ref方式访问组件方法，加载更多数据，每加载成功一次，当前页 +1

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.remove(id, options)

udb为unicloud-db组件的ref属性值

在列表页面，如果想删除一个item，原本要做很多事：

为减少重复开发，unicloud-db组件提供了remove方法，在列表渲染时绑定好index，直接调用remove方法即可一行代码完成上述5步。

首先在列表生成的时候给删除按钮绑定好id：

示例源码如下，请查看 pre > code 标签中的内容

然后confirmDelete方法里面只有一行代码：

示例源码如下，请查看 pre > code 标签中的内容

clientDB组件的remove方法的参数只支持传入数据库的_id进行删除，不支持其他where条件删除。

参数传入的_id支持单个，也支持多个，即可以批量删除。多个id的格式是：

示例源码如下，请查看 pre > code 标签中的内容

在uniCloud的web控制台的DB Schema界面，可自助生成数据表的admin管理插件，其中有多行数据批选批删示例。

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.add(value, options)

udb为unicloud-db组件的ref属性值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.update(id, value, options)

udb为unicloud-db组件的ref属性值

使用unicloud-db组件的update方法，除了更新云数据库中的数据外，也会同时更新当前页面的unicloud-db组件中的data数据，自然也会自动差量更新页面渲染的内容。同时update方法还封装了修改成功的toast提示。

示例源码如下，请查看 pre > code 标签中的内容

第一个参数 id 是数据的唯一标识，第二个参数 value 是需要修改的新数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在js中，获取<unicloud-db> 组件的data的方法如下：

示例源码如下，请查看 pre > code 标签中的内容

如果修改了dataList的值，组件渲染的界面也会同步变化。

但是在浏览器控制台里无法使用this来打印查看数据，为此特别新增了unidev.clientDB.data方法以优化调试体验。

H5平台，开发模式下浏览器控制台输入 unidev.clientDB.data，可查看组件内部数据，多个组件通过索引查看 unidev.clientDB.data[0]

联表查询有以下两种写法，对于数据量稍大的表推荐使用多个临时表组成的数组作为collection，可以在主表的getTemp内先进行过滤减小联表时的性能消耗。

更多关于联表查询的内容请参考：JQL联表查询

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件简化了列表分页的写法，只需简单的配置每页需要多少数据（默认是20条），不管是数据库的分页查询还是前端的列表分页展示，都自动封装了。

列表分页有2种模式，一种是手机上常见的拉到底部加载下一页，另一种是pc常见的底部列出页码，点击页码跳转页面。

下面的示例代码没有使用uList组件，实际开发时建议使用uList组件来避免长列表的性能问题。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用分页控件，常见于PC端。在uniCloud Admin 中，有完整的分页展示数据、新增删除数据的示例代码。

<unicloud-db> 组件支持嵌套。

子组件中访问父组件 data 时，需options传递数据

如下示例演示了2个组件的嵌套，以及在子组件中如何访问父组件 data

示例源码如下，请查看 pre > code 标签中的内容

完整项目示例见插件市场的示例项目: https://ext.dcloud.net.cn/plugin?id=2574

**Examples:**

Example 1 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 2 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 3 (json):
```json
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 4 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/price.html

**Contents:**
- # 概述
- # 阿里云
  - # 免费服务空间
  - # 包年包月套餐
    - # 套餐变配
    - # 包年包月套餐转按量计费
  - # 按量计费
  - # 按量计费每日资源上限设置
    - # 资源上限设置特别说明
  - # 各项资源释义说明

uniCloud的定价、套餐内容、服务SLA，是由云厂商直接公布的。DCloud公司不会加价。uniCloud已经上线近5年，DCloud一直以良心方式服务开发者，努力降低应用的开发门槛、提高应用的开发效率。

付费用户享受云厂商提供的服务协议SLA，详见

阿里云正式版需要使用HBuilderX 3.6.5+（正式版）或3.6.10+（Alpha版）或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

阿里云提供1个免费空间，付费空间提供包月、按量计费两种计费方式，具体说明如下：

包年包月套餐，适于业务稳定、套餐资源使用均衡的场景。

如果你难以预估会消耗多少云资源，或者业务波峰波谷变化较大，或者套餐中某些项目不够用、某些项目又用不完，此时推荐使用按量计费。

阿里云为每个账号提供了1个免费服务空间，以方便产品开发测试及体验。具体额度请阅读下方包年包月套餐中的开发者版。

套餐中的资源超标后服务空间会停服，需要及时升配或转按量计费才能恢复。

阿里云包年包月套餐支持升配和转换按量计费，不支持降配，且按量计费空间不支持转换为包年包月套餐。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud按量余额，以用于按量计费账单扣费。

注意： 按量计费不支持转换为包年包月，该操作不可逆，请谨慎操作。

按量计费，意味着不是每个月支付固定费用，而是根据使用量付费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从阿里云预存余额中扣除。

如果预存余额不足，则服务空间将不可用，需要立即充值。

如您担心按量计费会造成不可控的费用上升，也可以为各项资源设置用量上限。

资源上限可在web控制台 服务空间详情进行设置，该设置实时生效。

每项资源指标的数据更新延迟时间不同，当数据更新且某项资源用量超过阈值时，则该项服务便会单独停用。

上述指标，容量是累加的，其他指标则是按日计算。

例如，设置了每日云存储下载次数不能超过1万次。如当日超过该下载次数，则在超过的6小时后停止云存储的下载功能。

该设置为阿里云实验阶段功能，资源用量更新有延迟，待资源更新后达到设置的资源用量上限时，才会执行管控。管控执行亦有延迟性，所以存在实际用量超设置上限情况，需特别说明：

因上游储备不足，目前uniCloud阿里云版仍有一些限额。DCloud会持续推动限额的解除。目前有需求的开发者需向DCloud人工联系申请提高限额。

目前单个账号可创建20个正式版服务空间，如有更多需求需发邮件到service@dcloud.io申请。此外集合数量限制也可申请提升。邮件模板见下方：申请解除限制邮件模板

示例源码如下，请查看 pre > code 标签中的内容

云存储数据处理：图片裁剪、视频截帧等功能。现阶段免费，但不排除后续收费可能。

通过扩展数据库解除限制：若数据库集合数量、索引数量等限制已无法满足您的需求，则可以使用扩展数据库，扩展数据库没有内置数据库相关的限制。扩展数据库介绍

套餐指标超限： 包月套餐各项资源用量如有指标超出上限时，该项指标服务便会停服，其他服务不受影响。比如云存储CDN流量超套餐上限，则云存储文件无法访问，其他服务正常。如需恢复，可升级套餐来获取更高套餐额度或转换为按量计费，升配或转按量计费后，资源恢复大约有10分钟左右延迟。

套餐到期停服： 包月套餐在到期当天的0点10分左右开始停服，停服后服务空间无法正常使用，资源会保留15天。15天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 按量计费空间没有到期时间，是在账户欠费时开始停服。阿里云在每天上午9点左右出前一日账单，出账后如果账户发生欠费，按量计费服务空间则会被停服无法正常使用，资源会保留15天。15天内操作余额充正服务恢复正常（续费后大约有10分钟左右延迟），15天后会销毁空间资源且无法找回。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

使用腾讯云Nodejs12及以上版本时，务必仔细阅读此文档：keepRunningAfterReturn

腾讯云于2022年8月12日更新了计费方式。

新计费模式下，统一采用基础套餐+超限按量计费的模式，开发者可先购买带有一定配额的基础套餐，超出套餐配额部分按使用量付费。

腾讯云服务空间套餐将于2025年6月30日进行升级，升级针对部分套餐额度和能力进行了调整，详见相关公告

套餐在有效期内可随时进行升配，升配生效大约有10分钟延迟。在服务空间到期当天可操作降配，如已过期，需先续费后方可进行变配操作。

以下条目的消耗不属于套餐内资源，会从账号的腾讯云余额进行扣除。

注：当包年包月服务空间升级新套餐时，如果已开通前端网页托管，则前端网页托管会自动转为按量计费，请确保账号余额充足！

套餐到期第二天服务空间会进入隔离状态，服务空间不可用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），7天后会销毁空间资源且无法找回。

当服务空间通用按量余额欠费时，服务空间的云函数日志及超限按量将会自动关闭。如果服务空间套餐资源已超上限，则服务将会停服不可用。服务空间通用按量余额充正后需手动开启相关服务。

注意：部分老账号可能使用的是腾讯云按量余额，查看如何确认服务空间使用的余额类型？

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

支付宝云需要使用3.97+或与此版本对应的uni-app cli项目才可正常使用。如果是cli创建的项目，可以参考：更新依赖到指定版本

支付宝云支持基础套餐+超限按量计费及纯按量计费两种计费模式，开发者可先购买带有一定配额的基础套餐（免费版也可以），超出套餐配额部分按使用量付费，也可以直接开通按量计费空间。

开通支付宝云服务空间之前，需DCloud账号实名认证的身份信息已有对应的支付宝账号。如果DCloud账号实名认证为企业，则需要注册该企业对应的支付宝账号，点此可前往注册支付宝 。目前暂不支持民办非企业单位。

支付宝云包年包月套餐支持升降配，升配或降配套餐，不会影响原来套餐的有效时长。

升降配的差价计算规则：高规格套餐的剩余时长价格 - 低规格套餐的剩余时长价格。剩余时长计算单位为月，剩余时长不足一个月时按一个月计算。

升配举例： 将套餐A升级至套餐B，假设原套餐A已经购买了3个月，在第2个月发起升配。则需要补充第2个月和第3个月的差价（不满1个月按1个月算） 即：补充差价 = 2 *（套餐B价格-套餐A价格），支付成功后，10分钟左右生效。

降配举例： 将套餐A降级至套餐B，假设原套餐 A 已经购买了3个月，在第2个月中发起降配。则自动退还第2个月后半个月和第3个月的差价 即：退还差价=1.5*（套餐A价格-套餐B价格），支付成功后，当月即生效。

包年包月套餐支持转换按量计费，如果是付费套餐，转换后会按照剩余有效期核算退费金额并自动退费到uniCloud支付宝云账号余额，以用于按量计费账单扣费。

按量计费空间也可以转换为包年包月套餐（灰度中，后续会逐步开放），计费模式的转换一个月最多可操作三次。

支付宝云支持套餐+超限按量计费以及纯按量计费空间两种计费模式，即套餐用量超限额后、纯按量计费空间产生用量后，都会按照按量计费规则计费。

按量付费需要预存余额，每日根据前一日资源消耗生成账单，从支付宝云按量余额或服务空间通用余额中扣除。查看如何确认服务空间使用的余额类型？

如果预存余额不足，则服务空间将不可用，需要立即充值。

资源上限可在web控制台 服务空间详情进行设置，该设置为每项资源用量基于套餐额度的百分比，该设置实时生效。

上述指标，在保证金及按量余额充足的情况下，可设置0-300%，0为无限制。

例如，设置了云存储下载次数为20%。如果下载次数超过 套餐云存储下载次数额度*0.2 后，在超过的2小时后会将服务空间停服。

支付宝云内置数据库有一定的兼容性问题，大致表现如下：

如果想要使用支付宝云的同时避开这些兼容性问题，推荐使用扩展数据库，扩展数据库是DCloud推出的用来解决内置数据库现有问题的解决方案。同时为您的业务提供高性能、高可用的数据库服务。查看详情

为了解决域名备案问题，支付宝云服务空间在过去90天累计消费满100元可分配一个阿里云备案码，消费满200元可分配两个阿里云备案码（需购买套餐或消耗余额，仅充值余额不算）。账单T+1出账，每个空间最多可申请两个备案码。

备案码申请入口：uniCloud控制台 --> 支付宝云服务空间详情 --> 扩展服务 --> 备案码管理，符合条件的服务空间可点击“申请备案码”来申请。申请成功后，再在列表页面点击“备案码授权“按钮，授权备案码给阿里云账号。这样就可以在阿里云域名备案页面输入备案码了。

阿里云官网对接入备案的域名有要求，会定期检查域名是否接入阿里云相关服务（即域名是否解析到阿里云服务器），未接入可能会被要求整改或被取消备案。针对这种情况，可以将一个二级域名绑定到uniCloud阿里云或支付宝云服务空间然后配置cname解析。

注意：申请备案码后服务空间不支持申请销毁退费

套餐指标超限： 包月套餐各项资源用量如有指标超上限时，服务空间会被停服。超上限的资源用量如果大于1分钱则会出账并从支付宝按量余额中扣除，如余额不足则会欠费。

套餐到期停服： 包月套餐在到期后第二天开始停服，停服后服务空间无法正常使用，资源会保留7天。7天内操作续费服务恢复正常（续费后大约有10分钟左右延迟），未续费则会被销毁且无法找回。

余额欠费停服： 支付宝云在每天上午10点左右出前一日账单（T+1），出账后如果账户发生欠费，则无法操作新购、续费及变配并停服所有支付宝云服务空间，欠费后第7天释放所有按量计费服务空间。欠费充值余额正常后，大于有5分钟延迟来恢复停服空间。

服务空间停服后，云存储、数据库、前端网页托管等占用的容量如果超套餐用量仍会产生按量计费账单。如果开通了按量计费Redis，停服期间Redis实例会继续保留，同时仍会收取Redis按量费用。

注意： 如果一个支付宝关联了多个DCloud账号（最多可绑定5个）且支付宝云按量余额独立存在（无法合并至服务空间通用按量余额），当其中一个DCloud账号的支付宝按量余额欠费时，该支付宝账号关联的所有DCloud账号服务空间都会停服。

推荐使用uniCloud监控告警服务，随时监控资源使用量、空间余额等，避免欠费停服。

按量计费时，涉及按量余额和保证金的概念。包年包月套餐不涉及这2个概念。

按量余额已升级为服务空间通用余额。由于历史原因，部分老账号下可能存在多个按量余额（阿里云按量余额、腾讯云按量余额、支付宝云按量余额），可升级合并为服务空间通用余额。查看如何进行按量余额合并

按量余额指开发者使用按量计费时提前充值的金额，发生资源消耗后，费用会从余额里扣除。

因按量计费空间不是实时计费，而是隔天出账，所以可能出现某天消耗过大、余额不足以支付昨日账单的情况。此时就会发生欠费。

开发者欠费时，DCloud仍需要向云厂商缴纳欠费。所以为了避免开发者不缴纳欠费，DCloud收取了200元保证金。

当开发者不再使用按量计费服务空间时，保证金可以退还。

由于保证金可以申请退还，所以不能申请开具发票，但可申请开具收据，申请方式：发送邮件到 fapiao@dcloud.io，一般15个工作日可开具，邮件内容：

示例源码如下，请查看 pre > code 标签中的内容

退还保证金申请路径：uniCloud控制台费用中心 自助申请退还。

申请时，如果保证金订单付款时间距今已未超出第三方支付原路退还时间（365天内），则原路实时退还； 否则，在申请时需填写收款支付宝的账号及姓名，我们将在1-3个工作日左右进行审核并操作支付宝转账来退还保证金。

当保证金充值订单付款方式为对公打款时，无法在线自助申请退还，需使用uniCloud注册邮箱发送邮件到 service@dcloud.io来申请，邮件内容模板：

示例源码如下，请查看 pre > code 标签中的内容

注意：如果您注册uniCloud账号使用的是qq号@qq.com这类邮箱，发送邮件时，请勿使用qq邮箱的域名邮箱，需更换为qq号@qq.com 这种邮箱发送邮件。

uniCloud提供了多维度、多渠道的资源监控及告警服务，监控告警设置入口：https://unicloud.dcloud.net.cn/pages/product-alarm/rule-list 。

uniCloud的监控告警服务，支持的资源项包括：

当你的线上系统故障时，可以参考此文档判断责任归属：如何判断是DCloud或云厂商（支付宝云、阿里云、腾讯云）的问题

贵。没有免费版，导致入门门槛高。稳定，商用保障强，因为与微信云开发复用，质控团队投入较大。适合愿意付出更多成本来追求稳定性的企业用户。

便宜。有一个免费空间，入门门槛低。较稳定。自研的数据库oceanBase在兼容MongoDB语法方面做的不够完善。适合追求性价比，且愿意适配oceanBase写法的开发者。

便宜。有一个免费空间，入门门槛低。稳定性在3家中最低，质控团队较小。三家中唯一直接使用MongoDB的厂商，MongoDB语法兼容性最好。适合对稳定性不敏感的开发者。

提示：上表中，如果云数据库改用扩展数据库，则没有上面数据库的限制。扩展数据库介绍

_id 在原生 MongoDB 中是24位的 ObjectId 类型，注意此类型在数据库存储时非字符串，通过该字段进行正则查询是会报错的

阿里云的数据库使用的是原生的 MongoDB，_id 是24位的 ObjectId 类型

腾讯云的数据库使用的是基于腾讯云改造的 MongoDB，_id 是32位的 字符串类型

支付宝云数据库使用的是基于支付宝云自研的兼容MongoDB协议的数据库，_id是24位的字符串类型，且在支付宝云数据库中不存在ObjectId 类型

如果在阿里云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库会强制转 ObjectId 类型，且会出现大写转小写的情况

如果在腾讯云保存一个长度为24位且满足 ObjectId 类型的字符串，数据库部分情况下会强制转 ObjectId 类型，且还会导致根据该字段查询表数据时无法查到数据的问题

目前可以使用云数据库的导入导出进行迁移，迁移数据库之前可以使用导出db_init.json功能将所有集合及索引导出。再使用数据导入导出功能进行迁移。导入导出请参考：数据导入导出和备份

也可以直接使用第三方封装好的插件：unicloud数据库一键搬家工具，支持阿里云与腾讯云互转。支持跨账号转。

迁移数据可以通过在腾讯云服务空间导出数据表为json文件，在阿里云服务空间导入json文件到表的方式进行迁移。

由于此前腾讯云并未完全支持ObjectId类型的数据，在阿里云迁移到腾讯云时需要注意处理一下ObjectId类型的数据，包括自动生成的_id字段以及关联到其他表的_id的字段。简单来说就是将导出的数据内的ObjectId类型的数据处理成字符串且不满足ObjectId的格式。

示例源码如下，请查看 pre > code 标签中的内容

以下为一个简单的脚本示例用于处理导出的json文件

如果将此文件存储为parse.js，使用node parse.js 输入文件相对或绝对路径 输出文件相对或绝对路径即可处理导出的json文件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 2 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 3 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

Example 4 (unknown):
```unknown
邮件标题：服务空间数量限制提升申请 | 集合数量限制提升申请 | 云函数域名代理需求申请

邮件内容：

客户账号：uniCloud.dcloud.net.cn 登录账号(就是HBuilderX账号)
服务空间id：mp-xxxxxxx (注意不是服务空间名称而是id)
客户名称：当前账号认证的公司名称
负责人电话：
申请内容：申请提升 服务空间数量限制 | 集合数量限制 | 将www.xxx.com纳入云函数的域名代理中
业务场景：
业务规模：
```

---

## 概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/app.html

**Contents:**
- # 概述
- # 目录结构
- # 前端页面
  - # 创建并配置uni-id的配置文件
  - # 初始化
  - # 配置
    - # 调试模式
    - # 登录方式
      - # 配置示例
    - # 隐私政策

uni-id-pages，是uni-id体系的一部分。

它基于uni-id-common提供了一批现成的、开源的、登录注册账户管理相关的前端页面和云端云对象。

它是一个云端一体页面组的uni_modules ，含前端页面和后端云对象（uni-id-co）。

开发者在项目中引入uni-id-pages，账户管理的功能无需自己再开发。由于源码的开放性和层次结构清晰，有二次开发需求也很方便调整。

下载地址：https://ext.dcloud.net.cn/plugin?name=uni-id-pages

需要在App.vue中初始化uni-id-pages的init.js文件

示例源码如下，请查看 pre > code 标签中的内容

路径：/uni_modules/uni-id-pages/config.js

示例源码如下，请查看 pre > code 标签中的内容

debug模式下，启动应用会自动发起一次网络请求（调用uni-id-co的getSupportedLoginType）。

检查：uni-id-pages客户端配置的登录方式，是否未在uniCloud服务端配置正确，否则抛出异常。

示例源码如下，请查看 pre > code 标签中的内容

如上示例配置，表示启用：账号密码登录、验证码登录。

示例源码如下，请查看 pre > code 标签中的内容

则表示启用：微信登录、验证码登录、账号密码登录。

平台差异性配置:如果你希望在不同的平台有不同的登录方式，直接使用条件编译 即可。如下配置，即表示仅在APP端启用短信验证码登录

示例源码如下，请查看 pre > code 标签中的内容

注意： iOS 的 AppStore 规则：应用若支持三方社交登录服务（如:一键登录、微信登录等），则必须同时向用户提供“以苹果账号登录”的选项。即：如果你的应用不支持三方登录，那么可以不带上苹果登录，如果你的应用支持三方登录，那必须同时把苹果登录也带上。

以上配置仅开启前端登录入口，实现功能还需：

一款规范的小程序或App要上架到国内应用商店必须提供《隐私政策和用户使用协议》，参考模版：隐私权政策模板.zip

推荐使用：HBuilderX编辑器，以markdown文档格式编辑《隐私政策和用户使用协议》，通过在文档中鼠标右键一键分享 上传到前端网页托管获得链接

用户如果没有设置密码，在登录后会跳转设置密码页面

此功能默认不开启, 开启请将 setPasswordAfterLogin 设置为 true，如下：

示例源码如下，请查看 pre > code 标签中的内容

如果不需要强制设置密码可以将 allowSkip 设置为 true 用户可以选择跳过设置密码。

uni-id-pages包含：账号注册、免密登录、头像更换、修改昵称、绑定手机号码、找回密码、注销账号等页面。插件地址

项目中常有打开登录页面的需求，这里对登录页面展开介绍；包括两类登录方式：

执行uni.navigateTo打开登录页面，会默认使用配置中loginTypes值的第一项为登录方式。

例如loginTypes：["weixin","apple","univerify"]会以weixin，即微信登录为默认登录方式

uni-id-pages支持通过传递参数type，指定登录方式。例如：指定苹果登录，使用如下代码即可

示例源码如下，请查看 pre > code 标签中的内容

可以配套使用uniIdRouter；当用户未登录，但访问了需强制登录的页面，或接口提示token无效或过期（响应体以TOKEN_INVALID开头）时均需要打开登录页面。你需要把以上两个路径路径定义为loginPage。

为了便于集成uni-id-pages的项目监听到登录和注销登录事件，提供了两个全局事件：uni-id-pages-login-success，uni-id-pages-logout。开发者可以通过uni.$on 来监听这些事件。

**Examples:**

Example 1 (julia):
```julia
├─uni_modules                                         存放uni_module规范的插件。
│    ├─其他module
│    └─uni-id-pages
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        └─uni-id-co                         集成调用uni-id方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能，不建议修改此目录下文件
│        │            │  ├─third-party                三方平台接口
│        │            │  └─utils                      基础功能
│        │            ├─middleware                    中间件
│        │            └─module                        分模块存放的云对象方法
│        ├─common
│        │    ├─login-page.scss                       登录页面公共样式
│        │    ├─login-page.mixin.js                   登录页面公共mixin文件
│        │    └─loginSuccess.js                       登录成功后执行的文件
│        ├─components
│        │    ├─cloud-image                           uniCloud云存储图片解析组件
│        │    │    └─cloud-image.vue
│        │    ├─uni-id-pages-agreements               同意用户服务协议&隐私政策条款组件
│        │    │    └─uni-id-pages-agreements.vue
│        │    ├─uni-id-pages-avatar                   用户头像组件
│        │    │    └─uni-id-pages-avatar.vue
│        │    ├─uni-id-pages-bind-mobile              通过微信获取手机号码绑定个人资料
│        │    │    └─uni-id-pages-bind-mobile.vue
│        │    ├─uni-id-pages-email-form               邮箱验证码组件
│        │    │    └─uni-id-pages-email-form.vue
│        │    ├─uni-id-pages-fab-login                悬浮的切换登录方式组件
│        │    │    └─uni-id-pages-fab-login.vue
│        │    ├─uni-id-pages-sms-form                 获取短信验证码组件
│        │    │    └─uni-id-pages-sms-form.vue
│        │    └─uni-id-pages-user-profile             获取用户信息组件
│        │        └─uni-id-pages-user-profile.vue
│        ├─pages
│        │    ├─common
│        │    │    └─webview                          用于实现应用内浏览或打开《用户协议和隐私协议》URL链接页面
│        │    │        └─webview.vue
│        │    ├─login
│        │    │    ├─login-smscode.vue                短信验证码登录
│        │    │    ├─login-withoutpwd.vue             免密码登录
│        │    │    └─login-withpwd.vue                密码登录
│        │    ├─register
│        │    │    ├─register.vue                     通过用户名密码注册账号
│        │    │    ├─register-admin.vue               创建超级管理员
│        │    │    ├─register-by-email.vue            通过邮箱验证码注册账号
│        │    │    └─validator.js                     注册账号页的表单验证规则文件
│        │    ├─retrieve
│        │    │    ├─retrieve-by-email.vue            通过邮箱验证码重置密码
│        │    │    └─retrieve.vue					            通过手机验证码重置密码
│        │    └─userinfo
│        │        ├─bind-mobile.vue                   绑定手机号码
│        │        ├─change_pwd.vue                    修改密码
│        │        ├─cropImage.vue                     裁剪图片
│        │        ├─deactivate.vue                    注销账号
│        │        ├─set-pwd.vue                       设置密码
│        │        ├─realname-verify                   实名认证
│        │        └─userinfo.js                       注册账号页的表单验证规则文件
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─config.js                                  uni-id-pages的配置文件
│        ├─init.js                                    初始化文件
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 2 (julia):
```julia
├─uni_modules                                         存放uni_module规范的插件。
│    ├─其他module
│    └─uni-id-pages
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        └─uni-id-co                         集成调用uni-id方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能，不建议修改此目录下文件
│        │            │  ├─third-party                三方平台接口
│        │            │  └─utils                      基础功能
│        │            ├─middleware                    中间件
│        │            └─module                        分模块存放的云对象方法
│        ├─common
│        │    ├─login-page.scss                       登录页面公共样式
│        │    ├─login-page.mixin.js                   登录页面公共mixin文件
│        │    └─loginSuccess.js                       登录成功后执行的文件
│        ├─components
│        │    ├─cloud-image                           uniCloud云存储图片解析组件
│        │    │    └─cloud-image.vue
│        │    ├─uni-id-pages-agreements               同意用户服务协议&隐私政策条款组件
│        │    │    └─uni-id-pages-agreements.vue
│        │    ├─uni-id-pages-avatar                   用户头像组件
│        │    │    └─uni-id-pages-avatar.vue
│        │    ├─uni-id-pages-bind-mobile              通过微信获取手机号码绑定个人资料
│        │    │    └─uni-id-pages-bind-mobile.vue
│        │    ├─uni-id-pages-email-form               邮箱验证码组件
│        │    │    └─uni-id-pages-email-form.vue
│        │    ├─uni-id-pages-fab-login                悬浮的切换登录方式组件
│        │    │    └─uni-id-pages-fab-login.vue
│        │    ├─uni-id-pages-sms-form                 获取短信验证码组件
│        │    │    └─uni-id-pages-sms-form.vue
│        │    └─uni-id-pages-user-profile             获取用户信息组件
│        │        └─uni-id-pages-user-profile.vue
│        ├─pages
│        │    ├─common
│        │    │    └─webview                          用于实现应用内浏览或打开《用户协议和隐私协议》URL链接页面
│        │    │        └─webview.vue
│        │    ├─login
│        │    │    ├─login-smscode.vue                短信验证码登录
│        │    │    ├─login-withoutpwd.vue             免密码登录
│        │    │    └─login-withpwd.vue                密码登录
│        │    ├─register
│        │    │    ├─register.vue                     通过用户名密码注册账号
│        │    │    ├─register-admin.vue               创建超级管理员
│        │    │    ├─register-by-email.vue            通过邮箱验证码注册账号
│        │    │    └─validator.js                     注册账号页的表单验证规则文件
│        │    ├─retrieve
│        │    │    ├─retrieve-by-email.vue            通过邮箱验证码重置密码
│        │    │    └─retrieve.vue					            通过手机验证码重置密码
│        │    └─userinfo
│        │        ├─bind-mobile.vue                   绑定手机号码
│        │        ├─change_pwd.vue                    修改密码
│        │        ├─cropImage.vue                     裁剪图片
│        │        ├─deactivate.vue                    注销账号
│        │        ├─set-pwd.vue                       设置密码
│        │        ├─realname-verify                   实名认证
│        │        └─userinfo.js                       注册账号页的表单验证规则文件
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─config.js                                  uni-id-pages的配置文件
│        ├─init.js                                    初始化文件
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 3 (javascript):
```javascript
<script>
	import uniIdPageInit from '@/uni_modules/uni-id-pages/init.js';
	export default {
	onLaunch: async function() {
	console.log('App Launch')
	await uniIdPageInit()
},
	onShow: function() {
	console.log('App Show')
},
	onHide: function() {
	console.log('App Hide')
}
}
</script>
```

Example 4 (javascript):
```javascript
<script>
	import uniIdPageInit from '@/uni_modules/uni-id-pages/init.js';
	export default {
	onLaunch: async function() {
	console.log('App Launch')
	await uniIdPageInit()
},
	onShow: function() {
	console.log('App Show')
},
	onHide: function() {
	console.log('App Hide')
}
}
</script>
```

---

## DB Schema概述 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/schema?id=autocode

**Contents:**
- # DB Schema概述
  - # 如何编写DB Schema
- # Schema的一级节点
- # 字段的属性
  - # 属性列表
  - # 字段类型bsonType
  - # 数组字段类型的子类型arrayType
  - # 默认值defaultValue/forceDefaultValue
  - # foreignKey字段外键
    - # 分表

DB Schema是基于 JSON 格式定义的数据结构的规范。

每张表/集合，都有一个表名.schema.json的文件，来描述表的信息、字段的信息。

一个表的简单schema.json示例如下

示例源码如下，请查看 pre > code 标签中的内容

除schema外jql还支持使用js编写schema扩展，在数据的增删改查时触发相应的触发器，详见：DB schema 扩展

MongoDB支持通过 $jsonSchema 操作符 在插入和更新文档时进行结构验证（非空、类型校验等）， $jsonSchema 支持 JSON Schema的草案4，包括core specification 和validation specification 。uniCloud在MongoDB基础上进行了JSON Schema扩展。

编写DB Schema是uniCloud的数据库开发的重要环节。但必须通过JQL操作数据库才能发挥DB Schema的价值。

所以注意，在云函数中使用传统MongoDB API操作数据库时DB Schema不生效。不管在客户端还是云端，都必须使用JQL操作数据库。

如果你的应用可以通过clientDB完成，那么这样将无需编写服务器代码，整体开发效率会极大提升。客户端操作数据库时必须完全编写DB Schema，尤其权限部分。

如果应用的权限系统比较复杂，使用clientDB不如使用云对象方便，也应该编写好除了权限部分以外的其他的schema。这样联表查询、tree查询、默认值、值域校验等其他功能仍然可以方便使用。

具体来说，如自己在云函数中编写权限控制代码，则需要把DB Schema的权限都设为false，在云函数中将操作角色设为admin（通过setuser API），以跳过schema的权限验证。

当然，云函数中代码控制的权限和DB Schema中的权限也可以混合使用，简单权限交由DB Schema处理，复杂权限再编写代码处理。

所以建议开发者编写好schema，无论云端还是前端操作数据库。最多是云函数处理权限时忽略schema中的权限部分。

在HBuilderX中编写schema，有良好的语法提示和语法校验，还可以本地调试，是更为推荐的schema编写方案。

HBuilderX内创建的schema新建和保存时不会自动上传

HBuilderX中运行前端项目，在控制台选择连接本地云函数，或者本地云函数/云对象直接运行，此时本地编写的schema可直接生效，无需上传。方便编写调试。

web控制台上编辑DB Schema保存后是实时在现网生效的，请注意对现网商用项目的影响。

示例源码如下，请查看 pre > code 标签中的内容

properties里的字段列表，每个字段都有很多可以设置的属性，如下：

如果你阅读过数据库入门文档，那么你的服务空间此时应该有表resume，且里面有一条数据。

我们仍以 resume 表为例，除了_id外，该表有6个业务字段：name, birth_year, tel, email, address, intro。

则resume.schema.json按如下编写。

示例源码如下，请查看 pre > code 标签中的内容

schema保存后，可以通过代码测试。注意在uniCloud web控制台修改数据不受schema限制，只有通过JQL操作数据时schema才生效。

我们在前端测试工程里新加一个按钮“添加数据”

示例源码如下，请查看 pre > code 标签中的内容

可以看到，不符合规则的数据无法通过JQL操作入库。可以依次把各个字段的测试值修正为合法格式测试，直到可以正常入库。

成功后，res会返回新增记录的id，也可以在web控制台看到新增的数据。

失败的提示语也可以通过errorMessage自定义。

成功后，再次点击“添加数据”按钮，会发现重复数据插入。避免这种情况需要设置索引，比如将tel字段设为唯一索引。详见

官方推出了openDB开源数据库规范，包括用户表、文章表、商品表等很多模板表，这些模板表均已经内置DB Schema，可学习参考。详见

示例源码如下，请查看 pre > code 标签中的内容

在上述格式中，除了url外，其他均为非必填。

image键是图片的扩展键，除了基本的宽高像素外，开发者可以自己扩展其他键，比如色位。同理video也可以自行扩展。

以resume表为例，新加一个照片字段photo，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

uni-ui组件库中包含组件：<uni-file-picker> 。该组件和file字段的数据库完美搭配。

组件首先选择文件，并上传到uniCloud云存储，在表单提交后将上传文件的地址写入file字段中。详见：https://ext.dcloud.net.cn/plugin?id=4079

DB Schema定义字段类型为file后，可以通过schema2code工具，直接生成上传表单页面，前端页面包含<uni-file-picker>组件，选择、上传、写库一气呵成。详见：schema2code

一个字段如果bsonType是array，那么它可以进一步通过arrayType指定这个数组里每个数组项目的bsonType，值域仍然是所有的字段类型。

比如一个字段存储了多张图片，那么可以设置bsonType为array，然后进一步设置arrayType为file。

以resume表为例，新加一个照片字段photos，设为file类型，定义格式如下（省略了其他老字段）：

示例源码如下，请查看 pre > code 标签中的内容

defaultValue和forceDefaultValue都是默认值，即新增一行数据记录时，如果字段内容未提供，则按默认值填充该字段内容。但2者也有区别，如下：

在实际开发中，forceDefaultValue常用于设置为当前服务器时间、当前登录用户id、客户端ip等。 这些数据都不能通过前端上传，不安全。过去只能在云端写云函数操作。在schema配置后则可以不用写云函数。使用JQL新增数据记录时会自动补齐这些数据。

defaultValue/forceDefaultValue内可以使用固定值，还可以使用预置变量$env，形式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以resume表为例，新增一个字段create_time，表示记录的创建时间。

该字段的defaultValue指定为服务器时间。新增记录时，若前端不传该字段，则默认为当前服务器时间。若前端传一个指定的值，则以传的值为准。

示例源码如下，请查看 pre > code 标签中的内容

强制默认值forceDefaultValue，指定为当前服务器时间戳。此时前端传任何值均无效，新增记录时一定会变成当前云端时间。

示例源码如下，请查看 pre > code 标签中的内容

在实际业务中，记录的创建时间不能由客户端篡改，比如强制为云端时间。所以这个场景下必须使用forceDefaultValue。

一个复杂的业务系统，有很多张数据表。表与表之间，存在的数据关联。foreignKey用于描述数据关联关系。

比如一个文章系统，至少需要用户表、文章分类表、文章表、评论表。opendb已经包含了这4张表，可以点击链接看这些表的结构：

我们先不展开描述上面这几张表，首先讲解为什么分表、怎么分表。

因为MongoDB的灵活性，理论上可以在用户表[uni-id-users]中新增一个字段articles，在articles下面通过数组来存放该作者的每一遍文章，然后在该文章中再来一个字段comments，存放该文章的每一条评论。

如下，uni-id-users表的数据内容，假使里面有2个用户，zhangsan和lisi，然后lisi写了1篇文章，这篇文章又被zhangsan评论了1条。

示例源码如下，请查看 pre > code 标签中的内容

可以看出，这个uni-id-users表形成了用户、文章、评论的三层嵌套。

虽然MongoDB可以这么嵌套，但实际业务中不该这样设计。会导致查询性能低下甚至某些查询条件无法实现。

数据库是数字系统的底层，它应该清晰有条理，人、文章、评论以及这3者的关系，都应该清晰且不冗余。

MongoDB的嵌套，更多的适用于不会被单独拎出来查询的、记录条数较少的场景。

比如简历表中的工作经历，就可以嵌套。因为工作经历数量较少、且不会出现单独查工作经历而不查人的情况。

但文章表，是一定需要独立的，因为文章数量会非常多，它会单独搜索；

评论表其实不太有单独搜索的需求，它总是伴随指定文章出现。但因为数量会很多，评论也需要分页查询，嵌套在文章表下不利于分页查询。

所以正确的数据库设计，还是分开这几张表。另外很多文章系统都会有文章分类，比如 社会、教育、娱乐、体育、科技...，所以还需要一个文章分类表。

opendb的这4张表，才是正确的分表设计。

可以看到注册用户都在uni-id-users表中，而文章内容在opendb-news-articles表中。一个用户可能写了很多文章，这些文章不会存入uni-id-users表。

既然有了分表的概念，就存在表与表之间关系的概念了。

比如在文章表中，如何存放文章的作者信息？如何表示这篇文章是哪个用户写的？是存放作者的用户名吗？

实际上，文章表中的作者字段，也就是user_id字段，存放的是用户表中的这个作者的_id字段的值。_id是uniCloud数据库每张表的每个记录都有的唯一字段。

可以看下用户表uni-id-users和文章表opendb-news-articles具体数据，直观感受下：

uni-id-users用户表，还是假使里面有2个作者，zhangsan和lisi

示例源码如下，请查看 pre > code 标签中的内容

opendb-news-articles文章表，里面只有1篇文章，这篇文章是 lisi 写的，所以在字段user_id中存的就是60b9315801033700011ba9ed，这就是uni-id-users表中 lisi 对应的 _id

示例源码如下，请查看 pre > code 标签中的内容

只要user_id这个关联关系映射起来，数据就清晰且完整了。

并不需要在文章表opendb-news-articles存放作者的用户名、昵称、头像、注册时间甚至密码，只需要存它的user_id，就精准、最小冗余的表达数据关系。

当然也有的系统设计为了减少联表查询而在文章表里冗余存放作者昵称和头像，是否使用冗余可以视需求而定，但一定需要用user_id来做数据表的关联。

上面显示的是2个表的数据内容，但回到 DB Schema 中，如何在schema中表达这种关联关系？那就是foreignKey，外键。

文章表opendb-news-articles的 DB Schema 中的user_id字段的描述如下：

示例源码如下，请查看 pre > code 标签中的内容

上面的重点，就在这个foreignKey，它的前半部分是另一张表的表名，中间用.分割，后半部分是另一张表的字段名。

它代表文章表这个user_id字段，在关系上实质指向uni-id-users表的_id字段。也就是文章表的user_id字段里存的值，其实是源自uni-id-users表的_id字段里的值。

注意不要搞反，并不是在uni-id-users表的schema的_id字段里配foreignKey。uni-id-users表的_id字段是原值，不引用自任何地方。而是在其他引用uid的字段来配。

同样，评论表opendb-news-comments 的schema里，

配置foreignKey，除了清晰描述数据关系，它最大的作用是联表查询。

JQL没有像SQL那样提供了join、leftjoin、innerjoin这些语法，只需要配置好数据关系，配好foreignKey，查询时就可以自动联表查询。

在传统关系型数据库中，tree是很难表达的，只有oracle这种商业数据库提供了tree查询。其他关系型数据库需要开发者通过复杂的代码实现tree查询。

在MongoDB中，虽然自身天然支持tree，但实际业务中并不会使用MongoDB的json嵌套方式来描述tree。

比如部门tree，部门可以动态的新增、删除、改名、挪动层级。实际上每个部门，在部门表里的数据仍然是一条独立的行数据记录，并不是一条记录里无限嵌套下去。

如部门表，里面有2条数据，一条数据记录是“总部”，另一条数据记录“一级部门A”

示例源码如下，请查看 pre > code 标签中的内容

除非你的部门就这2个，永远不变。否则就不该使用上面的做法。

示例源码如下，请查看 pre > code 标签中的内容

在"一级部门A"的parent_id中，值为5fe77207974b6900018c6c9c，它其实就是"总部"的_id。

那么在 DB Schema 中如何表达这种关系呢？就要使用parentKey。

部门表opendb-department 的schema中，将字段parent_id的"parentKey"设为"_id"，即指定了数据之间的父子关系，如下：

示例源码如下，请查看 pre > code 标签中的内容

parentKey将数据表不同记录的父子关系描述了出来。一个字段A的属性设置了parentKey并指向另一个字段B，那么这个A的值，就一定等于B的值。

使用parentKey描述了字段父子关系后，就可以通过JQL的getTree方便的做tree查询了。因内容较多，详见

DB Schema提供了一套完善的字段值域描述规则，并且自动进行数据入库校验，不符合规则的数据无法写入数据库。

注意只有要对数据库写入内容时（新增记录或修改记录）才涉及字段值域的校验问题。读与删不涉及。

DB Schema里的字段值域校验系统由4部分组成：

在schema一级节点的required中，可以以数组的方式填入多个字段名称。比如以下示例将name字段设为必填

示例源码如下，请查看 pre > code 标签中的内容

一个字段的required，和字段的其他规则的关系如下：

以下面的代码为例，如果不传name的值可以通过校验；如果传了name则要求name最小长度为2，否则校验失败

示例源码如下，请查看 pre > code 标签中的内容

其中format的url格式补充说明如下：

http:// | https:// | ftp:// 开头, // 后必须包含一个 .(localhost除外)

可以在resume表中增加一个email字段，使用format来约束其格式。

示例源码如下，请查看 pre > code 标签中的内容

例如: 验证手机号 "pattern": "^\\+?[0-9-]{3,20}$"

示例源码如下，请查看 pre > code 标签中的内容

enum，即枚举。一个字段设定了enum后，该字段的合法内容，只能在enum设定的候选数据项中取值。HBuilderX 3.7.13移除校验数据时enum最多只可以枚举500条的限制。

比如给resume表增加一个性别字段，合法值域只能是“0”、“1”、“2”中的一个。

示例源码如下，请查看 pre > code 标签中的内容

字段gender设成这样后，插入或修改的数据如果不是 0 或 1 或 2，就会报错，无法插入或更新数据。

通过schema2code生成前端表单页面时，带有enum的字段会生成 picker 组件。该组件在界面上渲染时会生成“1、2、3”这3个候选的复选框。所以一般不推荐使用简单数组，而是推荐下面的 支持描述的数组。

仍然使用性别字段举例，合法值域只能是“0”、“1”、“2”中的一个。但通过schema2code生成前端表单页面时，该字段会生成uni-data-checkbox组件，该组件在界面上渲染时会生成“未知”、“男”、“女”这3个候选的复选框。

示例源码如下，请查看 pre > code 标签中的内容

这种带描述的方式，让schema可读性提高，同时也让schema2code生成的前端界面可用性更高。

对于候选比较少的情况，schema2code使用需要弹出一次的picker未必合适。如果想在界面中平铺候选，比如 男、女、未知 直接显示在表单中，此时可以在schema的componentForEdit属性中改用uni-data-checkbox组件 来表达性别选择。

一个字段的合法值域，可以是从另一个数据查询而来。也即，在enum中可以配置JQL查询语句。

这种方式需要搭配foreignKey来使用，也就是需要关联另一个表

在opendb中有一个民族表opendb-nation-china ，里面存放了中国的56个民族。

我们要在resume表中加一个民族字段，就应该从这个opendb-nation-china表取值。

在项目根目录uniCloud/database点右键，新建schema，选择opendb-nation-china

这种opendb表的预置数据，需要上传schema到云端，才会添加到数据库中。所以需要对这个opendb-nation-china.schema.json点右键，上传 DB Schema

就可以uniCloud web控制台创建，此时会自动入库数据，但需要对项目根目录uniCloud/database点右键->下载 DB Schema，才可以在本地调试时使用。

设置nation字段的外键"foreignKey": "opendb-nation-china.name"。民族比较简单，这里我们直接取了民族表的汉字名称为关联key，没有取数据库ID。

示例源码如下，请查看 pre > code 标签中的内容

这样客户端如果传上来一个不在opendb-nation-china表里的民族名称，是无法入库的。

通过schema2code生成前端表单页面时，该字段会生成 picker 组件，该组件被点击后，会弹出候选项，这些候选项都是从民族表中查询数据并显示的。

除了普通的二维数据表，enum还支持tree型数据。即enumType为tree。

在opendb中有一个城市表opendb-city-china ，里面存放了中国的各个城市。城市是按 省、市、区 分三级的树形数据。

在resume表中，有一个city字段，其合理的字段规则应该是从opendb-city-china表取值，

设置enumType为"tree"，代表enum里的数据为树形结构，比如下面的例子，代表opendb-city-china表以getTree方式查询。在schema2code时，可自动生成多级级联选择组件，详见

示例源码如下，请查看 pre > code 标签中的内容

是否将字符串两边空格trim掉。仅对string类型字段生效。

trim的优先级，高于字符串的其他验证规则，比如format、pattern、minLength、validateFunction、fileRules。配置trim后，JQL引擎会首先将字符串trim后再交给其他验证系统验证。

配置trim后，schema2code生成的前端页面中的输入框也将自动trim用户的输入内容，然后再提交云端。

以resume表为例，name字段有minLength为2的限制，假使插入name的值为“a ”，由于a后面的空格会先被trim掉，长度变成1，导致这个数据无法被写入数据库。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.1.0起，支持schema内配置一级节点fieldRules对字段之间的关系进行约束和校验。当然只校验一个字段也可以。

fieldRules的写法等同JQL的where写法（也可以使用各种数据库运算方法），参考：JQL where

fieldRules内配置如下，数组内可以配置多个rule，每个rule都有rule表达式、错误提示语、运行兼容环境这3部分。

示例源码如下，请查看 pre > code 标签中的内容

rule表达式，是一组js，返回值必须为true或false。返回false则触发提示错误，错误提示显示的是errorMessage的内容。

上述配置中，create_date、end_date为字段名称。schema内也支持写字段操作方法，如add方法。

例：在todo表内可以使用fieldRules限制end_date大于create_date

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，create_date为必填项，只需限制end_date存在时大于create_date即可

当属性配置不满足需求，需要写js函数进行校验时，使用本功能。（当然也可以使用schema.ext.js来替代）

对validateFunction目录右键，还可以上传和下载validateFunction，和uniCloud web控制台进行同步。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中编写好validateFunction后，按Ctrl+u可以快捷上传validateFunction到uniCloud云端。

编写扩展校验函数后，在表结构 schema 中确定要配置的字段，在该字段的validateFunction属性上，配置上面编写的扩展校验函数的名称。

如下例中，当name字段的内容要入库前，就会触发执行 "checkabc" 这个 扩展校验函数 。如果"checkabc"校验没有返回true，则该次数据库操作会失败。

validateFunction 类型为字符串时，云端和客户端同时生效

示例源码如下，请查看 pre > code 标签中的内容

validateFunction 类型为对象时，可配置客户端同不生效，云端仍然生效

示例源码如下，请查看 pre > code 标签中的内容

提示：如果配置了 "client": false 客户端也可以在生成的代码中改为自己的校验函数，此时客户端的校验仍然生效，客户端对应的校验文件目录为 js_sdk/validator/collection， collection为表名，非固定值

扩展校验函数是服务空间级的，一个扩展校验函数可以被这个服务空间下的任意表中的任意字段引用。

扩展校验函数里的代码是可以联网的。一个常见场景是内容的敏感词过滤，可以将内容提交到三方校验服务里，如果校验通过再入库。

不建议在扩展校验函数里编写大量的代码，会影响性能。

扩展校验函数的默认运行环境与普通云函数的环境相同，可以调用云函数里可用的各种API。 * 如果要连接外网，要调用uniCloud.httpclient； * 如果要调用数据库，需使用云函数里操作数据库的方式，即不支持JQL，详见

但是，在schema2code中，扩展校验函数也会被生成到前端页面的校验规则里。

也就是说，如果使用schema2code生成前端页面，那么写扩展校验函数需要多一层注意。

比如调用了uniCloud.httpclient这样在前端并不存在的API时，前端的表单校验会出错。

此时就需要在扩展校验函数中多写一个if判断，避免undefined的问题。

示例源码如下，请查看 pre > code 标签中的内容

schema.ext.js是schema.json的扩展和补充，它可以以编程的方式对数据的增删改查进行监听，然后执行任意操作。所以同样可以用于字段的值域校验。

schema.ext.js与validator function的区别是，validator function是针对某一个字段的控制，返回布尔值。而schema.ext.js是对整个表的自由编程。

schema.ext.js篇幅较长，另见schema.ext.js

数据不符合schema配置的规范时，无法入库，此时会报错。

uniCloud有一些基本错误提示语的格式化，如需自定义错误提示语，就需要使用本功能，根据errorMessage的定义报出错误提示。

errorMessage支持字符串，也支持json object。类型为object时，可定义多个校验提示。

{} 为占位符，可在其中引用已有属性，如title、label等。

示例源码如下，请查看 pre > code 标签中的内容

从示例可以看出，errorMessage支持配一条，也支持根据不同的错误类型配不同的errorMessage。

“数据库中某字段值不能在多条记录中重复”，这个需求一般不是在字段值域校验里实现，而是在数据库索引里配置该字段为唯一索引。详见

可以在web控制台配置索引，db_init.json也可以创建索引。注意如果数据库中多条记录中该字段已经有重复内容，那么设该字段为唯一索引时会报错，需先把重复数据去掉。

DB Schema的数据权限系统，是为JQL设计的，尤其clientDB强依赖这套权限系统。因为客户端是无法信任的，没有缜密的权限系统，会导致客户端任意改动云数据库内容。

在过去，开发者需要在后端写代码来处理权限控制，但实际上有了DB Schema和uni-id后，这种权限控制的后台代码就不用再写了。

只要配好DB Schema的权限，放开让前端写业务即可。配置里声明不能读写的数据，前端就无法读写。

DB Schema的permission规则，分为两部分，一边是对操作数据的指定，一边是对角色的指定，规则中对两者进行关联，匹配则校验通过。

注意：如果登录用户是uni-id的admin角色，即超级管理员，则不受DB Schema的配置限制的，admin角色拥有对所有数据的读写权限。

例如在uniCloud admin等管理端系统，只要使用admin用户登录就可以在前端操作数据库。

在更新云端DB Schema时，如果发现服务空间下没有uni-id公共模块，会自动安装uni-id。如果服务空间已经存在uni-id，则不会再自动安装。此时需要注意及时升级uni-id，避免太老的uni-id有兼容问题。(从HBuilderX 3.5起，改为uni-id-common公共模块)

表级控制，包括增删改查四种权限，分别称为：create、delete、update、read。（注意这里使用的是行业通用的crud命名，与操作数据库的方法add()、remove()、update()、get()在命名上有差异，但表意是相同的）

HBuilderX 3.1.0起还新增了count权限，即是否有权对该表进行统计计数。

所有的操作的默认值均为false。也就是不配置permission代表不能操作数据库（角色为admin用户例外）。

例如一个user表，里面有_id、name、pwd等字段，该表的DB Schema如下，代表前端用户可读（包括游客），但前端非admin用户不可新增、删除、更新数据记录。

示例源码如下，请查看 pre > code 标签中的内容

permission的字段级控制，包括读写两种权限，分别称为：read、write。

也就是对于一个指定的字段，可以控制什么样的角色可以读取该字段内容，什么样的角色可以修改写入字段内容。

以上述的user表为例，假如要限制前端禁止读取age字段，那么按如下配置，在字段age下面再写permission节点，设定read为false。

示例源码如下，请查看 pre > code 标签中的内容

按上述配置，前端查询数据时，如果不包含age字段，仍然可以查询。但如果查询请求包含age字段，该请求会被拒绝，提示无权访问。

子级会继承父级的权限，即需要同时满足父级权限以及本节点权限，方可操作此节点。例如上述schema中如果配置表级read权限为false，在为name设置read权限为true的情况下，name字段仍不可读

如果字段的bsonType配置为password，则clientDB完全不可操作此字段（即使是admin用户也不可以在客户端读写）。

示例源码如下，请查看 pre > code 标签中的内容

DB Schema提供了一个内置变量doc，表示要意图操作的数据记录。并支持用各种表达式来描述指定的记录。

仍然以user表举例，假使该表有个字段叫status表示用户是否被禁用。status是bool值，true代表用户状态正常，false代表被禁用。

然后有个需求，JQL只能查用户状态正常的用户信息，禁用用户信息无法查。那么schema配置如下，表级控制的read节点的值不再是简单的true/false，而是变成一个表达式："doc.status==true"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如JQL查询user表的所有数据，则会报权限校验失败；如JQL查询里在where条件里声明了只查询status字段为true的数据，则查询会放行。

除了上述例子提到的doc变量，事实上DB Schema的权限规则支持很多变量和运算符，可以满足各种配置需求。

我们继续使用user表举例，目前需求如下，前端用户如果登录，那么该用户可以修改自己的name字段。此时需要在schema中配置name字段的permission为"write":"(doc._id == auth.uid)"

示例源码如下，请查看 pre > code 标签中的内容

根据这个配置，如前端应用已经登录，且登录的用户发起修改自己的name的请求，则允许修改。其他修改数据请求则会被拒绝。

要分清 数据权限permission 和 字段值域校验validator 的区别。

在权限规则的变量中只有数据库中的数据doc，并没有前端提交的待入库数据data。所以如果要对待入库的数据data做校验，应该在字段值域validator中校验，而不是在权限permission中校验。

如果想获取和判断目标数据记录doc之外的其他数据，则需要使用get方法，见下一章节。

forceDefaultValue属于数据校验的范畴，在数据写入时生效，但是如果配置forceDefaultValue为{"$env": "uid"}也会进行用户身份的校验，未登录用户不可插入数据。

例如在news表新增一条记录，权限需求是“未登录用户不能创建新闻”，其实不需要在news表的create权限里写auth.uid != null。只需把news表的uid字段的forceDefaultValue设为"$env": "uid"，create权限配置为true即可，未登录用户自然无法创建。当然实际使用时你可能需要更复杂的权限，直接使用true作为权限规则时务必注意

在schema中使用uni-id的permission和role，首先需要在uniCloud admin中创建好权限，然后创建角色并给该角色分配权限，最后创建用户并授权角色。

这样用户登录后，uniCloud会自动分析它的permission和role，在schema里编写的关于permission和role的限制也可以一一对应上，进行有效管理。

admin中创建权限、角色和用户授权，另见文档

权限规则内置了doc变量，但只能用于要操作的数据表的判断，如果要获取其他表的数据做判断就需要get方法了。

权限规则内通过get方法，根据id获取数据库中的数据。get方法接收一个字符串作为参数，字符串形式为database.表名.记录ID

例如有个论坛，要求用户积分大于100分才可以发帖。那么帖子表的create权限应该配成：

示例源码如下，请查看 pre > code 标签中的内容

使用get方法时需要注意get方法的参数必须是唯一确定值，例如schema配置的get权限如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

非jql不会走权限校验，jql报了权限校验未通过从以下几点进行检查

schema.json是一个json方式的配置，配置的特点是简单易用，但无法编程。

当出现配置难以满足的需求，比如复杂的数据权限校验规则、复杂的字段值域校验规则，此时应当使用编程的方式来解决。

这就是 scheme.js。每个表都有一个schema.json和一个schema.ext.js（可选）。

在schema.ext.js里可以监听数据的增删改查，可自由做前置校验、前置数据加工或后置加工，可引用扩展库和公共模块。

因篇幅较多，请另见数据库schema.ext.js触发器

再次强调，schema.json和schema.ext.js的生效前提，均是JQL。使用传统MongoDB写法无法执行这些。

DB Schema里有大量的信息，其实有了这些信息，前端将无需自己开发表单维护界面，uniCloud可以自动生成新增、修改、列表、详情的前端页面，以及admin端的列表、新增、修改、删除全套功能。

因内容较长，请另见文档schema2code

**Examples:**

Example 1 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 2 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 3 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

Example 4 (json):
```json
{
	"bsonType": "object", // 固定节点
	"description": "该表的描述",
	"required": [], // 必填字段列表
	"properties": { // 该表的字段清单
		"_id": { // 字段名称，每个表都会带有_id字段
			"description": "ID，系统自动生成"
			// 这里还有很多字段属性可以设置
		},
		"field2": { // 字段2，每个表都会带有_id字段
			"description": ""
			// 这里还有很多字段属性可以设置
		}
	}
}
```

---

## unicloud-db组件简介 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-db

**Contents:**
- # unicloud-db组件简介
- # 属性
- # v-slot:default
- # collection
- # where
- # orderby
- # loadtime
- # 事件
- # ssr-key
- # 方法

<unicloud-db> 组件是一个数据库查询组件，它是对clientDB的js库的再封装。

前端通过组件方式直接获取uniCloud的云端数据库中的数据，并绑定在界面上进行渲染。

在传统开发中，开发者需要在前端定义data、通过request联网获取接口数据、然后赋值给data。同时后端还需要写接口来查库和反馈数据。

有了<unicloud-db> 组件，上述工作只需要1行代码！写组件，设组件的属性，在属性中指定要查什么表、哪些字段、以及查询条件，就OK了！

HBuilderX中敲下udb代码块，得到如下代码，然后通过collection属性指定要查询表“table1”，通过field属性指定要查询字段“field1”，并且在where属性中指定查询id为1的数据。查询结果data就可以直接渲染在界面上。

示例源码如下，请查看 pre > code 标签中的内容

<unicloud-db> 组件尤其适用于列表、详情等展示类页面。开发效率可以大幅度的提升。

<unicloud-db> 组件的查询语法是jql，这是一种比sql语句和nosql语法更简洁、更符合js开发者习惯的查询语法。没学过sql或nosql的前端，也可以轻松掌握。jql详见

<unicloud-db> 组件不仅支持查询。还自带了add、remove、update方法，见下文方法章节

<unicloud-db> 由原 <uni-clientdb>插件 升级而来，从 HBuilderX 3.0 起<unicloud-db>内置到框架，与小程序基础库版本无关。

如果需要 HBuilderX3.0 以下版本使用clientDB组件，则需要从插件市场单独下载<uni-clientdb>插件，下载地址为：https://ext.dcloud.net.cn/plugin?id=3256 。但仍然推荐升级HBuilderX 3.0+。

TODO：暂不支持in子查询功能。后续会补充

注意：page-current/page-size 改变不重置数据(page-data="replace") 和 (loadtime="manual") 除外，collection/action/field/getcount/orderby/where 改变后清空已有数据

比如云数据库有个user的表，里面有字段id、name，查询id=1的数据，那么写法如下：

注意下面示例使用了getone会返回一条对象形式的data，如不使用getone，data将会是数组形式，即多一层

示例源码如下，请查看 pre > code 标签中的内容

注意：除非使用admin账户登录操作，否则需要在 uniCloud 控制台对要查询的表增加 Schema 权限配置。至少配置读取权限，否则无权在前端查询，详见 DB Schema

示例源码如下，请查看 pre > code 标签中的内容

提示：如果不指定分页模式， data 为多次查询的集合

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

where中指定要查询的条件。比如只查询某个字段的值符合一定条件的记录。

组件的where属性，与clientDB的JS API是一致的，且内容较多，所以详见js API中相关jql文档：详情

但组件与js API有一个差别，就是组件的属性中若使用js中的变量，需额外注意。

例如查询uni-id-users表，字段username的值由js变量指定，有如下几种方式：

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

方式2. 不在属性中写，而在js中拼接字符串

示例源码如下，请查看 pre > code 标签中的内容

方式1. 使用模板字符串，用${}包裹变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述示例使用的是==比较符，如需进行模糊搜索，则使用正则表达式。插件市场提供了完整的云端一体搜索模板，搜索类页面无需自行开发，可直接使用。详见

示例源码如下，请查看 pre > code 标签中的内容

再次强调，where条件内容较多，组件和api用法相同，完整的where条件文档在api文档中，另见：JQL文档

格式为 字段名 空格 asc(升序)/desc(降序)，多个字段用 , 分割，优先级为字段顺序

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

load事件在查询执行后、渲染前触发，一般用于查询数据的二次加工。比如查库结果不能直接渲染时，可以在load事件里先对data进行预处理。

示例源码如下，请查看 pre > code 标签中的内容

数据库里的时间一般是时间戳，不能直接渲染。虽然可以在load事件中对时间格式化，但更简单的方式是使用<uni-dateformat>组件 ，无需写js处理。

error事件在查询报错时触发，比如联网失败。

示例源码如下，请查看 pre > code 标签中的内容

发行 H5 ssr 时有效，用于保证服务器端渲染和前端加载的数据对应

默认值：根据 (页面路径 + unicloud-db 组件代码中的行号)生成的唯一值

注意：页面同时出现2个及以上 unicloud-db 组件需要配置此属性，且要保证值整个应用唯一

当 <unicloud-db> 组件的 manual 属性设为 true 时，不会在页面初始化时联网查询数据，此时需要通过本方法在需要的时候手动加载数据。

示例源码如下，请查看 pre > code 标签中的内容

一般onLoad因时机太早取不到this.$refs.udb，在onReady里可以取到。

举例常见场景，页面pagea在url中获取参数id，然后加载数据

请求地址：/pages/pagea?id=123

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.loadData({clear: true}, callback)，

可选参数 clear: true，是否清空数据和分页信息，true表示清空，默认false

callback 是回调函数，加载数据完成后触发（即使加载失败）

示例源码如下，请查看 pre > code 标签中的内容

在列表的加载下一页场景下，使用ref方式访问组件方法，加载更多数据，每加载成功一次，当前页 +1

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.remove(id, options)

udb为unicloud-db组件的ref属性值

在列表页面，如果想删除一个item，原本要做很多事：

为减少重复开发，unicloud-db组件提供了remove方法，在列表渲染时绑定好index，直接调用remove方法即可一行代码完成上述5步。

首先在列表生成的时候给删除按钮绑定好id：

示例源码如下，请查看 pre > code 标签中的内容

然后confirmDelete方法里面只有一行代码：

示例源码如下，请查看 pre > code 标签中的内容

clientDB组件的remove方法的参数只支持传入数据库的_id进行删除，不支持其他where条件删除。

参数传入的_id支持单个，也支持多个，即可以批量删除。多个id的格式是：

示例源码如下，请查看 pre > code 标签中的内容

在uniCloud的web控制台的DB Schema界面，可自助生成数据表的admin管理插件，其中有多行数据批选批删示例。

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.add(value, options)

udb为unicloud-db组件的ref属性值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

this.$refs.udb.update(id, value, options)

udb为unicloud-db组件的ref属性值

使用unicloud-db组件的update方法，除了更新云数据库中的数据外，也会同时更新当前页面的unicloud-db组件中的data数据，自然也会自动差量更新页面渲染的内容。同时update方法还封装了修改成功的toast提示。

示例源码如下，请查看 pre > code 标签中的内容

第一个参数 id 是数据的唯一标识，第二个参数 value 是需要修改的新数据

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在js中，获取<unicloud-db> 组件的data的方法如下：

示例源码如下，请查看 pre > code 标签中的内容

如果修改了dataList的值，组件渲染的界面也会同步变化。

但是在浏览器控制台里无法使用this来打印查看数据，为此特别新增了unidev.clientDB.data方法以优化调试体验。

H5平台，开发模式下浏览器控制台输入 unidev.clientDB.data，可查看组件内部数据，多个组件通过索引查看 unidev.clientDB.data[0]

联表查询有以下两种写法，对于数据量稍大的表推荐使用多个临时表组成的数组作为collection，可以在主表的getTemp内先进行过滤减小联表时的性能消耗。

更多关于联表查询的内容请参考：JQL联表查询

用于联表查询，注意主表副表之间需要在schema内以foreignKey关联（副表支持多个）。如下示例以book作为主表，关联author表进行查询，在book表的schema内设置author_id字段指向author表

示例源码如下，请查看 pre > code 标签中的内容

同样用于联表查询，但是与直接拼接多个字符串的方式不同，可以先对主表进行处理再关联。和直接使用多个表名字符串拼接相比，在主表数据量大的情况下性能有明显提升

示例源码如下，请查看 pre > code 标签中的内容

unicloud-db组件简化了列表分页的写法，只需简单的配置每页需要多少数据（默认是20条），不管是数据库的分页查询还是前端的列表分页展示，都自动封装了。

列表分页有2种模式，一种是手机上常见的拉到底部加载下一页，另一种是pc常见的底部列出页码，点击页码跳转页面。

下面的示例代码没有使用uList组件，实际开发时建议使用uList组件来避免长列表的性能问题。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用分页控件，常见于PC端。在uniCloud Admin 中，有完整的分页展示数据、新增删除数据的示例代码。

<unicloud-db> 组件支持嵌套。

子组件中访问父组件 data 时，需options传递数据

如下示例演示了2个组件的嵌套，以及在子组件中如何访问父组件 data

示例源码如下，请查看 pre > code 标签中的内容

完整项目示例见插件市场的示例项目: https://ext.dcloud.net.cn/plugin?id=2574

**Examples:**

Example 1 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 2 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 3 (json):
```json
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

Example 4 (html):
```html
<unicloud-db v-slot:default="{data, loading, error, options}" collection="table1" field="field1" :getone="true" where="id=='1'">
  <view>
    {{ data}}
  </view>
</unicloud-db>
```

---

## uniCloud快速上手 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/quickstart?id=useinh5

**Contents:**
- # uniCloud快速上手
- # hello uniCloud
  - # 体验示例
  - # 运行 Hello uniCloud 源码
- # 开发自己的第一个uniCloud项目
- # cli项目中使用uniCloud
- # uni-app项目使用uniCloud
- # web控制台
  - # 编辑数据库数据注意事项
    - # 添加日期

Hello uniCloud，是一个示例，演示了 uniCloud 的各种能力。

这个示例目前只发布了h5版本和Android app版。

Hello uniCloud部署了3套，分别连接uniCloud的支付宝云版、阿里云版和腾讯云版。

h5版地址（发布在uniCloud的前端网页托管上）

由于该示例未适配pc宽屏，如使用pc浏览器打开地址，建议F12打开控制台，使用手机模式预览。

apk地址（发布在uniCloud的云存储上）

Hello uniCloud 的源码地址：https://ext.dcloud.net.cn/plugin?id=4082

在 HBuilderX 新建项目界面，选择uni-app项目，选择 Hello uniCloud 项目模板。

HBuilderX 会在项目创建后弹出 uniCloud初始化向导，根据向导部署

HBuilderX中新建项目，选择uni-app项目，并勾选启用uniCloud，在右侧选择服务供应商（支付宝云、阿里云、腾讯云）

项目名称随意，比如 firstunicloud

一个开发者可以拥有多个服务空间，每个服务空间都是一个独立的serverless云环境，不同服务空间之间的云函数、数据库、存储都是隔离的。

对项目根目录uniCloud点右键选择关联云服务空间，绑定之前创建的服务空间，或者新建一个服务空间。

uniCloud项目创建并绑定服务空间后，开发者可以创建云函数（云对象是云函数的一种，云函数可泛指普通云函数和云对象）。

在uniCloud/cloudfunctions目录右键创建云函数/云对象

如果该云函数/云对象还需要引入其他js，可在index.js入口文件中引用。

初学者，建议从云对象学起，比云函数更加简单直观。

在本教程中，我们创建一个云对象名为 helloco。

打开index.obj.js，我们为它添加一个 sum 方法，逻辑就是接收传入a和b2个参数，返回求和结果。

示例源码如下，请查看 pre > code 标签中的内容

在项目首页，pages/index/index.vue 里，添加一个按钮，点击后执行异步方法sum。

js 中 import 这个 helloco 对象，调用它的 sum 方法

示例源码如下，请查看 pre > code 标签中的内容

将项目运行到浏览器或其他平台，点页面上的按钮，控制台会打印结果：3

HBuilderX自带一个云函数本地运行环境，运行项目时也默认选择连接本地云函数。可以在底部控制台中的前端控制台右上角进行切换。

可以对helloco云对象点右键上传到uniCloud服务空间，然后在前端控制台右上角切换为连接云端云函数，那么此时客户端连接的就是真正的现网uniCloud服务器了。

到此为止，你已经开发了第一个 first uniCloud 项目，完成了客户端和服务器的第一次交互。

这个云对象只做了一个求和运算，实际开发中不需要在服务器求和，前端就可以求和。服务器应该做更复杂的事情。

但你可以通过这个示例感知uniCloud的开发，其实非常简单。尤其是云对象，打破了服务器做接口传json给前端的传统，让云端服务对象化，让服务器代码像写前端js一样、清晰。

接下来，建议通读文档，进一步学习掌握uniCloud。

如果要在cli项目中使用uniCloud，可以参考以下步骤

如果您有一个现有的 uni-app 项目，并希望将其与 uniCloud 集成，可以按照以下步骤操作：

打开HBuilderX后，点击菜单栏的 文件 > 导入 > 从本地目录导入（或者Git/SVN）

在项目根目录右键，选择创建uniCloud云服务空间， 选择具体云厂商后创建。

在uniCloud目录右键，选择关联服务空间或项目...，选择之前创建的服务空间。如没有服务空间，请在uniCloud控制台 创建。

在uniCloud目录右键，选择初始化向导，按照操作提示上传云函数和数据库schema。

在HBuilderX中运行项目，即可在前端调用云函数和操作数据库。

web控制台网址：https://unicloud.dcloud.net.cn

在HX中对 uniCloud 目录点右键，或者在帮助菜单中，均有入口链接。

在web控制台可以对数据库进行编辑。在json文档中，输入字符串、数字、bool值都是常规的操作。但有2种特殊数据类型，时间和地理位置，在编辑时有特殊的写法，请注意：

在web控制台添加/修改数据时，如果输入"2020-12-02 12:12:12"会变成字符串，而不是日期格式。此时需通过以下方式添加日期类型数据。

示例源码如下，请查看 pre > code 标签中的内容

注：时间戳无需如此复杂。时间戳只需直接输入不加引号的数字即可。

示例源码如下，请查看 pre > code 标签中的内容

文档已移至：Web中使用uniCloud的跨域处理

**Examples:**

Example 1 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 2 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 3 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

Example 4 (unknown):
```unknown
module.exports = {
	sum(a, b) {
		// 此处省略a和b的有效性校验
		return a + b
	}
}
```

---
