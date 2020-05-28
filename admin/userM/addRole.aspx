<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addRole.aspx.cs" Inherits="Donate.admin.userM.addRole" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all" />
    <title>Admini</title>
</head>
<body>
    <div class="layui-fluid">
        <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <div class="layui-form-item">
                        <label class="layui-form-label">角色名称</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="TextBox1" runat="server" class="layui-input" ValidationGroup="name" />
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="角色名称不能为空" ForeColor="Red" ValidationGroup="name"></asp:RequiredFieldValidator>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="提交" class="layui-btn" OnClick="Button1_Click" ValidationGroup="name" />
                            <asp:Button ID="Button2" runat="server"  Text="重置" class="layui-btn layui-btn-primary" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="../../layuiadmin/layui/layui.js"></script>
    <script>
        layui.config({
            base: '../../layuiadmin/' //静态资源所在路径
        }).extend({
            index: 'lib/index' //主入口模块
        }).use(['index', 'form', 'laydate'], function () {
            var $ = layui.$
                , admin = layui.admin
                , element = layui.element
                , layer = layui.layer
                , laydate = layui.laydate
                , form = layui.form;
            element.render();
            form.render(null, 'component-form-group');

            laydate.render({
                elem: '#LAY-component-form-group-date'
            });
        });
    </script>
</body>
</html>
