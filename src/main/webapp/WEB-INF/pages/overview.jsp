<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>班级总览</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

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
                    <a class="nav-link" href="/register">手动导入新增教师/学员 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link grade" href="/excelfile">自动导入新增教师/学员 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/addcourse">课程管理</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/grade">查看成绩</a>
                </li>

            </ul>
            <%--<form class="form-inline my-2 my-lg-0">--%>
                <%--<button type="button" class="btn btn-success btn-sm logout" style="float: right">退出登录</button>--%>
            <%--</form>--%>
        </div>
    </nav>
    <br>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>班级名</th>
            <th>班主任</th>
            <th>学生个数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="tb">

        </tbody>
    </table>

    <!-- updateModal -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">编辑班级</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="updateClasses">
                        <input type="hidden" id="classId" name="classId">
                        <input type="hidden" id="username" name="username">
                        <div class="form-group">
                            <label for="className">班级名</label>
                            <input type="text" class="form-control" id="className" name="className" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="headmaster">班主任</label>
                            <select class="custom-select" id="headmaster" name="userId">
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary closeEmp" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary updateEmp">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>

    function _initClassesList(){
        $.ajax({
            type: "post",
            url: "getClassesList",
            success: function (data) {
                if (data.status === 0){
                    data = data.data;
                    for (let i = 0; i < data.length; i++) {
                        $("#tb").append(
                            `
                             <tr>
                                <th>${"${i + 1}"}</th>
                                <td>${"${data[i].className}"}</td>
                                <td>${"${data[i].headmaster}"}</td>
                                <td>${"${data[i].stuCount}"}</td>

                                <td>
                                    <button type="button" class="btn btn-outline-warning btn-sm details" data-id="${"${data[i].classId}"}">详情</button>
                                    <button type="button" class="btn btn-outline-warning btn-sm update" data-toggle="modal" data-target="#updateModal" data-id="${"${data[i].classId}"}">修改</button>
                                </td>
                            </tr>
                            `
                        );
                    }
                    $('.details').on('click', function () {

                        location.href = "details?classId="+ this.getAttribute("data-id") +"";
                    });

                } else if(data.status === 2){
                    location.href = "login.html";
                }
            }
        });
    }

    $(function (){

        _initClassesList();

        $(".logout").click(function () {
           $.ajax({
              type: 'post',
              url: 'logout',
           });
           location.href= "/login.jsp"
        });

        $("#updateModal").on('show.bs.modal', function (e) {

            $('.updateEmp').on('click', function () {
                $.ajax({
                    type: "post",
                    url: "updateClassNameAndUsername",
                    data: $("#updateClasses").serialize(),
                    success: function (data) {
                        $("#updateModal").modal("hide");
                        //刷新
                        location.href = location;
                    }
                })

            });

            $('.closeEmp').on('click', function () {
                location.href = location;
            });
            $('.close').on('click', function () {
                location.href = location;
            });

            $.ajax({
                type: "post",
                url: "getClassesById",
                data: {classId:$(e.relatedTarget).data('id')},
                success: function (data) {
                    data = data.data;
                    $("#className").prop('value', `${"${data.className}"}`);
                    $("#username").prop('value', `${"${data.headmaster}"}`);
                    for (let i = 0; i < data.user.length; i++) {
                        $("#headmaster").append(
                            `
                        <option value=${"${data.user[i].userId}"}>${"${data.user[i].username}"}</option>

                        `
                        );
                    }

                    $("#classId").prop('value', `${"${data.classId}"}`);
                }
            });

            // $('.details').on('click', function () {
            //     alert(1);
            // });


        });
    });

</script>

</body>
</html>

