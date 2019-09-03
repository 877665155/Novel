<%@page contentType="text/html; charset=utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <%--<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <%--<script type="text/javascript" src="/static/js/layui.js" charset="utf-8"></script>--%>
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
        <div class="layui-form">
          <%--<div class="layui-form-item">--%>
              <%--<label for="readerId" class="layui-form-label">--%>
                  <%--<span class="x-red">*</span>用户名--%>
              <%--</label>--%>
              <%--<div class="layui-input-inline">--%>
                  <%--<input  type="text" id="readerId" name="readerId" required="" lay-verify="required " readonly--%>
                  <%--autocomplete="off" class="layui-input">--%>
              <%--</div>--%>
          <%--</div>--%>
          <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red"></span>书名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bookName" name="bookName" required="" lay-verify="required"
                autocomplete="off" class="layui-input" value="${book.bookName}" placeholder="${book.bookName}">
            </div>
        </div>

            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">
                    <span class="x-red"></span>书id
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="bookId" name="bookId" required="" lay-verify="required"
                           autocomplete="off" class="layui-input" value="${book.bookId}" placeholder="${book.bookId}">
                </div>
            </div>

          <div class="layui-form-item">
              <label for="orderPrice" class="layui-form-label">
                  <span class="x-red"></span>小说价格
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="orderPrice" name="orderPrice" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${book.bookPrice}">
              </div>
          </div>
            <div class="layui-form-item">
                <label for="orderPrice" class="layui-form-label">
                    <span class="x-red"></span>支付方式
                </label>
                <div class="layui-input-inline">
                    <%--<select name="payWay" id="payWay"   style="height: 38px;display: block;">--%>
                    <select name="payWay" id="payWay" >
                        <option value="支付方式">支付方式</option>
                        <option value="支付宝">支付宝</option>
                        <option value="微信">微信</option>
                        <option value="银行卡">银行卡</option>
                    </select>
                </div>
            </div>

           <!-- <div class="layui-form-item">
                <label for="payStatus" class="layui-form-label">
                    <span class="x-red">*</span>支付状态
                </label>
                <div class="layui-input-inline">
                    <select id="payStatus" name="payStatus" class="valid">
                        <option value="2">待支付</option>
                        <option value="1">已完成</option>
                    </select>
               </div>
            </div> -->
          <%--<div class="layui-form-item">--%>
              <%--<label for="payWay" class="layui-form-label">--%>
                  <%--<span class="x-red">*</span>支付方式--%>
              <%--</label>--%>

          <%--</div>--%>
          <!-- <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_email" name="email" required="" lay-verify="email"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>
              </div>
          </div> -->

          <div class="layui-form-item">
              <label  class="layui-form-label">
              </label>
              <button  class="layui-btn" id="addOrder">
                  购买
              </button>
          </div>
      </div>

    </div>
    <script>
        layui.use('layer', function(){ //独立版的layer无需执行这一句
            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        $('#addOrder').on('click',addOrder)

        function addOrder() {

            var bookName = $("#bookName").val();
            var bookId = $("#bookId").val();
            var orderPrice = $("#orderPrice").val();
            var payWay = $("#payWay option:selected").val();
            console.log(payWay)

            console.log("aaaaaaaaaaaaaaaa")

        <%--$.ajax({--%>
            <%--type:'POST',--%>
            <%--url:"${pageContext.request.contextPath}/bookorder/add",--%>
            <%--data:{--%>
            //     "bookName":bookName,
            //     "bookId":bookId,
            //     "orderPrice":orderPrice,
            //     "payWay":payWay
            <%--},--%>
            <%--dataType:"json",--%>
            <%--success:function (data) {--%>
                <%--console.log(data);--%>
                <%--// layer.alert(data.msg, {icon: data.code == 200 ? 6 : 5},function () {--%>
                <%--//     /*var index = parent.layer.getFrameIndex(window.name);--%>
                <%--//     //关闭当前frame--%>
                <%--//     parent.layer.close(index);--%>
                <%--//     parent.location.replace(parent.location.href);*!/*/--%>
                <%--// });--%>
            <%--},--%>
            <%--error: function (a,b,c) {--%>
                <%--console.log(a,b,c)--%>
            <%--}--%>
        <%--})--%>
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/bookorder/add",
                data:{
                    bookName:bookName,
                    bookId:bookId,
                    orderPrice:orderPrice,
                    payWay:payWay
                },
                dataType:"json",
                success:function (res) {
                    layer.alert(res.msg, {icon: res.code=200? 6:5},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });
                },
                error:function (a,b,c) {
                    console.log("a1111")
                }
            })

        }


        })

       /* layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

          //监听提交
          form.on('submit(add)', function(data){
              console.log(data)


            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
          
        });*/
    </script>

  </body>

</html>