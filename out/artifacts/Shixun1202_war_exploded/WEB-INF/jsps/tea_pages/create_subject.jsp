<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../static/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../static/css/first-css.css" type="text/css" rel="stylesheet">
    <link href="../static/css/flow-family.css" type="text/css" rel="stylesheet">
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../static/css/login.css" type="text/css" rel="stylesheet">
    <script src="../static/js/dynamic.js"></script>
<%--    <script src="../static/js/headerAndFooter.js"></script>--%>
    <title>创建课程</title>"
</head>
<script>
    $(document).ready(function(){

        $("#trigger").click(function(){
            var data = $("#inputCourseId").val();
            var targetURL = $("#indexForm").attr("action");
            $.ajax({
                type: "post",
                url: targetURL,
                async: false,
                cache: false,
                data: {"CourseId":data},
                dataType: "text",
                success: function (data) {
                    alert(data);
                },
                error: function () {
                    alert("服务器出错");
                }
            })
        })

    })
</script>
    <body>		<!--头部-->
        <div id="header"></div>
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
        <!--身体-->
        <div class="content-first clear-both">
            <div class="banner-show banner-show-2 over-hide">
                   <img src="../static/images/banner_aboutUs.jpg" alt="关于我们" title="关于我们">
            </div><!--banner-->
        
            <div class="container over-hide mg-t50 pd-b50">
            	<div class="row">
                    <hr style="width:150px; margin-left:120px; border-top:5px solid #00aeef;" class="mg-t20 mg-b20"/>
						<div class="article-main pd-l100">
                            <h4 class="media-heading font-bold mg-b15">创建课程</h4>
                            <div class="col-xs-12 col-sm-10 pd-xs-l25 mg-xs-t15" id="personalDetails">
                                <div class="over-hide bg-fff pd-all-15">
<!--                                    <h3 class="color-blue2 mg-b25">个人资料</h3>-->
                                    <form id="indexForm" action="${pageContext.request.contextPath}/Class/createTable" method="post">
                                        课程ID：&nbsp;&nbsp;<label>
                                        <input id="inputCourseId"type="text" name="age" class="custom-text" placeholder="请输入课程ID"
                                               onfocus="this.placeholder=''" onblur="this.placeholder='请输入课程ID'">
<%--                                    </label>--%>

<%--                                        <br>--%>

<%--                                        教师：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>--%>
<%--                                        <input type="text" name="age" class="custom-text" placeholder="请输入教师姓名"--%>
<%--                                               onfocus="this.placeholder=''" onblur="this.placeholder='请输入教师姓名'">--%>
<%--                                    </label>--%>

<%--                                        <br>--%>
<%--                                        请输入备注：<label>--%>
<%--                                        <input type="text" name="beizhu" class="custom-text" placeholder="请输入备注"--%>
<%--                                               onfocus="this.placeholder=''" onblur="this.placeholder='请输入备注'">--%>
<%--                                    </label>--%>
<%--                                        <br>--%>
                                        <button type="button" id="trigger" name="submit" class="custom-btn btn-10">确认提交</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    
                </div><!--row end-->
            </div><!--container end-->
        </div><!--content-first end-->
        
        <!--尾部-->        

    </body>

