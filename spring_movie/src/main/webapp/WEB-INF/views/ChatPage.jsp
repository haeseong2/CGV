<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- sockjs -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

    <!-- icon -->
    <script src="https://kit.fontawesome.com/a6d95e01a9.js" crossorigin="anonymous"></script>

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
                        <h1 class="h3 mb-0 text-gray-800">채팅 페이지 - chatPage.jsp</h1>
                    </div>
                    <h2 style="font-size: 15px;">로그인 아이디 : ${sessionScope.loginId}</h2>
                    <h2 style="font-size: 15px;">로그인 프로필 : ${sessionScope.loginProfile}</h2>
                    <h2 style="font-size: 15px;">로그인 타입 : ${sessionScope.loginType}</h2>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl-8">
                            <div class="card shadow mb-4" style="min-width: 400px;overflow-y: auto;height: 500px;" id="chatMsgList">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">채팅창</h6>
                                </div>
                                <div class="card-body" id="chatList">
                                    <!-- 
                                    <div class="row">
                                        <div class="col-6"></div>
                                        <div class="col-6">
                                            <div class="mb-2" style="text-align: end;">${sessionScope.loginId}</div>
                                            <div class="bg-warning rounded-pill mb-3 p-3 font-weight-bold" id="chat1" style="color: black; float: right;">보낸메세지 1</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="mb-2" style="text-align: start;">${sessionScope.loginId}</div>
                                            <div class="bg-primary rounded-pill mb-3 p-3 font-weight-bold" id="chat2" style="color: white; float: left;">받은메세지 1</div>
                                        </div>
                                        <div class="col-6"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6"><div class="bg-primary rounded-pill mb-3 p-3 font-weight-bold" id="chat3" style="color: white; float: left;">받은메세지 2</div></div>
                                        <div class="col-6"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6"></div>
                                        <div class="col-6"><div class="bg-warning rounded-pill mb-3 p-3 font-weight-bold" id="chat4" style="color: black; float: right;">보낸메세지 2</div></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6"><div class="bg-primary rounded-pill mb-3 p-3 font-weight-bold" id="chat5" style="color: white; float: left;">받은메세지 3</div></div>
                                        <div class="col-6"></div>
                                    </div>
                                     -->
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="card shadow mb-4" style="min-width: 400px;">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">입력창</h6>
                                </div>
                                <div class="card-body">
                                    <div style="display: grid; grid-template-columns: 1fr 70px;">
                                        <div><input type="text" class="form-control" id="chatMsg" onkeydown="submitMsg(event)"></div>
                                        <div class="text-center"><button class="btn btn-primary" onclick="chatSend()" id="submitBtn"><i class="fa-solid fa-paper-plane"></i></button></div>
                                    </div>
                                </div>
                            </div>
                            <div class="card shadow mb-4" style="min-width: 400px;height: 345px;overflow: auto;">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">접속중</h6>
                                </div>
                                <div class="card-body" id="loginChat"></div>
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

    </div>
</body>
<script type="text/javascript">
    var checkMsg = "${msg}";
    console.log(checkMsg.length);
    if (checkMsg.length > 0) {
        alert(checkMsg);
    }
</script>
<script type="text/javascript">
    var url = "${pageContext.request.contextPath}/chatWskMessage";
    var sock = new SockJS(url);
    sock.onopen = function() {
        console.log('open');
    };

    sock.onmessage = function(e) {  // message객체를 받으면 실행되는 부분
        console.log(e); // 매개변수 e : :
        console.log('message', e.data);
        var receiveData = JSON.parse(e.data);
        console.log(receiveData);
        if(receiveData.msgComment == "connect"){
            var userList = receiveData.loginId.split("++");
            console.log(userList);
            for(var i = 0; i < userList.length; i++){
                if(userList[i].length > 0){
                    $("#loginChat").append('<div id="'+ userList[i] +'">' + userList[i] + '</div>');
                }
            }
            /*
            var output = '<div id="'+receiveData.loginId+'">' + receiveData.loginId + '</div>';
            $("#loginChat").append(output);
            */
        }else if(receiveData.msgComment == "disConnect"){
            $("#" + receiveData.loginId).remove();
        }else {
            var output = "";
            output += '<div class="row">';
            console.log("receiveData.loginId : " + receiveData.loginId);
            console.log("sessionId : " + '${sessionScope.loginId}');
            
            var urlId = sock._transport.url
            console.log(urlId.split("/")[6]); 
            console.log("비회원 receiveData.loginId : " + receiveData.loginId.substring(4))
    
            if(receiveData.loginId == '${sessionScope.loginId}' || urlId.split("/")[6] == receiveData.loginId.substring(4)){
                output += '<div class="col-5"></div>';
                output += '<div class="col-2"></div>';
                output += '<div class="col-5">';
                // output += '<div class="mb-2" style="text-align: end;">' + receiveData.loginId + '</div>';
                output += '<div class="rounded bg-warning mb-3 p-3 font-weight-bold" id="chat1" style="color: black; float: right; overflow-wrap: anywhere;">' + receiveData.msgComment + '</div>';
                output += '</div>';
            }else{
                output += '<div class="col-5">';
                output += '<div class="mb-2" style="text-align: start;">' + receiveData.loginId + '</div>';
                output += '<div class="rounded bg-primary mb-3 p-3 font-weight-bold" id="chat2" style="color: white; float: left; overflow-wrap: anywhere;">' + receiveData.msgComment + '</div>';
                output += '</div>';
                output += '<div class="col-2"></div>';
                output += '<div class="col-5"></div>';
            }
            output += '</div>';
    
            $("#chatList").append(output);
            $("#chatMsgList").scrollTop($("#chatMsgList")[0].scrollHeight);
        }
    };

    sock.onclose = function() {
        console.log('close');
    };
</script>
<script type="text/javascript">
    function chatSend(){
        var msgComment = $("#chatMsg").val();
        if(msgComment.trim().length > 0){
            $("#chatMsg").val("");
            var chatData = {
                "loginId" : '${sessionScope.loginId}',
                "msgComment" : msgComment
            };
            console.log(chatData);
            sock.send(JSON.stringify(chatData));
        }
        $("#chatMsg").focus();
    }

    function submitMsg(event){
        if(event.key === "Enter"){
            event.preventDefault();
            $("#submitBtn").click();
        }
    }
</script>
</html>