<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="userId" class="layui-form-label">
                <span class="x-red">*</span>用户id
            </label>
            <div class="layui-input-inline">
                <input type="text" id="userId" name="userId" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="rechargeMoney" class="layui-form-label">
                <span class="x-red">*</span>充值金额
            </label>
            <div class="layui-input-inline">
                <input type="text" id="rechargeMoney" name="rechargeMoney" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="rechargeWay" class="layui-form-label">
                <span class="x-red">*</span>充值方式
            </label>
            <div class="layui-input-inline">
                <select name="rechargeWay" id="rechargeWay" class="valid">
                    <option>充值方式</option>
                    <option>支付宝</option>
                    <option>微信</option>
                    <option>银行卡</option>
                </select>
            </div>
        </div>
        <%--<div class="layui-form-item">--%>
        <%--<label for="L_email" class="layui-form-label">--%>
        <%--<span class="x-red">*</span>--%>
        <%--</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<input type="text" id="L_email" name="email" required="" lay-verify="email"--%>
        <%--autocomplete="off" class="layui-input">--%>
        <%--</div>--%>
        <%--<div class="layui-form-mid layui-word-aux">--%>
        <%--<span class="x-red">*</span>--%>
        <%--</div>--%>
        <%--</div>--%>

        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="" name="orderadd">
                增加
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;


        //监听提交
        form.on('submit(add)', function(data){
            // console.log(data)
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/rechargeorder/add",
                data:data.field,
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    layer.alert(data.msg, {icon: data.code == 200 ? 6 : 5},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        parent.location.replace(parent.location.href);
                    });
                }

            });
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });


    });
</script>

</body>

</html>