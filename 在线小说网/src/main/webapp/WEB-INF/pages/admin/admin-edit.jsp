<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>管理员编辑页面</title>
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
    <div class="x-body layui-anim layui-anim-up">
        <form class="layui-form">
            <%--隐藏域--%>
            <input type="hidden" name="id" value="${admin.id}">
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>管理员名字
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${admin.adminName}" id="L_username" name="adminName" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input">
              </div>
          </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>性别
                </label>
                <div class="layui-input-inline">
                    <input type="radio" name="adminGender" class="layui-input" ${admin.adminGender == 1 ? "checked" : ""}  value="1"> 男
                    <input type="radio" name="adminGender" class="layui-input" ${admin.adminGender == 2 ? "checked" : ""} value="2"> 女
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>手机
                </label>
                <div class="layui-input-inline">
                    <input value="${admin.adminPhone}" type="text" name="adminPhone" required="" lay-verify="phone" class="layui-input">
                </div>
            </div>


          <div class="layui-form-item">
              <label  class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  编辑
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 4){
                return '名字至少得4个字符啊';
              }
            }
            ,
            phone: function (value) {
                // 用正则去验证手机号
                var regExp = new RegExp("^1[356789]\\d{9}$");
                if(!regExp.test(value)){
                    return "手机号格式不正确!";
                }
            }

          });

          //监听提交
          form.on('submit(add)', function(data){

              $.ajax({
                  type: "post",
                  url:"${pageContext.request.contextPath}/admin/edit",
                  data:data.field,
                  dataType: "json",
                  success:function (data) {
                      layer.alert(data.msg, {icon: data.code == 200 ? 6 : 5},function () {
                         // 获得frame索引
                         var index = parent.layer.getFrameIndex(window.name);
                         //关闭当前frame
                         parent.layer.close(index);
                         // 刷新页面
                         parent.location.replace(parent.location.href);
                     });
                  }
              });

            return false;
          });
          
          
        });
    </script>

  </body>

</html>