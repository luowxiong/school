<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container" style="display: flex;justify-content: center;margin-top: 200px">
    <form action="#" method="post" id="forgotForm" style="width: 450px">
        <div class="form-group">
            <label for="userId">输入想要找回密码的学号</label>
            <input type="text" class="form-control" id="userId" name="userId" autocomplete="off">
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
                url: "selectUserIdIsnull",
                data:$("#forgotForm").serialize(),
                success: function (data) {
                    console.log(data.status);
                    if (data.status === 0){
                        location.href = "encrypted";
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