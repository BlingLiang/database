
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<title>您好，请登录！</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="static/css/login.css" type="text/css" rel="stylesheet">
<script src="static/js/dynamic.js" type="text/javascript"></script>
<script>
    function submitForm1() {
        var targetURL = $("#indexForm1").attr("action");
        var id = $("#log_id").val();
        var password = $("#log_password").val();
        var type = document.getElementsByName("log_type");
        var typevalue;
        var count;
        for (count = 0; count < type.length; count++) {
            if (type[count].checked) {
                typevalue = type[count].value;
            }
        }
        $.ajax({
            type: "post",
            url: targetURL,
            async: false,
            cache: false,
            data: {"id": id, "password": password, "type": typevalue},
            dataType: "text",
            success: function (data) {
                if(data==="log as student") {
                    window.location.replace("page/turn?target=stu_pages/mainPage");
                }else if(data==="log as teacher"){
                    window.location.replace("page/turn?target=tea_pages/subjects");
                }else{
                    alert("密码错误");
                }
            },
            error: function () {
                alert("服务器出错");
            }
        })
    }

    function submitForm2() {
        var targetURL = $("#indexForm2").attr("action");
        var data = $("#indexForm2").serialize();
        var id = $("#reg_id").val();
        var password = $("#reg_password").val();
        var type = document.getElementsByName("reg_type");
        var typevalue;
        var count;
        for (count = 0; count < type.length; count++) {
            if (type[count].checked) {
                typevalue = type[count].value;
            }
        }
        $.ajax({
            type: "post",
            url: targetURL,
            async: false,
            cache: false,
            data: {"id": id, "password": password, "type": typevalue},
            dataType: "text",
            success: function (data) {
                // alert(data);
                if(data==="register success as student") {
                    window.location.replace("page/turn?target=stu_pages/mainPage");
                }else if(data==="register success as teacher"){
                    window.location.replace("page/turn?target=tea_pages/mainPage");
                }else{
                    alert("密码错误");
                }
            },
            error: function () {
                alert("服务器出错");
            }
        })
    }
</script>
<div class="login_bg">
    <div id="login">
        <div class="login_form">
            <form id="indexForm1" action="${pageContext.request.contextPath}/Log/validate" method="post">
                <p class="form_word"><span class="large-fontsize">登陆</span>/<span
                        onclick="switchLogin('register')"><a style="cursor:pointer">注册</a></span></p>
                <br><br>
                <input type="text" id="log_id" class="custom-text" placeholder="请输入用户名" onfocus="this.placeholder=''"
                       onblur="this.placeholder='请输入用户名'"><br><br>
                <input type="text" id="log_password" class="custom-text" placeholder="密码"
                       onfocus="this.placeholder=''"
                       onblur="this.placeholder='请输入密码'"><br><br>
                student:<input type="radio" name="log_type" value="student"/>
                teacher:<input type="radio" name="log_type" value="teacher"/>

                <button type="button" name="submit" class="custom-btn btn-10" onclick="submitForm1()">
                    点&nbsp&nbsp&nbsp击&nbsp&nbsp&nbsp登&nbsp&nbsp&nbsp陆
                </button>
            </form>
        </div>

    </div>
    <div id="register" style="display: none">
        <div class="login_form">
            <form id="indexForm2" action="${pageContext.request.contextPath}/Log/register" method="post">
                <p class="form_word"><span onclick="switchLogin('login')"> <a style="cursor:pointer"> 登陆</a></span>
                    /<span
                            class="large-fontsize">注册</span></p>
                <br>
                <input type="text" id="reg_id" class="custom-text" placeholder="请输入用户名" onfocus="this.placeholder=''"
                       onblur="this.placeholder='请输入用户名'"><br>
                <input type="text" id="reg_password" class="custom-text" placeholder="请设置您的密码"
                       onfocus="this.placeholder=''" onblur="this.placeholder='请设置您的密码'">
                <input type="text" name="confirmPassword" class="custom-text" placeholder="请确认密码"
                       onfocus="this.placeholder=''" onblur="this.placeholder='请确认密码'"><br><br>
                student:<input type="radio" name="reg_type" value="student"/>
                teacher:<input type="radio" name="reg_type" value="teacher"/>

                <button type="button" name="submit" class="custom-btn btn-10" onclick="submitForm2()">
                    点&nbsp&nbsp&nbsp击&nbsp&nbsp&nbsp注&nbsp&nbsp&nbsp册
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
