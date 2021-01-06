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
                <!--                <iframe style="display:none" onload="onFrameLoad()"-->
                <!--                        id="uploadtarget" name="uploadtarget"></iframe>-->
                <table class="table">
                    <caption></caption>
                    <thead>
                    <tr>

                        <th>学号</th>
                        <th>姓名</th>
                        <th>分数</th>
                        <th>提交时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="../teacher_html/perHomeworkAnalysis.html">1</a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>


    </div><!--over-hide end-->
</div>

</body>
</html>