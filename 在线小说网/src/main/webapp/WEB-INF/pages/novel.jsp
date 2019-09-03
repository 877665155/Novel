<%@ page import="com.xh.pojo.Reader" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>novel</title>
    <link rel="stylesheet" href="/static/css/novel.css">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <style>
        .header_bottom {
            width: 100%;
            height: 50px;
            margin-top: 20px;
            background-color: red;
        }
        .middle {
            width: 100%;
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
        .wrap1 {
            width: 1000px;
            height: 100px;
            margin-left: auto;
            margin-right: auto;
        }
        header .public ul {
            width: 100%;
            background: none;
        }
    </style>
</head>

<body>
    <header>
        <div class="public">
            <div class="logoTo">
                <div class="logoTo_left">
                    <%--<a href="/shiduPage">--%>
                        <%--<img src="/static/images/logo.a180d.png" />--%>
                    <%--</a>--%>
                </div>
                <div class="logoTo_right">
                    <div class="logoTo_right_sou">
                        <input type="text" value="农女福妃别太甜" />
                        <span></span>
                    </div>
                </div>

            </div>
            <div class="header_bottom">
                <div class="wrap1">
                    <ul class="middle">
                        <li id="first"><a href="${pageContext.request.contextPath}/book/getByType?bookType=1">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=1">排行榜</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=1">免费</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=2">玄幻仙侠</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=3">轻小说</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=4">古代</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=5">现言</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=6">完本</a></li>
                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=7">青春</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <section>
        <div class="daohang">
            <a href="">首页&gt;</a>
            <a href="">现代言情&gt;</a>
            <a href="">婚恋情缘&gt;</a>
            <a href="">婚途脉脉</a>
        </div>
        <div class="bookintro">
            <div class="bookImg">
                <img src="${book.bookDetail.picAddress}" alt="">
            </div>
            <div class="introRight clearfix">
                <h1>${book.bookName}</h1><span>${book.author1.authorName} 著</span>
                <ul class="clearfix">
                    <li>
                        <c:if test="${book.bookType==1}">
                            免费
                        </c:if>
                        <c:if test="${book.bookType==2}">
                            玄幻仙侠
                        </c:if>
                        <c:if test="${book.bookType==3}">
                            轻小说
                        </c:if>
                        <c:if test="${book.bookType==4}">
                            古代
                        </c:if>
                        <c:if test="${book.bookType==5}">
                            现言
                        </c:if>
                        <c:if test="${book.bookType==6}">
                            完本
                        </c:if>
                        <c:if test="${book.bookType==7}">
                            青春
                        </c:if>
                    </li>
                </ul>
                <p>${book.bookDetail.bookBref}
                </p>
                <button><a href="${pageContext.request.contextPath}/shiduPage?bookId=${book.bookId}&page=1">免费试读</a></button>
                <button onclick="x_admin_show('立即购买','${pageContext.request.contextPath}/bookOrder/toOrder?bookId=${book.bookId}',600,400)">立即购买</button>
            </div>
        </div>
        <div class="bookInfo clearfix">
            <div class="infoHeader">
                <h2 class="firstHeader">作品信息</h2>
                <%--<span><a href="">更新至 第262章 抱歉，我刚才凶你了 16小时前</a></span>--%>
            </div>
            <!-- -----------------------------------------作者信息 --------------------------------------------- -->
            <div class="infoleft clearfix">
                <div class="author">
                    <a href=""><img src="/static/images/59b392dc51c9b.jpeg" alt=""></a>
                    <span>${book.author1.authorName}</span>
                </div>
                <div class="content clearfix">
                    <div class="clearfix">
                        <h2><a href="">签约作者 ${book.author1.authorFeature}</a></h2>
                        <div class="replay">
                            <img src="/static/images/strategy_dialogue.png" alt="">
                            <span>120</span>
                            <img src="/static/images/strategy_heart.png" alt="">
                            <span>200</span>
                        </div>
                    </div>
                    <ul class="info clearfix">
                        <li>作品总数 5</li>
                        <li>累计字数 438.03万</li>
                        <li>创作天数 875</li>
                    </ul>
                    <p>从灵感到创作，花费不过半月时间，笛爷除此之外还有极多其他优秀作品，若你刚好也感兴趣，那就点击下方图片吧...</p>
                    <ul class="journalImg clearfix">
                        <li><img src="/static/images/90.jpg" alt=""></li>
                        <li><img src="/static/images/90 (1).jpg" alt=""></li>
                        <li><img src="/static/images/90.jpg" alt=""></li>
                        <li><img src="/static/images/90 (1).jpg" alt=""></li>
                    </ul>
                    <span class="imgCount1">共14张</span>
                    
                    
                </div>
                <img src="/static/images/bg.jpg" alt="" class="bgImg">
                <div class="pingjia" style="padding:10px;">
                        <h2>作品讨论区</h2>

                    <c:forEach items="${messageList}" var="message">
                        <div style="display: flex;justify-content: flex-start;align-items: center;background: lightgrey;margin-bottom: 10px;">
                            <div><img src="/static/images/account.1e031.png" alt="" style="width: 36px;">

                                <p>用户</p>
                            </div>
                            <p style="margin-left: 20px;">${message.messageContent}</p>
                        </div>
                    </c:forEach>

                   <%-- <div style="display: flex;justify-content: flex-start;align-items: center;background: lightgrey;margin-bottom: 10px;">
                        <div><img src="/static/images/account.1e031.png" alt="" style="width: 36px;">
                            <p >renanan</p>
                        </div>

                        <p style="margin-left: 20px;">好看</p>
                    </div>
                    <div style="display: flex;justify-content: flex-start;align-items: center;background: lightgrey;margin-bottom: 10px;">
                        <div><img src="/static/images/account.1e031.png" alt="" style="width: 36px;">
                            <p >renanan</p>
                        </div>

                        <p style="margin-left: 20px;">好看</p>
                    </div>--%>

                        <div>
                            <form action="${pageContext.request.contextPath}/message/add" method="post" style="display: flex;justify-content: space-around;">
                                <input type="text" name="bookId" value="${book.bookId}" style="display: none">
                                <input type="text" name="messageContent" placeholder="请输入留言"><button class="layui-btn" type="submit">发布留言</button>
                            </form>
                        </div>
                    </div>
            </div>
            <!-- -----------------------------------------右边-------------------------------------- -->
            <div class="journalContent_right">
                <div class="journalClassification">
                    <div class="journalClassificationheader">
                        <img src="/static/images/strategy_label.png" alt="">
                        <h2>热门分类</h2>
                    </div>
                    <ul class="journalClassification1">
                        <li><img src="/static/images/strategy_point.png" alt="">现代言情</li>
                        <li><img src="/static/images/strategy_point.png" alt="">古代言情</li>
                        <li><img src="/static/images/strategy_point.png" alt="">浪漫青春</li>
                        <li><img src="/static/images/strategy_point.png" alt="">玄幻言情</li>
                    </ul>
                    <ul class="journalClassification2">
                        <li><img src="/static/images/strategy_point.png" alt="">仙侠奇缘</li>
                        <li><img src="/static/images/strategy_point.png" alt="">悬疑灵异</li>
                    </ul>
                    <ul class="journalClassification3">
                        <li><img src="/static/images/strategy_point.png" alt="">科幻空间</li>
                        <li><img src="/static/images/strategy_point.png" alt="">游戏竞技</li>
                    </ul>
                    <ul class="journalClassification4">
                        <li><img src="/static/images/strategy_point.png" alt="">短篇小说</li>
                        <li><img src="/static/images/strategy_point.png" alt="">轻小说</li>
                    </ul>
                </div>
                <div class="journalRanking">
                    <div class="rankingHeader">
                        <img src="/static/images/strategy_star.png" alt="">
                        <h2>达人榜</h2>
                    </div>
                    <ul class="clearfix">
                        <li>
                            <img src="/static/images/strategy_userhead1.png" alt="">
                            <div class="userInfo">
                                <h3>萌萌</h3>
                                <p>月贡献度：3600</p>
                            </div>
                        </li>
                        <li>
                            <img src="/static/images/strategy_userhead1.png" alt="">
                            <div class="userInfo">
                                <h3>萌萌</h3>
                                <p>月贡献度：3600</p>
                            </div>
                        </li>
                        <li>
                            <img src="/static/images/strategy_userhead1.png" alt="">
                            <div class="userInfo">
                                <h3>萌萌</h3>
                                <p>月贡献度：3600</p>
                            </div>
                        </li>
                        <li>
                            <img src="/static/images/strategy_userhead1.png" alt="">
                            <div class="userInfo">
                                <h3>萌萌</h3>
                                <p>月贡献度：3600</p>
                            </div>
                        </li>
                        <li>
                            <img src="/static/images/strategy_userhead1.png" alt="">
                            <div class="userInfo">
                                <h3>萌萌</h3>
                                <p>月贡献度：3600</p>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>


    </section>
</body>

</html>