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

    <link rel="stylesheet" href="http://169.254.25.72:8011/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://169.254.25.72:8011/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://169.254.25.72:8011/css/main.css">

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
<script src="http://169.254.25.72:8011/jquery/jquery-2.1.1.min.js"></script>
<script src="http://169.254.25.72:8011/bootstrap/js/bootstrap.min.js"></script>
<script src="http://169.254.25.72:8011/script/docs.min.js"></script>
<script src="http://169.254.25.72:8011/script/menu-left.js"></script>
</body>
</html>
