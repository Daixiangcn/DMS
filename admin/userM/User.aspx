<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Donate.admin.UserManagement.User" %>

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
                <div class="layui-card-header">条件查询</div>
                <div class="layui-card-body" style="padding: 15px;">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-inline">
                                <asp:TextBox ID="TextBox3" runat="server" class="layui-input"></asp:TextBox>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号码</label>
                            <div class="layui-input-inline">
                                <asp:TextBox ID="TextBox4" runat="server" class="layui-input"></asp:TextBox>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">电子邮箱</label>
                            <div class="layui-input-inline">
                                <asp:TextBox ID="TextBox5" runat="server" class="layui-input"></asp:TextBox>
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="搜索" class="layui-btn" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" Text="查询全部" class="layui-btn" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <div class="layui-form-item">
                        <asp:GridView ID="GridView1" runat="server" class="layui-table" Style="text-align: center" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SqlDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="uid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
                                <asp:BoundField DataField="nick" HeaderText="昵称" SortExpression="nick" />
                                <asp:TemplateField HeaderText="性别" SortExpression="gender">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Convert.ToInt32(Eval("gender"))==1?"男":"女" %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="头像" SortExpression="imgUrl">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imgUrl") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>

                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("imgUrl") %>' Height="60px" Width="60px" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="phoneNumber" HeaderText="手机号码" SortExpression="phoneNumber" />
                                <asp:BoundField DataField="role_name" HeaderText="用户身份" SortExpression="role_name" />
                                <asp:BoundField DataField="email" HeaderText="电子邮箱" SortExpression="email" />
                                <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" Visible="False" />
                                <asp:BoundField DataField="lastDate" HeaderText="最后登录时间" SortExpression="lastDate" />
                                <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password" Visible="False" />
                                <asp:BoundField DataField="lastIp" HeaderText="最后登录IP" SortExpression="lastIp" />
                                <asp:BoundField DataField="remarks" HeaderText="备注信息" SortExpression="remarks" Visible="False" />
                                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="/admin/userM/moreInfo.aspx?uid={0}" HeaderText="选择" Text="详情" />
                            </Columns>
                            <EditRowStyle CssClass="layui-input" />
                            <HeaderStyle BackColor="#E6E6E6" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT `user`.*, role.name AS role_name FROM role INNER JOIN `user` ON role.id = `user`.role WHERE  `user`.role = 3" UpdateCommand="UPDATE `user` SET nick = @nick, gender = @gender, phoneNumber = @phoneNumber, email = @email, role = @role, remarks = @remarks WHERE (uid = @uid)" DeleteCommand="DELETE FROM `user` WHERE (uid = @uid)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT id, name FROM role"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT `user`.uid, `user`.nick, `user`.gender, `user`.imgUrl, `user`.phoneNumber, `user`.email, `user`.role, `user`.remarks, `user`.lastDate, `user`.password, `user`.lastIp, role.name AS role_name FROM role INNER JOIN `user` ON role.id = `user`.role WHERE (`user`.nick LIKE ?) AND (`user`.phoneNumber LIKE ?) AND (`user`.email LIKE ?) AND  `user`.role = 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox3" Name="nick" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox4" Name="phoneNumber" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox5" Name="email" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
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
