<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 목록</title>
</head>
<body>
	<div align="center">
		<h1>글 목록</h1>
		<hr>
		<table>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
			<c:if test="${getMemberCommunityList == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다??</td>
				</tr>
			</c:if>
			<c:forEach var="CommunityList" items="${getMemberCommunityList }">
				<tr>
					<td>${CommunityList.memberCmNumber }</td>
					<td><a href="getMemberCommunity.do?memberCmNumber=${CommunityList.memberCmNumber }">${CommunityList.memberCmTitle }</a></td>
					<td>${CommunityList.memberCsName }</td>
					<td>${CommunityList.memberCmRegdate }</td>
					<td>${CommunityList.memberCmViews }</td>
				</tr>
			</c:forEach>
		</table>
		<a href="insertMemberCommunity.do" onclick='checkLogin()'>글 등록</a>
	</div>
	
<script type="text/javascript">
function checkLogin() {
    var id = memberCsNumberCode; // 여기서 로그인 여부를 판단하는 변수를 가져옵니다.
    if (id == 0) {
        alert("로그인 후 글쓰기가 가능합니다.");
        return false; // 글 등록을 막기 위해 false 반환
    } else {
        return true; // 로그인 상태면 글 등록 가능하도록 true 반환
    }
}
</script>
</body>
</html>