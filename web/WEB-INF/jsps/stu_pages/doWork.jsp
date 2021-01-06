<%--
  Created by IntelliJ IDEA.
  User: ChenWenhan
  Date: 2020/12/21
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
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
        function sliceSel(Str) {
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
            for (i = 0; i < length; i += 7) {
                var course = new Array();
                course[0] = strs[i];
                course[1] = strs[i + 1];
                course[2] = strs[i + 2];
                course[3] = strs[i+3];
                course[4] = strs[i + 4];
                course[5] = strs[i + 5];
                course[6] = strs[i + 6];
                Courses[count] = course;
                count++;
            }
            return Courses;
        }
        function sliceJud(Str) {
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
        function sliceSub(Str) {
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
        function appendSelect(title,itema,itemb,itemc,itemd,rank) {
            var Container = $("#container");
            var table = $("<table></table>");
            var line1 = $("<tr><td>"+title+"</td></tr>");
            var line2 = $("<tr></tr>");
            var item_A = $("<td><input type='radio' value='A' name='s"+rank+"'></input>A: <p>"+itema+"</p></td>");
            var item_B = $("<td><input type='radio' value='B' name='s"+rank+"'></input>B: <p>"+itemb+"</p></td>");
            var item_C = $("<td><input type='radio' value='C' name='s"+rank+"'></input>C: <p>"+itemc+"</p></td>");
            var item_D = $("<td><input type='radio' value='D' name='s"+rank+"'></input>D: <p>"+itemd+"</p></td>");
            line2.append(item_A);
            line2.append(item_B);
            line2.append(item_C);
            line2.append(item_D);
            table.append(line1);
            table.append(line2);
            var newLI = $("<li class='sel'></li>");
            newLI.append(table);
            Container.append(newLI);
        }

        function appendJudge(title, rank){
            var Container = $("#container");
            var newLI = $("<li class='jud'></li>");
            var context = $("<p>"+title+"</p>");
            var answer = $("<label><input type='radio' name='j"+rank+"' value='true'>T</label><label><input type='radio' name='j"+rank+"' value='false'>F</label>");
            newLI.append(context);
            newLI.append(answer);
            Container.append(newLI);
        }

        function appendSub(title, rank){
            var Container = $("#container");
            var newLI = $("<li class='sub'></li>");
            var context = $("<p>"+title+"</p>");
            var answer = $("<textarea rows='3' cols='20' class='answer'></textarea>");
            newLI.append(context);
            newLI.append(answer);
            Container.append(newLI);
        }
        var selStr = $("#container").attr("selects");
        var selinfos = sliceSel(selStr);
        var i = 0;
        for (i = 0; i < selinfos.length; i++) {
            appendSelect(selinfos[i][0].slice(1,-1),selinfos[i][1].slice(1),selinfos[i][2],selinfos[i][3],selinfos[i][4].slice(0,-1),i);
        }

        var judStr = $("#container").attr("judges");
        var judinfos = sliceJud(judStr);
        i = 0;
        for (i = 0; i < judinfos.length; i++) {
            if(i == judinfos.length-1){
                appendJudge(judinfos[i][2].slice(1,-4),i);
            }else{
                appendJudge(judinfos[i][2].slice(1,-2),i);
            }
        }

        var subStr = $("#container").attr("subs");
        var subinfos = sliceSub(subStr);
        i = 0;
        for (i = 0; i < subinfos.length; i++) {
            if(i == subinfos.length-1){
                appendSub(subinfos[i][2].slice(1,-4),i);
            }else{
                appendSub(subinfos[i][2].slice(1,-2),i);
            }
        }

        $("#container").on("click",".submitor",function(){
            var selA = new Array();
            var judA = new Array();
            var subA = new Array();
            var sels = $("#container").find(".sel");
            var juds = $("#container").find(".jud");
            var subs = $("#container").find(".sub");
            var i = 0;
            for(i=0;i<sels.length;i++){
                var ss = $(sels[i]);
                var type = ss.find("input");
                var typevalue;
                var count;
                for (count = 0; count < type.length; count++) {
                    if (type[count].checked) {
                        typevalue = type[count].value;
                    }
                }
                selA[i] = typevalue;

            }
            i = 0;
            for(i=0;i<juds.length;i++){
                var ss = $(juds[i]);
                var type = ss.find("input");
                var typevalue;
                var count;
                for (count = 0; count < type.length; count++) {
                    if (type[count].checked) {
                        typevalue = type[count].value;
                    }
                }
                judA[i] = typevalue;
            }
            i = 0;
            for(i=0;i<subs.length;i++){
                var ss = $(subs[i]);
                subA[i] = ss.find(".answer")[0].value;
            }
            var targetURL=$(this).attr("action");
            var workName = $("#container").attr("workId");


            $.ajax({
                type: "post",
                url: targetURL,
                async: false,
                cache: false,
                data: {"selA": selA, "judA": judA, "subA": subA, "workName":workName},
                dataType: "text",
                traditional: true,
                success: function (data) {
                    alert(data)
                },
                error: function () {
                    alert("服务器出错");
                }
            })
        })
    })
</script>

<div id="header"></div>

<ul id="container" selects="${selects}" judges="${judges}" subs="${subs}" workId="${workid}">
    <li><button class='submitor' action="${pageContext.request.contextPath}/page/postHomeWork">提交</button></li>
</ul>
</body>
</html>
