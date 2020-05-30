<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inform.aspx.cs" Inherits="Donate.users.setting.Inform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale  =1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all" />
    <title>Information</title>
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
                        <div class="layui-card-body" pad15>
                            <div class="layui-form" wid100 lay-filter>
                                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="uid">

                                    <EditItemTemplate>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">我的角色</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Label ID="roleLabel" runat="server" Text='<%# RoleName(Eval("role")) %>' />
                                            </div>
                                            <%--<div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>--%>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">性别</label>
                                            <div class="layui-input-inline">
                                                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("gender") %>'>
                                                    <asp:ListItem Value="1">男</asp:ListItem>
                                                    <asp:ListItem Value="0">女</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">手机号码</label>
                                            <div class="layui-input-inline">
                                                <asp:TextBox ID="phoneNumberTextBox" runat="server" Text='<%# Bind("phoneNumber") %>' class="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">昵称</label>
                                            <div class="layui-input-inline">
                                                <asp:TextBox ID="nickTextBox" runat="server" Text='<%# Bind("nick") %>' class="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">电子邮箱</label>
                                            <div class="layui-input-inline">
                                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' class="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">头像</label>
                                            <div class="layui-input-inline">
                                                <asp:TextBox ID="imgUrlTextBox" runat="server" Text='<%# Bind("imgUrl") %>' class="layui-input" Visible="False" />
                                            </div>
                                            <div class="layui-input-inline" style="width: auto;">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                                <asp:Button ID="Button3" runat="server" Text="上传图片" OnClick="Button1_Click" class="layui-btn" />
                                            </div>
                                            <div class="layui-input-inline layui-btn-container" style="width: 200px;">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="" Width="100px" />
                                            </div>

                                        </div>
                                        <div class="layui-form-item layui-form-text">
                                            <label class="layui-form-label">备注信息</label>
                                            <div class="layui-input-inline">
                                                <asp:TextBox ID="remarksTextBox" runat="server" Text='<%# Bind("remarks") %>' class="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" class="layui-btn" />
                                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" class="layui-btn layui-btn-primary" />
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">我的角色</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Label ID="roleLabel" runat="server" Text='<%# RoleName(Eval("role")) %>' />
                                            </div>
                                            <%--<div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>--%>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">性别</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Label ID="genderLabel" runat="server" Text='<%# Convert.ToInt32( Eval("gender"))==1?"男":"女" %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">手机号码</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Label ID="phoneNumberLabel" runat="server" Text='<%# Bind("phoneNumber") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">昵称</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Label ID="nickLabel" runat="server" Text='<%# Bind("nick") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">电子邮箱</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">头像</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imgUrl") %>' Width="100px" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item layui-form-text">
                                            <label class="layui-form-label">备注信息</label>
                                            <div class="layui-input-block" style="line-height: 38px">
                                                <asp:Label ID="remarksLabel" runat="server" Text='<%# Bind("remarks") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" class="layui-btn" />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:FormView>
                            </div>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT * FROM role"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT *  FROM user WHERE (uid = ?) " UpdateCommand="UPDATE `user` SET nick = @nick, gender = @gender, phoneNumber = @phoneNumber, email = @email, imgUrl = @imgUrl, remarks = @remarks WHERE (uid = @uid)">
                            <SelectParameters>
                                <asp:SessionParameter Name="uid" SessionField="uid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </form>
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
