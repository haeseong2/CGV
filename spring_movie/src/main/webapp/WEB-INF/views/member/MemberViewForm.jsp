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
    <title>내정보페이지</title>

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
                        <h1 class="h3 mb-0 text-gray-800">내정보페이지 - MemberViewFrom.jsp</h1>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl-4">
                            <!-- Profile picture card-->
                            <div class="card mb-4 mb-xl-0">
                                <div class="card-header">프로필이미지</div>
                                <div class="card-body text-center">
                                    <!-- Profile picture image-->
                                    <c:choose>
			                        	<c:when test="${sessionScope.loginType == 1}">
		                                    <img class="img-account-profile mb-2" src="${pageContext.request.contextPath}/resources/mprofileUpload/${memberInfo.mprofile}" alt="프로필이미지" height="300px">
			                            </c:when>
			                        	<c:otherwise>
		                                    <img class="img-account-profile mb-2" src="${memberInfo.mprofile}" alt="프로필이미지" height="300px">
			                        	</c:otherwise>
			                        </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <!-- Account details card-->
                            <div class="card mb-4">
                                <div class="card-header">회원정보</div>
                                <div class="card-body">
                                    <form>
                                        
                                        <!-- 아이디 -->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputMid">아이디</label>
                                            <input class="form-control" id="inputMid" type="text"  value="${memberInfo.mid}">
                                        </div>

                                        <!-- 비밀번호 -->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputMpw">비밀번호</label>
                                            <input class="form-control" id="inputMpw" type="password" value="${memberInfo.mpw}">
                                        </div>

                                        <!-- 이름 -->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputMname">이름</label>
                                            <input class="form-control" id="inputMname" type="text" value="${memberInfo.mname}">
                                        </div>

                                        <!-- 생년월일 -->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputMbirth">생년월일</label>
                                            <input class="form-control" id="inputMbirth" type="date" value="${memberInfo.mbirth}">
                                        </div>

                                        <!-- 이메일 -->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputMemail">이메일</label>
                                            <input class="form-control" id="inputMemail" type="email" value="${memberInfo.memail}">
                                        </div>

                                        <!-- 주소 -->
                                        <label class="small mb-1" for="sample6_postcode">주소</label>
                                        <div class="row gx-3 mb-3">
                                            <!-- 우편번호 -->
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" id="sample6_postcode" name="mpostcode" value="${memberInfo.mpostcode}">
                                            </div>
                                            <!-- 주소 -->
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="sample6_address"  name="maddr" value="${memberInfo.maddr}">
                                            </div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <!-- 상세주소 -->
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="sample6_detailAddress" name="mdetailAddr" value="${memberInfo.mdetailAddr}">
                                            </div>
                                            <!-- 참고항목 -->
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="sample6_extraAddress" name="mextraAddr" value="${memberInfo.mextraAddr}">
                                            </div>
                                        </div>

                                        <!-- Save changes button-->
                                        <button class="btn btn-primary" type="button">회원정보 수정</button>
                                    </form>
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
    $(document).ready(function(){
        $(".form-control").attr("readonly", "readonly")
    })
</script>
</html>