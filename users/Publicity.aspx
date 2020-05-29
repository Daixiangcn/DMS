<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publicity.aspx.cs" Inherits="Donate.users.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all">
    <title>查询</title>
</head>
<body>
    <div class="layui-fluid">
        <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
            <div class="layui-card">
                <div class="layui-card-header">条件查询</div>
                <div class="layui-card-body" style="padding: 15px;">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="date" id="LAY-component-form-group-date" lay-verify="date" placeholder="年-月-日" autocomplete="off" class="layui-input" />
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">捐赠者</label>
                            <div class="layui-input-inline">
                                <input type="text" name="donor" autocomplete="off" class="layui-input" />
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">项目</label>
                            <div class="layui-input-inline">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id"></asp:DropDownList>
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="搜索" class="layui-btn" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" Text="查询全部" class="layui-btn" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <div class="layui-card-body" style="padding: 15px;">
                        <div class="layui-form-item">
                            <asp:GridView ID="GridView1" class="layui-table" Style="text-align: center" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="layui-table" HeaderStyle-HorizontalAlign="Center" DataKeyNames="id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="time" HeaderText="日期" SortExpression="time" DataFormatString="{0:d}">
                                        <ControlStyle CssClass="layui-input" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="项目名称" SortExpression="obj_name">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("obj_id") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("obj_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="捐赠金额" SortExpression="money">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="layui-input" Text='<%# Bind("money") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("money") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="donor" HeaderText="捐赠者" SortExpression="donor">
                                        <ControlStyle CssClass="layui-input" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="备注信息" SortExpression="message">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="layui-input" Text='<%# Bind("message") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("message") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="捐赠类型" SortExpression="type_name">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("type_id") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("type_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField HeaderText="操作" ShowEditButton="True" CancelImageUrl="~/img/cancle.png" EditImageUrl="~/img/edit.png" UpdateImageUrl="~/img/save.png" ShowDeleteButton="True" >
                                    <HeaderStyle Width="80px" />
                                    </asp:CommandField>
                                </Columns>

                                <HeaderStyle BackColor="#E6E6E6" CssClass="text-center"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Center" />

                            </asp:GridView>
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT donation.id, donation.`time`, objectTab.name AS obj_name, donation.money, donation.donor, donation.message, typeInfo.name AS type_name, donation.obj_id, donation.type_id FROM donation INNER JOIN objectTab ON donation.obj_id = objectTab.id INNER JOIN typeInfo ON donation.type_id = typeInfo.id ORDER BY donation.id DESC" UpdateCommand="UPDATE donation SET `time` = @time , obj_id = @obj_id, money = @money, donor = @donor, message = @message, type_id = @type_id WHERE (id = @id)" InsertCommand="INSERT INTO donation(`time`, donor) VALUES ( @time , @donor)" DeleteCommand="DELETE FROM donation WHERE (id = @id)"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT id, name FROM objectTab"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT id, name FROM typeInfo"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:donate_sysConnectionString %>" ProviderName="<%$ ConnectionStrings:donate_sysConnectionString.ProviderName %>" SelectCommand="SELECT id, `time`, object_id, money, donor, message, typeInfo FROM donation WHERE (object_id = @DropDownList1.SelectedValue) AND (donor = @donor) AND (typeInfo = @DropDownList2.SelectedValue)"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT donation.id, donation.`time`, objectTab.name AS obj_name, donation.money, donation.donor, donation.message, typeInfo.name AS type_name FROM donation INNER JOIN objectTab ON donation.obj_id = objectTab.id INNER JOIN typeInfo ON donation.type_id = typeInfo.id WHERE ( (time = ?) AND (donor = ?) AND (objectTab.id = ?))">
                        <SelectParameters>
                            <asp:FormParameter FormField="date" Name="date" Type="String" />
                            <asp:FormParameter FormField="donor" Name="donor" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="obj_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />
                </div>
        </form>


    </div>
    <script src="/layuiadmin/layui/layui.js"></script>
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
