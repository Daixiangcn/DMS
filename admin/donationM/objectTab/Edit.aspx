<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Donate.admin.management.Object" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../layuiadmin/style/admin.css" media="all">
    <title>项目管理</title>
</head>
<body>
    <div class="layui-fluid">
        <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
            <%--编辑项目--%>
            <div class="layui-card">
     <%--           <div class="layui-card-header">编辑项目</div>--%>
                <div class="layui-card-body" style="padding: 15px;">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="layui-table" DataKeyNames="id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                            <asp:TemplateField HeaderText="项目名称" SortExpression="name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="layui-input" Text='<%# Bind("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="项目描述" SortExpression="description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="layui-input" Text='<%# Bind("description") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelImageUrl="~/img/cancle.png" EditImageUrl="~/img/edit.png" HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/img/save.png" />
                        </Columns>
                        <HeaderStyle BackColor="#E6E6E6" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT * FROM objectTab" UpdateCommand="UPDATE objectTab SET name = @name, description = @description WHERE (id = @id)" DeleteCommand="DELETE FROM objectTab WHERE id= @id" InsertCommand="INSERT INTO objectTab(name, description) VALUES (@name, @description)"></asp:SqlDataSource>
                </div>
            </div>
        </form>
    </div>
    <script src="/layuiadmin/layui/layui.js"></script>
</body>
</html>
