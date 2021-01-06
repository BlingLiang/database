<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HEAD>
    <TITLE>my_subjects</TITLE>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../static/css/demo.css" type="text/css">
    <link rel="stylesheet" href="../static/zTreeStyle.css" type="text/css">
    <link href="../static/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../static/css/first-css.css" type="text/css" rel="stylesheet">
    <link href="../static/css/flow-family.css" type="text/css" rel="stylesheet">
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../static/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.js"></script>
    <script type="text/javascript" src="../static/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="../static/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="../static/js/jquery.ztree.exedit.js"></script>
    <script type="text/javascript" src="../static/js/headerForTeacher.js"></script>


    <script type="text/javascript">
        var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            edit: {
                drag: {
                    isCopy: true,
                    isMove: true,
                    prev: true,
                    next: true,
                    inner: true
                },
                enable: true,
                showRemoveBtn: true,
                showRenameBtn: true,
                removeTitle: "remove",
                renameTitle: "rename"
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                beforeDrag: beforeDrag,
                beforeEditName: beforeEditName,
                beforeRemove: beforeRemove,
                beforeRename: beforeRename,
                onRemove: onRemove,
                onRename: onRename,
                onClick: function (event, treeId, treeNode) {
                    if (treeNode.ahref) {
                        window.open(treeNode.ahref);
                    } else {
                        alert("此节点没有链接！")
                    }

                }
            }
        };

        var zNodes = [
            {id: 1, pId: 0, name: "subject_name", open: true},
            {id: 11, pId: 1, name: "leaf node 1-1", ahref: "target.html", target: "_blank"},
            {id: 12, pId: 1, name: "leaf node 1-2", ahref: "target.html", target: "_blank"},
            {id: 13, pId: 1, name: "leaf node 1-3", ahref: "target.html", target: "_blank"},
            // { id:2, pId:0, name:"parent node 2", open:true},
            // { id:21, pId:2, name:"leaf node 2-1",ahref:"edit_fun.html" ,target:"_blank"},
            // { id:22, pId:2, name:"leaf node 2-2",ahref:"edit_fun.html" ,target:"_blank"},
            // { id:23, pId:2, name:"leaf node 2-3",ahref:"edit_fun.html" ,target:"_blank"},
            // { id:3, pId:0, name:"parent node 3", open:true },
            // { id:31, pId:3, name:"leaf node 3-1",ahref:"edit_fun.html" ,target:"_blank"},
            // { id:32, pId:3, name:"leaf node 3-2",ahref:"edit_fun.html" ,target:"_blank"},
            // { id:33, pId:3, name:"leaf node 3-3",ahref:"edit_fun.html" ,target:"_blank"}
        ];
        var log, className = "dark";

        function beforeDrag(treeId, treeNodes) {
            return false;
        }

        function beforeEditName(treeId, treeNode) {
            className = (className === "dark" ? "" : "dark");
            showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            setTimeout(function () {
                if (confirm("Start node '" + treeNode.name + "' editorial status?")) {
                    setTimeout(function () {
                        zTree.editName(treeNode);
                    }, 0);
                }
            }, 0);
            return false;
        }

        function beforeRemove(treeId, treeNode) {
            className = (className === "dark" ? "" : "dark");
            showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            return confirm("Confirm delete node '" + treeNode.name + "' it?");
        }

        function onRemove(e, treeId, treeNode) {
            showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        }

        function beforeRename(treeId, treeNode, newName, isCancel) {
            className = (className === "dark" ? "" : "dark");
            showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
            if (newName.length == 0) {
                setTimeout(function () {
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.cancelEditName();
                    alert("Node name can not be empty.");
                }, 0);
                return false;
            }
            return true;
        }

        function onRename(e, treeId, treeNode, isCancel) {
            showLog((isCancel ? "<span style='color:#bcbdbf'>" : "") + "[ " + getTime() + " onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
        }

        function showRemoveBtn(treeId, treeNode) {
            return !treeNode.isFirstNode;
        }

        function showRenameBtn(treeId, treeNode) {
            return !treeNode.isLastNode;
        }

        function showLog(str) {
            if (!log) log = $("#log");
            log.append("<li class='" + className + "'>" + str + "</li>");
            if (log.children("li").length > 8) {
                log.get(0).removeChild(log.children("li")[0]);
            }
        }

        function getTime() {
            var now = new Date(),
                h = now.getHours(),
                m = now.getMinutes(),
                s = now.getSeconds(),
                ms = now.getMilliseconds();
            return (h + ":" + m + ":" + s + " " + ms);
        }

        var newCount = 1;

        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_" + treeNode.tId);
            if (btn) btn.bind("click", function () {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.addNodes(treeNode, {
                    id: (100 + newCount),
                    pId: treeNode.id,
                    ahref: "target.html",
                    target: "_blank",
                    name: "new node" + (newCount++)
                });
                return false;
            });
        };

        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_" + treeNode.tId).unbind().remove();
        };

        function selectAll() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
        }

        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            $("#selectAll").bind("click", selectAll);
        });
        //-->
    </script>
    <style type="text/css">
        .ztree li span.button.add {
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
            *vertical-align: middle
        }
    </style>
</HEAD>

<BODY>
<div id="header"></div>
<div class="content_wrap">

    <div class="zTreeDemoBackground left">
        <ul id="treeDemo" class="ztree"></ul>
    </div>
    <div id="file">

        <form method="POST" action="https://your.domain.com/upload" enctype="multipart/form-data"
              class="headIMG">
            <label>
                <input type="text" name="text">
            </label>
            <button type="submit" name="submit" class="custom-btn btn-10 headIMG" style="float: right">确认上传
            </button>
            <input type="file" style="float:right"/>

        </form>
    </div>
    <div class="footer"></div>
</div>
</BODY>
