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
            /*
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            */
        }

        .btn-dNone{
            display: none;
        }
        
        .grid{
            display: grid;
            grid-template-columns: 120px 1fr;
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
                        <h1 class="h3 mb-0 text-gray-800">관리자 극장확인 - AdminTheaterList.jsp</h1>
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
                                            <th>극장코드</th>
                                            <th>극장이름</th>
                                            <th>극장주소</th>
                                            <th>전화번호</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>극장코드</th>
                                            <th>극장이름</th>
                                            <th>극장주소</th>
                                            <th>전화번호</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <!-- c:set >> 사용할 변수선언 -->
                                        <c:set var="today" value="<%=new Date() %>"></c:set>
                                        <c:forEach items="${theaterList}" var="theaterInfo">
                                            <tr id="${theaterInfo.thcode}">
                                                <td class="align-middle text-center">${theaterInfo.thcode}</td>
                                                <td class="align-middle font-weight-bold">${theaterInfo.thname}</td>
                                                <td class="align-middle">${theaterInfo.thaddr}</td>
                                                <td class="align-middle">${theaterInfo.thtel}</td>
                                                <td class="align-middle">
                                                    <button class="btn btn-warning m-1" onclick="modifyTheaterForm('${theaterInfo.thcode}')">상세정보</button>&nbsp;
                                                    <c:choose>
                                                	    <c:when test="${theaterInfo.thstate == 1}">
                                                            <button class="btn btn-primary m-1" onclick="modifyThstate('${theaterInfo.thcode}', '${theaterInfo.thstate}')">사용중</button>
                                                		</c:when>
                                                		<c:otherwise>
                                                            <button class="btn btn-danger m-1" onclick="modifyThstate('${theaterInfo.thcode}', '${theaterInfo.thstate}')">중지됨</button>
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

    <!-- ModifyTheater Modal-->
    <div class="modal fade" id="modifyTheater" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold" id="theaterModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">ï¿½</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="modify_thcode" name="thcode">
                    <div class="grid mb-3 align-self-center">
                        <div>극장이름 : </div>
                        <div><input class="form-control" type="text" id="modify_thname" name="thname" readonly="readonly"></div>
                    </div>
                    <div class="grid mb-3 align-self-center">
                        <div>극장주소 : </div>
                        <div><input class="form-control" type="text" id="modify_thaddr" name="thaddr" readonly="readonly"></div>
                    </div>
                    <div class="grid mb-3 align-self-center">
                        <div>극장전화번호 : </div>
                        <div><input class="form-control" type="text" id="modify_thtel" name="thtel" readonly="readonly">
                        </div>
                    </div>
                    <input type="hidden" id="modify_thstate" name="thstate">
                </div>
                <div class="modal-footer">
                    <button id="openBtn" type="button" class="btn btn-success" onclick="modifyOpen()">정보수정</button>
                    <button id="subBtn" type="button" class="btn btn-warning btn-dNone" onclick="modifyTheater()"">수정하기</button>
                    <button id="closeBtn" type="button" class="btn btn-secondary btn-dNone" onclick="modifyClose(true)">취소</button>
                </div>
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
</script>
<script type="text/javascript">
    function modifyThstate(thcode, thstate){
        console.log("극장 활성/비활성화");

        $.ajax({
            type : "get",
            url : "adminModifyThstate",
            data : {"thcode" : thcode, "thstate" : thstate},
            dataType : "json",
            async : false,
            success(result){
                console.log(result);
                
                var output = printTheater(result);
                
                $("#"+ thcode).html(output);
                /*
                if(result.thstate == 1){
                    
                }else{

                }
                */
            }
        })
    }

    function printTheater(theater){
        var output = "";

        output += '<td class="align-middle text-center">' + theater.thcode + '</td>';
        output += '<td class="align-middle font-weight-bold">' + theater.thname + '</td>';
        output += '<td class="align-middle">' + theater.thaddr + '</td>';
        output += '<td class="align-middle">' + theater.thtel + '</td>';
        output += '<td class="align-middle">';output += '<button class="btn btn-warning m-1" onclick="modifyTheaterForm(\'' + theater.thcode + '\')">상세정보</button>&nbsp;&nbsp;'
        if(theater.thstate == 1){
            output += '<button class="btn btn-primary m-1" onclick="modifyThstate(\'' + theater.thcode + '\', \'' + theater.thstate + '\')">사용중</button>';
        }else{
            output += '<button class="btn btn-danger m-1" onclick="modifyThstate(\'' + theater.thcode + '\', \'' + theater.thstate + '\')">중지됨</button>';
        }
        output += '</td>';

        return output;
    }

    function modifyTheaterForm(thcode){
        /*
        console.log(theater);
        var row = theater.replaceAll(", ", ",").split("(")[1].split(")")[0].split(",")
        var theaterData = {};
        for(var i = 0; i < row.length; i++){
            var key = row[i].split("=")[0];     // key값
            var val = row[i].split("=")[1];     // value값
            theaterData[key] = val;             // key-value쌍으로 dictionary자료 입력
        }
        console.log(theaterData);
        */
        $.ajax({
            type : "get",
            url : "adminTheaterInfo",
            data : {"thcode" : thcode},
            dataType : "json",
            async : false,
            success(result){
                console.log(result);
                // 한번 modal을 불러오고 닫을 경우 modal이 사라진게 아닌 남아있으므로 속성을 초기화
                $("#modify_thname").attr("readonly", "readonly");
                $("#modify_thaddr").attr("readonly", "readonly");
                $("#modify_thtel").attr("readonly", "readonly");
                $("#openBtn").removeClass("btn-dNone");
                $("#subBtn").addClass("btn-dNone");
                $("#closeBtn").addClass("btn-dNone");


                $("#theaterModalLabel").text("["+result.thcode + "] 극장 상세정보");
                $("#modify_thcode").val(result.thcode);
                $("#modify_thname").val(result.thname);
                $("#modify_thaddr").val(result.thaddr);
                $("#modify_thtel").val(result.thtel);
                $("#modify_thstate").val(result.thstate);

                thInfoVal = result;
            }
        })
        
        $("#modifyTheater").modal("show");
        
    }

    var thInfoVal = "";

    function modifyOpen(){
        $("#modify_thname").removeAttr("readonly");
        $("#modify_thaddr").removeAttr("readonly");
        $("#modify_thtel").removeAttr("readonly");

        $("#openBtn").toggleClass("btn-dNone");
        $("#subBtn").toggleClass("btn-dNone");
        $("#closeBtn").toggleClass("btn-dNone");
    }

    function modifyClose(preCheck){
        $("#modify_thname").attr("readonly", "readonly");
        $("#modify_thaddr").attr("readonly", "readonly");
        $("#modify_thtel").attr("readonly", "readonly");

        $("#openBtn").toggleClass("btn-dNone");
        $("#subBtn").toggleClass("btn-dNone");
        $("#closeBtn").toggleClass("btn-dNone");

        if(preCheck){
            previousThInfo
        }
    }

    function previousThInfo(){
        $("#modify_thcode").val(thInfoVal.thcode);
        $("#modify_thname").val(thInfoVal.thname);
        $("#modify_thaddr").val(thInfoVal.thaddr);
        $("#modify_thtel").val(thInfoVal.thtel);
        $("#modify_thstate").val(thInfoVal.thstate);
    }

    function modifyTheater(){
        var thcode = $("#modify_thcode").val();
        var thname = $("#modify_thname").val();
        var thaddr = $("#modify_thaddr").val();
        var thtel = $("#modify_thtel").val();
        var thstate = $("#modify_thstate").val();

        console.log("thcode : " + thcode);
        console.log("thname : " + thname);
        console.log("thaddr : " + thaddr);
        console.log("thtel : " + thtel);
        console.log("thstate : " + thstate);

        $.ajax({
            type : "get",
            url : "adminModifyTheater",
            data : {"thcode" : thcode, "thname" : thname, "thaddr" : thaddr, "thtel" : thtel},
            dataType : "json",
            async : false,
            success : function(result){
                console.log("updateResult : " + result);
                if(result > 0){
                    alert("극장정보가 수정되었습니다.");
                    modifyClose(false);
                    $("#modifyTheater").modal("hide");
                    
                    // selector.on(event, event발생시 실행될 function(){})
                    // hide : modal이 닫힐때 실행
                    // hidden : modal이 닫히고 나서 실행
                    // show : modal이 열릴때 실행
                    // shown : modal이 열리고 나서 실행
                    /*
                    $("#modifyTheater").on('hide.bs.modal',function(){
                        alert("modal이 닫히기 전 실행");
                    });
                    $("#modifyTheater").on('hidden.bs.modal',function(){
                        alert("modal이 닫힌 후 실행");
                    });
                    $("#modifyTheater").on('show.bs.modal',function(){
                        alert("modal이 열리기 전 실행");
                    });
                    $("#modifyTheater").on('shown.bs.modal',function(){
                        alert("modal이 열린 후 실행");
                    });
                    */

                    var thInfo = {"thcode" : thcode, "thname" : thname, "thaddr" : thaddr, "thtel" : thtel, "thstate" : thstate};
                    /*
                    thInfo["thcode"] = thcode;
                    thInfo["thname"] = thname;
                    thInfo["thaddr"] = thaddr;
                    thInfo["thtel"] = thtel;
                    thInfo["thstate"] = thstate;
                    */
                    thInfoVal = thInfo;
                    console.log(thInfo);
                    console.log(thInfoVal);
                    var output = printTheater(thInfo);
                    $("#"+ thcode).html(output);
                }else{
                    alert("극장정보 수정에 실패하였습니다.");
                }
            }
        })
    }

</script>

</html>