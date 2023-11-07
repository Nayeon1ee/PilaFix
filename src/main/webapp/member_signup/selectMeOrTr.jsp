<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입시 강사or회원 선택화면</title>
</head>
<body>
<form action="getUserRole.do">
      <p>회원 강사 선택</p>
      <label><input type="radio" name="csRoleCode" value="ME"> 회원</label>
      <label><input type="radio" name="csRoleCode" value="TR"> 강사</label>
      <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
    </form>
</body>
</html>