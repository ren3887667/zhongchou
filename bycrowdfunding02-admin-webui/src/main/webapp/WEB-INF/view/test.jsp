<%--
  Created by IntelliJ IDEA.
  User: renjie
  Date: 2020/7/29
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <%--base标记是一个基链接标记，是一个单标记。用以改变文件中所有连结标记的参数内定值。--%>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>

</body>
</html>
