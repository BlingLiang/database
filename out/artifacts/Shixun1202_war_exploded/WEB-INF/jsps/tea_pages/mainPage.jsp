<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主页</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="某某官网">
    <meta name="description" content="某某官网">
    <link href="../static/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../static/css/first-css.css" type="text/css" rel="stylesheet">
    <link href="../static/css/flow-family.css" type="text/css" rel="stylesheet">
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script src="../static/js/jquery-3.1.0.min.js"></script>
    <script src="../static/js/bootstrap.js"></script>
    <script src="../static/js/CourseSlicer.js"></script>
<%--    <script src="../static/js/headerAndFooter.js"></script>--%>
    <![endif]-->
</head>
<body>
<script>
    $(document).ready(function(){
        function sliceLong(Str) {
            var size = Str.length;
            Str = Str.substring(1, size);
            strs = Str.split(",");
            var length = strs.length;
            var i = 0;
            for (i = 0; i < length; i++) {
                var position = strs[i].indexOf("=");
                strs[i] = strs[i].substr(position + 1);
            }
            var count = 0;
            var Courses = new Array();
            for (i = 0; i < length; i += 5) {
                var course = new Array();
                course[0] = strs[i];
                course[1] = strs[i + 1];
                course[2] = strs[i + 2];
                course[3] = strs[i + 3];
                course[4] = strs[i + 4];
                Courses[count] = course;
                count++;
            }
            return Courses;
        }

        function appendCourse(CourseName) {
            var coursePics = $("#pics");
            var cli = document.createElement("li");
            cli.setAttribute("class", "col-xs-6 col-sm-3");
            var cdiv = document.createElement("div");
            cdiv.setAttribute("class", "li-inner img-101");
            var ctitle = document.createElement("p");
            var cimg = document.createElement("img");
            cimg.setAttribute("src","images/ad_0.jpg");
            ctitle.innerText = CourseName;
            cdiv.appendChild(cimg);
            cdiv.appendChild(ctitle);
            cli.appendChild(cdiv);
            coursePics.append(cli);
        }
        var LongStr = $("#pics").attr("courses");
        var Courses = sliceLong(LongStr);
        var i = 0;
        for(i = 0; i<Courses.length;i++){
            appendCourse(Courses[i][2]);
        }

    })
</script>
<!--头部-->
<div id="header"></div>

<div class="header-first"><div class="header-top"><div class="container">欢迎您的到来！</div></div>
    <div class="container" style="height:80px; line-height:76px; position:relative;">
        <div class="row">
            <div class="nav-top" id="nav_top">
                <span class="nav-btn">导航</span>
                <ul class="toolbar">
                    <li><a href="turn?target=tea_pages/subjects">我的课程</a></li>
<%--                    <li><a href="../teacher_html/information_stu">收件箱</a></li>--%>
                    <li><a href="turn?target=tea_pages/settings">个人中心</a></li>
                </ul>
            </div>
            <div class="logo"><img src="../static/images/logo.png" height="90vh" alt="官网logo" title=""></div>
            <hr>
        </div>
    </div>
</div>
<div class="content-first clear-both">
    <div class="banner-show over-hide">
        <div id="myCarousel" class="carousel slide pos-r">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active">
                    <a href="#"><img src="../static/images/学霸锦鲤.png" alt="官网" title="官网"></a>
                </div>
                <div class="item">
                    <a href="#"><img src="../static/images/熊孩子们开学了.png" alt="官网" title="官网"></a>
                </div>
                <div class="item">
                    <a href="#"><img src="../static/images/在家学习.jpg" alt="官网" title="官网"></a>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="carousel-control left" style="background-image:none;" href="#myCarousel"
               data-slide="prev"><span class="nav-aleft">&lsaquo;</span></a>
            <a class="carousel-control right" style="background-image:none;" href="#myCarousel"
               data-slide="next"><span class="nav-aleft">&rsaquo;</span></a>

        </div>
    </div>


    <div class="content-first bg-bannerb mg-t50 pd-t40 pd-b40">
        <div class="container">
            <div class="row">
                <h3 class="title text-center">
                    <p class="mg-0"><span class="title-top"
                                          style="color:#fff; border-bottom:3px solid #fff;">
                        <button onclick="window.location.replace('turn?target=tea_pages/create_subject')">开设课程</button></span>
                    </p>
                </h3>
                <ul class="ad_li80 mg-t30" courses = "${courses.toString()}" id="pics">
                </ul>
            </div><!--row end-->
        </div><!-- container end-->
    </div><!--content-first end-->

    <!--尾部-->
    <div id="footer"></div>
    <div class="go_top" id="go_top" style="display: none;"></div>
    <div class="footer-first font12 footer-flow">
        Copyright © 2020 西南财经大学经济信息工程学院 版权所有
    </div>

</div>
</body>



