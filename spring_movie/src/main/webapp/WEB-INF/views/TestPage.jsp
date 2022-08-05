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
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- sockjs -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

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
                        <h1 class="h3 mb-0 text-gray-800">테스트페이지 - TestPage.jsp</h1>
                    </div>
                    <h2 style="font-size: 15px;">로그인 아이디 : ${sessionScope.loginId}</h2>
                    <h2 style="font-size: 15px;">로그인 프로필 : ${sessionScope.loginProfile}</h2>
                    <h2 style="font-size: 15px;">로그인 타입 : ${sessionScope.loginType}</h2>
                    <!-- Content Row -->
                    <hr>
                    <input type="text" id="username" placeholder="보내는 사람">
                    <br>
                    <input type="text" id="comment" placeholder="메세지">
                    <br>
                    <button onclick="msgSendTest()">테스트 버튼</button>
                    <div id="receiveMsg">
                        
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
    var url = "${pageContext.request.contextPath}/testWskMessage";
    var sock = new SockJS(url);
    sock.onopen = function() {
        console.log('open');
    };

    sock.onmessage = function(e) {  // message객체를 받으면 실행되는 부분
        console.log(e); // 매개변수 e : :
        console.log('message', e.data); // e.data를 출력하게 되면 json형식을 갖춘 문자열이므로 key-value값을 갖는 객체로 사용이 불가
        receiveData = JSON.parse(e.data);
        console.log(receiveData);
        var output = "<p>" + "보내는 아이디 : " + receiveData.msgUserId + "</p>";
        output +=   "<p>" + "메세지 내용 : " + receiveData.msgComment + "</p>";
        $("#receiveMsg").append(output);    // .append(output) : : 기존 html에 output 내용을 추가
    };

    sock.onclose = function() {
        console.log('close');
    };
</script>
<script type="text/javascript">
    function msgSendTest(){
        var username = $("#username").val();
        var comment = $("#comment").val();

        var msgData = {
            "msgUserId" : username, 
            "msgComment" : comment
        };

        console.log(msgData);
        console.log(JSON.stringify(msgData));   // json형태를 갖는 문자열(String)으로 형변환

        // $("#username").val("");
        $("#comment").val("");
        sock.send(JSON.stringify(msgData)); // client - server간에 전달하는 데이터형식 : 문자열
                                            // >> client <-> server : json형식의 문자열
    }
</script>
</html>