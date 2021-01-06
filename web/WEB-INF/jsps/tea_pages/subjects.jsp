<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的课程</title>
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
    <![endif]-->
</head>
<body>
<script>
    $(document).ready(function () {

        $("#container").on("click",".pageTrigger",function(){
            var courseId = $(this).parent().parent().attr("corr_courseID");
            window.location.replace("course?courseId="+courseId);
        })
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

        function appendCourse(CourseName, CourseId) {
            var courseContainer = $("#container");
            var cli = document.createElement("li");
            cli.setAttribute("corr_courseID", CourseId);
            cli.setAttribute("class", "col-xs-12 col-sm-4");
            var cdiv = document.createElement("div");
            cdiv.setAttribute("class", "li-inner");
            var ctitle = document.createElement("p");
            var ci = document.createElement("i");
            ci.setAttribute("class", "color-blue2");
            ctitle.appendChild(ci);
            var bu = document.createElement("button");
            bu.setAttribute("class", "pageTrigger");
            var ch = document.createElement(("h3"));
            ch.innerText = CourseName;
            bu.appendChild(ch);
            cdiv.appendChild(ctitle);
            cdiv.appendChild(bu);
            cli.appendChild(cdiv);
            courseContainer.append(cli);
        }

        var LongStr = $("#container").attr("courses");
        var Courses = sliceLong(LongStr);
        var i = 0;
        for (i = 0; i < Courses.length; i++) {
            appendCourse(Courses[i][2], Courses[i][1].slice(1,-1));
        }
    })
</script>
<!--头部-->
<div id="header"></div>
<div class="header-first">
    <div class="header-top">
        <div class="container">欢迎您的到来！</div>
    </div>
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
<!--身体-->
<div class="container over-hide">
    <div class="row pd-t40">
        <h3 class="title text-center">
            <p class="mg-0"><span class="title-top">我教的课</span></p><br>
        </h3>
        <div class="over-hide">

            <div class="col-xs-12 col-sm-9 ">
                <div class="row">
                    <ul class="ad_li1" id="container" courses = "${courses.toString()}", action="${pageContext.request.contextPath}/Page/course">


                        <div class="clear-both"></div>
                    </ul>
                </div><!--row end-->
            </div><!--col-xs-9 end-->
        </div><!--over-hide end-->

    </div><!--over-hide end-->
</div><!--row end-->
</div><!-- container end-->


<!--尾部-->
<div id="footer"></div>
<div class="go_top" id="go_top" style="display: none;"></div>
<div class="footer-first font12 footer-flow">
    Copyright © 2020 西南财经大学经济信息工程学院 版权所有
</div>
</body>

