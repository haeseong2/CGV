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

    <title>회원가입페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
        type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- 다음 우편번호 서비스 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daumPostCode.js"></script>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="/WEB-INF/views/includes/TopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">회원가입페이지 - MemberJoinFrom.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                        <div class="col-lg-10" style="margin-left: auto; margin-right: auto;">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                                </div>
                                <form class="user" action="memberJoin" method="post" enctype="multipart/form-data"
                                    onsubmit="return joinFormCheck()">
                                    <!-- bootstrap에서 생성한 class로 스타일을 줄 경우-->
                                    <!-- mb : margin botton, ml : margin left, 등.. -->
                                    <!-- pb : padding botton, 등.. -->
                                    <!-- 아이디 -->
                                    <label for="inputMid" class="text-lg font-weight-bold">아이디</label>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="inputMid"
                                            name="mid" placeholder="아이디입력">
                                        <span id="idCheckMsg">&nbsp;</span>
                                    </div>

                                    <!-- 비밀번호 -->
                                    <label for="inputMpw" class="text-lg font-weight-bold">비밀번호</label>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" class="form-control form-control-user" id="inputMpw"
                                                name="mpw" placeholder="비밀번호입력(1 ~ 10자)">
                                            <span id="pwCheckMsg">&nbsp;</span>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user" id="repeatMpw"
                                                placeholder="비밀번호 확인">
                                            <span id="pwConfirmMsg">&nbsp;</span>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <!-- 이름 -->
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="inputMname" class="text-lg font-weight-bold">이름</label>
                                            <input type="text" class="form-control form-control-user" id="inputMname"
                                                name="mname" placeholder="이름입력" required="required">
                                            <span id="nameCheckMsg">&nbsp;</span>
                                        </div>
                                        <!-- 생년월일 -->
                                        <div class="col-sm-6">
                                            <label for="inputMbirth" class="text-lg font-weight-bold">생년월일</label>
                                            <input type="date" class="form-control form-control-user" id="inputMbirth"
                                                name="mbirth" required="required">
                                        </div>
                                    </div>

                                    <!-- 이메일 -->
                                    <label for="inputMemail" class="text-lg font-weight-bold">이메일</label>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" id="inputMemail"
                                            name="memail" placeholder="이메일입력" required="required">
                                    </div>


                                    <!-- 주소 -->
                                    <label for="sample6_postcode" class="text-lg font-weight-bold">주소</label>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user"
                                                id="sample6_postcode" name="mpostcode" placeholder="우편번호">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="button" class="btn btn-primary btn-user btn-block"
                                                onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="sample6_address"
                                            name="maddr" placeholder="주소" required="required">
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user"
                                                id="sample6_detailAddress" name="mdetailAddr" placeholder="상세주소">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control form-control-user"
                                                id="sample6_extraAddress" name="mextraAddr" placeholder="참고항목">
                                        </div>
                                    </div>

                                    <!-- 프로필이미지 -->
                                    <label for="inputProfile" class="text-lg font-weight-bold">프로필이미지</label>
                                    <div class="form-group">
                                        <input type="file" class="form-control form-control-user" id="inputProfile"
                                            name="mfile" style="padding-top: 10px; height: 50px;">
                                    </div>


                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        회원가입
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="login.html">Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Row -->

                    <!-- Content Row -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>



    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <!--
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	-->
    <!-- Page level custom scripts -->
    <!--
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
	-->
</body>
<script type="text/javascript">
    console.log("스크립트 확인!")

    var formIdCheck = false;
    var formPwCheck = false;
    var formNameCheck = false;

    $(document).ready(function () {

        // 아이디 입력 확인
        $("#inputMid").focusout(function () {
            var inputId = $("#inputMid").val();
            console.log("inputId : " + inputId);
            console.log("inputId.length : " + inputId.length)
            if (inputId.length == 0) {
                $("#idCheckMsg").text("아이디를 입력해주세요.").css("color", "red");
                formIdCheck = false;
            } else if (inputId.length > 10) {
                $("#idCheckMsg").text("아이디는 10자 이내입니다.").css("color", "red");
                formIdCheck = false;
            } else {
                $.ajax({
                    type: "get",
                    url: "memberIdCheck",
                    data: {
                        "inputId": inputId
                    },
                    success: function (result) {
                        console.log("result : " + result)
                        // result에 따라 실행
                        if (result == "OK") {
                            $("#idCheckMsg").text("사용가능한 아이디입니다.").css("color", "green");
                            formIdCheck = true;
                        } else if (result == "NG") {
                            $("#idCheckMsg").text("중복된 아이디입니다..").css("color", "red");
                            formIdCheck = false;
                        }

                    }
                })
            }
        })

        // 비밀번호 입력 확인
        $("#inputMpw").keyup(function () {
            var inputPw = $("#inputMpw").val();
            console.log("inputPw : " + inputPw);
            console.log("inputPw.length : " + inputPw.length)
            if (inputPw.length == 0) {
                $("#pwCheckMsg").text("비밀번호를 입력해주세요").css("color", "red");
            } else if (inputPw.length > 10) {
                $("#pwCheckMsg").text("비밀번호는 10자 이내입니다.").css("color", "red");
            } else {
                $("#pwCheckMsg").text("OK").css("color", "green");
            }
        })

        $("#repeatMpw").focusout(function () {
            var inputPw = $("#inputMpw").val();
            var repeatPw = $("#repeatMpw").val();
            console.log("inputPw : " + inputPw);
            console.log("repeatPw : " + repeatPw);
            if (inputPw != repeatPw) {
                $("#pwConfirmMsg").text("비밀번호와 일치하지 않습니다.").css("color", "red");
                formPwCheck = false;
            } else if (inputPw.length == 0 || inputPw.length > 10) {
                $("#pwConfirmMsg").text("비밀번호가 올바르지 않습니다.").css("color", "red");
                formPwCheck = false;
            } else {
                $("#pwConfirmMsg").text("OK").css("color", "green");
                formPwCheck = true;
            }
        })

        // 이름 입력 확인
        $("#inputMname").focusout(function () {
            var inputName = $("#inputMname").val();
            console.log("inputName : " + inputName);
            if (inputName.length == 0) {
                $("#nameCheckMsg").text("이름을 입력해주세요.").css("color", "red");
            } else if (inputName.length > 10) {
                $("#nameCheckMsg").text("이름길이는 10자 이내입니다.").css("color", "red");
            } else {
                $("#nameCheckMsg").text("OK").css("color", "green");
            }
        })
    })

    function joinFormCheck() {
        // 아이디 입력 확인
        if (!formIdCheck) {
            alert("아이디를 확인해주세요!");
            $("#inputMid").focus();
            return false;
        }

        // 비밀번호 입력 확인
        if (!formPwCheck) {
            alert("비밀번호를 확인해주세요!");
            $("#inputMpw").focus();
            return false;
        }

        // 이름 입력 확인
        if (!formNameCheck) {
            alert("이름을 확인해주세요!");
            $("#inputMname").focus();
            return false;
        }
        return true;
    }
</script>

</html>