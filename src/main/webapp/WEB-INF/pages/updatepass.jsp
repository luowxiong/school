<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码/密保</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">
    <style>

    </style>
</head>
<body>

<div class="container" style="margin-top: 50px;width: 500px">

    <form action="#" method="post" id="update">
    <input type="hidden" id="userId" name="userId" value="${user.userId}">
    <input type="hidden" id="role" name="role" value="${user.role}">
    <%--<div class="input-group mb-3">--%>
        <%--<div class="input-group-prepend">--%>
            <%--<button class="btn btn-outline-secondary" type="button">旧的密码</button>--%>
        <%--</div>--%>
        <%--<input type="text" id="pass" name="pass" class="form-control" value="${user.password}" autocomplete="off" disabled="disabled">--%>
    <%--</div>--%>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <button class="btn btn-outline-secondary" type="button">新的密码</button>
        </div>
        <input type="text" id="password" name="password" class="form-control" autocomplete="off">
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <button class="btn btn-outline-secondary" type="button">新的密保问题</button>
        </div>
        <input type="text" id="question" name="question" class="form-control" autocomplete="off">
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <button class="btn btn-outline-secondary" type="button">新的密保答案</button>
        </div>
        <input type="text" id="answer" name="answer" class="form-control" autocomplete="off">
    </div>

    <button type="button" class="btn btn-danger btn-sm update">修改密码/密保</button>
    <button type="button" class="btn btn-success btn-sm back">返回个人信息</button>
    </form>
</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>

    $(".back").click(function () {
        if ($("#role").val() == 3) {
            location.href = "student";
        } else {
            location.href = "teacher";
        }
    });

    $(".update").click(function () {
        $.ajax({
            type: "post",
            url: "updatePassword",
            data: $("#update").serialize(),
            success: function (data) {
                if (data.status === 0){
                    alert("修改成功,请重新登陆");
                    location.href="login.jsp";
                } else {
                    alert(data.message)
                }
            }
        })
    })
</script>
</body>
</html>