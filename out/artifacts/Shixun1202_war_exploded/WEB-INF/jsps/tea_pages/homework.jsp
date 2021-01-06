<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="某某官网">
    <meta name="description" content="某某官网">
    <link href="../static/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../static/css/first-css.css" type="text/css" rel="stylesheet">
    <link href="../static/css/flow-family.css" type="text/css" rel="stylesheet">
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <link href="../static/css/login.css" type="text/css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script src="../static/js/dynamic.js"></script>
    <script src="../static/js/jquery-3.1.0.min.js"></script>
    <script src="../static/js/bootstrap.js"></script>
    <script src="../static/js/headerForTeacher.js"></script>
    <![endif]-->
</head>

<body>
<script>
    $(document).ready(function () {
        $("#createWork").click(function(){
            var data = $("#textArea").val();
            var targetURL = $(this).parent().parent().attr("action");
            $.ajax({
                type: "post",
                url: targetURL,
                async: false,
                cache: false,
                data: {"context":data},
                dataType: "text",
                success: function (data) {
                    alert(data)
                },
                error: function () {
                    alert("服务器出错");
                    window.location.reload();
                }
            })
        })
        $("#workContainer").on("click",".editor",function(){
            // var courseId = $(this).parent().parent().attr("corr_courseID");
            // window.location.replace("course?courseId="+courseId);
            window.location.replace("turn?target=tea_pages/WorkEditor");
        })
        $("#workContainer").on("click",".editTrigger",function(){
            // var courseId = $(this).parent().parent().attr("corr_courseID");
            // window.location.replace("course?courseId="+courseId);
            var name = $(this).attr("workname");
            window.location.replace("homeworkAnalysis?workId="+name);
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
            var Works = new Array();
            for (i = 0; i < length; i += 3) {
                var work = new Array();
                work[0] = strs[i];
                work[1] = strs[i + 1];
                work[2] = strs[i + 2];
                Works[count] = work;
                count++;
            }
            return Works;
        }

        function appendCourse(HomeWorkName) {
            var courseContainer = $("#workContainer");
            var cli = document.createElement("li");
            cli.setAttribute("class", "col-xs-12 col-sm-4");
            var cdiv = document.createElement("div");
            cdiv.setAttribute("class", "li-inner");
            var ctitle = document.createElement("p");
            var ci = document.createElement("i");
            ci.setAttribute("class", "iconfont icon-weixin-copy color-blue2");
            ctitle.appendChild(ci);
            var bu = document.createElement("button");
            bu.setAttribute("workname",HomeWorkName);
            bu.setAttribute("class", "editTrigger");
            var ch = document.createElement(("h3"));
            ch.innerText = HomeWorkName;
            bu.appendChild(ch);
            cdiv.appendChild(ctitle);
            cdiv.appendChild(bu);
            cli.appendChild(cdiv);
            courseContainer.append(cli);
        }

        var LongStr = $("#workContainer").attr("works");
        var Works = sliceLong(LongStr);
        var i = 0;
        for (i = 0; i < Works.length; i++) {
            appendCourse(Works[i][1].slice(1,-1));
        }
    })
</script>
<!--头部-->

<div id="header"></div>
<div class="content-first clear-both">
    <div class="banner-show over-hide">

    </div>

    <div class="container over-hide">
        <div class="row pd-t40">
            <h3 class="title text-center">
                <p class="mg-0"><span class="title-top">发布作业</span></p>
                <br><br>
            </h3>

            <div class="col-xs-12 col-sm-9 over-hide">
                <div class="row">
                    <ul class="ad_li1" id="workContainer" works="${works.toString()}">
                        <li class="col-xs-12 col-sm-4">
                            <div class="li-inner">
                                <p><img src="../static/images/tianjia.svg" alt="添加课程"> </p>
                                <h3><button class="editor">添加作业</button></h3>
                            </div>
                        </li>
                        <div class="clear-both"></div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div id='topCoverDiv' style="display: none;"></div>
<div id='dia' style="display: none;">
    <div >
        <div id="text_box" id="create_Area" action="${pageContext.request.contextPath}/work/insertWork">
            <textarea class="addText" id="textArea"></textarea>
            <button ID="fabu" type="submit" name="submit" class="custom-btn btn-9">确 认 发 布</button>
            <a onclick='test()' style="font-size: 18px;cursor: default;"><button type="button" id="createWork" class="custom-btn btn-9">放 弃 编 辑</button></a>
        </div>
    </div>
</div>
</body>
</html>