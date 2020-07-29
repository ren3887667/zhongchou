<%--
  Created by IntelliJ IDEA.
  User: yc
  Date: 2020/7/29 0029
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>项目标签</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="http://169.254.25.72:8011/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://169.254.25.72:8011/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://169.254.25.72:8011/css/main.css">
    <link rel="stylesheet" href="http://169.254.25.72:8011/css/doc.min.css">
    <link rel="stylesheet" href="http://169.254.25.72:8011/ztree/zTreeStyle.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<jsp:include  page="admin-head.jsp" flush="true"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <%--左菜单栏展示  menu-left.js --%>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="panel panel-default">
                <div class="panel-heading"><i class="glyphicon glyphicon-th-list"></i> 项目标签列表</div>
                <div class="panel-body">
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://169.254.25.72:8011/jquery/jquery-2.1.1.min.js"></script>
<script src="http://169.254.25.72:8011/bootstrap/js/bootstrap.min.js"></script>
<script src="http://169.254.25.72:8011/script/docs.min.js"></script>
<script src="http://169.254.25.72:8011/ztree/jquery.ztree.all-3.5.min.js"></script>
<script src="http://169.254.25.72:8011/script/menu-left.js"></script>

<%--stree的初始化和加载--%>
<script type="text/javascript">
function genetrateTree() {
    var setting = {
        view: {
            selectedMulti: false,
            addDiyDom: function(treeId, treeNode){
                var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
                if ( treeNode.icon ) {
                    icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
                }
            },
            addHoverDom: function(treeId, treeNode){
                var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                aObj.attr("href", "javascript:;");
                if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
                var s = '<span id="btnGroup'+treeNode.tId+'">';

                //准备三个按钮
                var addBtn = '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                var editBtn = '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                var removeBtn = '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';

                if ( treeNode.level == 0 ) {
                    s += addBtn;
                } else if ( treeNode.level == 1 ) {
                    s += editBtn;
                    if (treeNode.children.length == 0) {
                        s += removeBtn;
                    }
                    s += addBtn;
                } else if ( treeNode.level == 2 ) {
                    s += editBtn;
                    s += removeBtn;
                }

                s += '</span>';
                aObj.after(s);
            },
            removeHoverDom: function(treeId, treeNode){
                $("#btnGroup"+treeNode.tId).remove();
            }
        },
        /*async: {
            enable: true,
            url:"tree.txt",
            autoParam:["id", "name=n", "level=lv"]
        },*/
        callback: {
            onClick : function(event, treeId, json) {
            }
        }
    };
    //$.fn.zTree.init($("#treeDemo"), setting); //异步访问数据
    var d ;
    $.ajax({
        url: "/tTag/tag/get/whole/tree.json",//访问的路径
        type:"get",//访问类型
        //提交的数据
        //data: $("#regForm").serialize(),//表单序列化提交
        dataType:"json",//规定返回值格式
        async : false,//同步上传
        success:function (json){//成功回调函数
            if(json.result=="FAILED"){
                alert(json.message)
            }else {
                d=json.data;
            }
        },
        error :function(){//错误回调函数
            alert("系统异常！")
        }
    });
    $.fn.zTree.init($("#treeDemo"), setting, d);
};
</script>

<script type="text/javascript">
    $(function () {
        genetrateTree();
        }
    );




</script>
</body>
</html>