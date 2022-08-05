<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        td{
            padding: 5px;
        }
    </style>
</head>

<body>
    <h1>MemberJoinForm_test.jsp</h1>

    <form action="memberJoin" method="post" enctype="multipart/form-data">
        <table border="1">
            <tr>
                <th>아이디</th>
                <td><input type="text" name="mid"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="text" name="mpw"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="mname"></td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td><input type="date" name="mbirth"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" name="memail"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="maddress"></td>
            </tr>
            <tr>
                <th>프로필이미지</th>
                <td><input type="file" name="mfile"></td>
            </tr>
            <tr>
                <th colspan="2"><input type="submit" value="회원가입"></th>
            </tr>
        </table>
    </form>

</body>

</html>