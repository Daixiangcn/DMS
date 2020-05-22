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
                <div class="layui-col-sm4">
                    <div class="layui-card">
                        <div class="layui-card-header">用户留言</div>
                        <div class="layui-card-body">
                            <ul class="layuiadmin-card-status layuiadmin-home2-usernote">
                                <li>
                                    <h3>贤心</h3>
                                    <p>
                                        当前在线人数：
                                    </p>
                                    <span>5月30日 00:00</span>
                                    <a href="javascript:;" layadmin-event="replyNote" data-id="7" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
                                </li>
                                <li>
                                    <h3>诸葛亮</h3>
                                    <p>皓首匹夫！苍髯老贼！你枉活九十有六，一生未立寸功，只会摇唇鼓舌！助曹为虐！一条断脊之犬，还敢在我军阵前狺狺狂吠，我从未见过有如此厚颜无耻之人！</p>
                                    <span>5月02日 00:00</span>
                                    <a href="javascript:;" layadmin-event="replyNote" data-id="5" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
                                </li>
                                <li>
                                    <h3>胡歌</h3>
                                    <p>你以为只要长得漂亮就有男生喜欢？你以为只要有了钱漂亮妹子就自己贴上来了？你以为学霸就能找到好工作？我告诉你吧，这些都是真的！</p>
                                    <span>5月11日 00:00</span>
                                    <a href="javascript:;" layadmin-event="replyNote" data-id="6" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
                                </li>
                                <li>
                                    <h3>杜甫</h3>
                                    <p>人才虽高，不务学问，不能致圣。刘向十日画一水，五日画一石。</p>
                                    <span>4月11日 00:00</span>
                                    <a href="javascript:;" layadmin-event="replyNote" data-id="2" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
                                </li>
                                <li>
                                    <h3>鲁迅</h3>
                                    <p>路本是无所谓有和无的，走的人多了，就没路了。。</p>
                                    <span>4月28日 00:00</span>
                                    <a href="javascript:;" layadmin-event="replyNote" data-id="4" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
                                </li>
                                <li>
                                    <h3>张爱玲</h3>
                                    <p>于千万人之中遇到你所要遇到的人，于千万年之中，时间的无涯的荒野中，没有早一步，也没有晚一步，刚巧赶上了，那也没有别的话好说，唯有轻轻的问一声：“噢，原来你也在这里？”</p>
                                    <span>4月11日 00:00</span>
                                    <a href="javascript:;" layadmin-event="replyNote" data-id="1" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm8">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-sm6">
                            <div class="layui-card">
                                <div class="layui-card-header">本周活跃用户列表</div>
                                <div class="layui-card-body">
                                    <table class="layui-table layuiadmin-page-table" lay-skin="line">
                                        <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>最后登录时间</th>
                                                <th>状态</th>
                                                <th>获得赞</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><span class="first">胡歌</span></td>
                                                <td><i class="layui-icon layui-icon-log">11:20</i></td>
                                                <td><span>在线</span></td>
                                                <td>22 <i class="layui-icon layui-icon-praise"></i></td>
                                            </tr>
                                            <tr>
                                                <td><span class="second">彭于晏</span></td>
                                                <td><i class="layui-icon layui-icon-log">10:40</i></td>
                                                <td><span>在线</span></td>
                                                <td>21 <i class="layui-icon layui-icon-praise"></i></td>
                                            </tr>
                                            <tr>
                                                <td><span class="third">靳东</span></td>
                                                <td><i class="layui-icon layui-icon-log">01:30</i></td>
                                                <td><i>离线</i></td>
                                                <td>66 <i class="layui-icon layui-icon-praise"></i></td>
                                            </tr>
                                            <tr>
                                                <td>吴尊</td>
                                                <td><i class="layui-icon layui-icon-log">21:18</i></td>
                                                <td><i>离线</i></td>
                                                <td>45 <i class="layui-icon layui-icon-praise"></i></td>
                                            </tr>
                                            <tr>
                                                <td>许上进</td>
                                                <td><i class="layui-icon layui-icon-log">09:30</i></td>
                                                <td><span>在线</span></td>
                                                <td>21 <i class="layui-icon layui-icon-praise"></i></td>
                                            </tr>
                                            <tr>
                                                <td>小蚊子</td>
                                                <td><i class="layui-icon layui-icon-log">21:18</i></td>
                                                <td><i>在线</i></td>
                                                <td>45 <i class="layui-icon layui-icon-praise"></i></td>
                                            </tr>
                                            <tr>
                                                <td>贤心</td>
                                                <td><i class="layui-icon layui-icon-log">09:30</i></td>
                                                <td><span>在线</span></td>
                                                <td>21 <i class="layui-icon layui-icon-praise"></i></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-sm6">
                            <div class="layui-card">
                                <div class="layui-card-header">项目进展</div>
                                <div class="layui-card-body">
                                    <div class="layui-tab-content">
                                        <div class="layui-tab-item layui-show">
                                            <table id="LAY-index-prograss"></table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-sm12">
                            <div class="layui-card">
                                <div class="layui-card-header">捐赠者全国分布</div>
                                <div class="layui-card-body">
                                    <div class="layui-row layui-col-space15">
                                        <div class="layui-col-sm4">
                                            <table class="layui-table layuiadmin-page-table" lay-skin="line">
                                                <thead>
                                                    <tr>
                                                        <th>排名</th>
                                                        <th>地区</th>
                                                        <th>人数</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>浙江</td>
                                                        <td>62310</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td>上海</td>
                                                        <td>59190</td>
                                                    </tr>
                                                    <tr>
                                                        <td>3</td>
                                                        <td>广东</td>
                                                        <td>55891</td>
                                                    </tr>
                                                    <tr>
                                                        <td>4</td>
                                                        <td>北京</td>
                                                        <td>51919</td>
                                                    </tr>
                                                    <tr>
                                                        <td>5</td>
                                                        <td>山东</td>
                                                        <td>39231</td>
                                                    </tr>
                                                    <tr>
                                                        <td>6</td>
                                                        <td>湖北</td>
                                                        <td>37109</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="layui-col-sm8">

                                            <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagethree">
                                                <div carousel-item id="LAY-index-pagethree">
                                                    <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
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
