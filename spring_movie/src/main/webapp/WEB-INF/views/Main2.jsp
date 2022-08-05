<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
</head>

<body>
    <h1>Main.jsp</h1>
    
    <!-- 외부에서는 바로 WEP-INF안에 view폴더로 바로 접근이 불가능하다. -->
    <!-- 그러므로 page에서 page로 이동할 경우에도 controller에 요청하여 이동하게 됨 -->
    <a href="${pageContext.request.contextPath}/memberJoinForm">회원가입페이지</a>
    <!-- /memberJoinForm이면 ip:포트/memberJoinForm -->
    <!-- memberJoinForm 이면 ip:포트/controller/memberJoinForm -->
    <!-- Tomcat server에 path가 /controller 이므로 'ip:포트/controller/memberJoinForm'형식으로 접속하여야 함 -->
    
    
</body>

</html>