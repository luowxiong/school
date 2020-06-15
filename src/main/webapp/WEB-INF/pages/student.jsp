<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生个人信息</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">
    <style>

    </style>
</head>
<body>

<div class="container">

    <nav class="navbar navbar-light" style="background-color: #0483d4">
        <img src="img/logo_jw_w.png">
        <div style="color: white;font: normal 24px/45px 'microsoft YaHei'">奕聪中学师生管理系统</div>
        <form class="form-inline my-2 my-lg-0">
            欢迎您:&nbsp;${user.username}&nbsp;&nbsp;
            <button type="button" class="btn btn-light btn-sm logout" style="float: right">退出登录</button>
        </form>
    </nav>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/course">查看课程 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/score">查看成绩 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/updatepass">修改密码/密保</a>
                </li>

            </ul>
            <%--<form class="form-inline my-2 my-lg-0">--%>
                <%--<button type="button" class="btn btn-light btn-sm logout" style="float: right">退出登录</button>--%>
            <%--</form>--%>
        </div>
    </nav>
    <br>
    <div style="width: 500px;">
        <div class="input-group mb-3">
            <button type="button" class="btn btn-danger btn-sm">个人信息</button>
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <button class="btn btn-outline-secondary" type="button">班级</button>
            </div>
            <input type="text" id="classId" name="classId" class="form-control" value="${user.classes.className}" autocomplete="off" disabled="disabled">
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <button class="btn btn-outline-secondary" type="button">班主任</button>
            </div>
            <input type="text" id="headmaster" name="headmaster" class="form-control" value="${user.classes.headmaster}" autocomplete="off" disabled="disabled">
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <button class="btn btn-outline-secondary" type="button">学号</button>
            </div>
            <input type="text" id="soleId" name="soleId" class="form-control" value="${user.userId}" autocomplete="off" disabled="disabled">
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <button class="btn btn-outline-secondary" type="button">姓名</button>
            </div>
            <input type="text" id="username" name="username" class="form-control" value="${user.username}" autocomplete="off" disabled="disabled">
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <button class="btn btn-outline-secondary" type="button">性别</button>
            </div>
            <input type="text" id="sex" name="sex" class="form-control" value="${user.sex}" autocomplete="off" disabled="disabled">
        </div>
    </div>
    <div class="jumbotron">
        <h1 class="display-4">Hello, ${user.username}</h1>
        <p class="lead">好好学习，天天向上</p>
        <hr class="my-4">
        <p>学习使我快乐</p>
        <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
    </div>
</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>
    $(".logout").click(function () {
        $.ajax({
            type: 'post',
            url: 'logout',
        });
        location.href= "/login.jsp"
    });
</script>

</body>
</html>