<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Donate.Register" %>

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
            right: 154px;
        }
    </style>
    <script src="/layuiadmin/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="/layuiadmin/countdown.js" type="text/javascript"></script>
    <script>
        $(function () {
            $(".captchaBtn").on("click", function () {
                //...
                countdown(this);
                //...
            })
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
            <div class="layadmin-user-login-main">
                <div class="layadmin-user-login-box layadmin-user-login-header">
                   
                    </div>
                 <div>
            <asp:Label ID="Label1" runat="server" Text="用户名（手机号）"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="请输入的电话号码的长度为十一位" ForeColor="Red" ValidationExpression="\d{11}"> </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="请填写十一位手机号" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
&nbsp;<asp:Label ID="Label2" runat="server" Text="请输入密码"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码长度为6-15位" ForeColor="Red" ValidationExpression="\w{6,15}"></asp:RegularExpressionValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="请再输入一次密码"></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="请再输入一遍密码" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="两次输入的密码不一致" ForeColor="Red"></asp:CompareValidator>
            <br />
&nbsp;
            <asp:Label ID="Label4" runat="server" Text="请输入验证码"></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><button class="captchaBtn">获取短信验证码</button>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="请输入验证码" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" />
            <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click" Text="重置" />
        </div>
                </div>
            </div>
       
    </form>
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

            });
        </script>
</body>
</html>
