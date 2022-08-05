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

    <!-- icon -->
    <script src="https://kit.fontawesome.com/a6d95e01a9.js" crossorigin="anonymous"></script>

    <style type="text/css">
        .card-body {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .card-header {
            text-align: center;
        }

        .mvtitle a:hover {
            text-decoration: none;
        }

        .mvtitle {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="../includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="../includes/TopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">영화목록페이지 - MovieChart.jsp</h1>
                    </div>

                    <!-- Content Row -->

                    <div class="row">
                        <c:forEach items="${movieList}" var="movieList">
                            <div class="col-xl-3 col-md-6 col-sm-12 mb-4">
                                <div class="card">
                                    <div class="card-header">
                                        <a href="${pageContext.request.contextPath}/movieView?mvcode=${movieList.mvcode}">
                                            <img src="${movieList.mvposter}" alt="영화포스터" height="300px"></div>
                                    </a>
                                    <div class="card-body mvtitle">
                                        <a href="${pageContext.request.contextPath}/movieView?mvcode=${movieList.mvcode}">${movieList.mvtitle}</a>
                                    </div>
                                    <div class="card-footer" style="border: none; background-color: white;">
                                        <div class="text-gray-900 fs-5 font-weight-bold">예매율 : ${movieList.rerate}% <br> <span class="text-primary"><i class="fa-regular fa-thumbs-up"></i></span> : ${movieList.rvlike} | <span class="text-danger"><i class="fa-regular fa-thumbs-down"></i></span> : ${movieList.rvdislike}</div> 
                                        <div class="text-gray-900 fs-5 font-weight-bold">${movieList.mvopen} 개봉
                                        </div>
                                        <div><a class="btn btn-danger" href="movieReservationPage?mvcode=${movieList.mvcode}">예매하기</a></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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

</html>