<%--
  Created by IntelliJ IDEA.
  User: yc
  Date: 2020/7/28 0028
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="http://127.0.0.1:8011/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://127.0.0.1:8011/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://127.0.0.1:8011/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        .tree-closed {
            height : 40px;
        }
        .tree-expanded {
            height : auto;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 控制面板</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> 张三 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                            <li class="divider"></li>
                            <li><a href="index.html"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="查询">
            </form>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">控制面板</h1>

            <div class="row placeholders">
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://127.0.0.1:8011/jquery/jquery-2.1.1.min.js"></script>
<script src="http://127.0.0.1:8011/bootstrap/js/bootstrap.min.js"></script>
<script src="http://127.0.0.1:8011/script/docs.min.js"></script>

<script type="text/javascript">
        $.ajax({
            url: "/tMenu/menu/get/whole/tree.json",//访问的路径
            type:"get",//访问类型
            //提交的数据
            //data: $("#regForm").serialize(),//表单序列化提交
            dataType:"json",//规定返回值格式
            async : false,//同步上传
            success:function (json){//成功回调函数
                if(json.result=="FAILED"){
                    alert(json.message)
                }else {
                    var root = json.data;
                    for ( var i = 0;i < root.children.length;i++){
                        if(root.children[i].children.length <1){
                            var str='<li class="list-group-item tree-closed" ><a href="'+root.children[i].url+'"><i class="'+root.icon+'"></i> '+root.children[i].name+'</a></li>';
                            $(".list-group").append(str);
                        }else {
                            var str='<li class="list-group-item tree-closed"><span><i class="'+root.children[i].icon+'"></i> '+root.children[i].name+' <span class="badge" style="float:right">'+root.children[i].children.length+'</span></span><ul style="margin-top:5px;display:none;">';
                            for (var j = 0;j < root.children[i].children.length;j++) {
                                str+='<li style="height:30px;"><a href="'+root.children[i].children[j].url+'"><i class="'+root.children[i].children[j].icon+'"></i>'+root.children[i].children[j].name+'</a></li>';
                            }
                            $(".list-group").append(str+"</ul></li>");
                        }
                    }
                }
            },
            error :function(){//错误回调函数
                alert("系统异常！")
            }
        });

</script>

<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
    });
</script>
</body>
</html>
