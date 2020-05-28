<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="Donate.admin.UserManagement.Role" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all" />
    <title>Role</title>
    <style>
        #LAY-component-layer-list .layui-card-body {
            padding-top: 15px;
        }
    </style>
</head>
<body>
    <div class="layui-fluid">
        <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <div id="LAY-component-layer-list">
                        <asp:Button ID="Button1" runat="server" class="layui-btn" Text="增加角色" ValidationGroup="test1" OnClick="Button1_Click1"  />
                    </div>
                    <div class="layui-form-item">
                        <asp:GridView ID="GridView1" runat="server" class="layui-table" Style="text-align: center" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                                <asp:TemplateField HeaderText="名称" SortExpression="name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="layui-input" Text='<%# Bind("name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                            <HeaderStyle BackColor="#E6E6E6" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT id, name FROM role" UpdateCommand="UPDATE role SET name = @name WHERE (id = @id)" DeleteCommand="DELETE FROM role WHERE (id = @id) AND (id &lt;&gt; 1)"></asp:SqlDataSource>
        </form>
    </div>
    <script src="/layuiadmin/layui/lay/modules/jquery.js"></script>
    <script src="/layuiadmin/layui/layui.js"></script>
    <script>
        layui.config({
            base: '/layuiadmin/' //静态资源所在路径
        }).extend({
            index: 'lib/index' //主入口模块
        }).use(['index'], function () {
            var $ = layui.$
                , admin = layui.admin
                , element = layui.element
                , layer = layui.layer;

            element.render();

            /* 触发弹层 */
            var active = {
                test1: function () {
                    layer.open({
                        type: 2
                        , content: '/admin/userM/addRole.aspx'
                        , shadeClose: true
                        , area: admin.screen() < 2 ? ['100%', '80%'] : ['375px', '500px']
                        , maxmin: true
                    });
                }
            };
            $('#LAY-component-layer-list .layui-btn').on('click', function () {
                var type = $(this).data('type');
                active[type] && active[type].call(this);
            });
        });
    </script>
</body>
</html>
