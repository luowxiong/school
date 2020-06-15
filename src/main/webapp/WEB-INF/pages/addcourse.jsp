<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程管理</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">

</head>
<body>
<div class="container">

    <form action="#" method="post" id="addCourseForm">
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
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="tb">

        </tbody>
    </table>
    </form>

    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#saveModal">添加</button>
    <a href="/overview"><button type="button" class="btn btn-success btn-sm">返回总览</button></a>

    <!-- saveModal -->
    <div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="saveModalLabel">修改课程</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="saveCourse">

                        <div class="form-group">
                            <label for="cno">课程号</label>
                            <input type="number" class="form-control" id="addcno" name="cno" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="cname">课程名称</label>
                            <input type="text" class="form-control" id="addcname" name="cname" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="username">任课老师</label>
                            <select class="custom-select" id="addusername" name="username">
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="schoolTime">上课时间</label>
                            <input type="text" class="form-control" id="addschoolTime" name="schoolTime" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="site">教学地点</label>
                            <input type="text" class="form-control" id="addsite" name="site" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="site">学年</label>
                            <input type="text" class="form-control" id="addsemesters" name="semesters" autocomplete="off">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary addCloseEmp" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary addEmp">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- updateModal -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">修改课程</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="updateCourse">
                        <input type="hidden" id="cId" name="cId">
                        <div class="form-group">
                            <label for="cno">课程号</label>
                            <input type="number" class="form-control" id="cno" name="cno" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="cname">课程名称</label>
                            <input type="text" class="form-control" id="cname" name="cname" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="username">任课老师</label>
                            <select class="custom-select" id="username" name="username">
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="schoolTime">上课时间</label>
                            <input type="text" class="form-control" id="schoolTime" name="schoolTime" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="site">教学地点</label>
                            <input type="text" class="form-control" id="site" name="site" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="site">学年</label>
                            <input type="text" class="form-control" id="semesters" name="semesters" autocomplete="off">
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
    function _initAddCourse(){
        $.ajax({
            type: "post",
            url: "getCourseList",
            data:$("#addcourseForm").serialize(),
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
                                <td>
                                    <button type="button" class="btn btn-outline-warning btn-sm updateCourse" data-toggle="modal" data-target="#updateModal" data-id="${"${data[i].cno}"}">修改</button>
                                    <button type="button" class="btn btn-outline-warning btn-sm delCourse" data-id="${"${data[i].cno}"}">删除</button>
                                </td>
                            </tr>
                            `
                        );
                    }
                    $('.delCourse').on('click', function () {
                        $.ajax({
                            type: "post",
                            url: "deleteCourseByCno",
                            data: {cno:this.getAttribute("data-id")},
                            success: function () {
                                location.href = location;
                            }
                        })

                    });
                }
            }
        });

    }

    $(function () {
        _initAddCourse();

        $("#updateModal").on('show.bs.modal', function (e) {

            $('.updateEmp').click(function () {
               $.ajax({
                   type: "post",
                   url: "updateByCid",
                   data: $("#updateCourse").serialize(),
                   success: function (data) {
                       if (data.status === 0){
                           $("#updateModal").modal("hide");
                           //刷新
                           location.href = location;
                       }
                   }
               })
            });

            $.ajax({
                type: 'post',
                url: 'getCourseByCno',
                data: {cno:$(e.relatedTarget).data('id')},
                success: function (data) {
                    data = data.data;
                    console.log(data);
                    $("#cId").prop('value',`${"${data.cid}"}`);
                    $("#cno").prop('value',`${"${data.cno}"}`);
                    $("#cname").prop('value',`${"${data.cname}"}`);
                    $("#schoolTime").prop('value',`${"${data.schoolTime}"}`);
                    $("#site").prop('value',`${"${data.site}"}`);
                    $("#semesters").prop('value',`${"${data.semesters}"}`);
                    for (let i = 0; i < data.user.length; i++) {
                        $("#username").append(
                            `
                        <option value=${"${data.user[i].username}"}>${"${data.user[i].username}"}</option>

                        `
                        );
                    }
                }
            });

            $('.closeEmp').on('click', function () {
                location.href = location;
            });
            $('.close').on('click', function () {
                location.href = location;
            });

        });

        $("#saveModal").on('show.bs.modal', function (e) {

            $('.addEmp').click(function () {
                $.ajax({
                    type: "post",
                    url: "saveCourse",
                    data: $("#saveCourse").serialize(),
                    success: function (data) {
                        if (data.status === 0){
                            $("#saveModal").modal("hide");
                            //刷新
                            location.href = location;
                        }else {
                            alert(data.message);
                        }
                    }
                })
            });

            $.ajax({
                type: 'post',
                url: 'getTeachersList',
                success: function (data) {
                    data = data.data;
                    for (let i = 0; i < data.length; i++) {
                        $("#addusername").append(
                            `
                        <option value=${"${data[i].username}"}>${"${data[i].username}"}</option>

                        `
                        );
                    }
                }
            });

            $('.addCloseEmp').on('click', function () {
                location.href = location;
            });
            $('.close').on('click', function () {
                location.href = location;
            });

        });
    });

</script>

</body>
</html>