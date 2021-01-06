<%--
  Created by IntelliJ IDEA.
  User: ChenWenhan
  Date: 2020/12/21
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>编辑</title>
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
    <![endif]-->
</head>
<body>
<script>
    $(document).ready(function(){
        $("#rootContainer").on("click",".editTrigger", function(){
            var bu = $(this);
            var context = $(this).parent().prev().find("p");
            if(bu.text()==="修改"){
                bu.text("确定");
                var value = context.text();
                var inputBox = $("<input type='text'></input>");
                inputBox.val(value);
                context.text("");
                context.append(inputBox);
            }else{
                bu.text("修改");
                var value = context.find("input").val();
                context.remove("input");
                context.text(value);
            }
        })

        $("#rootContainer").on("click", ".addSelect",function(){
            var root = $("#rootContainer");
            var box = $("<div class='select'></div>")
            var table = $("<table></table>");
            var titleLine = $("<tr></tr>")
            var title = $("<td><p class='editable'>选择题题目</p></td>");

            var selectAnswer = $("<td><select class='answer'>"+
                "<option value ='A'>A</option>"+
                "<option value ='B'>B</option>"+
                "<option value ='C'>C</option>"+
                "<option value ='D'>D</option>"+
                "</select></td>");
            var score = $("<td><p>分数: <p><input class='score' type=text></input></td>");
            titleLine.append(title);
            titleLine.append($("<td><button class='editTrigger'>修改</button></td>"));
            titleLine.append($("<td>答案: </td>"));
            titleLine.append(selectAnswer);
            titleLine.append(score);
            var Aline = $("<tr></tr>");
            var selectItemA = $("<td><p>A: </p><td>");
            var ItemA = $("<td><p class='editable'>选项A</p></td>")
            Aline.append(selectItemA);
            Aline.append(ItemA);
            Aline.append($("<td><button class='editTrigger'>修改</button></td>"));
            var Bline = $("<tr></tr>");
            var selectItemB = $("<td><p>B: </p><td>");
            var ItemB = $("<td><p class='editable'>选项B</p></td>")
            Bline.append(selectItemB);
            Bline.append(ItemB);
            Bline.append($("<td><button class='editTrigger'>修改</button></td>"));
            var Cline = $("<tr></tr>");
            var selectItemC = $("<td><p>C: </p><td>");
            var ItemC = $("<td><p class='editable'>选项C</p></td>")
            Cline.append(selectItemC);
            Cline.append(ItemC);
            Cline.append($("<td><button class='editTrigger'>修改</button></td>"));
            var Dline = $("<tr></tr>");
            var selectItemD = $("<td><p>D: </p><td>");
            var ItemD = $("<td><p class='editable'>选项D</p></td>")
            Dline.append(selectItemD);
            Dline.append(ItemD);
            Dline.append($("<td><button class='editTrigger'>修改</button></td>"));
            table.append(titleLine);
            table.append(Aline);
            table.append(Bline);
            table.append(Cline);
            table.append(Dline);
            box.append(table);
            root.append(box);
            root.append($("<hr>"));
        })

        $("#rootContainer").on("click", ".addJudge",function(){
            var button = $("<div><button class='editTrigger'>修改</button></div>");
            var cbox = $("<div></div>");
            var context = $("<p class='editable'></p>");
            context.text("判断题题目");
            cbox.append(context);
            var num = parseInt($("#rootContainer").attr("num"));
            num++;
            $("#rootContainer").attr("num",num.toString());
            var answer = $("<label><input type='radio' name='"+num+"' value='true'>T</label><label><input type='radio' name='"+num+"' value='false'>F</label>");
            var root = $("#rootContainer");
            var box = $("<div class='judge'></div>");
            var score = $("<div><p>分数: <p><input class='score' type=text></input></div>");
            box.append(cbox);
            box.append(button);
            box.append(answer);
            box.append(score);
            root.append(box);
            root.append($("<hr>"));
        })

        $("#rootContainer").on("click", ".addSub",function(){
            var sub = $("<div class='sub'></div>");
            var context = $("<p class='editable'></p>");
            context.text("主观题题干");
            var cbox = $("<div></div>");
            cbox.append(context);
            var bbox = $("<div><button class='editTrigger'>修改</button></div>");
            var area = $("<textarea rows='3' cols='20' class='area'></textarea>")
            sub.append(cbox);
            sub.append(bbox);
            sub.append(area);
            var score = $("<div><p>分数: <p><input class='score' type=text></input></div>");
            sub.append(score);
            var root = $("#rootContainer");
            root.append(sub);
            root.append($("<hr>"));
        })

        $("#rootContainer").on("click", ".submitWork",function(){
            var workname=$("#workname").val();
            var selQuestion = new Array();
            var judQuestion = new Array();
            var subQuestion = new Array();
            var sels = $("#rootContainer").find(".select");
            var i = 0;
            for(i=0;i<sels.length;i++){
                var ss = $(sels[i]);
                var info = new Array();
                info[0] = ss.find(".editable")[0].innerText;
                info[1] = ss.find(".editable")[1].innerText;
                info[2] = ss.find(".editable")[2].innerText;
                info[3] = ss.find(".editable")[3].innerText;
                info[4] = ss.find(".editable")[4].innerText;
                info[5] = ss.find(".answer").val();
                info[6] = ss.find(".score").val();
                selQuestion[i] = info;
            }
            var juds = $("#rootContainer").find(".judge");
            i = 0;
            for(i=0;i<juds.length;i++){
                var info = new Array();
                var ss = $(juds[i]);
                info[0] = ss.find(".editable")[0].innerText;
                var type = ss.find("input");
                var typevalue;
                var count;
                for (count = 0; count < type.length; count++) {
                    if (type[count].checked) {
                        typevalue = type[count].value;
                    }
                }
                info[1] = typevalue;
                info[2] = ss.find(".score").val();
                judQuestion[i] = info;
            }



            var subs = $("#rootContainer").find(".sub");
            i = 0;
            for(i=0;i<subs.length;i++){
                var info = new Array();
                var ss = $(subs[i]);
                info[0] = ss.find(".editable")[0].innerText;
                info[1] = ss.find(".area")[0].value;
                info[2] = ss.find(".score").val();
                subQuestion[i] = info;
            }

            var targetURL = $(this).attr("action");
            alert(targetURL);
            $.ajax({
                type: "post",
                url: targetURL,
                async: false,
                cache: false,
                data: {
                    "workname":workname,
                    "selections": selQuestion,
                    "judges": judQuestion,
                    "subs": subQuestion
                },
                dataType: "text",
                traditional: true,
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
<div id="header"></div>
<ul id="rootContainer" num="0">
    <br><br><br><br>
    <li>
        作业名称: <input type='text' id="workname"/>
        <button class="submitWork" action="${pageContext.request.contextPath}/work/insertWork">提交</button>
    </li>
    <li>
        <button class="addSelect">选择题</button>
        <button class="addJudge">判断题</button>
        <button class="addSub">主观题</button>
    </li>
</ul>
</body>