<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Donate.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>统一身份认证-慈善捐赠管理系统</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all" />
    <link rel="stylesheet" href="/layuiadmin/style/login.css" media="all" />
    <style type="text/css">
        .auto-style1 {
            position: relative;
            display: block;
            box-sizing: border-box;
            float: left;
            width: 55.33333333%;
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
                    <h2 lang="zh-cn" class="layadmin-user-login-codeimg">
                        <asp:Label ID="Label" runat="server" Text="Label"></asp:Label></h2>
                    <p>
                        <asp:Label ID="Labe2" runat="server" Text="新用户注册"></asp:Label>
                    </p>
                </div>
                <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                    <div class="layui-form-item">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                        <asp:TextBox ID="TextBox1" runat="server" class="layui-input" placeholder="手机号"></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="请输入的电话号码的长度为11位" ForeColor="Red" ValidationExpression="\d{11}" ValidationGroup="yz" Display="None"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="手机号不能为空" ForeColor="Red" ValidationGroup="yz" Display="None"></asp:RequiredFieldValidator>
                    <div class="layui-form-item">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                        <asp:TextBox ID="TextBox2" runat="server" class="layui-input" placeholder="密码"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码不能为空" ForeColor="Red" ValidationGroup="yz" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码长度为6-15位" ForeColor="Red" ValidationExpression="\w{6,15}" ValidationGroup="yz" Display="None"></asp:RegularExpressionValidator>
                    <div class="layui-form-item">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                        <asp:TextBox ID="TextBox3" runat="server" class="layui-input" placeholder="再次输入密码"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="请再输入一遍密码" ForeColor="Red" ValidationGroup="yz" Display="None"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="两次输入的密码不一致" ForeColor="Red" ValidationGroup="yz" Display="None"></asp:CompareValidator>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="auto-style1">
                                <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                                <asp:TextBox ID="TextBox4" runat="server" class="layui-input" placeholder="验证码"></asp:TextBox>
                            </div>
                            <div class="layui-col-xs5">
                                <div style="margin-left: 10px;">
                                    <asp:Button ID="Button3" runat="server" Text="获取短信验证码" OnClick="Button3_Click" class="captchaBtn layui-btn" UseSubmitBehavior="False" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="请输入验证码" ForeColor="Red" ValidationGroup="yz" Display="None"></asp:RequiredFieldValidator>
                    <div class="layui-form-item">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" ValidationGroup="yz" class="layui-btn layui-btn-fluid" />
                    </div>
                    <div class="layui-form-item">
                        <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click" Text="重置" class="layui-btn layui-btn-fluid" />
                    </div>
                    <div class="layui-trans layui-form-item layadmin-user-login-other">
                        <a href="/login.aspx" class="layadmin-user-jump-change layadmin-link">登录帐号</a>
                    </div>
                </div>
            </div>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="yz" />
        <div class="layui-trans layadmin-user-login-footer">
            <p>
                <span><a rel="nofollow" href="http://www.beian.miit.gov.cn" target="_blank">备案号：陕ICP备19016242号-1</a></span>
            </p>
            <p>Copyright &copy; 2020 <a href="https://www.idcs.vip/">西安市碑林区锋云网络工作室</a> 版权所有</p>
        </div>
    </form>
</body>
</html>
