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
        .review_grid {
            display: grid;
            grid-template-columns: 120px 1fr 100px;
        }

        input {
            width: 500px;
        }

        .grid {
            display: grid;
            grid-template-columns: 80px 1fr;
        }
        .btn-dNone{
            display: none;
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
                        <h1 class="h3 mb-0 text-gray-800">영화 상세페이지 - MovieView.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl-4">
                            <!-- Profile picture card-->
                            <div class="card mb-4 mb-xl-0">
                                <div class="card-body text-center">
                                    <!-- Profile picture image-->
                                    <img src="${movie.mvposter}" alt="영화포스터" height="400px">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <!-- Account details card-->

                            <div class="card mb-4">
                                <div class="card-header">
                                    <div style="display: grid; grid-template-columns: 1fr 80px;">
                                        <div>
                                            <span style="font-size: 30px; font-weight: bold;">${movie.mvtitle}</span>
                                        </div>
                                        <div class="text-center">
                                            <c:choose>
                                                <c:when test="${movie.mvstate == 1}">
                                                    <button class="btn btn-primary" onclick="modifyMvstate('${movie.mvcode}', this)">사용중</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="btn btn-danger" onclick="modifyMvstate('${movie.mvcode}', this)">중지됨</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <form action="modifyMovie" method="post">
                                    <div class="card-body">
                                        <div class="mb-3 border-bottom">
                                            예매율 : ${movie.rerate}% | <span class="text-primary"><i class="fa-regular fa-thumbs-up"></i></span> : ${movie.rvlike} | <span class="text-danger"><i class="fa-regular fa-thumbs-down"></i></span> : ${movie.rvdislike}
                                        </div>
                                        <input type="hidden" value="${movie.mvcode}" name="mvcode">
                                        <div class="mb-3 grid">
                                            <div class="align-self-center">감독 : </div>
                                            <div><input class="form-control" type="text" value="${movie.mvpd}" name="mvpd" id="md_mvpd" readonly="readonly"></div>
                                        </div>

                                        <div class="mb-3 grid">
                                            <div class="align-self-center">배우 : </div>
                                            <div><input class="form-control" type="text" value="${movie.mvactor}" name="mvactor" id="md_mvactor" readonly="readonly"></div>
                                        </div>

                                        <div class="mb-3 grid">
                                            <div class="align-self-center">장르 : </div>
                                            <div><input class="form-control" type="text" value="${movie.mvgenre}" name="mvgenre" id="md_mvgenre" readonly="readonly"></div>
                                        </div>

                                        <div class="mb-3 grid">
                                            <div class="align-self-center">관람연령 : </div>
                                            <div><input class="form-control" type="text" value="${movie.mvage}" name="mvage" id="md_mvage" readonly="readonly"></div>
                                        </div>
                                        <div class="mb-3 grid">
                                            <div class="align-self-center">러닝타임 : </div>
                                            <div><input class="form-control" type="text" value="${movie.mvtime}" name="mvtime" id="md_mvtime" readonly="readonly"></div>
                                        </div>
                                        <div class="mb-3 grid">
                                            <div class="align-self-center">개봉일 : </div>
                                            <div><input class="form-control" type="date" value="${movie.mvopen}" name="mvopen" id="md_mvopen" readonly="readonly"></div>
                                        </div>
                                        <!-- button 3개 만들고 display속성으로 토글처럼 보이게 만듬 -->
                                        <div class="mb-3" style="float: right;">
                                            <button id="openBtn" type="button" class="btn btn-success" onclick="modifyOpen()">정보수정</button>
                                            <button id="subBtn" type="submit" class="btn btn-warning btn-dNone" )">수정하기</button>
                                            <button id="closeBtn" type="button" class="btn btn-secondary btn-dNone" onclick="modifyClose()">취소</button>
                                        </div>
                                    </div>
                                </form>
                                <button class="btn btn-warning" onclick="modifyMovieInfo()">modal로 수정하기</button>
                            </div>
                        </div>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header" style="font-size: 30px; font-weight: bold;">
                                    관람평
                                    <c:if test="${sessionScope.loginId != null}">
                                        <button class="btn btn-danger" style="font-size: 15px; float: right;" onclick="myreview('${movie.mvcode}', '${sessionScope.loginId}')">내 관람평 보기</button>
                                        <button class="btn btn-success" style="font-size: 15px; float: right; margin-right: 10px;" onclick="myreview('${movie.mvcode}', null)">전체 관람평 보기</button>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <div class="row" id="review">
                                        <c:forEach items="${reviewList}" var="reviewInfo">
                                            <div class="col-6 mb-3">
                                                <div class="review_grid">
                                                    <div class="text-center">
                                                        <img src="${pageContext.request.contextPath}/resources/mprofileUpload/${reviewInfo.mprofile}" alt="" width="100px">
                                                    </div>
                                                    <div>
                                                        <div class="font-weight-bold text-dark">
                                                            <c:choose>
                                                                <c:when test="${reviewInfo.rvrecommend == 1}">
                                                                    <span class="text-primary"><i class="fa-regular fa-thumbs-up"></i></span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-danger"><i class="fa-regular fa-thumbs-down"></i></span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            ${reviewInfo.rvmid}
                                                        </div>
                                                        <div style="min-height: 100px;">${reviewInfo.rvcomment}</div>
                                                        <div>${reviewInfo.rvdate}</div>
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info" onclick="deleteReview('${reviewInfo.rvrecode}')">삭제하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
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

    <!-- modify Modal -->
    <div class="modal fade" id="modifyMoiveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">영화정보 수정</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">ï¿½</span>
                    </button>
                </div>
                <form action="adminModifyMovie" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-4 text-center">
                                <img id="modify_mvposter" src="" alt="예매영화포스터" style="height: 300px;">
                            </div>
                            <div class="col-8">
                                <div class="grid mb-3">
                                    <div class="align-self-center">영화제목 : </div>
                                    <div><input type="text" class="form-control" id="modify_mvtitle" readonly="readonly"></div>
                                </div>
                                <div class="grid mb-3">
                                    <div class="align-self-center">감독 : </div>
                                    <div><input type="text" class="form-control" id="modify_mvpd" name="mvpd"></div>
                                </div>
                                <div class="grid mb-3">
                                    <div class="align-self-center">배우 : </div>
                                    <div><input type="text" class="form-control" id="modify_mvactor" name="mvactor"></div>
                                </div>
                                <div class="grid mb-3">
                                    <div class="align-self-center">장르 : </div>
                                    <div><input type="text" class="form-control" id="modify_mvgenre" name="mvgenre"></div>
                                </div>
                                <div class="grid mb-3">
                                    <div class="align-self-center">연령제한 : </div>
                                    <div><input type="text" class="form-control" id="modify_mvage" name="mvage"></div>
                                </div>
                                <div class="grid mb-3">
                                    <div class="align-self-center">러닝타임 : </div>
                                    <div><input type="text" class="form-control" id="modify_mvtime" name="mvtime"></div>
                                </div>
                                <div class="grid mb-3">
                                    <div class="align-self-center">개봉일 : </div>
                                    <div><input type="date" class="form-control" id="modify_mvopen" name="mvopen"></div>
                                </div>
                                <input type="hidden" id="modify_mvcode" name="mvcode">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-warning" )">수정하기</button>
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>





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

    function modifyMvstate(mvcode, btnObj) {
        console.log("modifyMvstate() 호출");
        var mvstate;
        if ($(btnObj).hasClass("btn-primary")) {
            mvstate = 1;
        } else {
            mvstate = 0;
        }

        $.ajax({
            type: "get",
            url: "modifyMvstate",
            data: {
                "mvcode": mvcode,
                "mvstate": mvstate
            },
            dataType: "json",
            async: false,
            success: function (result) {
                $(btnObj).toggleClass("btn-primary");
                $(btnObj).toggleClass("btn-danger");
                if (result.mvstate == 1) {
                    $(btnObj).text("사용중");
                } else {
                    $(btnObj).text("중지됨");
                }
            }
        })
    }

    function deleteReview(rvrecode) {
        console.log("rvrecode : " + rvrecode);
    }

    function modifyMovieInfo(movieInfo) {
        console.log("영화 수정하기");
        console.log(movieInfo);
        console.log('${movie.mvcode}');

        // 1. movie객체로 받아오기
        // 2. mvcode를 이용해 ajax로 데이터 가져오기
        
        $("#modify_mvposter").attr("src", '${movie.mvposter}');
        $("#modify_mvtitle").val('${movie.mvtitle}');
        $("#modify_mvpd").val('${movie.mvpd}');
        $("#modify_mvactor").val('${movie.mvactor}');
        $("#modify_mvgenre").val('${movie.mvgenre}');
        $("#modify_mvage").val('${movie.mvage}');
        $("#modify_mvtime").val('${movie.mvtime}');
        $("#modify_mvopen").val('${movie.mvopen}');
        $("#modify_mvcode").val('${movie.mvcode}');

        $("#modifyMoiveModal").modal("show");
    }

    function modifyOpen(){

        $("#md_mvpd").removeAttr("readonly");
        $("#md_mvactor").removeAttr("readonly");
        $("#md_mvgenre").removeAttr("readonly");
        $("#md_mvage").removeAttr("readonly");
        $("#md_mvtime").removeAttr("readonly");
        $("#md_mvopen").removeAttr("readonly");

        $("#openBtn").toggleClass("btn-dNone");
        $("#subBtn").toggleClass("btn-dNone");
        $("#closeBtn").toggleClass("btn-dNone");
    }

    function modifyClose(){

        $("#md_mvpd").attr("readonly", "readonly");
        $("#md_mvactor").attr("readonly", "readonly");
        $("#md_mvgenre").attr("readonly", "readonly");
        $("#md_mvage").attr("readonly", "readonly");
        $("#md_mvtime").attr("readonly", "readonly");
        $("#md_mvopen").attr("readonly", "readonly");

        $("#openBtn").toggleClass("btn-dNone");
        $("#subBtn").toggleClass("btn-dNone");
        $("#closeBtn").toggleClass("btn-dNone");
    }
</script>

</html>