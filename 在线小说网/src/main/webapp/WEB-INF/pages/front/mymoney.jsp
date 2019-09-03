<%@page contentType="text/html; charset=utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .container {
            width: 100%;
            height: 100%;
        }
        .clearfix::after{
            content: "";
            height: 0;
            clear: both;
            display: block;
        }

        .container .nav {
            width: 100%;
            height: 80px;
            background-color: rgb(245, 52, 86);
        }

        .container .nav h1 {
            color: white;
            line-height: 80px;
            vertical-align: middle;
            font-size: 24px;
            font-weight: 400;
            margin-left: 40px;
        }

        .container .content {
            width: 1000px;
            height: 800px;
            border: 1px solid #eeeeee;
            margin: 20px auto;
        }

        .container .content div>p {
            color: #b6adad;
            font-size: 14px;
            margin-left: 20px;
            margin-bottom: 10px;
        }
        .container .content>div{
            margin-left: 40px;
            margin-top: 30px;

        }
        .user span{
            font-size: 14px;
        }
        .user img{
            width: 30px;
            margin-left: 20px;
        }
        .rechargeWay>div{
            width: 240px;
            height: 80px;
            border: 1px solid rgba(199, 196, 196, 0.933);
            float: left;
            margin-right: 15px;

        }
        .rechargeWay div img{
            width: 50px;
            margin: 15px 20px;
        }
        .rechargeWay div h4{
            line-height: 80px;
            float: right;
            font-weight: 400;
            margin-right: 60px;

            
        }
    .recharge>div{
        width: 350px;
        height: 60px;
        border: 1px solid rgba(199, 196, 196, 0.933); 
        float: left;
        margin-right: 30px;
        margin-bottom: 20px;

    }
    .recharge{
        height: 400px;
    }
    .container .content .recharge p{
        font-size: 20px;
        color: #000;
        line-height: 60px;
        margin-left: 20px;

    }
 .other input{
        border: none;
        outline: none;
        border-bottom: 1px solid rgba(175, 168, 168, 0.933);


    }
    /* .container .content .recharg .other p{
       display: inline-block;
       width: 40px;
        } */
#money{
    display: inline-block;
       width: 80px;
}
        

    </style>
</head>

<body>
    <div class="container">
        <div class="nav">
            <h1>余额充值</h1>
        </div>
        <div class="content">
            <div>
                <p>账号</p>
                <div class="user"><img src="./images/用户_wps图片.png" alt=""><span>读者名字</span> </div>
            </div>
            <div class="rechargeWay clearfix">
                <p>充值方式</p>
                <div class="zhifubao">
                    <img src="./images/zhifubao.png" alt="">
                    <h4>支付宝</h4>
                </div>
                <div class="weixin">
                    <img src="./images/weixin.png" alt="">
                    <h4>微信</h4>
                </div>
                <div class="yinhangka">
                    <img src="./images/yinhangka.png" alt="">
                    <h4>银行卡</h4>
                </div>

            </div>
            <div class="recharge">
                <p>充值金额</p>
                <div>
                    <p>￥10</p>
                </div>
                <div>
                    <p>￥20</p>
                </div>
                <div>
                    <p>￥30</p>
                </div>
                <div>
                    <p>￥50</p>
                </div>
                <div>
                    <p>￥100</p>
                </div>
                <div class="other">
                   <p id="money">其他金额</p>
                    <input type="text" placeholder="输入金额">
                </div>
              
               
            </div>
            <button>立即支付</button>
            <div>
                    <input type="radio" id="">
                    <span>我同意《用户协议》</span>
                </div>
        </div>

    </div>
</body>

</html>