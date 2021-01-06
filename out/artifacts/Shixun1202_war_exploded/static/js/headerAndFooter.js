// JavaScript Document

//动态添加头部和尾部

$().ready(function (e) {
    //头部
    $('head').append('');
    $("#header").html(
        '<div class="header-first"><div class="header-top"><div class="container">欢迎您的到来！</div></div>' +
        '<div class="container" style="height:80px; line-height:76px; position:relative;">' +
        ' <div class="row">' +
        '<div class="nav-top" id="nav_top">' +
        '<span class="nav-btn">导航</span>' +
        ' <ul class="toolbar">' +
        //page/turn?target=stu_pages/mainPage
        '<li><a href="turn?target=stu_pages/mainPage">首页</a></li>' +
        '<li><a href="turn?target=stu_pages/subjects">我的课程</a></li>' +
        '<li><a href="information_total">收件箱</a></li+>' +
        '<li><a href="turn?target=stu_pages/settings">个人中心</a></li>' +
        '</ul>' +
        '</div>' +
        '<div class="logo"><img src="../static/images/logo.png" height="90vh" alt="官网logo" title=""></div>' +
        '</div>' +
        '</div>' +
        '</div>'
    );

    //尾部
    $("#footer").html(
        '<div class="go_top" id="go_top" style="display: none;"></div>' +
        '<div class="footer-first font12 footer-flow">' +
        'Copyright © 2020 西南财经大学经济信息工程学院 版权所有' +
        '</div>'
    );

    //页面跳转后给导航栏添加激活样式
    var nc = pageName();
    //alert(nc)
    $('.toolbar li').find("a[href='" + nc + "']").addClass("active");
    if (nc.indexOf("ar") !== -1) {
        $('.toolbar li a').eq(0).addClass("active");
    }

    $(function () {
        $(".aFloatTools_Show").click(function () {
            //alert("11")
            $('.divFloatToolsView').animate({width: 'show', opacity: 'show'}, 100, function () {
                $('.divFloatToolsView').show();
            });
            $('.aFloatTools_Show').hide();
            $('.aFloatTools_Hide').show();
        });
        $(".aFloatTools_Hide").click(function () {
            //alert("22")
            $('.divFloatToolsView').animate({width: 'hide', opacity: 'hide'}, 100, function () {
                $('.divFloatToolsView').hide();
            });
            $('.aFloatTools_Show').show();
            $('.aFloatTools_Hide').hide();
        });
    });

    //移动端 首页导航和文档中心-文章导航伸缩功能
    var win_w = $(window).width();
    if (win_w < 767) {
        $("#nav_top ul").css("display", "block").hide(); //解决导航第一次点击出现闪屏的现象，可能是因为之前使用了display:none;这个样式，造成初次点击时候，页面同时css和js同时变化，所以有闪屏。

        $("#nav_top").on("click", this, function () {//alert(111)
            $("#nav_top ul").slideToggle();
            //e.preventDefault();
        })
        $("#myScrollspy").on("click", this, function () {//alert(1133)
            $("#myScrollspy ul").slideToggle();
            //e.preventDefault();
        })
    }

    //返回顶部
    $(window).scroll(function () {
        if ($(window).scrollTop() > 800)
            $("#go_top").show();
        else
            $("#go_top").hide();
    });
    $("#go_top").click(function () {
        $('body,html').animate({scrollTop: 0}, 500)
    })

    $("#testDr a").click(function () {
        $("#testDr a").removeClass("active");
        $(this).addClass("active");
    })


});

window.onresize = function () {
    window.location.reload();
}

//导航栏
/*跳转添加导航样式 方法1*/
function pageName() {
    var strUrl = location.href;
    var arrUrl = strUrl.split("/");
    return arrUrl[arrUrl.length - 1];
}



