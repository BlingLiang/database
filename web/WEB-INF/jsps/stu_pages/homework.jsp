<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <link href="../static/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../static/css/first-css.css" type="text/css" rel="stylesheet">
    <link href="../static/css/flow-family.css" type="text/css" rel="stylesheet">
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <script src="../static/js/jquery-3.1.0.min.js"></script>
    <script src="../static/js/bootstrap.js"></script>
    <script src="../static/js/headerForStu.js"></script>
</head>

<body>
<script>
    $(document).ready(function () {
        $("#container").on("click", ".trigger",function(){
            var workId = $(this).attr("workid");
            window.location.replace("doWork?workId="+workId);
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
            for (i = 0; i < length; i += 3) {
                var course = new Array();
                course[0] = strs[i];
                course[1] = strs[i + 1];
                course[2] = strs[i + 2];
                Courses[count] = course;
                count++;
            }
            return Courses;
        }
        function appendCourse(WorkContext) {
            var courseContainer = $("#container");
            var cli = document.createElement("li");
            cli.setAttribute("class", "col-xs-12 col-sm-4");
            var cdiv = document.createElement("div");
            cdiv.setAttribute("class", "li-inner");
            var ctitle = document.createElement("p");
            var ci = document.createElement("i");
            ci.setAttribute("class","iconfont icon-weixin-copy color-blue2");
            ctitle.appendChild(ci);

            var bu = document.createElement("button");
            bu.setAttribute("class", "trigger");
            bu.setAttribute("workid",WorkContext);
            var ch = document.createElement("h3");
            ch.innerText = WorkContext;
            bu.appendChild(ch);
            cdiv.appendChild(ctitle);
            cdiv.appendChild(bu);
            cli.appendChild(cdiv);
            courseContainer.append(cli);
        }

        var LongStr = $("#container").attr("works");
        var Works = sliceLong(LongStr);
        var i = 0;
        for (i = 0; i < Works.length; i++) {
            appendCourse(Works[i][1].slice(1,-1));
        }

    })
</script>
<div id="header"></div>
<hr>
<div class="content-first clear-both">
    <div class="banner-show over-hide">

    </div>

    <div class="container over-hide">
        <div class="row pd-t40">
            <h3 class="title text-center">
                <p class="mg-0"><span class="title-top">我的作业</span></p>
                <br><br>
            </h3>

            <div class="col-xs-12 col-sm-9 over-hide">
                <div class="row">
                    <ul class="ad_li1" id="container" works="${works.toString()}">


                    </ul>
                </div><!--row end-->
            </div><!--col-xs-9 end-->
        </div><!--over-hide end-->
    </div>
</div>
<!--尾部-->
<div id="footer"></div>
</body>
</html>