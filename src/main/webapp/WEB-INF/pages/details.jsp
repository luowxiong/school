<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>班级详情</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container">

    班级名 :<input type="text" disabled="disabled" id="className" name="className" style="border: none;">
    班主任 :<input type="text" disabled="disabled" id="headmaster" name="headmaster" style="border: none;">

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>学号</th>
            <th>学生姓名</th>
            <th>性别</th>
            <th>操作</th>
            <th>转班</th>

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
                    <h5 class="modal-title" id="updateModalLabel">转班</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="updateClasses">
                        <input type="hidden" id="userId" name="userId">
                        <div class="form-group">
                            <label for="classId">班级名</label>
                            <select class="custom-select" id="classId" name="classId">
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

    <a href="overview"><button type="button" class="btn btn-outline-success btn-sm">返回总览</button></a>
</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>

    function _initStudent(){
        $.ajax({
            type: "post",
            url: "getStuByClassId",
            data: {classId:window.location.search.substring(9, 10)},
            success: function (data) {
                if (data.status === 0){
                    data = data.data;
                    $("#className").prop('value', data.className);
                    $("#headmaster").prop('value', data.headmaster);
                    for (let i = 0; i < data.user.length; i++) {
                        $("#tb").append(
                            `
                             <tr>
                                <th>${"${i + 1}"}</th>
                                <th>${"${data.user[i].userId}"}</th>
                                <td>${"${data.user[i].username}"}</td>
                                <td>${"${data.user[i].sex}"}</td>
                                <td><button type="button" class="btn btn-danger btn-sm pass" data-id="${"${data.user[i].userId}"}">重置密码</button></td>
                                <td><button type="button" class="btn btn-danger btn-sm turn" data-toggle="modal" data-target="#updateModal" data-id="${"${data.user[i].userId}"}">转班</button></td>
                            </tr>
                            `
                        );
                    }
                }

                $('.pass').on('click', function () {

                    $.ajax({
                        type: "post",
                        url: "updatePassByUserId",
                        data: {userId:this.getAttribute("data-id")},
                        success: function (data) {
                            if (data.status === 0){
                                alert("重置成功")
                            }
                        }
                    })
                });
            }
        });
    }

    $(function () {
        _initStudent();
        // var classId = window.location.search.substring(9, 10);

        $("#updateModal").on('show.bs.modal', function (e) {

            $('.updateEmp').on('click', function () {
                $.ajax({
                    type: "post",
                    url: "updateClassesByUserId",
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
                url: "selectClassesList",
                // data: {classId:$(e.relatedTarget).data('id')},
                success: function (data) {
                    data = data.data;
                    console.log(data);
                    $("#userId").prop('value', $(e.relatedTarget).data('id'));
                    for (let i = 0; i < data.length; i++) {
                        $("#classId").append(
                            `
                        <option value=${"${data[i].classId}"}>${"${data[i].className}"}</option>

                        `
                        );
                    }

                }
            });
        });
    })
</script>

</body>
</html>