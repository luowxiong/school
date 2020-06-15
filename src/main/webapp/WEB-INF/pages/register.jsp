<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">
</head>
<body style="background-color: antiquewhite">
<div class="container" style="display: flex;justify-content: center;align-items: center">
    <form action="#" method="post" id="registerForm" style="width: 450px">
        <div class="form-group">
            <label for="inputUsername">姓名:</label>
            <input type="text" class="form-control" id="inputUsername" name="username" autocomplete="off">
            <p id="msgByusername" style="color: red"></p>
        </div>
        <div class="form-group">
            <label for="inputPassword">密码:</label>
            <input type="password" class="form-control" id="inputPassword" name="password">
            <p id="msgBypassword" style="color: red"></p>
        </div>

        <div>性别:
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="man" name="sex" class="custom-control-input" value="男" checked>
                <label class="custom-control-label" for="man">男</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="woman" name="sex" class="custom-control-input" value="女">
                <label class="custom-control-label" for="woman">女</label>
            </div>
        </div>
        <br>

        <div>身份:
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="teacher" name="role" class="custom-control-input" value="2" checked>
                <label class="custom-control-label" for="teacher">教师</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="student" name="role" class="custom-control-input" value="3">
                <label class="custom-control-label" for="student">学生</label>
            </div>
        </div>
        <br>

        <div class="form-group">
            <label for="question">密保问题:</label>
            <input type="text" class="form-control" id="question" name="question" autocomplete="off">
            <p id="msgByquestion" style="color: red"></p>
        </div>

        <div class="form-group">
            <label for="answer">密保答案:</label>
            <input type="text" class="form-control" id="answer" name="answer" autocomplete="off">
            <p id="msgByanswer" style="color: red"></p>
        </div>

        <div class="form-group">
            <label for="className">班级:</label>
            <select class="custom-select" id="className" name="classId">
            </select>
        </div>

        <button type="button" class="btn btn-success register">新增教师/学生</button>
        <a href="/overview"><button type="button" class="btn btn-success register">返回总览</button></a>
        <br><br>

    </form>
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
                        console.log(data);
                        for (let i = 0; i < data.length; i++) {
                            $("#className").append(
                                `
                                <option value=${"${data[i].classId}"}>${"${data[i].className}"}</option>
                            `
                            );
                        }
                    } else if(data.status === 2){
                        location.href = "login.html";
                    }
                }
            });
        }

        $(function () {
            _initClassesList()

            var username = document.getElementById("inputUsername");
            $("#inputUsername").blur(function () {
                if (username.value == '') {
                    $("#msgByusername").text("用户名不能为空");
                } else {
                    $("#msgByusername").text("");
                }
            });

            var pass = document.getElementById("inputPassword");
            $("#inputPassword").blur(function () {
                if (pass.value == '') {
                    $("#msgBypassword").text("密码不能为空");
                } else {
                    $("#msgBypassword").text("");
                }
            });

            var question = document.getElementById("question");
            $("#question").blur(function () {
                if (question.value == '') {
                    $("#msgByquestion").text("密保问题不能为空");
                } else {
                    $("#msgByquestion").text("");
                }
            });

            var answer = document.getElementById("answer");
            $("#answer").blur(function () {
                if (answer.value == '') {
                    $("#msgByanswer").text("密保答案不能为空");
                } else {
                    $("#msgByanswer").text("");
                }
            });

            $(".register").click(function () {

                if (answer.value != '' && username.value != '' && pass.value != '' && question.value != ''){
                    $.ajax({
                        type: "post",
                        url: "addUserList",
                        data:$("#registerForm").serialize(),
                        success: function (data) {
                            if (data.status === 0){
                                alert("新增成功");
                                location.href = "overview"
                            }
                        }


                    });

                } else {

                    $.ajax({
                        url:'selectUserByname',
                        type:'post',
                        data:$("#registerForm").serialize(),
                        success:function (res) {
                            console.log(res);
                            if (res.status === 2){
                                alert(res.message)
                            }
                        }
                    });

                    if (answer.value == '') {
                        $("#msgByanswer").text("密保答案不能为空");
                    } else {
                        $("#msgByanswer").text("");
                    }

                    if (question.value == '') {
                        $("#msgByquestion").text("密保问题不能为空");
                    } else {
                        $("#msgByquestion").text("");
                    }

                    if (username.value == '') {
                        $("#msgByusername").text("用户名不能为空");
                    } else {
                        $("#msgByusername").text("");
                    }

                    if (pass.value == '') {
                        $("#msgBypassword").text("密码不能为空");
                    } else {
                        $("#msgBypassword").text("");
                    }



                }
            })


        });

    </script>

</body>
</html>

