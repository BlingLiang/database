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
    <script src="../static/js/jquery-3.1.0.min.js"></script>
    <script src="../static/js/bootstrap.js"></script>
    <script src="../static/js/headerForTeacher.js"></script>
</head>
<body>
<script>
    $(document).ready(function(){
        function sliceLong(Str) {
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

        $("#body").on("click", ".trigger",function(){
            var stuId = $(this).parent().prev().prev().text();
            window.location.replace("OnehomeworkAnalysis?stuId="+stuId);
        })
        function appendLine(name, id, score,info){
            if(info==="未提交" || info===" 未提交") {
                var line = $("<tr><td>" + name + "</td><td class='stuId'>" + id + "</td><td>" + score + "</td><td>" + info + "</td></tr>");
                $("#body").append(line);
            }else{
                var line = $("<tr><td>" + name + "</td><td class='stuId'>" + id + "</td><td>" + score + "</td><td><button class='trigger' >详情</button></td></tr>");
                $("#body").append(line);
            }

        }
        var names = $("#body").attr("names");
        var ids = $("#body").attr("ids");
        var scores = $("#body").attr("scores");
        var infos = $("#body").attr("infos")
        namess = names.slice(1,-1).split(",");
        idss = ids.slice(1,-1).split(",");
        scoress = scores.slice(1,-1).split(",");
        infoss = infos.slice(1,-1).split(",");
        var size = namess.length;
        var i = 0;
        for(i = 0; i<size; i++){
            appendLine(namess[i],idss[i],scoress[i],infoss[i]);
        }

    })
</script>
<div id="header"></div>
<div class="container over-hide">

    <div class="row pd-t40">
        <h3 class="title text-center">
            <p class="mg-0"><span class="title-top">作业详情</span></p>
            <br><br>
        </h3>

        <div class="col-xs-12 col-sm-10 pd-xs-l25 mg-xs-t15" id="headImage">
            <div norap class="over-hide bg-fff pd-all-15 ">
                <h3 class="color-blue2 mg-b25">详情</h3>

                <form method="POST" action="https://your.domain.com/upload" enctype="multipart/form-data"
                      class="headIMG">
                    <button type="submit" name="submit" class="custom-btn btn-10 headIMG" style="float: right">确认上传
                    </button>
                    <input type="file" style="float:right"/>

                </form>

                <table class="table">
                    <caption></caption>
                    <thead>
                    <tr>

                        <th>学号</th>
                        <th>姓名</th>
                        <th>分数</th>
                        <th>详情</th>
                    </tr>
                    </thead>
                    <tbody names="${names}" ids="${ids}" scores="${scores}" infos = "${info}" id="body">

                    </tbody>
                </table>
            </div>
        </div>


    </div><!--over-hide end-->
</div>
</body>
</html>