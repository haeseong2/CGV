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
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="includes/AdminSideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="includes/AdminTopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 메인페이지 - AdminMain.jsp</h1>
                    </div>
                    <h2 style="font-size: 15px;">로그인 아이디 : ${sessionScope.loginId}</h2>
                    <h2 style="font-size: 15px;">로그인 프로필 : ${sessionScope.loginProfile}</h2>
                    <h2 style="font-size: 15px;">로그인 타입 : ${sessionScope.loginType}</h2>

                    <!-- Content Row -->

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
    <!-- reserveMsg Modal -->
    <div class="modal fade" id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">영화가 예매되었습니다.</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">ï¿½</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-4">
                            <img id="reserveMsg_mvposter" src="" alt="예매영화포스터" style="height: 200px;">
                        </div>
                        <div class="col-8">
                            <div class="font-weight-bold p-2" id="reserveMsg_recode"></div>
                            <div class="font-weight-bold p-2" id="reserveMsg_mvtitle"></div>
                            <div class="font-weight-bold p-2" id="reserveMsg_thname"></div>
                            <div class="font-weight-bold p-2" id="reserveMsg_scdate"></div>
                            <div class="font-weight-bold p-2" id="reserveMsg_reamount"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    var checkMsg = "${msg}";
    console.log(checkMsg.length);
    if (checkMsg.length > 0) {
        alert(checkMsg);
    }

    var reserveMsg = "${reserveMsg}";
    console.log(reserveMsg.length);
    if(reserveMsg.length > 0){
        $("#reserveMsg_mvposter").attr("src", "${reserveMsg.mvposter}");
        $("#reserveMsg_recode").text("예매코드 : ${reserveMsg.recode}");
        $("#reserveMsg_mvtitle").text("영화 : ${reserveMsg.mvtitle}");
        $("#reserveMsg_thname").text("극장 : ${reserveMsg.thname}");
        $("#reserveMsg_scdate").text("일시 : ${reserveMsg.scdate}");
        $("#reserveMsg_reamount").text("인원 : ${reserveMsg.reamount}");

        $("#reservationModal").modal('show');   // 선택자에 해당하는 modal을 띄움
    }
</script>
</html>