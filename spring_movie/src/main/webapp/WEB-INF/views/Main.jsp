<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
        type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body>
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-header">
                <p class="text-center" style="font-size: 30px; margin: 30px;">시작페이지</p>
            </div>
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row p-5">
                    <div class="col-xl-6 mb-3 text-center">
                        <button class="btn btn-danger" onclick="adminMain()"
                            style="height: 150px; width: 300px;">관리자페이지</button>
                    </div>
                    <div class="col-xl-6 mb-3 text-center">
                        <button class="btn btn-primary" onclick="movieMain()"
                            style="height: 150px; width: 300px;">일반회원페이지</button>
                        <!-- <a class="btn btn-primary" href="movieMain" style="height: 150px; width: 300px;">일반회원페이지</a> -->
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/	js/sb-admin-2.min.js"></script>

</body>
<script type="text/javascript">
    var checkMsg = "${msg}";
    console.log(checkMsg.length);
    if (checkMsg.length > 0) {
        alert(checkMsg);
    }

    function adminMain() {
        /*
        var confirmVal = confirm("확인");
        console.log(confirmVal);
        */
        var inputPw = prompt("비밀번호 입력");
        console.log(inputPw);
        location.href = "adminMain?inputPw=" + inputPw;
    }

    function movieMain() {
        location.href = "movieMain"
    }
</script>

</html>