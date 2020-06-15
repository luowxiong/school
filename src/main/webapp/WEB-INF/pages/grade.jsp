<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看成绩</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container">

    <form action="#" method="post" id="gradeForm">
        <br>
        <div>
            学号:<input type="text" name="userId" id="userId" autocomplete="off">&nbsp;&nbsp;
            姓名:<input type="text" name="username" id="username" autocomplete="off">&nbsp;&nbsp;
            课程号:<input type="text" name="cno" id="cno" autocomplete="off">
            <br>
            <br>
            学期:<input type="date" name="startTime" id="startTime">-<input type="date" name="endTime" id="endTime">
            &nbsp;&nbsp;&nbsp;
            <button type="button" id="sel">查询</button>
        </div><br>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>学号</th>
            <th>姓名</th>
            <th>课程号</th>
            <th>课程名</th>
            <th>成绩</th>
            <th>学期时间</th>
        </tr>
        </thead>
        <tbody id="tb">

        </tbody>
    </table>
    </form>

    <a href="/overview"><button type="button" class="btn btn-success btn-sm">返回总览</button></a>


</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>
    function _initGrade(){

        $.ajax({
            type: "get",
            url: "getGrade",
            success: function (data) {
                data=data.data;
                // console.log(data);
                for (let i = 0; i < data.length; i++) {
                    $("#tb").append(
                        `
                             <tr>
                                <th>${"${i + 1}"}</th>
                                <th>${"${data[i].userId}"}</th>
                                <th>${"${data[i].username}"}</th>
                                <th>${"${data[i].cno}"}</th>
                                <th>${"${data[i].course.cname}"}</th>

                                <th>${"${data[i].sno}"}</th>
                                <th>${"${data[i].createTime}"}</th>
                            </tr>
                            `
                    );
                }

            }
        })
    }

    $(function () {
        _initGrade();
        $("#sel").click(function () {
            $("#tb").html('');
            $.ajax({
                type: "get",
                url: "getGradeList",
                    data: {userId:$("#userId").val(),username:$("#username").val(),cno:$("#cno").val(),startTime:$("#startTime").val(),endTime:$("#endTime").val()},
                success: function (data) {
                    data=data.data;
                    // console.log(data);
                    for (let i = 0; i < data.length; i++) {
                        $("#tb").append(
                            `
                             <tr>
                                <th>${"${i + 1}"}</th>
                                <th>${"${data[i].userId}"}</th>
                                <th>${"${data[i].username}"}</th>
                                <th>${"${data[i].cno}"}</th>
                                <th>${"${data[i].course.cname}"}</th>
                                <th>${"${data[i].sno}"}</th>
                                <th>${"${data[i].createTime}"}</th>
                            </tr>
                            `
                        );
                    }

                }
            })
        })
    })
</script>
</body>
</html>