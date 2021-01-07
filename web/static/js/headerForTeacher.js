// JavaScript Document

//动态添加头部和尾部

$().ready(function(e) {
    //头部
    $('head').append('');
    $("#header").html(
        '<div class="header-first"><div class="header-top"><div class="container">欢迎您的到来！</div></div>'+
        '<div class="container" style="height:80px; line-height:76px; position:relative;">'+
        ' <div class="row">'+
        '<div class="nav-top" id="nav_top">'+
        '<span class="nav-btn">导航</span>'+
        ' <ul class="toolbar">'+
        '<li><a href="turn?target=tea_pages/subjects">课程中心</a></li>'+
        '<li><a href="course">首页</a></li>'+
        '<li><a href="exam">考试</a></li>'+
        '<li><a href="cinforms">通知</a></li>'+
        '<li><a href="turn?target=tea_pages/discussion">讨论</a></li>'+
        '<li><a href="turn?target=tea_pages/analysis">统计</a></li>'+
        '</ul>'+
        '</div>'+
        // '<div class="logo"><img src="../static/images/logo.png" height="90vh" alt="官网logo" title=""></div>'+
        '<hr>'+
        '</div>'+
        '</div>'+
        '</div>'
    );

    //尾部
    $("#footer").html(
        '<div class="go_top" id="go_top" style="display: none;"></div>'+
        '<div class="footer-first font12 footer-flow">'+
        'Copyright © 2020 西南财经大学经济信息工程学院 版权所有'+
        '</div>'
    );
    //移动端 首页导航和文档中心-文章导航伸缩功能
    var win_w=$(window).width();
    if(win_w<767){
        $("#nav_top ul").css("display","block").hide(); //解决导航第一次点击出现闪屏的现象，可能是因为之前使用了display:none;这个样式，造成初次点击时候，页面同时css和js同时变化，所以有闪屏。

        $("#nav_top").on("click",this,function(){//alert(111)
            $("#nav_top ul").slideToggle();
            //e.preventDefault();
        })
        $("#myScrollspy").on("click",this,function(){//alert(1133)
            $("#myScrollspy ul").slideToggle();
            //e.preventDefault();
        })
    }



});

