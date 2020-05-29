<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password.aspx.cs" Inherits="Donate.users.setting.Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale  =1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all" />
    <title>Password</title>
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body" pad15>
                        <form id="form1" runat="server">
                            <div class="layui-form" wid100 lay-filter>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">原密码</label>
                                    <div class="layui-input-inline">
                                        <asp:TextBox ID="TextBox1" runat="server" class="layui-input" TextMode="Password" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="原密码不能为空" ForeColor="Red" ValidationGroup="passwd"></asp:RequiredFieldValidator>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">新密码</label>
                                    <div class="layui-input-inline">
                                        <asp:TextBox ID="TextBox2" runat="server" class="layui-input" TextMode="Password" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="新密码不能为空" ForeColor="Red" ValidationGroup="passwd"></asp:RequiredFieldValidator>
&nbsp;
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="密码长度限制：6-15位" ForeColor="Red" ValidationExpression="\w{6,15}" ValidationGroup="passwd"></asp:RegularExpressionValidator>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">再输一次新密码</label>
                                    <div class="layui-input-inline">
                                        <asp:TextBox ID="TextBox3" runat="server" class="layui-input" TextMode="Password" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="再次输入的新密码不能为空" ForeColor="Red" ValidationGroup="passwd"></asp:RequiredFieldValidator>
&nbsp;
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="两次输入的新密码不一致" ForeColor="Red" ValidationGroup="passwd"></asp:CompareValidator>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <asp:Button ID="Button1" runat="server" Text="提交" class="layui-btn" OnClick="Button1_Click" ValidationGroup="passwd" />
                                        <asp:Button ID="Button2" runat="server" Text="重置" class="layui-btn" OnClick="Button2_Click" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/layuiadmin/layui/layui.js"></script>
    <script>
        layui.config({
            base: '../../../layuiadmin/' //静态资源所在路径
        }).extend({
            index: 'lib/index' //主入口模块
        }).use(['index', 'set']);
    </script>

</body>
</html>
