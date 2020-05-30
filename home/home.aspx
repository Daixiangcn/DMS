<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Donate.home.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>layuiAdmin 主页示例模板二</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
</head>
<body>
    <form id="form1" runat="server">
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">

                <div class="layui-col-sm6 layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            总捐赠金额
            <span class="layui-badge layui-bg-blue layuiadmin-badge">万元</span>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">
                            <p class="layuiadmin-big-font">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </p>
                            <p>
                                截止时间
              <span class="layuiadmin-span-color">
                  <asp:Label ID="dateLabel" runat="server" Text="Label"></asp:Label><i class="layui-inline layui-icon layui-icon-log"></i></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            总捐赠人次
            <span class="layui-badge layui-bg-cyan layuiadmin-badge">人次</span>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">
                            <p class="layuiadmin-big-font">
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </p>
                            <p>
                                总记录数
              <span class="layuiadmin-span-color">
                  <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                  条 <i class="layui-inline layui-icon layui-icon-tabs"></i></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            线上捐赠
            <span class="layui-badge layui-bg-green layuiadmin-badge">万元</span>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">

                            <p class="layuiadmin-big-font">
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </p>
                            <p>
                                捐赠人次<span class="layuiadmin-span-color">
                                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                    <i class="layui-inline layui-icon layui-icon-user"></i></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            线下捐赠
            <span class="layui-badge layui-bg-orange layuiadmin-badge">万元</span>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">

                            <p class="layuiadmin-big-font">
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            </p>
                            <p>
                                捐赠人次<span class="layuiadmin-span-color">
                                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label><i class="layui-inline layui-icon layui-icon-user"></i></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            捐赠数据统计
            <div class="layui-btn-group layuiadmin-btn-group">
                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">去年</a>
                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">今年</a>
            </div>
                        </div>
                        <div class="layui-card-body">
                            <div class="layui-row">

                                <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagetwo">
                                    <div carousel-item id="LAY-index-pagetwo">
                                        <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="../../layuiadmin/layui/layui.js"></script>
        <script>
            layui.config({
                base: '../../layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index', 'sample']);
        </script>
    </form>
</body>
</html>
