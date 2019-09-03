<%@page contentType="text/html; charset=utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="/static/css/layui.css">
  <script type="text/javascript" src="/static/js/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <style>
    #bg{
      background: url("/static/images/e64f07251f06e7c1a75142a2fde2aec2.jpg") no-repeat;
      background-size: cover;
      /* height: 200px;
      padding-top: 20px; */
    }
    /* #bg h3{ */

    /* } */
  </style>
</head>
<body>

  <div class="site-nav-bg" id="navtop">
    <div class="site-nav w1200"  >
      <p class="sn-back-home">
        <!-- <i class="layui-icon layui-icon-home"></i> -->
        <a href="${pageContext.request.contextPath}/book/getByType?bookType=1" style="color: rgb(165, 162, 162);margin-left: 10px; font-size: 20px;">首页</a>
      </p>
      <div class="sn-quick-menu">
        <%--<div class="login"><a href="login.html">登录</a></div>--%>
        <%--<div class="sp-cart"><a href="shopcart.html">购物车</a><span>2</span></div>--%>
      </div>
    </div>
  </div>

  <div class="content content-nav-base shopcart-content">
  
    <div class="banner-bg w1200" id="bg">
      <h3>我的订单</h3>
      <p></p>
    </div>
    <c:forEach items="${bookOrderList}" var="bookOrder">

    <div class="cart w1200">
      <div class="cart-table-th">

        <div class="th th-item">
          <div class="th-inner">
            订单编号：&nbsp;<span style="color:rgb(223, 91, 30)">${bookOrder.orderid}</span>
          </div>
        </div>
        <div class="th th-price">
          <div class="th-inner" style="width: 300px">
            订单时间:&nbsp;<span style="color:rgb(223, 91, 30)">${bookOrder.orderDate}</span>
          </div>
        </div>
        <div class="th th-amount" style="margin-left: 20px">
          <div class="th-inner">
            订单状态：&nbsp;<span style="color:rgb(223, 91, 30)">
            <c:if test="${bookOrder.orderStatus==1}">
              待确定
            </c:if>
             <c:if test="${bookOrder.orderStatus==2}">
               已完成
             </c:if>
             <c:if test="${bookOrder.orderStatus==3}">
               已取消
             </c:if>
          </span>
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            订单总价：&nbsp;<span style="color:rgb(223, 91, 30)">${bookOrder.orderPrice}</span>
          </div>
        </div>
         
      </div>
      <div class="OrderList">
        <div class="order-content" id="list-cont">



          <ul class="item-content layui-clear">
            <li class="th th-chk">
            </li>
            <li class="th th-item">
              <div class="item-cont">
                <a href="javascript:;"><img src="${bookOrder.book.bookDetail.picAddress}" alt=""></a>
                <div class="text">
                  <div class="title">${bookOrder.book.bookName}</div>
                  <p>${bookOrder.book.bookDetail.bookBref}</p>
                </div>
              </div>
            </li>
            <li class="th th-price">
              <p class="th-su"><span style="color:#EE0000">单价：</span><span>${bookOrder.orderPrice}</span></p>
            </li>
            <li class="th th-amount">
              <div class="box-btn layui-clear">
                <input class="Quantity-input" type="" name="" value="1" disabled="disabled"> 
              </div>
            </li>
            <li class="th th-sum">
              <p><span>总价：</span><span style="color:rgb(75, 75, 75)">${bookOrder.orderPrice}</span></p>
            </li>
           
          </ul>

        </div>

      </div>
    </div>

    </c:forEach>

  </div>

<script type="text/javascript">
  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery','element','car'],function(){
    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
    
    // 模版导入数据
    // var html = demo.innerHTML,
    // listCont = document.getElementById('list-cont');
    // mm.request({
    //   url: '../json/shopcart.json',
    //   success : function(res){
    //     listCont.innerHTML = mm.renderHtml(html,res)
    //     element.render();
    //     car.init()
    //   },
    //   error: function(res){
    //     console.log(res);
    //   }
    // })
    // 
    car.init()


});
</script>
</body>
</html>