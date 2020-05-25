<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Donate.admin.infoUp.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all"/>
    <title>Edit</title>
</head>
<body>
    <div class="layui-fluid">
        <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="date" id="LAY-component-form-group-date" lay-verify="date" placeholder="年-月-日" autocomplete="off" class="layui-input" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">项目名称</label>
                            <div class="layui-input-inline">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">捐赠类型</label>
                            <div class="layui-input-inline">
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">捐赠者</label>
                            <div class="layui-input-inline">
                                <asp:TextBox ID="TextBox1" runat="server" class="layui-input"></asp:TextBox>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="捐赠者不能为空，" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="不能为数字" ForeColor="Red" ValidationExpression="^[\u4e00-\u9fa5a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">捐赠金额</label>
                            <div class="layui-input-inline">
                                <asp:TextBox ID="TextBox2" runat="server" class="layui-input"></asp:TextBox>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="捐赠金额不能为空，" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="只能是数字" ForeColor="Red" ValidationExpression="[0-9.]+"></asp:RegularExpressionValidator>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">备注信息</label>
                            <div class="layui-input-block">
                                <textarea name="message" placeholder="请输入内容" class="layui-textarea"></textarea>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT id, name FROM objectTab"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT id, name FROM typeInfo"></asp:SqlDataSource>
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

            form.render(null, 'component-form-group');

            laydate.render({
                elem: '#LAY-component-form-group-date'
            });

            /* 自定义验证规则 */
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            /* 监听指定开关 */
            form.on('switch(component-form-switchTest)', function (data) {
                layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                    offset: '6px'
                });
                layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
            });

            /* 监听提交 */
            form.on('submit(component-form-demo1)', function (data) {
                parent.layer.alert(JSON.stringify(data.field), {
                    title: '最终的提交信息'
                })
                return false;
            });
        });
    </script>
</body>
</html>
