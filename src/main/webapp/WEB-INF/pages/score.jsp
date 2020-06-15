<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生查看分数</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container">

    <form action="#" method="post" id="scoreForm">
    <input type="hidden" id="userId" name="userId" value="${user.userId}">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>课程名称</th>
            <th>任课教师</th>
            <th>分数</th>
        </tr>
        </thead>
        <tbody id="tb">

        </tbody>
    </table>
    </form>

    <a href="/student"><button type="button" class="btn btn-outline-success btn-sm">返回个人信息</button></a>
</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>

    function _initScore(){
        $.ajax({
            type: "post",
            url: "getGradeByUserId",
            data:$("#scoreForm").serialize(),
            success: function (data) {
                if (data.status === 0){
                    data = data.data;
                    console.log(data);
                    for (let i = 0; i < data.length; i++) {
                        $("#tb").append(
                            `
                             <tr>
                                <th>${"${i + 1}"}</th>
                                <th>${"${data[i].course.cname}"}</th>
                                <th>${"${data[i].course.username}"}</th>
                                <td>${"${data[i].sno}"}</td>
                            </tr>
                            `
                        );
                    }
                }
            }
        });
    }

    $(function () {
        _initScore();
    })
</script>

</body>
</html>