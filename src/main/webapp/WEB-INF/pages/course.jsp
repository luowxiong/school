<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container">

    <form action="#" method="post" id="courseForm">
    <input type="hidden" id="userId" name="userId" value="${user.userId}">
    <input type="hidden" id="role" name="role" value="${user.role}">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>课程号</th>
            <th>课程名称</th>
            <th>任课教师</th>
            <th>上课时间</th>
            <th>教学地点</th>
            <th>学年</th>
        </tr>
        </thead>
        <tbody id="tb">

        </tbody>
    </table>
    </form>

    <button type="button" class="btn btn-outline-success btn-sm back">返回个人信息</button>
</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>

    function _initCourse(){
        $.ajax({
            type: "post",
            url: "getCourseListById",
            data:$("#courseForm").serialize(),
            success: function (data) {
                if (data.status === 0){
                    data = data.data;
                    for (let i = 0; i < data.length; i++) {
                        $("#tb").append(
                            `
                             <tr>
                                <th>${"${i + 1}"}</th>
                                <th>${"${data[i].cno}"}</th>
                                <td>${"${data[i].cname}"}</td>
                                <td>${"${data[i].username}"}</td>
                                <td>${"${data[i].schoolTime}"}</td>
                                <td>${"${data[i].site}"}</td>
                                <td>${"${data[i].semesters}"}</td>
                            </tr>
                            `
                        );
                    }
                }
            }
        });

    }

    $(function () {
        _initCourse();

        $(".back").click(function () {
            if ($("#role").val() == 3) {
                location.href = "student";
            } else {
                location.href = "teacher";
            }
        });

    })
</script>

</body>
</html>