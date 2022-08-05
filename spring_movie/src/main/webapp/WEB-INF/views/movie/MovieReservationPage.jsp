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
    <style>
        .listArea {
            margin: 10px;
            border-radius: 5px;
        }

        .listArea:hover {
            cursor: pointer;
        }

        .thSet {
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
                        <h1 class="h3 mb-0 text-gray-800">영화예매 페이지 - MovieReservationPage.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <!-- 영화, 극장, 날짜및시간, 상영관 선택 -->
                    <div class="row">
                        <div class="col-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">영화</h6>
                                </div>
                                <c:forEach items="${reMvList}" var="reMvList">
                                    <div id="${reMvList.mvcode}" class="card-body listArea mvList text-gray-900 fw-bold" onclick="mvSelect(this, '${reMvList.mvcode}', '${reMvList.mvposter}' )">${reMvList.mvtitle}</div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">극장목록</h6>
                                </div>
                                <div id="thList">
                                    <c:forEach items="${reThList}" var="reThList">
                                        <div class="card-body listArea thList text-gray-900 fw-bold"
                                            onclick="thSelect(this, '${reThList.thcode}')">${reThList.thname}</div>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                        <div class="col-2">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">날짜선택</h6>
                                </div>
                                <div id="scDateList">
                                    <div class="card-body">
                                        관람일
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">상영관 및 시간</h6>
                                </div>
                                <div id="scRoomTimeList">
                                    <div class="card-body">
                                        상영관, 시간
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Row -->
                    <!-- 선택항목 확인 -->
                    <div class="row mt-5">
                        <div class="col-5 " style="border-right: 2px solid black;">
                            <!-- 선택 영화 정보 -->
                            <div class="row">
                                <div class="col-6 card-body p-1" style="text-align: center;">
                                    <!-- <p>포스터</p> -->
                                    <img src="" alt="" id="mvposter" width="100px">
                                </div>
                                <div class="col-6 card-body" id="mvtitle"
                                    style="vertical-align: bottom; font-weight: bold;">
                                    <!-- <p>영화제목</p> -->
                                </div>
                            </div>
                        </div>
                        <div class="col-3 " style="border-right: 2px solid black;">
                            <!-- 선택 극장 및 상영관 정보 -->
                            <div class="card-body p-1">
                                <span>극장&nbsp;&nbsp;>>&nbsp;&nbsp;</span>
                                <span class="font-weight-bold thSet" id="theater"></span>
                            </div>
                            <div class="card-body p-1">
                                <span>일시&nbsp;&nbsp;>>&nbsp;&nbsp;</span>
                                <span class="font-weight-bold thSet" id="scdate"></span>
                                <span class="font-weight-bold thSet" id="sctime"></span>
                            </div>
                            <div class="card-body p-1">
                                <span>상영관&nbsp;&nbsp;>>&nbsp;&nbsp;</span>
                                <span class="font-weight-bold thSet" id="scroom"></span>
                            </div>
                            <div class="card-body p-1">
                                <span class="thSet">인원&nbsp;&nbsp;>>&nbsp;&nbsp;</span>
                                <span class="font-weight-bold thset" id="psel"></span>
                            </div>
                        </div>
                        <div class="col-2 " style="border-right: 2px solid black;">
                            인원수 입력
                            <br>
                            <button class="btn btn-light border border-3 pSel" onclick="peopleSelect(this)">1</button>
                            <button class="btn btn-light border border-3 pSel" onclick="peopleSelect(this)">2</button>
                            <button class="btn btn-light border border-3 pSel" onclick="peopleSelect(this)">3</button>
                            <button class="btn btn-light border border-3 pSel" onclick="peopleSelect(this)">4</button>
                            <button class="btn btn-light border border-3 pSel" onclick="peopleSelect(this)">5</button>
                        </div>
                        <div class="col-2">
                            <!-- 예매하기 버튼 -->
                            <form action="movieReservation" method="post" onsubmit="return reservationFormCheck()">
                                <input type="hidden" id="remid" name="remid" value="${sessionScope.loginId}">
                                <input type="hidden" id="rescthcode" name="rescthcode">
                                <input type="hidden" id="rescdate" name="rescdate">
                                <input type="hidden" id="rescroom" name="rescroom">
                                <input type="hidden" id="reamount" name="reamount">
                                <input class="btn btn-primary" type="submit" value="예매하기">
                            </form>
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
    var selectReMvcode = ""; // 선택한 영화코드
    var selectReThcode = ""; // 선택한 극장코드
    var selectReDate = "";   // 선택한 날짜
    function mvSelect(selmvObj, selMvcode, selMvposter) {

        // 영화목록 css 변경
        console.log("selMvcode : " + selMvcode);
        $(".mvList").css("background-color", "");
        $(selmvObj).css("background-color", "lightblue");
        selectReMvcode = selMvcode;
        $(".thList").css("background-color", "");

        // 극장 목록 조회 및 출력
        $.ajax({
            type: "get",
            url: "getThList",
            data: {
                "mvcode": selMvcode
            },
            dataType: "json",
            async: false,
            success: function (thList) {
                var output = "";
                for (var i = 0; i < thList.length; i++) {
                    output += "<div class=\"card-body listArea text-gray-900 fw-bold thList\" onclick=\"thSelect(this,\'" + thList[i].thcode + "\', \'" + thList[i].thname + "\')\">";
                    output += thList[i].thname;
                    output += "</div>";
                }
                $("#thList").html(output)
            }
        })

        // 선택내용 출력
        console.log("mvname : " + $(selmvObj).text());
        console.log("selMvposter : " + selMvposter);
        $("#mvposter").attr("src", selMvposter)
        $("#mvtitle").text($(selmvObj).text());

        $("#scDateList").html("<div class='card-body'>관람일</div>");
        $("#scRoomTimeList").html("<div class='card-body'>상영관, 시간</div>");
        
        // 하단 정보 초기화
        $("#theater").text("");
        $("#scdate").text("");
        $("#scroom").text("");
        $("#sctime").text("");

        // 예매form 초기화
        $("#rescthcode").val("");
        $("#rescroom").val("");
        $("#rescdate").val("");
        // $("#reamount").val("");
    }

    function thSelect(selThObj, selThcode, selThname) {
        // 극장 선택 css
        console.log("mvcode : " + selectReMvcode);
        console.log("selThcode : " + selThcode);
        selectReThcode = selThcode;
        $(".thList").css("background-color", "");
        $(selThObj).css("background-color", "lightblue");
        $(".scDateList").css("background-color", "");
        $(".scRoomTimeList").css("background-color", "");

        $("#theater").text(selThname);
        $("#rescthcode").val(selThcode);

        // 예매가능한 날짜 목록 조회 및 출력
        $.ajax({
            type: "get",
            url: "getScDateList",
            data: {
                "mvcode": selectReMvcode,
                "thcode": selectReThcode
            },
            dataType: "json",
            async: false,
            success: function (scDateList) {
                
                var output = "";
                for (var i = 0; i < scDateList.length; i++) {
                    output += "<div class=\"card-body listArea text-gray-900 fw-bold scDateList\" onclick=\"scDateSelect(this,'" + scDateList[i].scdate + "')\">";
                    output += scDateList[i].scdate;
                    output += "</div>";
                }
                $("#scDateList").html(output)
                
            }
        })

        // 초기화
        $("#scRoomTimeList").html("<div class='card-body'>상영관, 시간</div>");
        $("#scdate").text("");
        $("#scroom").text("");
        $("#sctime").text("");

        // form 초기화
        $("#rescroom").val("");
        $("#rescdate").val("");
        // $("#reamount").val("");
    }

    function scDateSelect(selScDateObj, selScDate) {
        console.log("mvcode : " + selectReMvcode);
        console.log("thcode : " + selectReThcode);
        console.log("scdate : " + selScDate);
        $(".scDateList").css("background-color", "");
        $(selScDateObj).css("background-color", "lightblue");
        $(".scRoomTimeList").css("background-color", "");

        $("#scdate").text(selScDate);
        selectReDate = selScDate;
        // 예매가능한 날짜 목록 조회 및 출력
        $.ajax({
            type: "get",
            url: "getScRoomTimeList",
            data: {
                "mvcode": selectReMvcode,
                "thcode": selectReThcode,
                "scdate": selScDate
            },
            dataType: "json",
            async: false,
            success: function (scRoomTimeList) {
                var output = "";
                /*
                for (var i = 0; i < scRoomTimeList.length; i++) {
                    output += "<div class=\"card-body listArea text-gray-900 fw-bold scRoomTimeList\" onclick=\"scRoomTimeSelect(this,\'" + scRoomTimeList[i].scroom + "\', \'" + scRoomTimeList[i].scdate + "\')\">";
                    output += "[" + scRoomTimeList[i].scroom + "] ";
                    output += scRoomTimeList[i].scdate;
                    output += "</div>";
                }
                */
                
                var scroom = ""; // 비교를 위한 변수
                for (var i = 0; i < scRoomTimeList.length; i++) {
                    if (scRoomTimeList[i].scroom != scroom) {
                        if (i != 0) {
                            output += "<hr>"
                        }
                        output += "<div class='card-body font-weight-bold p-1'>[" + scRoomTimeList[i].scroom + "]</div>";
                        scroom = scRoomTimeList[i].scroom;
                    }
                    output +="<button class=\"btn border border-3 listArea text-gray-900 fw-bold scRoomTimeList\" onclick=\"scRoomTimeSelect(this,\'" +
                        scRoomTimeList[i].scroom + "\', \'" + scRoomTimeList[i].scdate + "\')\">";
                    output += scRoomTimeList[i].scdate;
                    output += "</button>";
                }
                
                /*
                for (var i = 0; i < scRoomTimeList.length; i++) {
                    if(i == 0){
                        output += "<div class='card-body font-weight-bold p-1'>[" + scRoomTimeList[i].scroom + "]</div>";
                    }
                    if (scRoomTimeList[i].scroom != scRoomTimeList[i-1].scroom) {
                        output += "<hr>"
                        output += "<div class='card-body font-weight-bold p-1'>[" + scRoomTimeList[i].scroom + "]</div>";
                    }
                    output +="<button class=\"btn border border-3 listArea text-gray-900 fw-bold scRoomTimeList\" onclick=\"scRoomTimeSelect(this,\'" +
                        scRoomTimeList[i].scroom + "\', \'" + scRoomTimeList[i].scdate + "\')\">";
                    output += scRoomTimeList[i].scdate;
                    output += "</button>";
                }
                */
                $("#scRoomTimeList").html(output)
            }

        })
        $("#scroom").text("");
        $("#sctime").text("");

        // form 초기화
        $("#rescroom").val("");
        $("#rescdate").val("");
    }

    function scRoomTimeSelect(selScRoomTimeObj, selScRoom, selScTime) {
        $(".scRoomTimeList").css("background-color", "");
        $(selScRoomTimeObj).css("background-color", "lightblue");
        $("#scroom").text(selScRoom);
        $("#rescroom").val(selScRoom);
        $("#sctime").text(selScTime);
        $("#rescdate").val(selectReDate + " " + selScTime);
    }

    function peopleSelect(pObj){
        $(".pSel").css("background-color", "");
        $(pObj).css("background-color", "lightblue");
        $("#reamount").val($(pObj).text());
        $("#psel").text($(pObj).text() + "명");
    }

    function reservationFormCheck(){
        if($("#remid").val().length == 0){
            alert("로그인이 필요합니다.");
            return false;
        }
        if(selectReMvcode.length == 0){
            alert("영화를 선택해주세요.")
            return false;
        }
        if($("#rescthcode").val().length == 0){
            alert("극장을 선택해주세요.")
            return false;
        }
        if(selectReDate.length == 0){
            alert("날짜를 선택해주세요.")
            return false;
        }
        if($("#rescroom").val().length == 0 || $("#rescdate").val().length == 0){
            alert("상영관 및 시간을 선택해주세요")
            return false;
        }
        if($("#reamount").val().length == 0){
            alert("인원을 선택해주세요")
            return false;
        }
        return true;
    }
</script>
<script>
    // 로그인이 되지 않았는데 예매페이지로 이동한 경우
    $(document).ready(function(){
        var loginCheck = '${sessionScope.loginId}';
        if(loginCheck.length == 0){
            alert("로그인 후 이용가능합니다.")
            location.href = "memberLoginForm";
        }    
    })
    // 영화챠트에서 영화를 선택해서 예매페이지로 넘어온 경우
    var checkMvCode = '${param.mvcode}';
    console.log("checkMvCode : " + checkMvCode);
    if(checkMvCode.length>0){
        $("#"+checkMvCode).click();
    }
</script>
</html>