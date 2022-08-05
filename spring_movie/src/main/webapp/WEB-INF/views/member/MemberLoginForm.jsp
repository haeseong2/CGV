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

    <title>로그인페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
        type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

    <!-- kakao SDK -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a5cdd6ec4bd5792d11dbaa823228b572');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
    
    <!-- naver SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="/WEB-INF/views/includes/TopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">로그인페이지 - MemberLoginFrom.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                        <div class="col-lg-8" style="margin-left: auto; margin-right: auto;">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                                </div>
                                <form class="user" action="memberLogin" method="post">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="loginId" name="mid"
                                            placeholder="아이디입력">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" id="loginPw" name="mpw"
                                            placeholder="비밀번호입력">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        로그인
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center"><a class="small" id="kakaoLoginBtn"></a></div>
                                <br>
                                <div class="text-center" id="naver_id_login"></div>
                                <div class="text-center">
                                    <a class="small" href="memberJoinForm">Create an Account!</a>
                                </div>
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
    
</body>
<script type="text/javascript">
    var checkMsg = "${msg}";
    console.log(checkMsg.length);
    if(checkMsg.length >0){
        alert(checkMsg);
    }
</script>
<script type="text/javascript">
    Kakao.Auth.createLoginButton({
    container: '#kakaoLoginBtn',
    size: 'large',
    success: function(response) {
        console.log(response);
	    Kakao.API.request({
		  url: '/v2/user/me',
	 	  success: function(res) {
	   	    console.log(res);
            location.href="kakaoLogin?kakaoId="+res.id+"&kakaoEmail="+res.kakao_account.email+"&kakaoNickname="+res.kakao_account.profile.nickname+"&kakaoProfile="+res.kakao_account.profile.profile_image_url
            /*
            res.id
            res.kakao_account.email
            res.kakao_account.profile.nickname
            res.kakao_account.profile.profile_image_url
            */
            // 아이디, 이메일, 닉네임, 프로필
            // controller >> service
            // 보내준 아이디로 회원정보 조회 
            // if(아이디 == mid) {로그인처리후 메인페이지로}
            // else {'아이디, 이메일, 닉네임, 프로필'로 회원가입 처리후 로그인페이지로}
	   	  },
	   	  fail: function(error) {
	   	    console.error(error)
	   	  }
	   	});
    },
    fail: function(error) {
        console.log(error);
    },
    });
</script>
<!-- naver -->
<script type="text/javascript">
  	var naver_id_login = new naver_id_login("pisvZBPlorHDH8xQtXgP", "http://localhost:8080/controller/movieMain");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,49);
  	naver_id_login.setDomain("http://localhost:8080/");
  	naver_id_login.setState(state);
  	// naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
</script>

</html>