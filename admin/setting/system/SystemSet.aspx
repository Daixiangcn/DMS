<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemSet.aspx.cs" Inherits="Donate.admin.setting.system.SystemSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all" />
    <title>System</title>
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">

                    <div class="layui-card">
                        <div class="layui-card-body" pad15">
                            <div class="layui-form" wid100 lay-filter>
                                <asp:FormView ID="FormView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="80%">
                                    <EditItemTemplate>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">系统名称</label>
                                            <div class="layui-input-block">
                                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' CssClass="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">系统域名</label>
                                            <div class="layui-input-block">
                                                <asp:TextBox ID="domainTextBox" runat="server" Text='<%# Bind("domain") %>' CssClass="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">缓存时间</label>
                                            <div class="layui-input-inline" style="width:80px">
                                                <asp:TextBox ID="cacheTextBox" runat="server" Text='<%# Bind("cache") %>' CssClass="layui-input" />
                                            </div>
                                            <div class="layui-input-inline layui-input-company">分钟</div>
                                            <div class="layui-form-mid layui-word-aux">本地开发一般推荐设置为 0，线上环境建议设置为 10。</div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label layui-form-text">最大上传文件</label>
                                            <div class="layui-input-inline" style="width:80px">
                                                <asp:TextBox ID="max_file_sizeTextBox" runat="server" Text='<%# Bind("max_file_size") %>' CssClass="layui-input" />
                                            </div>
                                            <div class="layui-input-inline layui-input-company">KB</div>
                                            <div class="layui-form-mid layui-word-aux">提示：1 M = 1024 KB</div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label layui-form-text">上传文件类型</label>
                                            <div class="layui-input-block">
                                                <asp:TextBox ID="file_typeTextBox" runat="server" Text='<%# Bind("file_type") %>' CssClass="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">首页标题</label>
                                            <div class="layui-input-block">
                                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' CssClass="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">META关键词</label>
                                            <div class="layui-input-block">
                                                <asp:TextBox ID="keywordsTextBox" runat="server" Text='<%# Bind("keywords") %>' CssClass="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">META描述</label>
                                            <div class="layui-input-block">
                                                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' CssClass="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">版权信息</label>
                                            <div class="layui-input-block">
                                                <asp:TextBox ID="copyrightTextBox" runat="server" Text='<%# Bind("copyright") %>' CssClass="layui-input" />
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" class="layui-btn" />
                                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" class="layui-btn" />
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemTemplate>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">系统名称</label>
                                            <div class="layui-input-block" style="line-height:38px">
                                                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">系统域名</label>
                                            <div class="layui-input-block"  style="line-height:38px">
                                                <asp:Label ID="domainLabel" runat="server" Text='<%# Bind("domain") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">缓存时间</label>
                                            <div class="layui-input-block"  style="line-height:38px">
                                                <asp:Label ID="cacheLabel" runat="server" Text='<%# Bind("cache") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label layui-form-text">最大上传文件</label>
                                            <div class="layui-input-block"  style="line-height:38px">
                                                <asp:Label ID="max_file_sizeLabel" runat="server" Text='<%# Bind("max_file_size") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label layui-form-text">上传文件类型</label>
                                            <div class="layui-input-block" style="line-height:38px">
                                                <asp:Label ID="file_typeLabel" runat="server" Text='<%# Bind("file_type") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">首页标题</label>
                                            <div class="layui-input-block"  style="line-height:38px">
                                                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">META关键字</label>
                                            <div class="layui-input-block"  style="line-height:38px">
                                                <asp:Label ID="keywordsLabel" runat="server" Text='<%# Bind("keywords") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">META描述</label>
                                            <div class="layui-input-block"  style="line-height:38px">
                                                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                                            </div>
                                        </div>
                                        <div class="layui-form-item ">
                                            <label class="layui-form-label">版权信息</label>
                                            <div class="layui-input-block"  style="line-height:38px">
                                                <asp:Label ID="copyrightLabel" runat="server" Text='<%# Bind("copyright") %>' />
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
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DonateConnectionStrings %>" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:DonateConnectionStrings.ProviderName %>" SelectCommand="SELECT * FROM systemInfo" UpdateCommand="UPDATE systemInfo SET name = @name, domain = @domain, cache = @cache, max_file_size = @max_file_size, file_type = @file_type, title = @title, keywords = @keywords, description = @description, copyright = @copyright WHERE (id = @id)"></asp:SqlDataSource>
                </form>
            </div>
        </div>
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
