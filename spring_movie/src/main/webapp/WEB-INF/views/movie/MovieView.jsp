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
                                <div class="card-header" style="font-size: 30px; font-weight: bold;">${movie.mvtitle}
                                </div>
                                <div class="card-body">

                                    <div class="mb-3 border-bottom">
                                        예매율 : ${movie.rerate}% | <span class="text-primary"><i class="fa-regular fa-thumbs-up"></i></span> : ${movie.rvlike} | <span class="text-danger"><i class="fa-regular fa-thumbs-down"></i></span> :
                                        ${movie.rvdislike}
                                    </div>

                                    <div class="mb-3">
                                        감독 : ${movie.mvpd}
                                    </div>

                                    <div class="mb-3">
                                        배우 : ${movie.mvactor}
                                    </div>

                                    <div class="mb-3">
                                        장르 : ${movie.mvgenre}
                                    </div>

                                    <div class="mb-3">
                                        기본 : ${movie.mvage}, ${movie.mvtime}
                                    </div>

                                    <div class="mb-3">
                                        개봉일 : ${movie.mvopen}
                                    </div>

                                    <div class="mb-3">
                                        <a href="#">
                                            <button class="btn btn-danger" type="button">예매하기</button>
                                        </a>
                                    </div>

                                </div>
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
                                                        <c:if test="${reviewInfo.rvmid == sessionScope.loginId}">
                                                            <button class="btn btn-info"
                                                                onclick="myReviewView('${reviewInfo.rvrecode}')">수정하기</button>
                                                        </c:if>
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

        <!-- review Modal -->
        <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">관람평 작성</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">ï¿½</span>
                        </button>
                    </div>
                    <form action="reviewModify">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4 text-center">
                                    <img id="reserve_mvposter" src="" alt="예매영화포스터" style="height: 300px;">
                                </div>
                                <div class="col-8">
                                    <div class="font-weight-bold p-2" id="reserve_mvtitle"></div>
                                    <div class="font-weight-bold p-2" id="reserve_thname"></div>
                                    <div class="font-weight-bold p-2" id="reserve_scdate"></div>
                                    <div class="font-weight-bold p-2" id="reserve_reamount"></div>
                                    <input type="hidden" id="rvrecode" name="rvrecode">
                                    <input type="hidden" id="rvmvcode" name="rvmvcode">
                                    <input type="hidden" id="rvmid" name="rvmid">
                                    <div class="font-weight-bold" style="font-size: 20px;">
                                        <input id="like" type="radio" name="rvrecommend" value="1" checked="checked"> <i
                                            class="fa-regular fa-thumbs-up"></i> 좋아요
                                        <input id="dislike" type="radio" name="rvrecommend" value="0"> <i
                                            class="fa-regular fa-thumbs-down"></i> 별로에요
                                    </div>
                                    <textarea name="rvcomment" id="rvcomment" style="width: 100%; height: 95px;"
                                        placeholder="관람평은 최대 200자까지 작성 가능합니다."></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="submit" class="btn btn-primary" type="submit">수정하기</button>
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

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

    function myreview(mvcode, mid) {
        console.log("내 관람평 보기");
        $.ajax({
            type: "get",
            url: "getMyReview",
            data: {
                "rvmvcode": mvcode,
                "rvmid": mid
            },
            dataType: "json",
            async: false,
            success: function (review) {
                console.log(review);
                output = "";
                for (var i = 0; i < review.length; i++) {
                    console.log('review.mprofile : ' + review[i].mprofile);
                    console.log('review.rvrecommend : ' + review[i].rvrecommend);
                    console.log('review.rvmid : ' + review[i].rvmid);
                    console.log('review.rvcomment : ' + review[i].rvcomment);
                    console.log('review.rvdate : ' + review[i].rvdate);

                    output += '<div class="col-6 mb-3">';
                    output += '<div class="review_grid">';
                    output += '<div class="text-center">';
                    output += '<img src="${pageContext.request.contextPath}/resources/mprofileUpload/' +
                        review[i].mprofile + '" alt="" width="100px">';
                    output += '</div>'
                    output += '<div>'
                    output += '<div class="font-weight-bold text-dark">'

                    if (review[i].rvrecommend == 1) {
                        output +=
                            '<span class="text-primary"><i class="fa-regular fa-thumbs-up"></i></span>'
                    } else {
                        output +=
                            '<span class="text-danger"><i class="fa-regular fa-thumbs-down"></i></span>'
                    }
                    output += review[i].rvmid
                    output += '</div>'
                    output += '<div style="min-height: 100px;">' + review[i].rvcomment + '</div>'
                    output += '<div>' + review[i].rvdate + '</div>'
                    output += '</div>'
                    output += '</div>'
                    output += '</div>'
                }

                $("#review").html(output);
            }
        })
    }
    function myReviewView(rvrecode){
        console.log("관람평 수정하기");
        $.ajax({
            type: "get",
            url: "myReviewView",
            data: {
                "rvrecode": rvrecode
            },
            dataType: "json",
            async: false,
            success:function(result){
                console.log(result);
                
                $("#reserve_mvposter").attr("src", result.mvposter);
                $("#reserve_mvtitle").text("영화 : " + result.mvtitle);
                $("#reserve_thname").text("극장 : " + result.thname);
                $("#reserve_scdate").text("일시 : " + result.scdate);
                $("#reserve_reamount").text("인원 : " + result.reamount + "명");

                $("#rvrecode").val(result.recode);
                $("#rvmvcode").val(result.mvcode);
                $("#rvmid").val('${sessionScope.loginId}');
                $("#rvcomment").val(result.review.rvcomment);
                if(result.review.rvrecommend > 0){
                    $("#like").attr("checked", "checked")
                }else{
                    $("#dislike").attr("checked", "checked")
                }

                $("#reviewModal").modal('show');
                
            }
        })
    }
</script>

</html>