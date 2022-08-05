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
                        <h1 class="h3 mb-0 text-gray-800">예매내역확인 - ReservationList.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">예매목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>영화제목</th>
                                            <th>극장</th>
                                            <th>상영관</th>
                                            <th>일시</th>
                                            <th>예매인원</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th>영화제목</th>
                                            <th>극장</th>
                                            <th>상영관</th>
                                            <th>일시</th>
                                            <th>예매인원</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <!-- c:set >> 사용할 변수선언 -->
                                        <c:set var="today" value="<%=new Date() %>"></c:set>
                                        <c:forEach items="${reservationList}" var="reservationInfo">
                                            <tr>
                                                <td class="align-middle text-center"><img
                                                        src="${reservationInfo.mvposter}" alt="예매영화포스터" height="100px">
                                                </td>
                                                <td class="align-middle font-weight-bold">${reservationInfo.mvtitle}
                                                </td>
                                                <td class="align-middle font-weight-bold">${reservationInfo.thname}</td>
                                                <td class="align-middle font-weight-bold">${reservationInfo.scroom}</td>
                                                <td class="align-middle font-weight-bold">${reservationInfo.scdate}</td>
                                                <td class="align-middle font-weight-bold">${reservationInfo.reamount}명
                                                </td>
                                                <td class="align-middle">
                                                    <fmt:parseDate value="${reservationInfo.scdate}" var="scdate_fm" pattern="yyyy-MM-dd HH:mm"></fmt:parseDate>
                                                    <c:choose>
                                                        <c:when test="${scdate_fm > today}">
                                                            <a href="cancelReservation?recode=${reservationInfo.recode}"
                                                                class="btn btn-danger">예매취소</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${reservationInfo.rvcheck == null}">
                                                                    <button class="btn btn-primary" onclick="reviewWrite('${reservationInfo}')">관람평 작성</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- <button class="btn btn-secondary" onclick="reviewView('${reservationInfo}')">관람평 보기</button> -->
                                                                    <a href="movieView?mvcode=${reservationInfo.mvcode}" class="btn btn-secondary">관람평 보기</a>
                                                                </c:otherwise>
                                                            </c:choose>
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

    <!-- review Modal -->
    <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">관람평 작성</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">ï¿½</span>
                    </button>
                </div>
                <form action="reviewWrite">
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
                                    <input id="like" type="radio" name="rvrecommend" value="1" checked="checked"> <i class="fa-regular fa-thumbs-up"></i> 좋아요
                                    <input id="dislike" type="radio" name="rvrecommend" value="0"> <i class="fa-regular fa-thumbs-down"></i> 별로에요
                                </div>
                                <textarea name="rvcomment" id="rvcomment" style="width: 100%; height: 95px;" placeholder="관람평은 최대 200자까지 작성 가능합니다."></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="submit" class="btn btn-primary" type="submit">작성</button>
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

    function reviewWrite(reservationInfo) {
        // 객체를 매개변수로 받을 경우 객체는 한줄의 문자열 값으로 저장되므로 JS에서 사용할 수 있게 dictionary형식으로 변환하여야 한다.
        // 객체를 dictionaray형식으로 변환하기
        var row = reservationInfo.replaceAll(", ", ",").split("(")[1].split(")")[0].split(",")
        //                        공백 제거, "("기준으로 오른쪽, ")"기준으로 왼쪽, ","를 기준으로 나눔
        var reserveData = {};       // dictionary방식의 객체 생성
        for(var i = 0; i < row.length; i++){
            var key = row[i].split("=")[0];     // key값
            var val = row[i].split("=")[1];     // value값
            reserveData[key] = val;             // key-value쌍으로 dictionary자료 입력
        }
        console.log(reserveData);
        
        $("#reserve_mvposter").attr("src", reserveData.mvposter);
        $("#reserve_mvtitle").text("영화 : " + reserveData.mvtitle);
        $("#reserve_thname").text("극장 : " + reserveData.thname);
        $("#reserve_scdate").text("일시 : " + reserveData.scdate);
        $("#reserve_reamount").text("인원 : " + reserveData.reamount + "명");

        $("#rvrecode").val(reserveData.recode);
        $("#rvmvcode").val(reserveData.mvcode);
        $("#rvmid").val('${sessionScope.loginId}');
        
        if('${sessionScope.loginId}' == null){
            alert("로그인이 필요합니다.")
        } else{
            $("#reviewModal").modal('show');
        }

    }

    function reviewView(reservationInfo){
        var row = reservationInfo.replaceAll(", ", ",").split("(")[1].split(")")[0].split(",")
        //                        공백 제거, "("기준으로 오른쪽, ")"기준으로 왼쪽, ","를 기준으로 나눔
        var reserveData = {};       // dictionary방식의 객체 생성
        for(var i = 0; i < row.length; i++){
            var key = row[i].split("=")[0];     // key값
            var val = row[i].split("=")[1];     // value값
            reserveData[key] = val;             // key-value쌍으로 dictionary자료 입력
        }
        console.log(reserveData);
        console.log("recode : " + reserveData.recode);
        $.ajax({
            type : "get",
            url : "reviewView",
            data : {
                "recode" : reserveData.recode
            },
            dataType: "json",
            async: false,
            success:function(review){
                console.log(review);
                $("#reserve_mvposter").attr("src", reserveData.mvposter);
                $("#reserve_mvtitle").text("영화 : " + reserveData.mvtitle);
                $("#reserve_thname").text("극장 : " + reserveData.thname);
                $("#reserve_scdate").text("일시 : " + reserveData.scdate);
                $("#reserve_reamount").text("인원 : " + reserveData.reamount + "명");

                $("#rvrecode").val(reserveData.recode);
                $("#rvmvcode").val(reserveData.mvcode);
                $("#rvmid").val('${sessionScope.loginId}');
                $("#rvcomment").val(review.rvcomment);
                $("#rvcomment").attr("readonly", "readonly");
                if(review.rvrecommend > 0){
                    $("#like").attr("checked", "checked")
                }else{
                    $("#dislike").attr("checked", "checked")
                }
                $("#submit").attr("hidden", "hidden");

                $("#reviewModal").modal('show');
            }
        })
    }
</script>

</html>