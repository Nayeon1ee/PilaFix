<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<script type="text/javascript" src="/memeber_login/js/memberLogin.js"></script>
</head>
<body>
    <form id="loginForm" action="memberLogin.do" method="post" onsubmit="return validateLoginForm()">
        <div>
            <label for="csEmailId">이메일아이디:</label>
            <input type="text" id="csEmailId" name="csEmailId" placeholder="이메일아이디를 입력하세요.">
        </div>
        <div>
            <label for="csPassword">비밀번호:</label>
            <input type="password" id="csPassword" name="csPassword" placeholder="비밀번호를 입력하세요.">
        </div>
        <div>
            <input type="submit" value="로그인">
        </div>
    </form>

    <div id="socialLogin">
        <p>소셜 계정으로 빠른 로그인하기</p>
        <div id="socialButtons">
            <div style="width: 50px; height: 50px; background:gray; display: inline-block;"></div> <!-- 네이버 -->
            <div style="width: 50px; height: 50px; background:gray; display: inline-block;"></div> <!-- 카카오 -->
            <div style="width: 50px; height: 50px; background:gray; display: inline-block;"></div> <!-- 구글 -->
        </div>
    </div>

    <div>
        <a href="#">비밀번호 찾기</a> | <a href="#">회원가입</a>
    </div>

    <%-- 로그인 실패 시 --%>
    <% if (request.getParameter("loginError") != null) { %>
    <script type="text/javascript">
        loginFailed();
    </script>
    <% } %>
</body>
</html>