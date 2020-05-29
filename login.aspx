<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="login.aspx.cs" Inherits="Donate.login" %>

<%@ Register assembly="WebValidates" namespace="WebValidates" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>统一身份认证-慈善捐赠管理系统</title>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="/layuiadmin/style/login.css" media="all">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            display: block;
            box-sizing: border-box;
            float: left;
            width: 58.33333333%;
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
            <div class="layadmin-user-login-main">
                <div class="layadmin-user-login-box layadmin-user-login-header">
                    <h2 lang="zh-cn" class="layadmin-user-login-codeimg">
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h2>
                    <p>
                        <asp:Label ID="Label1" runat="server" Text="统一身份认证"></asp:Label>
                    </p>
                </div>
                <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                    <div class="layui-form-item">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                        <asp:TextBox ID="TextBox1" runat="server" class="layui-input" lay-verify="required" placeholder="用户名"></asp:TextBox>
                    </div>
                    <div class="layui-form-item">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                        <asp:TextBox ID="TextBox2" runat="server" class="layui-input" lay-verify="required" placeholder="密码" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="auto-style1">
                                <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                             
                                <asp:TextBox ID="TextBox3" runat="server" class="layui-input" AutoPostBack="True" CausesValidation="True"></asp:TextBox>
                            </div>
                            <div class="layui-col-xs5">
                                <div style="margin-left: 10px;">
                                    
                                    <cc1:SerialNumber ID="SerialNumber1" runat="server"   >
                                    </cc1:SerialNumber>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 20px;">
                         
                        <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="一周内免登陆"  Height="16px" OnCheckedChanged="CheckBox1_CheckedChanged"   />
                    </div>
                    <div class="layui-form-item">
                        <asp:Button ID="Button1" runat="server" Text="登录系统" class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit" OnClick="Button1_Click" /></div>
                    <div class="layui-trans layui-form-item layadmin-user-login-other">
                        <label>社交账号登入</label>
                        <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                        <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                        <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                        <a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
                    </div>
                </div>
            </div>

            <div class="layui-trans layadmin-user-login-footer">
                <p>
                    <span><a rel="nofollow" href="http://www.beian.miit.gov.cn" target="_blank">备案号：陕ICP备19016242号-1</a></span>
                </p>
                <p>Copyright &copy; 2020 <a href="https://www.idcs.vip/">西安市碑林区锋云网络工作室</a> 版权所有</p>
            </div>

            <!--<div class="ladmin-user-login-theme">
          <script type="text/html" template>
            <ul>
              <li data-theme=""><img src="{{ layui.setter.base }}style/res/bg-none.jpg"></li>
              <li data-theme="#03152A" style="background-color: #03152A;"></li>
              <li data-theme="#2E241B" style="background-color: #2E241B;"></li>
              <li data-theme="#50314F" style="background-color: #50314F;"></li>
              <li data-theme="#344058" style="background-color: #344058;"></li>
              <li data-theme="#20222A" style="background-color: #20222A;"></li>
            </ul>
          </script>
        </div>-->

        </div>
        <script src="../../layuiadmin/layui/layui.js"></script>
        <script>
            layui.config({
                base: '../../layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index', 'user'], function () {
                var $ = layui.$
                    , setter = layui.setter
                    , admin = layui.admin
                    , form = layui.form
                    , router = layui.router()
                    , search = router.search;

                form.render();




                //实际使用时记得删除该代码
                //layer.msg('为了方便演示，用户名密码可随意输入', {
                //    offset: '15px'
                //  , icon: 1
                //});

            });
        </script>
    </form>
</body>
</html>
