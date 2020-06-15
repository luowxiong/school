
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息导入</title>
    <link rel="stylesheet" href="/bootstrap4/css/bootstrap.min.css">
</head>
<body>

<form style="text-align: center;margin-top: 20px">
    <input type="file" class="btn btn-dark btn-sm" id="file"/>
    <button type="button" class="btnup btn btn-success btn-sm">上传</button>
    <br><br>
    <a href="/overview"><button type="button" class="btn btn-dark btn-sm">返回总览</button></a>
    <br><br>
    <h3>文件格式</h3>
    <img src="../../img/101.png" alt="">
</form>




<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap4/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $(".btnup").click(function () {
            // console.log($("#file")[0].files);
            //FormData用于向后台提交数据
            let formData = new FormData();
            formData.append('file', $("#file")[0].files[0])
            $.ajax({
                type: 'post',
                url: 'importExcel',
                data: formData,
                processData: false,
                contentType: false,
                success: function (res) {
                    if (res.status === 0){
                        alert("导入成功");
                        location.href = location;
                    }else {
                        alert(res.message);
                        location.href = location;
                    }
                }
            })
        })
    })
</script>
</body>
</html>
