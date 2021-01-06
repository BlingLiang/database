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
    <link href="../static/css/login.css" type="text/css" rel="stylesheet">
    <script src="../static/js/jquery-3.1.0.min.js"></script>
    <script src="../static/js/dynamic.js"></script>
    <script src="../static/js/bootstrap.js"></script>
    <script src="../static/js/headerForTeacher.js"></script>
    <![endif]-->
</head>

<body>

<script>
    $(document).ready(function(){

        $("#fabu").click(function(){
            var data = $("#text_area").val();
            var targetURL = $(this).parent().attr("action");
            $.ajax({
                type: "post",
                url: targetURL,
                async: false,
                cache: false,
                data: {"context":data},
                dataType: "text",
                success: function (data) {
                    if(data==="insert success") {
                        alert("插入成功")
                    }else{
                        alert("插入失败");
                    }
                    window.location.reload();
                },
                error: function () {
                    alert("服务器出错");
                }
            })
        })

        function appendInform(context){
            var ili = document.createElement("li");
            ili.setAttribute("class", "col-xs-12 col-sm-4");
            var idiv = document.createElement("div");
            idiv.setAttribute("class", "li-inner");
            var ip = document.createElement("p");
            var ii = document.createElement("i");
            ii.setAttribute("class", "iconfont icon-weixin-copy color-blue2");
            var ih3 = document.createElement("h3");
            ih3.innerText = context;
            ip.appendChild(ii);
            idiv.appendChild(ip);
            idiv.appendChild(ih3);
            ili.appendChild(idiv);
            var container = $("#informContainer");
            container.append(ili);
        }

        function StrSlicer(Str){
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
            var Informs = new Array();
            for (i = 0; i < length; i += 3) {
                var inform = new Array();
                inform[0] = strs[i];
                inform[1] = strs[i + 1];
                inform[2] = strs[i + 2];
                Informs[count] = inform;
                count++;
            }
            return Informs;
        }
        var longStr = $("#informContainer").attr("informs");
        var pieces = StrSlicer(longStr);
        var i = 0;
        for (i = 0; i < pieces.length; i++) {
            appendInform(pieces[i][1]);
        }

    })
</script>
<div id="header"></div>
<div class="content-first clear-both">
    <div class="banner-show over-hide">

    </div>

    <div class="container over-hide">
        <div class="row pd-t40">
            <h3 class="title text-center">
                <p class="mg-0"><span class="title-top">我的通知</span></p>
                <br><br>
            </h3>

            <div class="col-xs-12 col-sm-9 over-hide">
                <div class="row">
                    <ul class="ad_li1" id="informContainer" informs = "${informs.toString()}">
                        <li class="col-xs-12 col-sm-4">
                            <div class="li-inner">
                                <p><img src="../static/images/tianjia.svg" alt="添加课程"></p>
                                <h3><a onclick='test()'>添加通知</a></h3>
                            </div>

                        </li>
                    </ul>
                </div>
                <div class="clear-both"></div>

            </div><!--row end-->
        </div><!--col-xs-9 end-->
    </div><!--over-hide end-->
</div>
<div id='topCoverDiv' style="display: none;"></div>
    <div id='dia' style="display: none;">
        <div >
            <div id="text_box", action="${pageContext.request.contextPath}/Inform/insert">
                <textarea class="addText" id="text_area"></textarea>
                <button ID="fabu" type="button" name="submit" class="custom-btn btn-9">确 认 发 布</button>
                <a onclick='test()' style="font-size: 18px;cursor: default;"><button type="submit" name="submit" class="custom-btn btn-9">放 弃 编 辑</button></a>
            </div>
        </div>
    </div>



</body>
</html>