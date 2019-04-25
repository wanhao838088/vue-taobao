**已实现的效果图**
 <br>
 
  ![主页页1](https://github.com/wanhao838088/vue-taobao/blob/master/renren-vue/gifs/main.gif)

  ![主页页1](https://github.com/wanhao838088/vue-taobao/blob/master/renren-vue/gifs/calendar.gif)

 <br>

 
  <br>
  *  其它页面正在开发中....
  <br>

 * 项目演示地址: http://62.234.128.233:9090/ pc下使用chrome以移动端方式打开即可

* 分辨率适配说明:
    使用的是rem+flexible.js ，如果图片的设计稿为750宽尺寸，那么用这个px单位除以75，得到的就是rem单位。
    <br>
    举例： 某div宽度 150px ， 150/75=2，直接写2rem。
    <br>
    
* 测试登录的账号密码:
    手机号：18888888888
    密码：123456
    已经设置好了，直接点登陆即可
    <br>
    
* 项目后台接口说明:
    renren-api为项目接口，后台解决跨域请求问题。都是使用的真实的数据，后台使用java SpringBoot，
    mysql的备份文件在db文件夹下的0318.sql中，运行sql即可把数据导入。
    根据你的数据库设置的密码，修改对应的 application-dev.yml 。然后启动 ApiApplication
    
**项目结构** 
```
renren-security
├─renren-common     公共模块
│ 
├─renren-admin      管理后台
│    ├─db  数据库SQL脚本
│    │ 
│    ├─modules  模块
│    │    ├─job 定时任务
│    │    ├─oss 文件存储
│    │    └─sys 系统管理(核心)
│    │ 
│    └─resources 
│        ├─mapper   MyBatis文件
│        ├─statics  静态资源
│        ├─template 系统页面
│        │    ├─modules      模块页面
│        │    ├─index.html   AdminLTE主题风格（默认主题）
│        │    └─index1.html  Layui主题风格
│        └─application.yml   全局配置文件
│       
│ 
├─renren-api        API服务
│─renren-vue        使用vue构建的前台SPA应用 
├─renren-generator  代码生成器
│        └─resources 
│           ├─mapper   MyBatis文件
│           ├─template 代码生成器模板（可增加或修改相应模板）
│           ├─application.yml    全局配置文件
│           └─generator.properties   代码生成器，配置文件
│
```

<br>

### 一、renren-api
        1) /api/getCode 获取手机验证码
            同一ip同一手机号一分钟只能获取一次，短信验证码5分钟内有效。
            未注册的用户，直接使用验证码登录，直接自动完成注册
        2) /api/loginByCode
            手机号验证码登录 登录成功返回token
        3) /api/login
            账号密码登录 登录成功返回token
        4) /api/logout
            退出登录
        5) /api/register
            用户注册
        6) 商品列表 详情 轮播图 导航列表等
               

**项目说明** 
- 采用SpringBoot、MyBatis、Shiro框架，开发的一套权限系统，极低门槛，拿来即用。设计之初，就非常注重安全性，为企业系统保驾护航，让一切都变得如此简单。
- 提供了代码生成器，只需编写30%左右代码，其余的代码交给系统自动生成，可快速完成开发任务
- 支持MySQL、Oracle、SQL Server、PostgreSQL等主流数据库
<br>

**具有如下特点** 
- 灵活的权限控制，可控制到页面或按钮，满足绝大部分的权限需求
- 完善的部门管理及数据权限，通过注解实现数据权限的控制
- 完善的XSS防范及脚本过滤，彻底杜绝XSS攻击
- 支持分布式部署，session存储在redis中
- 友好的代码结构及注释，便于阅读及二次开发
- 引入quartz定时任务，可动态完成任务的添加、修改、删除、暂停、恢复及日志查看等功能
- 页面交互使用Vue2.x，极大的提高了开发效率
- 引入swagger文档支持，方便编写API接口文档

<br>

**数据权限设计思想** 
- 管理员管理、角色管理、部门管理，可操作本部门及子部门数据
- 菜单管理、定时任务、参数管理、字典管理、系统日志，没有数据权限
- 业务功能，按照用户数据权限，查询、操作数据【没有本部门数据权限，也能查询本人数据】

<br> 

 **技术选型：** 
- 核心框架：Spring Boot 2.0
- 安全框架：Apache Shiro 1.4
- 视图框架：Spring MVC 5.0
- 持久层框架：MyBatis 3.3
- 定时器：Quartz 2.3
- 数据库连接池：Druid 1.1
- 日志管理：SLF4J 1.7、Log4j
- 页面交互：Vue2.x

<br>

 **软件需求** 
- JDK1.8
- MySQL5.5+
- Maven3.0+

<br>

 **本地部署**
- 通过git下载源码
- 创建数据库renren_security，数据库编码为UTF-8
- 执行db/mysql.sql文件，初始化数据【按需导入表结构及数据】
- 修改application-dev.yml文件，更新MySQL账号和密码
- 在renren-security目录下，执行mvn clean install
<br>

- Eclipse、IDEA运行AdminApplication.java，则可启动项目【renren-admin】
- renren-admin访问路径：http://localhost:8080/renren-admin
- swagger文档路径：http://localhost:8080/renren-admin/swagger/index.html
- 账号密码：admin/admin

<br>

- Eclipse、IDEA运行ApiApplication.java，则可启动项目【renren-api】
- renren-api访问路径：http://localhost:8081/renren-api/swagger-ui.html

<br>

- Eclipse、IDEA运行GeneratorApplication.java，则可启动项目【renren-generator】
- renren-generator访问路径：http://localhost:8082/renren-generator


<br>

 **分布式部署**
- 分布式部署，需要安装redis，并配置config.properties里的redis信息
- 需要配置【renren.redis.open=true】，表示开启redis缓存
- 需要配置【renren.cluster=true】，表示开启集群环境

<br>

 **项目演示**
- 演示地址：http://demo.open.renren.io/renren-security
- 账号密码：admin/admin
