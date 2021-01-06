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
    <script src="../static/js/headerAndFooter.js"></script>
    <![endif]-->
</head>
<body>
<script>
    $(document).ready(function () {
        $("#container").on("click", ".trigger",function(){
            var courseId = $(this).attr("courseid");
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

        function appendCourse(CourseId, CourseName) {
            var courseContainer = $("#container");
            var cli = document.createElement("li");
            cli.setAttribute("class", "col-xs-12 col-sm-4");
            var cdiv = document.createElement("div");
            cdiv.setAttribute("class", "li-inner");
            var ctitle = document.createElement("p");
            var ci = document.createElement("i");
            ci.setAttribute("class", "color-blue2");
            ctitle.appendChild(ci);

            var bu = document.createElement("button");
            bu.setAttribute("courseid",CourseId);
            bu.setAttribute("class", "trigger");
            var ch = document.createElement("h3");
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
            appendCourse(Courses[i][1].slice(1,-1), Courses[i][2]);
        }

    })
</script>
<!--头部-->
<div id="header"></div>

<!--身体-->
<hr>

<div class="container over-hide">
    <div class="row pd-t40">
        <h3 class="title text-center">
            <p class="mg-0"><span class="title-top">我的课程</span></p><br>
        </h3>
        <div class="over-hide">
            <div class="col-xs-12 col-sm-9 ">
                <div class="row">
                    <ul class="ad_li1" id="container" courses="${courses.toString()}">

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

</body>

