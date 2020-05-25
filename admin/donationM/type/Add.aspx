<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Donate.admin.donationM.type.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all">
    <title>Add</title>
</head>
<body>
    <div class="layui-fluid">
        <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
            <%--添加项目--%>
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">类别名称</label>
                            <div class="layui-input-inline">
                                <asp:TextBox ID="TextBox1" runat="server" class="layui-input"></asp:TextBox>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="类别名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                        <div class="layui-form-item">
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">类别描述</label>
                                <div class="layui-input-block">
                                    <textarea name="description" placeholder="请输入该类别的简单描述" class="layui-textarea"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <asp:Button ID="Button1" runat="server" Text="立即提交" class="layui-btn" lay-filter="component-form-element" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="重置" class="layui-btn layui-btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
