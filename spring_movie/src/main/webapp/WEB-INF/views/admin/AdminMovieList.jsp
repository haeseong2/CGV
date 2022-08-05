<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
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

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
        rel="stylesheet">

    <!-- icon -->
    <script src="https://kit.fontawesome.com/a6d95e01a9.js" crossorigin="anonymous"></script>

    <style>
        td,
        th {
            font-size: 18px;
            color: black;
            margin: 3px;
            text-align: center;
        }
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="../includes/AdminSideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="../includes/AdminTopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 영화목록 - AdminMovieList.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">영화목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <!-- 75 , -, -, 75, 90, 75 -->
                                            <th>영화코드</th>
                                            <th>영화제목</th>
                                            <th>영화장르</th>
                                            <th>관람등급</th>
                                            <th>개봉일</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>영화코드</th>
                                            <th>영화제목</th>
                                            <th>영화장르</th>
                                            <th>관람등급</th>
                                            <th>개봉일</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <!-- c:set >> 사용할 변수선언 -->
                                        <c:set var="today" value="<%=new Date() %>"></c:set>
                                        <c:forEach items="${movieList}" var="movieInfo">
                                            <tr id="${movieInfo.mvcode}">
                                                <td class="align-middle text-center">
                                                	<c:choose>
                                                		<c:when test="${movieInfo.mvstate == 1}">
		                                                    <a class="text-decoration-non text-primary" href="adminMovieView?mvcode=${movieInfo.mvcode}">${movieInfo.mvcode}</a>
                                                		</c:when>
                                                		<c:otherwise>
	                                                		<a class="text-decoration-non text-danger" href="adminMovieView?mvcode=${movieInfo.mvcode}">${movieInfo.mvcode}</a>
                                                		</c:otherwise>
                                                	</c:choose>
                                                </td>
                                                <td class="align-middle font-weight-bold">
                                                	<c:choose>
                                                		<c:when test="${movieInfo.mvstate == 1}">
		                                                    <a class="text-decoration-non text-primary" href="adminMovieView?mvcode=${movieInfo.mvcode}">${movieInfo.mvtitle}</a>
                                                		</c:when>
                                                		<c:otherwise>
                                                			<a class="text-decoration-non text-danger" href="adminMovieView?mvcode=${movieInfo.mvcode}">${movieInfo.mvtitle}</a>
                                                		</c:otherwise>
                                                	</c:choose>
                                                </td>
                                                <td class="align-middle text-center">${movieInfo.mvgenre}</td>
                                                <td class="align-middle text-center">${movieInfo.mvage}</td>
                                                <td class="align-middle text-center">${movieInfo.mvopen}</td>
                                                <td class="align-middle">
                                                    <c:choose>
                                                		<c:when test="${movieInfo.mvstate == 1}">
                                                            <button class="btn btn-primary" onclick="modifyMvstate('${movieInfo.mvcode}', '${movieInfo.mvstate}')">사용중</button>
                                                		</c:when>
                                                		<c:otherwise>
                                                            <button class="btn btn-danger" onclick="modifyMvstate('${movieInfo.mvcode}', '${movieInfo.mvstate}')">중지됨</button>
                                                		</c:otherwise>
                                                	</c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
</body>
<script type="text/javascript">
    var checkMsg = "${msg}";
    console.log(checkMsg.length);
    if (checkMsg.length > 0) {
        alert(checkMsg);
    }

    function modifyMvstate(mvcode, mvstate){
        console.log("mvcode : " + mvcode);
        console.log("mvstate : " + mvstate);
        // this로 tag object를 가져왔을 경우 class존재 유무 or text 비교등으로 구분 하여 mvstate값 지정
        // $(object).hasClass : : 클래스가 존재하면 true, 없으면 false를 return
        // $(object).text() : : 해당 태그안의 text를 return

        // $(selector).toggleClass("A");
        // $(selector).toggleClass("B");
        //      >> "A" 클래스와 "B"클래스를 토글형식으로 만듬
        
        $.ajax({
            type : "get",
            url : "adminModifyMvstate",
            data : {"mvcode" : mvcode, "mvstate" : mvstate},
            dataType : "json",
            async : false,
            success : function(result){
                console.log(result);
                var output = "";
                output += '<td class="align-middle text-center">';
                if(result.mvstate == 1){
                    output += '<a class="text-decoration-non text-primary" href="adminMovieView?mvcode=' + result.mvcode + '">' + result.mvcode + '</a>';
                }else{
                    output += '<a class="text-decoration-non text-danger" href="adminMovieView?mvcode=' + result.mvcode + '">' + result.mvcode + '</a>';
                }
                output += '</td>';
                output += '<td class="align-middle font-weight-bold">';
                if(result.mvstate == 1){
                    output += '<a class="text-decoration-non text-primary" href="adminMovieView?mvcode=' + result.mvcode + '">' + result.mvtitle + '</a>'
                }else{
                    output += '<a class="text-decoration-non text-danger" href="adminMovieView?mvcode=' + result.mvcode + '">' + result.mvtitle + '</a>'
                }
                output += '</td>'
                output += '<td class="align-middle text-center">' + result.mvgenre + '</td>';
                output += '<td class="align-middle text-center">' + result.mvage + '</td>';
                output += '<td class="align-middle text-center">' + result.mvopen + '</td>';
                output += '<td class="align-middle">';
                if(result.mvstate == 1){
                    output += '<button class="btn btn-primary" onclick="modifyMvstate(\'' + result.mvcode + '\', \'' + result.mvstate + '\')">사용중</button>';
                }else{
                    output += '<button class="btn btn-danger" onclick="modifyMvstate(\'' + result.mvcode + '\', \'' + result.mvstate + '\')">중지됨</button>';
                }
                output += '</td>'
                console.log(output);
                $("#"+mvcode).html(output);
            }
        })
    }

</script>

</html>