<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">
    <style>
        body{
            background-color: #fafafa;
        }
        .nice{
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container{
            margin-top: 100px;
            display: flex;
            justify-content: space-between;
            border: #b3b7bb 2px solid;
            border-radius: 5px;
        }
        #loginForm{
            width: 300px;
            background-color: rgba(255,255,255,0.7);
            margin-top: 30px;
            border: #b3b7bb 1px solid;
            border-radius: 5px;
        }

    </style>
</head>
<body>
<div class="container">
    <div><img src="img/login_bg_pic.jpg"></div>
    <form action="getUserByname" method="post" id="loginForm">
        <div class="form-group">
            <label for="exampleInputEmail1">用户名</label>
            <input type="text" class="form-control" id="exampleInputEmail1" name="userId" autocomplete="off" value="${userId}">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">密码</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="password" value="${password}">
        </div>
        <%--验证码--%>
        <div class="form-group">
            <div class="input-icon" style="display: flex;justify-content: space-around;align-items: center">
                <i class="fa fa-picture-o"></i>
                <input class="form-control" style="width:180px;" type="text" id="verifyCode" name="verifyCode" placeholder="验证码" maxlength="4" autocomplete="off">
                <img src="${pageContext.request.contextPath }/getVerifyCode" width="110" height="34" id="verifyCodeImage">
            </div>
        </div>

        <div class="custom-control custom-checkbox mb-3 was-validated">
            <input type="checkbox" class="custom-control-input" id="rem" name="remember" checked>
            <label class="custom-control-label" for="rem">记住密码</label>
        </div>
        <button type="button" class="btn btn-primary login">登 录</button>
        <a href="/forgotpass"><button type="button" class="btn btn-danger">忘记密码</button></a>
        <br><br>

        <div class="nice">
            欢迎来到:<br>教务综合信息服务平台
        </div>

    </form>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/bootstrap4/js/bootstrap.min.js"></script>
    <script>

        $(function () {
            $('#verifyCodeImage').click(function () {
                location.href=location;
            });

            $(".login").click(function () {
                //发送ajax请求
                $.ajax({
                    url:'getUserByname',
                    type:'post',
                    data:$("#loginForm").serialize(),
                    success:function (res) {
                        console.log(res);
                        if (res.status === 0){
                            if(res.data.role === 0) {
                                location.href = "overview";
                            }else if (res.data.role === 1){
                                location.href = "teacher";
                            }else if (res.data.role === 2){
                                location.href = "teacher";
                            }else if (res.data.role === 3){
                                location.href = "student";
                            }
                        } else {
                            $(".nice").html("<div>" + res.message + "</div>");
                        }
                    }
                });
            });

        });

    </script>

</div>
</body>
</html>

