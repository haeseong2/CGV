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
            grid-template-columns: 300px 1fr;
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
                        <h1 class="h3 mb-0 text-gray-800">????????? ???????????? - AdminTheaterList.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">????????????</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>??????????????????</th>
                                            <th>ID</th>
                                            <th>??????</th>
                                            <th>?????????</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>??????????????????</th>
                                            <th>ID</th>
                                            <th>??????</th>
                                            <th>?????????</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${memberList}" var="memberInfo">
                                            <tr id="${memberInfo.mid}">
                                                <td class="align-middle text-center">
                                                    <c:choose>
                                                        <c:when test="${memberInfo.mjointype == 0}">
                                                            <img src="${pageContext.request.contextPath}/resources/mprofileUpload/${memberInfo.mprofile}" alt="??????????????????" style="width: 100px;">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${memberInfo.mprofile}" alt="??????????????????" style="width: 100px;">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="align-middle font-weight-bold">${memberInfo.mid}</td>
                                                <td class="align-middle">${memberInfo.mname}</td>
                                                <td class="align-middle">${memberInfo.memail}</td>
                                                <td class="align-middle">
                                                    <button class="btn btn-warning m-1" onclick="memberInfoForm('${memberInfo.mid}')">????????????</button>
                                                    <c:choose>
                                                	    <c:when test="${memberInfo.mstate == 0}">
                                                            <button class="btn btn-danger m-1" onclick="modifyMstate('${memberInfo.mid}', '${memberInfo.mstate}')">?????????</button>
                                                		</c:when>
                                                		<c:otherwise>
                                                            <button class="btn btn-primary m-1" onclick="modifyMstate('${memberInfo.mid}', '${memberInfo.mstate}')">?????????</button>
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

    <!-- MemberInfo Modal-->
    <div class="modal fade" id="memberInfoForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold" id="memberLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">??????</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="grid">
                        <div>
                            <div class="text-center" style="padding: 20px;"><img src="" alt="" id="memberProfile" style="width: 260px;"></div>
                        </div>
                        <div>
                            <div class="row mb-2">
                                <div class="col-6">
                                    ?????????
                                    <input type="text" class="form-control" id="memberId" readonly="readonly">
                                </div>
                                <div class="col-6">
                                    ????????????
                                    <input type="text" class="form-control" id="memberPw" readonly="readonly">
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-6">
                                    ??????
                                    <input type="text" class="form-control" id="memberName" readonly="readonly">
                                </div>
                                <div class="col-6">
                                    ??????
                                    <input type="text" class="form-control" id="memberBirth" readonly="readonly">
                                </div>
                            </div>
                            <div class="mb-2">
                                ?????????
                                <input type="text" class="form-control" id="memberEmail" readonly="readonly">
                            </div>
                            <div class="mb-2">
                                ??????
                                <input type="text" class="form-control" id="memberAddr" readonly="readonly">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="openBtn" type="button" class="btn btn-success" onclick="modifyOpen()">????????????</button>
                    <button id="subBtn" type="button" class="btn btn-warning btn-dNone" onclick="modifyTheater()"">????????????</button>
                    <button id="closeBtn" type="button" class="btn btn-secondary btn-dNone" onclick="modifyClose(true)">??????</button>
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
    function modifyMstate(mid, mstate){
        console.log("?????? ??????/??????");

        $.ajax({
            type : "get",
            url : "adminModifyMstate",
            data : {"mid" : mid, "mstate" : mstate},
            dataType : "json",
            async : false,
            success(result){
                console.log(result);
                var output = "";
                output += '<td class="align-middle text-center">';
                if(result.mjointype == 0){
                    output += '<img src="${pageContext.request.contextPath}/resources/mprofileUpload/' + result.mprofile + '" alt="??????????????????" style="width: 100px;">';
                }else{
                    output += '<img src="' + result.mprofile + '" alt="??????????????????" style="width: 100px;">';
                }
                output += '</td>';
                output += '<td class="align-middle font-weight-bold">' + result.mid + '</td>';
                output += '<td class="align-middle">' + result.mname + '</td>';
                output += '<td class="align-middle">' + result.memail + '</td>';
                output += '<td class="align-middle">';
                output += '<button class="btn btn-warning m-1" onclick="memberInfoForm(\'' + result.mid + '\')">????????????</button>&nbsp;';
                if(result.mstate == 0){
                    output += '<button class="btn btn-danger m-1" onclick="modifyMstate(\'' + result.mid + '\', \'' + result.mstate + '\')">?????????</button>';
                }else{
                    output += '<button class="btn btn-primary m-1" onclick="modifyMstate(\'' + result.mid + '\', \'' + result.mstate + '\')">?????????</button>';
                }
                output += '</td>';
                
                $("#" + result.mid).html(output);

            }
        })
    }

    function memberInfoForm(mid){
        $.ajax({
            type : "get",
            url : "adminMemberInfo",
            data : {"mid" : mid},
            dataType : "json",
            async : false,
            success(result){
                console.log(result);
                if(result.mjointype == 0){
                    $("#memberProfile").attr("src", "${pageContext.request.contextPath}/resources/mprofileUpload/"+result.mprofile);
                }else{
                    $("#memberProfile").attr("src", result.mprofile);
                }
                $("#memberId").val(result.mid);
                $("#memberPw").val(result.mpw);
                $("#memberName").val(result.mname);
                $("#memberBirth").val(result.mbirth);
                $("#memberEmail").val(result.memail);
                $("#memberAddr").val(result.maddress);

                $("#memberInfoForm").modal("show");
            }
        })
    }
</script>

</html>