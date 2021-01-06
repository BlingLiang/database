function switchItem(tag) {
    var s1 = document.getElementById('personalDetails');
    var s2 = document.getElementById('changePassword');
    var s3 = document.getElementById('headImage');

    switch (tag) {
        case 'personalDetails':
            s1.style.display = '';
            s2.style.display = 'none';
            s3.style.display = 'none';
            break;
        case 'changePassword':
            s1.style.display = 'none';
            s2.style.display = '';
            s3.style.display = 'none';
            break;
        case 'headImage':
            s1.style.display = 'none';
            s2.style.display = 'none';
            s3.style.display = '';
            break;


    }
}

function onFrameLoad() {
    var frame = document.getElementById("uploadtarget");
    var content = frame.contentWindow.document.body.innerHtml;
    //解析content，分析上传接口返回值（略）
}

function easyUpload() {
    var input = document.createElement("input");
    input.type = "file";
    input.click();
    input.onchange = function () {
        var file = input.files[0];
        var form = new FormData();
        form.append("file", file); //第一个参数是后台读取的请求key值
        form.append("fileName", file.name);
        form.append("other", "666666"); //实际业务的其他请求参数
        form.append("type", file.type);//回传文件类型
        form.append("size", file.size);//回传文件大小

        var xhr = new XMLHttpRequest();
        var action = "http://localhost:8080/upload.do"; //上传服务的接口地址
        xhr.open("POST", action);
        xhr.send(form); //发送表单数据
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var resultObj = JSON.parse(xhr.responseText);
                //处理返回的数据......
            }
        }
    }
}

function switchLogin(tag) {
    var s1 = document.getElementById('login');
    var s2 = document.getElementById('register');

    switch (tag) {
        case 'login':
            s1.style.display = '';
            s2.style.display = 'none';
            break;
        case 'register':
            s1.style.display = 'none';
            s2.style.display = '';
            break;


    }
}


function test() {
    var maskBg = document.getElementById('topCoverDiv')
    var dia = document.getElementById('dia')
    maskBg.style.display = (maskBg.style.display === 'none') ? 'block' : 'none';
    dia.style.display = (dia.style.display === 'none') ? 'block' : 'none';
}
