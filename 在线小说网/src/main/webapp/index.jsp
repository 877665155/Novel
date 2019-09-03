<%--<%@page contentType="text/html; charset=utf-8" language="java" %>--%>
<%--&lt;%&ndash;jsp 动作标签 => 转发&ndash;%&gt;--%>
<%--<jsp:forward page="/index"/>--%>
<%@page contentType="text/html; charset=utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<%--<jsp:forward page="/book/getByType?bookType=1"/>--%>
<head>
    <title>Title</title>
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
            margin-top:20px;
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
            width: 100px;
            height: 40px;
            margin-top:5px;
            text-align: center;
            border-radius: 5px;
            background-color: rgb(187, 175, 175);
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
            background-color:rgb(255, 245, 245);
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
            width: 960px;
            height: 300px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;

        }

        .neirong li {
            width: 300px;
            float: left;
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
        .shuru{
            width: 400px;
            height: 50px;
            float: left;
            margin-left: 100px;
        }
        #inp{
            outline: none;
            padding: 0 15px;
        }
        .shuru input{
            float: left;
            width: 300px;
            height: 40px;
            margin-top: 5px;
            border-radius: 20px;
            border:1px solid red;
        }
        .shuru button{
            width: 50px;
            height: 35px;
            margin-top: 8px;
            margin-left: 5px;
            background-color: red;
            border-radius: 5px;
            border: none;
            float:left;
        }
        .logo{
            float: left;
        }
        .logo a{
            display: block;
            width: 190px;
            height:60px;
        }
        .logo a img{
            width: 190px;
            height:60px;
        }
    </style>
</head>

<body>
<header>
    <div class="header_top">
        <div class="wrap">
            <div class="logo">
                <%--<a href="/shiduPage">--%>
                    <%--<img src="/static/images/logo.a180d.png" />--%>
                <%--</a>--%>
            </div>
            <div class="shuru">
                <input type="text" id="inp" >
                <button>搜索</button>
            </div>
            <div class="right">
                <a href="/loginPage" class="login">登录</a>
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
            <h3>编辑强推</h3>
        </div>
        <div class="context">
            <ul class="neirong">
                <li>
                    <div class="tupian"><a href="/novelPage"><img src="/static/images/4.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>婚途脉脉</h5>
                        <p>宁城人尽皆知，秦家独子秦遇时生性凉薄，不近女色。</p>
                        <p>帝业</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="/novelPage"><img src="/static/images/90.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>他来时有星光</h5>
                        <p>冷艳毒舌女明星VS铁血硬汉男警察每个人都有自己的罪</p>
                        <p>北风未眠</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/90%20(1).jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>你如星辰入梦来</h5>
                        <p>他是风头正盛的顶级偶像；她是初出茅庐的小透明编</p>
                        <p>小心</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/90.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>他来时有星光</h5>
                        <p>冷艳毒舌女明星VS铁血硬汉男警察每个人都有自己的罪</p>
                        <p>北风未眠</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/2.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>他的小九九</h5>
                        <p>我的身体里流淌着罪恶的鲜血，可我的灵魂却永远向往</p>
                        <p>雨果果</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/3.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>空降男神</h5>
                        <p>陆总不过是遛遛狗，竟然被小奶包缠上了，还诱来了国</p>
                        <p>19</p>
                    </div>
                </li>


            </ul>
        </div>
    </div>
    <div class="tuijian">
        <div class="tuijian_top">
            <h3>人气完本</h3>
        </div>
        <div class="context">
            <ul class="neirong">
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/5.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>原来你暗恋我啊</h5>
                        <p>四岁的陆西泽见到刚出生的楚瑶，嫌弃：“真丑。”</p>
                        <p>小飞</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/6.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>卦妃天下</h5>
                        <p>本文已由悦读纪出版，出版名《盛世繁华为君倾》，当</p>
                        <p>烟花</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/7.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>来自星河的妖狐</h5>
                        <p>1V1强强联手，盛宠无双，顾酒，畅销女漫画家，</p>
                        <p>别离</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/8.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5锦鲤</h5>
                        <p>温乔穿越了，从末世穿越到现代，不仅如此，她的空间</p>
                        <p>北风</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/9.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>限时密爱</h5>
                        <p>（正文已结局，番外进行时）1v1双洁。他是北城最</p>
                        <p>小苏苏</p>
                    </div>
                </li>
                <li>
                    <div class="tupian"><a href="#"><img src="/static/images/10.jpg" alt=""></a></div>
                    <div class="wenzi">
                        <h5>皇妃</h5>
                        <p>穿来清朝，温馨基本上就绝望了！在这个清穿多如狗</p>
                        <p>未眠</p>
                    </div>
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

</html>