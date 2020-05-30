<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="Donate.users.Donate" %>

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
        <form id="form1" runat="server">
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <p>目前，您可通过扫描屏幕下方二维码进行捐助，请在扫码备注里填写捐赠类型。</p>
                    <p>捐赠类型有：助印弘法、赞助本站、寺院建设、佛前供灯、放生护生、慈善会员、定向捐款、慈善捐款、其他捐款。</p>
                    <div class="layui-card-body" style="padding: 15px;">
                        <div class="layui-form-item">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/mm_facetoface_collect_qrcode_1590732159711.png" Width="300px" />
                        </div>
                    </div>
                </div>
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
