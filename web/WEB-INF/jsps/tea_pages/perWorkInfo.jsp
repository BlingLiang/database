<%--
  Created by IntelliJ IDEA.
  User: ChenWenhan
  Date: 2020/12/22
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
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
        var container = $("#container");
        // var selA = container.attr("selA").slice(1,-1).split(",");
        // var judA = container.attr("judA").slice(1,-1).split(",");
        var subA = container.attr("subA").slice(1,-1).split(",");
        var newLine = $("<li>选择题: "+container.attr("selA").slice(1,-1)+"</li>");
        var newLine2 = $("<li>判断题: "+container.attr("judA").slice(1,-1)+"</li>");
        container.append(newLine);
        container.append($("<hr>"));
        container.append(newLine2);
        container.append($("<hr>"));
        var size = subA.length;
        var i = 0;
        container.append($("<li>主观题</li>"));
        for(i = 0; i<size; i++){
            container.append($("<li>"+subA[i]+" 得分:<input type='text' class='getscore'></input></li>"));
            container.append($("<hr>"));

        }

        $("#container").on("click", ".submitScore", function(){
            var data = $("#container").find(".getscore");
            var size = data.length;
            var scores = new Array();
            var i = 0;
            for(i = 0;i<size; i++){
                scores[i] = $(data[i]).val();
            }

            var targetURL =$("#container").attr("action");
            $.ajax({
                type: "post",
                url: targetURL,
                async: false,
                cache: false,
                data: {"scores":scores},
                dataType: "text",
                traditional:true,
                success: function (data) {
                    alert(data)
                },
                error: function () {
                    alert("服务器出错");
                    window.location.reload();
                }
            })
        })
        container.append($("<li><button class='submitScore'>提交</button></li>"));
    })
</script>
<div id="header"></div>
<br><br><br><br>

<ul id="container" selA="${selA}" judA="${judA}" subA="${subA}" action="${pageContext.request.contextPath}/page/updateScore"></ul>
</body>
</html>
