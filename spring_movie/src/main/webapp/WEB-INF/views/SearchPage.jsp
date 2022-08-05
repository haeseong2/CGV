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

    <style>
        #scmvgrid{
            display: grid;
            grid-template-columns: 240px 1fr;
        }
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="includes/TopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">검색결과페이지 - SearchPage.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="mb-5">
                        <h3 class="mb-3">지금 예매 가능한 영화</h3>
                        <c:if test="${searchScMvResult == null}">
                            <div>검색결과가 없습니다.</div>
                        </c:if>
                        <div class="row">
                            <c:forEach items="${searchScMvResult}" var="scMvList">
                                <div class="col-6">
                                    <div id="scmvgrid">
                                        <div class="text-center">
                                            <img src="${scMvList.mvposter}" alt="영화포스터" style="width: 200px;">
                                        </div>
                                        <div>
                                            <div>${scMvList.mvtitle}</div>
                                            <div>
                                                <span>예매율 : ${scMvList.rerate}%</span>
                                                <span>
                                                    &nbsp;|&nbsp;
                                                    <span class="text-primary"><i class="fa-regular fa-thumbs-up"></i></span>
                                                    ${scMvList.rvlike}
                                                </span>
                                                <br>
                                                <span>
                                                    &nbsp;|&nbsp;
                                                    ${scMvList.mvopen} 개봉
                                                </span>
                                            </div>
                                            <hr>
                                            <div>
                                                영화설명
                                                <div>감독 : ${scMvList.mvpd}</div>
                                                <div>배우 : ${scMvList.mvactor}</div>
                                                <div>장르 : ${scMvList.mvgenre}</div>
                                                <div>${scMvList.mvage} | ${scMvList.mvtime}분</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Content Row -->
                    <div class="mb-5">
                        <h3 class="mb-3">영화 검색결과</h3>
                        <div class="row">
                        <c:if test="${searchMvResult == ''}">
                            <div>검색결과가 없습니다.</div>
                        </c:if>
                            <c:forEach items="${searchMvResult}" var="mvList">
                                <div class="col-4">
                                    <div class="card">
                                        <div class="card-header text-center"><img src="${mvList.mvposter}" alt="영화포스터" style="width: 300px;"></div>
                                        <div class="card-body" style="font-size: 30px;color: black;font-weight: bold;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${mvList.mvtitle}</div>
                                        <div class="card-footer" style="border: none; background-color: white;">
                                            ${mvList.mvopen}
                                            &nbsp;
                                            |
                                            &nbsp;
                                            <span class="text-primary"><i class="fa-regular fa-thumbs-up"></i></span>
                                            ${mvList.rvlike}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
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
    var checkMsg = "${msg}";
    console.log(checkMsg.length);
    if (checkMsg.length > 0) {
        alert(checkMsg);
    }
</script>

</html>