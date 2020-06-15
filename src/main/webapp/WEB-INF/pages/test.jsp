<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">
    <style>

    </style>
</head>
<body>

<div class="container">
    <form id="entryForm">
        <input type="hidden" id="username" name="username" class="form-control" value="${user.username}" autocomplete="off" readonly="readonly">
        <input type="hidden" id="cno" name="cno" class="form-control" autocomplete="off" readonly="readonly">

        <div class="input-group mb-3">
            <input type="text" id="cname" name="cname" class="form-control" autocomplete="off" readonly="readonly">
            <div class="input-group-prepend">
                <button class="btn btn-success selectGrade" type="button">查询已有成绩</button>
            </div>
        </div>
        <table class="table table-dark">
            <thead>
            <tr>
                <th>#</th>
                <th>学生姓名</th>
                <th>分数</th>

            </tr>
            </thead>
            <tbody id="tb">

            </tbody>
        </table>
        <button class="btn btn-success saveGrade" type="button" data-toggle="modal" data-target="#addModal" data-id="">录入成绩</button>

    </form>

    <!-- addModal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">录入成绩</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="addGradeForm">
                        <input type="hidden" id="gradeCno" name="cno">

                        <div class="form-group">
                            <label for="userId">学生学号</label>
                            <input type="text" class="form-control" id="userId" name="userId" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="sno">分数</label>
                            <input type="number" class="form-control" id="sno" name="sno" autocomplete="off">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary closeEmp" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary saveEmp">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>

    function _init(){
        $.ajax({
            type: "post",
            url: "getCourseListByusername",
            data: $("#entryForm").serialize(),
            success: function (data) {
                data=data.data;
                // console.log(data);
                $("#cname").val(data[0].cname);
                $("#cno").val(data[0].cno);
                $(".saveGrade").attr("data-id", data[0].cno);
                // console.log($(".saveGrade").attr("data-id"));
            }
        })
    }

    $(function () {
        _init();
        $(".selectGrade").click(function () {
            $.ajax({
                type: "post",
                url: "getGradeListByCno",
                data: $("#entryForm").serialize(),
                success: function (data) {
                    data=data.data;
                    // console.log(data);
                    for (let i = 0; i < data.length; i++) {
                        $("#tb").append(
                            `
                             <tr>
                                <th>${"${i + 1}"}</th>
                                <td>${"${data[i].user.username}"}</td>
                                <td>${"${data[i].sno}"}</td>
                            </tr>
                            `
                        );
                    }
                }
            })
        });

        $("#addModal").on('show.bs.modal', function (e){
            $("#gradeCno").val($(e.relatedTarget).data('id'));
            console.log($(e.relatedTarget).data('id'));

            $(".saveEmp").click(function () {
                $.ajax({
                    type: "post",
                    url: "saveGrade",
                    data: $("#addGradeForm").serialize(),
                    success: function (data) {
                        console.log(data);
                    }
                })
            })
        });


    });


</script>
</body>
</html>