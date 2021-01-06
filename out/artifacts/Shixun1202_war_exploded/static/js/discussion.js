

    window.onload = function(){

    var oMessageBox = document.getElementById("messageBox");
    var oInput = document.getElementById("myInput");
    var oPostBtn = document.getElementById("doPost");

    oPostBtn.onclick = function(){
    if(oInput.value){
    //写入发表留言的时间
    var oTime = document.createElement("div");
    oTime.className = "time";
    var myDate = new  Date();
    oTime.innerHTML = myDate.toLocaleString();
    oMessageBox.appendChild(oTime);

    //写入留言内容
    var oMessageContent = document.createElement("div");
    oMessageContent.className = "message_content";
    oMessageContent.innerHTML = oInput.value;
    oInput.value = "";
    oMessageBox.appendChild(oMessageContent);
}

}

}


