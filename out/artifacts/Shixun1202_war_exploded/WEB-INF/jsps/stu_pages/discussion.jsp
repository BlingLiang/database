<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>关于我们</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="某某官网">
    <meta name="description" content="某某官网">
    <link href="../static/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../static/css/first-css.css" type="text/css" rel="stylesheet">
    <link href="../static/css/flow-family.css" type="text/css" rel="stylesheet">
    <link href="../static/css/login.css" type="text/css" rel="stylesheet">
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <script src="../static/js/jquery-3.1.0.min.js"></script>
    <script src="../static/js/discussion.js"></script>
    <script src="../static/js/headerForStu.js"></script>
</head>

<body>        <!--头部-->
<div id="header"></div>

<!--身体-->
<hr>
<div class="textbox row pd-t10">
    <h3 class="title text-center">
        <p class="mg-0"><span class="title-top">欢迎来到讨论区，一个思想碰撞的地方！</span></p>
        <br><br>
    </h3>
    <div class="message_box" id="messageBox"></div>
    <input id="myInput" type="text" placeholder="请输入留言类容"/><br>
    <button class="custom-btn btn-10" id="doPost">提交</button>
</div>


<!--尾部-->
<div id="footer"></div>

</body>
