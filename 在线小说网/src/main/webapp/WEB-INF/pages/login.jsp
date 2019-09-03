<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登陆</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <style>
        .author{
            float: left;
        }
        .admin{
            float:right;;
        }
        .zhuce{
            margin-left:130px;
        }
    </style>
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">在线小说系统</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" >
        <input name="adminName" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="adminPwd" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
    <a  class="author"  href='${pageContext.request.contextPath}/duzhe'>读者</a>
    <a  class="admin"  href='${pageContext.request.contextPath}/zuozhe'>作者</a>
</div>

<script>
    $(function  () {
        layui.use('form', function(){
            var form = layui.form;
            // layer.msg('玩命卖萌中', function(){
            //   //关闭后的操作
            //   });
            // //监听提交
            form.on('submit(login)', function(data){
                $.ajax({
                    type: "post",// 提交表单的方法
                    url:"${pageContext.request.contextPath}/login",// 对应登陆接口的路径
                    data: data.field,// 提交的数据
                    dataType: "json",// 服务端返回的数据类型
                    success:function (data) {// 服务器返回数据之后的回调函数

                        layer.msg(data.msg,function(){

                            if(data.code === 200){

                                location.href='${pageContext.request.contextPath}/index'
                            }
                        });
                    }
                });
                return false;
            });
        });
    })


</script>


<!-- 底部结束 -->

</body>
</html>