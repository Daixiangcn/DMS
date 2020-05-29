# DMS（捐赠管理系统）项目说明及更新进度
## 系统功能模块图

![系统功能模块图](https://github.com/Daixiangcn/DMS/blob/master/img/%E7%B3%BB%E7%BB%9F%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97%E5%9B%BE.png?raw=true)

## 系统数据模型图

![系统数据模型图](https://github.com/Daixiangcn/DMS/blob/master/img/%E6%95%B0%E6%8D%AE%E5%BA%93%E6%A8%A1%E5%9E%8B.png?raw=true)
## 系统截图及在线预览
### 系统截图
系统版本：V1.0.0  
截图更新日期：2020年5月28日
![登录页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E7%99%BB%E5%BD%95%E9%A1%B5.jpg?raw=true)
图1. 登录页截图
![信息查询页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E4%BF%A1%E6%81%AF%E6%9F%A5%E8%AF%A2%E9%A1%B5.jpg?raw=true)
图2. 信息查询页截图
![模板录入页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E6%A8%A1%E6%9D%BF%E5%BD%95%E5%85%A5%E9%A1%B5.jpg?raw=true)
图3. 模板录入页截图
![人工录入页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E4%BA%BA%E5%B7%A5%E5%BD%95%E5%85%A5%E9%A1%B5.jpg?raw=true)
图4. 人工录入页截图
![编辑项目页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E7%BC%96%E8%BE%91%E9%A1%B9%E7%9B%AE%E9%A1%B5.jpg?raw=true)
图5. 编辑项目页截图
![系统设置页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E7%B3%BB%E7%BB%9F%E8%AE%BE%E7%BD%AE%E9%A1%B5.jpg?raw=true)
图6. 系统设置页截图
![基本资料页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E5%9F%BA%E6%9C%AC%E8%B5%84%E6%96%99%E9%A1%B5.jpg?raw=true)
图7. 基本资料页截图
![用户管理页](https://github.com/Daixiangcn/DMS/blob/master/img/system/%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E9%A1%B5.jpg?raw=true)
图8. 用户管理页截图
### 在线预览
网址：https://dms.idcs.vip/  
账号：13666666666  
密码：123456

## 更新日志
### 更新了管理员端的信息录入、信息查询、捐赠管理模块
更新日期：2020年5月26日 0点45分  
开发人员：戴翔

- 本次更新了管理员端的信息录入、信息查询、捐赠管理模块，同时，由于一开始在数据库设计方面的缺陷（表的命名中包含保留字，导致调用实体时出错），因此数据库设计返工，消耗了一定的时间。
- 由于主要使用asp.net技术，因此，前端的一些数据判断也交给asp.net控件来做，但前端框架使用的是Layui，全都使用asp.net的控件就会与现代审美有出入，比如Calendar控件。所以日期选择控件采用了Layui的，在判断是否选择方面只能后端判断是否获取值，再通过Response.Write向前端发送提示信息。这是我到目前为止想到的比较完美的替代方案了。
- 本项目由于业务需要，采用的是MySQL数据库，因此在数据库连接插件上也花了很长时间去调试。经过多次不同版本的实验，功能可以正常使用的软件版本如下：Visual Studio 2019+mysql-for-visualstudio-1.2.9+EntityFramework6.1.3+MySql.Data6.9.12+MySql.Data.Entity6.9.12。

### 用户上传头像部分未完成 
更新日期：2020年5月26日 22点55分  
开发人员：戴翔
- 在做系统设置页面时，添加了一些控件，打算使用UploadFile控件做图片上传，可是在aspx.cs文件中写前台的控件ID时，却被VisualStudio2019 提示“ASP.NET：当前上下文中不存在XX”，然后发现控件未注册。删除该页面，新建了一个页面，再次拖入控件，还是如此提示。项目中的其他页面控件注册正常。此问题截至本次更新尚未解决。

### 解决上传头像问题，完成用户管理模块部分功能
更新日期：2020年5月27日 23点15分  
开发人员：戴翔
- 实在是不想熬夜，但是几乎每天都在熬夜。不得不说，可能是由于晚上环境比较安静吧，工作效率还是比较高的。
- 早上起床后，打开电脑，准备解决昨天遗留的问题——“ASP.NET：当前上下文中不存在XX”即无法获取控件ID、因此无法上传头像。今天换了个思考方向，会不会是FormView控件的问题呢？于是就将FormView控件删除，再次添加其他控件，发现这次在aspx.cs中可以获取前台的ID了。那么，问题就变成了“asp.net FormView控件中如何获取其他控件”，解决方案是使用FindControl。至此，asp.net FormView控件中如何获取其他控件的问题已经解决。

```csharp
FormView1.FindControl("控件ID")
// 判断是否上传了文件
((FileUpload)FormView1.FindControl("FileUpload1")).HasFile
// 给TextBox的Text赋值
((TextBox)FormView1.FindControl("imgUrlTextBox")).Text = imgUrl;

```

- 今天白天身体不舒服就没有继续更新，晚上吃完晚饭后将用户管理模块的普通用户和管理员模块更新了一下，写了界面和查询功能，有待后续版本细化。

### 更新了用户管理中的角色管理模块
更新日期：2020年5月28日 11点50分  
开发人员：戴翔
- 今天上午更新了用户管理中的角色管理模块，至此，管理员端功能模块基本完工。

### 更新了用户界面中的功能模块
更新日期：2020年5月29日 22点54分  
开发人员：朱傲宇  
- 更新了普通用户视图中个人认证、信息公示、信息查询、在线捐赠、设置模块的界面及部分功能。由于目前的捐赠数据表中的现有数据不够细化，不符合查询要求，所以个性化的信息查询功能暂未开放，带后期版本更新数据表及数据后开放。

## 相关链接
戴翔的技术博客 https://daixiang.blog.csdn.net
