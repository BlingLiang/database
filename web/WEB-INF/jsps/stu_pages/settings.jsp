<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="某某官网">
    <meta name="description" content="某某官网">
    <link href="../static/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../static/css/first-css.css" type="text/css" rel="stylesheet">
    <link href="../static/css/flow-family.css" type="text/css" rel="stylesheet">
    <link href="../static/css/kefu.css" type="text/css" rel="stylesheet">
    <link href="../static/css/login.css" type="text/css" rel="stylesheet">
    <script src="../static/js/jquery-3.1.0.min.js"></script>
    <script src="../static/js/bootstrap.js"></script>
    <script src="../static/js/headerAndFooter.js"></script>
    <script src="../static/js/dynamic.js"></script>
</head>
<body class="bg-eee">
<script>
    function updateMSG() {
        var formData = $("#indexForm").serialize();
        var targetURL = $("#indexForm").attr("action");
        alert(formData);
        alert(targetURL);
        $.ajax({
            type: "post",
            url: targetURL,
            data: formData,
            async: false,
            cache: false,
            dataType: "text",
            success: function (data) {
                if (data === "update success") {
                    alert("修改成功");
                } else {
                    alert("修改失败");
                }
            },
            error: function () {
                alert("服务器错误");
            }

        })
    }
    function updatePSW(){
        var ori_psw = document.getElementsByName("old_pwd")[0].value;
        var new_psw = document.getElementsByName("new_pwd")[0].value;
        var rep_psw = document.getElementsByName("new_pwd_con")[0].value;
        if(new_psw===rep_psw){
            var targetURL = $("#indexForm1").attr("action");
            alert(targetURL);
            $.ajax({
                type:"post",
                url:targetURL,
                data:{"oldPassword": ori_psw, "newPassword":new_psw},
                async: false,
                cache: false,
                dataType:"text",
                success:function(data){
                    if(data==="update success"){
                        alert("修改成功");
                    }else{
                        alert("修改失败");
                    }
                },
                error:function(){
                    alert("服务器错误");
                }
            })
        }
    }

</script>
<!--头部-->
<div id="header" class="bg-fff"></div>



<div class="container over-hide">
    <div class="row pd-t40">
        <div class="col-xs-12 col-sm-2 over-hide bg-fff pd-b50">

            <p class="img-101 text-center"><img src="../static/images/touxiangs.jpg" class="img-circle" alt="头像"
                                                title="我的头像"/></p>
            <br>
            <p class="text-center">王状元</p>

            <ul class="left_menu pd-t20">
                <li onclick="switchItem('personalDetails')" name="radio">
                    <a href="#">基本资料</a>
                </li>
                <li onclick="switchItem('changePassword')" name="radio">
                    <a href="#">修改密码</a>
                </li>
                <li onclick="switchItem('headImage')" name="radio">
                    <a href="#">修改头像</a>
                </li>
            </ul>

        </div><!--col-sm-2 end-->

        <div class="col-xs-12 col-sm-10 pd-xs-l25 mg-xs-t15" id="personalDetails">
            <div class="over-hide bg-fff pd-all-15">
                <h3 class="color-blue2 mg-b25">个人资料</h3>
                <form id="indexForm" action="${pageContext.request.contextPath}/persionInfo/update" method="post">
                    请输入年龄：<label>
                    <input type="text" name="age" class="custom-text" placeholder="请输入年龄"
                           onfocus="this.placeholder=''" onblur="this.placeholder='请输入年龄'">
                </label>

                    <br>
                    请选择性别：
                    <label class="radio-inline">
                        <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="optionsRadiosinline" id="optionsRadios4" value="option2"> 女
                    </label>
                    <br>
                    请输入备注：<label>
                    <input type="text" name="beizhu" class="custom-text" placeholder="请输入备注"
                           onfocus="this.placeholder=''" onblur="this.placeholder='请输入备注'">
                </label>
                    <br>
                    <button type="button" name="submit" class="custom-btn btn-10" onclick="updateMSG()">确认修改</button>
                </form>
            </div>
        </div>

        <div class="col-xs-12 col-sm-10 pd-xs-l25 mg-xs-t15" id="changePassword" style="display: none">
            <div class="over-hide bg-fff pd-all-15">
                <h3 class="color-blue2 mg-b25">修改密码</h3>
                <form id="indexForm1" action="${pageContext.request.contextPath}/persionInfo/updatePSW" method="post">
                    旧密码：<label>
                    <input type="password" name="old_pwd" class="custom-text" placeholder="请输入旧密码"
                           onfocus="this.placeholder=''" onblur="this.placeholder='请输入旧密码'">
                </label>

                    <br>

                    <br>
                    新密码：<label>
                    <input type="text" name="new_pwd" class="custom-text" placeholder="请输入新密码"
                           onfocus="this.placeholder=''" onblur="this.placeholder='请输入新密码'">
                </label>
                    <br>
                    确认新密码：<label>
                    <input type="password" name="new_pwd_con" class="custom-text" placeholder="请确认新密码"
                           onfocus="this.placeholder=''" onblur="this.placeholder='请确认新密码'">
                </label>
                    <br>
                    验证码：<label>
                    <input type="password" name="yanzheng" class="custom-text" placeholder="请输入验证码"
                           onfocus="this.placeholder=''" onblur="this.placeholder='请输入验证码'">
                </label>
                    <img src="../static/images/验证码.jpg" style="height: 50px;width: 100px;">
                    <br>
                    <button type="button" name="submit" class="custom-btn btn-10" onclick="updatePSW()">确认修改</button>
                </form>
            </div>
        </div>

        <div class="col-xs-12 col-sm-10 pd-xs-l25 mg-xs-t15" id="headImage" style="display: none">
            <div norap class="over-hide bg-fff pd-all-15 ">
                <h3 class="color-blue2 mg-b25">修改头像</h3>
                    <img src="../static/images/shopnc.png" width="400vw" height="400vh" style="top:0vh" class="headIMG" alt=""/>
                    <img src="../static/images/lx_1.jpg" width="100vw" height="100vh" class="img-circle" class="headIMG" alt="">
                    <form method="POST" action="https://your.domain.com/upload"  enctype="multipart/form-data" class="headIMG">
                        <input type="file" style="float: left"/>
                        <button type="submit" name="submit" class="custom-btn btn-10 headIMG">确认修改</button>
                    </form>
                </div>
            </div>


            <p></p>
            <ul>

                <div class="clear-both"></div>
            </ul>

        </div><!--over-hide end-->
    </div><!--col-sm-10 end-->



<!--尾部-->   <!--content-first end-->
<div id="footer"></div>

</body>


