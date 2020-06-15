<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container" style="display: flex;justify-content: center;margin-top: 150px">
    <form action="#" method="post" id="updatepassForm" style="width: 450px">
        <input type="hidden" id="userId" name="userId" value="${forgotId}">
        <div class="form-group">
            <label for="pass">新密码</label>
            <input type="text" class="form-control" id="pass" name="pass" autocomplete="off">
        </div>

        <div class="form-group">
            <label for="password">确认密码</label>
            <input type="text" class="form-control" id="password" name="password" autocomplete="off">
        </div>
        <button type="button" class="btn btn-success next">修改</button>
    </form>
</div>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $(".next").click(function () {
            let pass = $("#pass").val();
            let password = $("#password").val();
            if (pass != null && pass != ""){
                if (password != null && password != "" && pass === password){
                    $.ajax({
                        type: "post",
                        url: "updatePass",
                        data:$("#updatepassForm").serialize(),
                        success: function (data) {
                            if (data.status === 0){
                                alert("修改密码成功，前往登录");
                                location.href = "login.jsp";
                            }
                        }
                    })
                } else {
                    alert("输入的密码不相同，请重新输入")
                }
            } else {
                alert("密码不能为空");
            }
        })
    })
</script>

</body>
</html>