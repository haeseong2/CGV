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

    <!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

    
    <style>
        .listArea {
            margin: 10px;
            border-radius: 5px;
        }
        
        .listArea:hover {
            cursor: pointer;
        }

        input:checked + label {
            background-color: lightblue;
        }
        input:disabled + label{
            background-color: lightpink;
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
                        <h1 class="h3 mb-0 text-gray-800">관리자 스케쥴 등록페이지 - AdminSchedule.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <!-- 영화, 극장, 날짜및시간, 상영관 선택 -->
                    <div class="row">
                        <!-- 영화 -->
                        <div class="col-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">영화목록</h6>
                                </div>
                                <div style="height: 500px; overflow: auto;">
                                    <c:forEach items="${movieList}" var="mvList">
                                        <div id="${mvList.mvcode}" class="card-body listArea mvList text-gray-900 fw-bold" onclick="mvSelect(this, '${mvList.mvcode}')">${mvList.mvtitle}</div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- 극장 -->
                        <div class="col-3">
                            <div class="card shadow mb-4" style="height: 500px; overflow: auto;">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">극장목록</h6>
                                </div>
                                <c:forEach items="${theaterList}" var="thList">
                                    <div class="card-body listArea thList text-gray-900 fw-bold" onclick="thSelect(this, '${thList.thcode}')">${thList.thname}</div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-5">
                            <!-- 상영날짜 -->
                            <div class="card shadow mb-4" style="height: 500px;">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">상영날짜 선택</h6>
                                </div>
                                <div class="card-body">
                                    <!--
                                    <div class="d-flex justify-content-around mb-3">
                                        <div class="p-2"><input type="date" name="" id="scOpen"></div>
                                        <div class="p-2">~</div>
                                        <div class="p-2"><input type="date" name="" id="scFin"></div>
                                    </div>
                                    -->
                                    <div id="datepicker"></div>
                                    <!-- <input type="date" id="scdate"> -->
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <!-- 상영관 및 시간 -->
                    <form action="scheduleWrite" method="post" onsubmit="return writeCheck()">
                        <div class="row">
                            <div class="col-8">
                                <div class="card shadow mb-4" style="width: 100%;">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">상영관 및 시간</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <div id="scroomdate"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="card shadow mb-4" style="width: 100%;">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">선택확인</h6>
                                    </div>
                                    <div class="card-body">
                                        <input type="text" class="form-control mb-1" name="scmvcode" id="insertScmvcode" readonly="readonly" placeholder="영화코드">
                                        <input type="text" class="form-control mb-1" name="scthcode" id="insertScthcode" readonly="readonly" placeholder="극장코드">
                                        <input type="text" class="form-control mb-1" name="scdate" id="insertScdate" readonly="readonly" placeholder="상영일">
                                    </div>
                                    <input type="submit" class="btn btn-primary" value="스케쥴 등록">
                                </div>

                            </div>
                        </div>
                    </form>
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
    var scMvCode = "";
    var scThCode = "";
    var scDate = "";

    // checkbox : : name이 동일할 경우 받는 매개변수(dto)를 리스트[]형식으로 만들경우 배열형태로 담겨진다.

    if(scMvCode != null && scThCode != null && scDate != null){
        console.log("check");
    }

</script>
    
<script type="text/javascript">
    var checkMsg = "${msg}";
    console.log(checkMsg.length);
    if (checkMsg.length > 0) {
        alert(checkMsg);
    }

    
    function mvSelect(selmvObj, selMvcode) {
        
        scMvCode = selMvcode;
        $("#insertScmvcode").val(scMvCode);
        // 영화목록 css 변경
        $(".mvList").css("background-color", "");
        $(selmvObj).css("background-color", "lightblue");

        getScRoomTime();

    }
    
    function thSelect(selThObj, selThcode) {

        scThCode = selThcode;
        $("#insertScthcode").val(scThCode);
        // 극장 선택 css
        $(".thList").css("background-color", "");
        $(selThObj).css("background-color", "lightblue");
        
        getScRoomTime();
    }

    function getScRoomTime(){
        if(scMvCode.length != 0 && scThCode.length != 0 && scDate.length != 0){
            var scroom = ["1관", "2관", "3관", "4관", "5관"];
            var sctime = ["09:00", "11:30", "14:00", "16:30", "19:00", "21:30"];
            /*
            var output = "";
                for(var i = 0; i < scroom.length; i++){
                    output += '<div class="mb-3 font-weight-bold" style="font-size: 20px;">' + scroom[i] + '</div>'
                    for(var j = 0; j < sctime.length; j++){
                        output += '<input type="checkbox" name="scroomtime" value="' + scroom[i] + " " + sctime[j] + '" style="display: none;" id="' + scroom[i] + " " + sctime[j] + '">'
                        output += '<label class="btn btn-light p-1 mr-3" for="' + scroom[i] + " " + sctime[j] + '">' + sctime[j] + '</label>';

                    }
                }
                    
            $("#scroomdate").html(output);
            */

            // 1. 스케쥴 테이블 조회 (scthcode)

            $.ajax({
                type: "get",
                url: "getScRoomTime",
                data:{"scthcode": scThCode, "scdate": scDate},
                dataType: "json",
                async: false,
                success: function(result){
                    console.log(result);
                    var output = "";
                    for(var i = 0; i < scroom.length; i++){
                        output += '<div class="mb-3 font-weight-bold" style="font-size: 20px;">' + scroom[i] + '</div>'
                        
                        // var registTime = [];
                        // var registMovie = [];
                        var registTM = [];
                        console.log(result.length);
                        for(var k = 0; k < result.length; k++){
                            if(result[k].scroom == scroom[i]){
                                // registTime.push(result[k].sctime);
                                // registMovie.push(result[k].mvtitle);
                                registTM.push([result[k].sctime, result[k].mvtitle]);
                            }
                        }
                        
                        // console.log(registTime);
                        // console.log(registMovie);
                        console.log(registTM);

                        for(var j = 0; j < sctime.length; j++){
                            
                            var ck = false;
                            var mvtitle = "";
                            /*
                            for (var l = 0; l < registTime.length; l++){
                                if(registTime[l] == sctime[j]){
                                    ck = true;
                                    mvtitle = registMovie[l];
                                    break;
                                }
                            }
                            */
                            
                            for (var l = 0; l < registTM.length; l++){
                                if(registTM[l][0] == sctime[j]){
                                    ck = true;
                                    mvtitle = registTM[l][1];
                                    break;
                                }
                            }
                            
                            // include(list) : : 값이 포함되어 있으면 true를 반환
                            // indexOf(list) : : 값의 인덱스를 반환(없으면 -1)
                            // 2차원 배열로 만들 경우 include안의 조건 list가 아닌 target이 되는 list를 1차원으로 변환하여 검색
                            /*
                            if(registTM[i][0].includes(sctime[j])){
                                output += '<input type="checkbox" name="scroomtime" value="' + scroom[i] + " " + sctime[j] + '" style="display: none;" id="' + scroom[i] + " " + sctime[j] + '" disabled = "disabled">'
                                output += '<label title="' + registTM[j][1] + '" class="btn btn-light p-1 mr-3" for="' + scroom[i] + " " + sctime[j] + '">' + sctime[j] + '</label>';
                            }else{
                                output += '<input type="checkbox" name="scroomtime" value="' + scroom[i] + " " + sctime[j] + '" style="display: none;" id="' + scroom[i] + " " + sctime[j] + '">'
                                output += '<label class="btn btn-light p-1 mr-3" for="' + scroom[i] + " " + sctime[j] + '">' + sctime[j] + '</label>';
                            }
                            */
                            if(ck){
                                output += '<input type="checkbox" name="scroomtime" value="' + scroom[i] + " " + sctime[j] + '" style="display: none;" id="' + scroom[i] + " " + sctime[j] + '" disabled = "disabled">'
                                output += '<label title="' + mvtitle + '" class="btn btn-light p-1 mr-3" for="' + scroom[i] + " " + sctime[j] + '">' + sctime[j] + '</label>';
                            }else{
                                output += '<input type="checkbox" name="scroomtime" value="' + scroom[i] + " " + sctime[j] + '" style="display: none;" id="' + scroom[i] + " " + sctime[j] + '">'
                                output += '<label class="btn btn-light p-1 mr-3" for="' + scroom[i] + " " + sctime[j] + '">' + sctime[j] + '</label>';
                            }
                            
                            
                            
                        }
                    }
                    
                    $("#scroomdate").html(output);
                    
                }
            })

            
        }
    }

</script>

<script type="text/javascript">
    function writeCheck(){
        if(scMvCode.length == 0){
            alert("영화이 선택되지 않았습니다.");
            return false;
        }
        if(scThCode.length == 0){
            alert("극장이 선택되지 않았습니다.");
            return false;
        }
        if(scDate.length == 0){
            alert("날짜이 선택되지 않았습니다.");
            return false;
        }
        var checkbox = $("input[name=scroomtime]").is(":checked");
        if(!checkbox){
            alert("상영관 및 시간이 선택되지 않았습니다.");
            return false;
        }
    }
</script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
    $("#datepicker").datepicker({
        autoSize: true,
        dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],

        onSelect:function(selDate){
            console.log(selDate);
            scDate = selDate;
            $("#insertScdate").val(scDate);
            getScRoomTime();
        }
    });

</script>
</html>