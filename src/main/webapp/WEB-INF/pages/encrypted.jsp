<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container" style="display: flex;justify-content: center;margin-top: 150px">
    <form action="#" method="post" id="encryptedForm" style="width: 450px">
        <input type="hidden" id="userId" name="userId" value="${forgotId}">
        <div class="form-group">
            <label for="question">密保问题</label>
            <input type="text" class="form-control" id="question" name="question" value="${question}" autocomplete="off" disabled="disabled">
        </div>

        <div class="form-group">
            <label for="answer">密保答案</label>
            <input type="text" class="form-control" id="answer" name="answer" autocomplete="off">
        </div>
        <button type="button" class="btn btn-success next">下一步</button>
    </form>
</div>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $(".next").click(function () {
            $.ajax({
                type: "post",
                url: "selectAnswerById",
                data:$("#encryptedForm").serialize(),
                success: function (data) {
                    if (data.status === 0){
                        location.href = "updatepassword";
                    } else {
                        alert(data.message)
                    }
                }
            })
        })
    })
</script>

</body>
</html>