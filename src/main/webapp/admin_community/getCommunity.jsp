<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 커뮤니티 상세화면</title>
</head>
<body>
	<div align="center">
		<h1>글 목록 상세</h1>
		<hr>
		<table border="1">
			<tr>
				<td>NO.</td>
				<td>${community.cmNumber }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=request.getParameter("csName") %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td>${community.cmRegdate}</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>${community.cmTitle}</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>${community.cmContent}</td>
			</tr>
			<tr>
				<td><button type="button" onclick="deleteCommunity(${community.cmNumber})">삭제</button></td>
			</tr>
		</table>
	</div>
<script>
function deleteCommunity(cmNumber) {
	if (window.confirm('삭제하면 되돌릴 수 없습니다. \n정말로 삭제하시겠습니까?')) {
		fetch('/pilafix/deleteCommunity.do?cmNumber=' + cmNumber, {
			method: 'GET'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
				window.location.href = 'getCommunityList.do'; // 커뮤니티 목록 페이지로 리다이렉트
			})
			.catch(error => {
				console.error(error);
			});
	}else {
		return;
	}
};
</script>
</body>
</html>