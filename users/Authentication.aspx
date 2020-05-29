<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authentication.aspx.cs" Inherits="Donate.users.Authentication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>统一身份认证-慈善捐赠管理系统</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="/layuiadmin/style/login.css" media="all">
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <form id="form1" runat="server" lay-filter="component-form-group">
                        <div class="layui-card-body" style="padding: 15px;">
                            <div class="layui-form-item">
                                <label class="layui-form-label">身份证号</label>
                                <div class="layui-input-inline">
                                    <asp:TextBox ID="TextBox1" runat="server" class="layui-input"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="身份证号不能为空" ForeColor="Red" ValidationGroup="id"></asp:RequiredFieldValidator>
                                &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="身份证号不正确" ForeColor="Red" ValidationExpression="\d{17}[\d|X]|\d{15}" ValidationGroup="id"></asp:RegularExpressionValidator>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <asp:TextBox ID="TextBox2" runat="server" class="layui-input"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="姓名不为空" ForeColor="Red" ValidationGroup="id"></asp:RequiredFieldValidator>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">手机号码</label>
                                <div class="layui-input-inline">
                                    <asp:TextBox ID="TextBox3" runat="server" class="layui-input"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="手机号码不能为空" ForeColor="Red" ValidationGroup="id"></asp:RequiredFieldValidator>
                                &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="手机号码不正确" ForeColor="Red" ValidationExpression="\d{11}" ValidationGroup="id"></asp:RegularExpressionValidator>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">短信验证码</label>
                                <div class="layui-input-inline">
                                    <asp:TextBox ID="TextBox4" runat="server" class="layui-input"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="短信验证码不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <asp:Button ID="Button1" runat="server" Text="提交" class="layui-btn" OnClick="Button1_Click" ValidationGroup="id" />
                                    <asp:Button ID="Button2" runat="server" Text="重置" class="layui-btn layui-btn-primary" OnClick="Button2_Click" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
</body>
</html>
