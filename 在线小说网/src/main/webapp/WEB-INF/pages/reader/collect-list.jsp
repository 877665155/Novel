<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>读者列表</title>
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
  
  <body class="layui-anim layui-anim-up">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">读者管理</a>
        <a>
          <cite>读者收藏</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/reader/collectsearch" method="post">
          <input type="text" name="keyword"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"  id="ssss"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
        <%--<button class="layui-btn" onclick="x_admin_show('添加收藏','${pageContext.request.contextPath}/reader/addPage',600,400)"><i class="layui-icon"></i>添加</button>--%>
        <span class="x-right" style="line-height:40px">共有数据：${pageInfo.total} 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>收藏编号</th>
            <th>读者名字</th>
            <th>小说名</th>
            <th>收藏时间</th>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="collect">
            <tr>
              <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${reader.readerId}'><i class="layui-icon">&#xe605;</i></div>
              </td>
              <td>${collect.collectId}</td>
              <td>${collect.readerName}</td>
              <td>${collect.bookName}</td>
              <td>${collect.collectDate}</td>

              <%--<td class="td-status">--%>
                <%--<span class="layui-btn layui-btn-normal ${reader.readerStatus==3 ?"layui-btn-disabled":""} layui-btn-mini">${reader.readerStatus==1 ? "在线":"注销"}</span></td>--%>
              <%--<td class="td-manage">--%>
                <%--<a onclick="member_stop(this,'${reader.readerId}')" href="javascript:;"  title="${reader.readerStatus==1? "注销":"启用"}">--%>
                  <%--<i class="layui-icon">${reader.readerStatus==1 ?"&#xe601;":"&#xe62f;"}</i>--%>
                <%--</a>--%>
                <%--<a title="编辑"  onclick="x_admin_show('编辑','${pageContext.request.contextPath}/reader/editPage?readerId=${reader.readerId}',600,400)" href="javascript:;">--%>
                  <%--<i class="layui-icon">&#xe642;</i>--%>
                <%--</a>--%>

                <%--<a title="删除" onclick="member_del(this,'${reader.readerId}')" href="javascript:;">--%>
                  <%--<i class="layui-icon">&#xe640;</i>--%>
                <%--</a>--%>
              </td>
            </tr>
          </c:forEach>


        </tbody>
      </table>
      <div class="page">
        <%--<a class="num" href="">1</a>--%>
        <%--<span class="current">2</span>--%>
        <%--<a class="num" href="">3</a>--%>
        <%--<a class="num" href="">489</a>--%>
        <div>
          <c:if test="${pageInfo.hasPreviousPage}">
            <a class="prev" href="${pageContext.request.contextPath}/reader/collect?page=${pageInfo.prePage}">&lt;&lt;</a>
          </c:if>
          <c:forEach items="${pageInfo.navigatepageNums}" var="p">
            <c:if test="${pageInfo.pageNum==p}">
              <span class="current">${p}</span>
            </c:if>
            <c:if test="${pageInfo.pageNum!=p}">
              <a class="num" href="${pageContext.request.contextPath}/reader/collect?page=${p}">${p}</a>
            </c:if>
          </c:forEach>
          <c:if test="${pageInfo.hasNextPage}">
            <a class="next" href="${pageContext.request.contextPath}/reader/collect?page=${pageInfo.nextPage}">&gt;&gt;</a>
          </c:if>
        </div>
      </div>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要状态处理吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                  $.ajax({
                     type:"post" ,
                      url:"${pageContext.request.contextPath}/reader/editStatus",
                      data:{readerId:id,readerStatus:1},
                      dataType:"json",
                      success:function (data) {
                          $(obj).attr('title','注销')
                          $(obj).find('i').html('&#xe62f;');
                          $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('在线');
                          layer.msg(data.msg,{icon: data.code==200 ? 6:5,time:1000});
                      }
                  });
              }else{
                  $.ajax({
                      type:"post" ,
                      url:"${pageContext.request.contextPath}/reader/editStatus",
                      data:{readerId:id,readerStatus:3},
                      dataType:"json",
                      success:function (data) {
                          $(obj).attr('title','启用')
                          $(obj).find('i').html('&#xe601;');
                          $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('注销');
                          layer.msg(data.msg,{icon: data.code==200 ? 6:5,time:1000});
                      }
                  });

              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          $.ajax({
              type:"post" ,
              url:"${pageContext.request.contextPath}/reader/delete",
              data:{readerId:id,readerStatus:1},
              dataType:"json",
              success:function (data) {
                  layer.confirm(data.msg,function(index){
                      //发异步删除数据
                      $(obj).parents("tr").remove();
                      layer.msg('已删除!',{icon:1,time:1000});
                  });
              }
          });

      }

      function delAll (argument) {

        var data = tableCheck.getData();
        // 将data转换成字符串
          data=data.join(",")
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                type:"post" ,
                url:"${pageContext.request.contextPath}/reader/deleteAll",
                data:{ids:data},
                dataType:"json",
                success:function (data) {
                    layer.msg(data.msg, {icon: 1});
                    if(data.code==200){
                        location.replace(location.href);
                    }
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                }
            });

        });
      }



      $(function () {
          $("#ssss").click(function () {
              $.ajax({
                  type:"post",
                  url:"/reader/search",
                  data:{readerName:$("#searchr").val()},
                  dataType:"json",
                  sucess:function (data) {
                      layer.msg(data.msg, {icon: 1});
                      if(data.code==200){
                          location.replace("${pageContext.request.contextPath}/reader/search");
                      }
                      $(".layui-form-checked").not('.header').parents('tr').remove();
                  }
              })
          })
      })
    </script>

  </body>

</html>