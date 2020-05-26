<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="Donate.admin.infoUp.Template" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../layuiadmin/style/admin.css" media="all">
    <title>模板上传</title>
</head>
<body>
    <div class="layui-fluid">
        <form id="form1" runat="server" class="layui-form" lay-filter="component-form-group">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md9">
                    <div class=" layui-card">
                        <div class="layui-card-header">使用说明</div>
                        <div class="layui-card-body">
                            <p>1. 请使用本页面提供的模板文件录入数据，不要改变单元格类型。</p>
                            <p>2. 需要特别注意的是，一份相同的数据只需要上传一次，目前而言，系统不会识别数据是否重复。</p>
                            <p>3. 建议操作员上传数据前先查看目前系统已有的数据，避免重复上传。</p>
                            <p>4. 如果出现问题，请联系系统管理员。</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">模板下载</div>
                        <div class="layui-card-body">
                            <p>版本号：V2.0</p>
                            <p>发布时间：2020年5月25日</p>
                            <a href="/files/download/20200525V2.xls">
                                <asp:Button ID="Button1" runat="server" Text="数据模板 V2.0" class="layui-btn" OnClick="Button1_Click" />
                            </a>              
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card ">
                        <div class="layui-card-header">模板录入</div>
                        <div class="layui-card-body">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn layui-btn-normal" id="test-upload-testList">选择文件</button><input class="layui-upload-file" type="file" accept="undefined" name="file" multiple="">
                                <div class="layui-upload-list">
                                    <table class="layui-table">
                                        <thead>
                                            <tr>
                                                <th>文件名</th>
                                                <th>大小</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="test-upload-demoList"></tbody>
                                    </table>
                                </div>
                                <button type="button" class="layui-btn" id="test-upload-testListAction">开始上传</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="../../../layuiadmin/layui/layui.js"></script>
    <script>
        layui.config({
            base: '../../../layuiadmin/' //静态资源所在路径
        }).extend({
            index: 'lib/index' //主入口模块
        }).use(['index', 'upload'], function () {
            var $ = layui.jquery
                , upload = layui.upload;
            //多文件列表示例
            var demoListView = $('#test-upload-demoList')
                , uploadListIns = upload.render({
                    elem: '#test-upload-testList'
                    , url: '/upload/'
                    , accept: 'file'
                    , multiple: true
                    , auto: false
                    , bindAction: '#test-upload-testListAction'
                    , choose: function (obj) {
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        //读取本地文件
                        obj.preview(function (index, file, result) {
                            var tr = $(['<tr id="upload-' + index + '">'
                                , '<td>' + file.name + '</td>'
                                , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                                , '<td>等待上传</td>'
                                , '<td>'
                                , '<button class="layui-btn layui-btn-mini test-upload-demo-reload layui-hide">重传</button>'
                                , '<button class="layui-btn layui-btn-mini layui-btn-danger test-upload-demo-delete">删除</button>'
                                , '</td>'
                                , '</tr>'].join(''));

                            //单个重传
                            tr.find('.test-upload-demo-reload').on('click', function () {
                                obj.upload(index, file);
                            });

                            //删除
                            tr.find('.test-upload-demo-delete').on('click', function () {
                                delete files[index]; //删除对应的文件
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });

                            demoListView.append(tr);
                        });
                    }
                    , done: function (res, index, upload) {
                        if (res.code == 0) { //上传成功
                            var tr = demoListView.find('tr#upload-' + index)
                                , tds = tr.children();
                            tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                            tds.eq(3).html(''); //清空操作
                            return delete this.files[index]; //删除文件队列已经上传成功的文件
                        }
                        this.error(index, upload);
                    }
                    , error: function (index, upload) {
                        var tr = demoListView.find('tr#upload-' + index)
                            , tds = tr.children();
                        tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                        tds.eq(3).find('.test-upload-demo-reload').removeClass('layui-hide'); //显示重传
                    }
                });
        })
    </script>
</body>
</html>
