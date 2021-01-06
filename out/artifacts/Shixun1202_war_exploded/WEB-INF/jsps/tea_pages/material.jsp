<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>资料</title>
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
    <script src="../static/js/headerForTeacher.js"></script>
    <script src="../static/js/dynamic.js"></script>
</head>
<body>
<div id="header"></div>
<div class="container over-hide">
    <div class="row pd-t40">
        <h3 class="title text-center">
            <p class="mg-0"><span class="title-top">课程资料</span></p>
            <br><br>
        </h3>

        <div class="col-xs-12 col-sm-10 pd-xs-l25 mg-xs-t15" id="headImage">
            <div norap class="over-hide bg-fff pd-all-15 ">
                <h3 class="color-blue2 mg-b25">资料上传</h3>

                <form class="headIMG">
                    <button type="submit" name="submit" class="custom-btn btn-10 headIMG" style="float: right"
                            onclick="document.getElementById('upload').style.display=''" onmouseup="document.getElementById('upload').style.display=''">确认上传
                    </button>

                    <input type="file" style="float:right"/>

                </form>
                <div id="upload" style="display:none">
                <table class="table">
                    <caption></caption>
                    <thead>
                    <tr>

                        <th>序号</th>
                        <th>文件名</th>
                        <th>大小</th>
                        <th>创建日期</th>
                    </tr>
                    </thead>

                        <tbody>

                        <tr>
                            <td>01</td>
                            <td>恋爱学导论.pdf</td>
                            <td>184kb</td>
                            <td>2020.12.22</td>
                        </tr>


                        </tbody>

                </table>
                </div>
            </div>
        </div>


    </div><!--over-hide end-->
</div>
</body>
