<%@page contentType="text/html; charset=utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>读者注册</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <link rel="stylesheet" href="/static/css/layui.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>

</head>
<body class="login-bg">
    
    <div class="register login layui-anim layui-anim-up">
        <div class="message">读者注册</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" onsubmit="return false">
            <input name="readerName" id="usrname" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="readerPhone" id="phone" placeholder="电话"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="readerEmail" id="email" placeholder="邮箱"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" id="pw" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="注册" id="submit" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });
              //监听提交

                $('#submit').on('click',function () {
                    var uName = $('#usrname').val()
                    var phone = $('#phone').val();
                    var email = $('#email').val();
                    var pw = $('#pw').val();

                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/reader/add",
                        data: {
                            readerName: uName,
                            readerPhone: phone,
                            readerEmail: email,
                            password: pw
                        },
                        dataType:"json",
                        success:function (data) {
                            layer.alert(data.msg, {icon: data.code == 200 ? 6 : 5},function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                                // 刷新页面
                                location.href='${pageContext.request.contextPath}/rloginPage'
                            });
                        }
                    });

                })

            });
        })

        
    </script>

    
    <!-- 底部结束 -->

</body>
</html>