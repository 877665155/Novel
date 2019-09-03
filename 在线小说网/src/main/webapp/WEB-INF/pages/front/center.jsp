<!-- <%--<%@page contentType="text/html; charset=utf-8" language="java" %>--%>
<%--&lt;%&ndash;jsp 动作标签 => 转发&ndash;%&gt;--%>
<%--<jsp:forward page="/index"/>--%>
<%@page contentType="text/html; charset=utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%> -->
<html>

<head>
    <title>Title</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;
        }

        .wrap {
            width: 1000px;
            height: 60px;
            margin-left: auto;
            margin-right: auto;
        }

        .header_top {
            width: 100%;
            height: 60px;
            padding-top: 20px;
            background-color: #fefefe;
        }

        .header_bottom {
            width: 100%;
            height: 50px;
            margin-top: 20px;
            background-color: red;
        }

        header {
            width: 100%;
            height: 150px;
            background-color: #fefefe;
        }




        .middle {
            width: 700px;
            height: 50px;
            line-height: 50px;

        }

        .middle li {
            float: left;
            margin-left: 20px;
        }

        .middle li a {
            color: white;
        }

        #first {
            margin-left: 0;
        }

        .right {
            float: right;
            width: 150px;
            height: 40px;
            margin-top: 5px;
            text-align: center;
            border-radius: 5px;
            /* background-color: rgb(187, 175, 175); */
        }

        .right img {
            height: 30px;
            width: 30px;
            margin-top: 6px;
            border-radius: 50%;
            vertical-align: middle;
            color: blanchedalmond;
        }

        .login {
            line-height: 40px;
            width: 50px;
            height: 50px;

        }

        .zhuce {
            line-height: 50px;
            width: 50px;
            height: 50px;
        }

        .wrap1 {
            width: 1000px;
            height: 100px;
            margin-left: auto;
            margin-right: auto;
        }

        section {
            width: 100%;
            height: 950px;
            background-color: rgb(255, 245, 245);
        }

        .tuijian {
            width: 1000px;
            height: 400px;
            background-color: white;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
        }

        .zhanweifu {
            height: 1px;
        }

        .tuijian_top {
            width: 960px;
            height: 50px;
            margin-left: auto;
            margin-right: auto;
            line-height: 50px;
            border-bottom: 1px solid black;
        }

        .context {
            width: 800px;
            height: 300px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;

        }

        .neirong li {
            width: 500px;
            height: 30px;
            float: left;
            font-size: 18px;
            color: #aca9a9;
            margin-left: 10px;
            margin-top: 20px;
        }

        .tupian {
            width: 100px;
            height: 130px;
            float: left;
        }

        .wenzi {
            float: left;
            width: 150px;
            height: 130px;
            margin-left: 10px;
        }

        img {
            width: 100px;
            height: 130px;
        }

        .wenzi p {
            margin-top: 14px;
            font-size: 14px;
        }

        footer {
            width: 100%;
            height: 100px;
            background-color: #ffebee
        }

        .last {
            width: 800px;
            height: 50px;
            padding: 20px;
            margin-left: auto;
            margin-right: auto;
        }

        .last ul li {
            float: left;
            margin-left: 20px;
        }

        .shuru {
            width: 400px;
            height: 50px;
            float: left;
            margin-left: 100px;
        }

        #inp {
            outline: none;
            padding: 0 15px;
        }

        .shuru input {
            float: left;
            width: 300px;
            height: 40px;
            margin-top: 5px;
            border-radius: 20px;
            border: 1px solid red;
        }

        .shuru button {
            width: 50px;
            height: 35px;
            margin-top: 8px;
            margin-left: 5px;
            background-color: red;
            border-radius: 5px;
            border: none;
            float: left;
        }

        .logo {
            float: left;
        }

        .logo a {
            display: block;
            width: 190px;
            height: 60px;
        }

        .logo a img {
            width: 190px;
            height: 60px;
        }

        .right ul {
            width: 150px;
            height: 40px;
            /* border: 1px solid #000; */
            border-radius: 10px;
            overflow: hidden;
        }

        .right ul li {
            width: 110px;
            height: 40px;
            padding: 0 20px;
            line-height: 40px;
            background: #ffffff;
            border-radius: 3px;
        }

        .right ul li:hover {
            background: #dad8d8;
        }

        .right ul li:hover a {
            color: rgb(255, 255, 255);
        }

        .right ul li a {
            color: rgb(124, 124, 123);

        }
    </style>
</head>

<body>
    <header>
        <div class="header_top">
            <div class="wrap">
                <div class="logo">
                    <!-- <a href="/shiduPage">
                    <img src="/static/images/logo.a180d.png" />
                </a> -->
                </div>
                <div class="shuru">
                    <input type="text" id="inp">
                    <button>搜索</button>
                </div>
                <div class="right">
                    <ul id="personal" onmouseover="show()" onmouseout="yingcang()">
                        <li style="display: flex; justify-content: space-between;">
                            <img src="images/touxiang.png" alt="">
                            <a href="">aaaaa</a>
                        </li>
                        <li style="text-align:right;line-height: 40px">
                            <a onclick="x_admin_show('编辑','information.html',600,400)" href="javascript:;">修改个人信息</a>
                        </li>
                        <li style="text-align:right;line-height: 40px">
                            <a href="mymoney.html">我的钱包</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="header_bottom">
            <div class="wrap1">
                <ul class="middle">
                    <li id="first"><a href="#">全部分类</a></li>
                    <li><a href="#">排行榜</a></li>
                    <li><a href="#">免费</a></li>
                    <li><a href="#">玄幻仙侠</a></li>
                    <li><a href="#">轻小说</a></li>
                    <li><a href="#">古代</a></li>
                    <li><a href="#">现言</a></li>
                    <li><a href="#">完本</a></li>
                    <li><a href="#">青春</a></li>
                </ul>
            </div>
        </div>


    </header>
    <section>

        <div class="zhanweifu"></div>
        <div class="tuijian">
            <div class="tuijian_top">
                <h3>我的信息</h3>
            </div>
            <div class="context">
                <ul class="neirong">
                    <li>
                        <span>用户名：</span>
                        <span>${reader.readerName}</span>
                    </li>
                    <li>
                        <span>性别：</span>
                        <span>${reader.readerSex}</span>
                    </li>
                    <li>
                        <span>邮箱：</span>
                        <span>${reader.readerEmail}</span>
                    </li>
                    <li>
                        <span>电话：</span>
                        <span>${reader.readerPhone}</span>
                    </li>
                    <li>
                        <span>余额：</span>
                        <span>${reader.balance}</span>
                    </li>
                    <li>
                        <span>注册时间：</span>
                        <span>${reader.readerAddTime}</span>
                    </li>
                </ul>
            </div>
        </div>

    </section>
    <footer>
        <div class="last">
            <ul>
                <li><a href="#">关于我们</a></li>
                <li><a href="#">联系我们</a></li>
                <li><a href="#">帮助中心</a></li>
                <li><a href="#">客服中心</a></li>
                <li><a href="#">加入我们</a></li>
                <li><a href="#">作家专区</a></li>
                <li><a href="#">动漫频道</a></li>
                <li><a href="#">游戏专区</a></li>
            </ul>
        </div>
    </footer>
</body>
<script>
    var personal = document.querySelector("#personal");
    console.dir(personal)
    function show() {
        personal.style = "overflow: visible;"

    }
    function yingcang() {
        personal.style = "overflow: hidden;"
        // console.log(11111)
    }
</script>

</html>