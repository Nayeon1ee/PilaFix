<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 세부 내용</title>
</head>
<body>

	<div align="center">
		<h1>신고글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>이메일발송코드</th>
				<td>${sendEmailHistoryInfo.mhEmailSendCode }</td>
			</tr>
			<tr>
				<th>이메일발송유형</th>
				<td>${sendEmailHistoryInfo.mhEmailSendType }</td>
			</tr>
			<tr>
				<th>이메일발송일시</th>
				<td>${sendEmailHistoryInfo.mhEmailSendDatetime }</td>
			</tr>
			<tr>
				<th>수신자명</th>
				<td>${sendEmailHistoryInfo.mhRecipientName }</td>
			</tr>
			<tr>
				<th>수신제목</th>
				<td>${sendEmailHistoryInfo.mhRecipientTitle }</td>
			</tr>
			<tr>
				<th>수신내용</th>
				<td>${sendEmailHistoryInfo.mhRecipientContent }</td>
			</tr>
			<tr>
				<th>수신자이메일</th>
				<td>${sendEmailHistoryInfo.mhRecipientEmail }</td>
			</tr>
			<tr>
				<th>발송성공여부</th>
				<td>${sendEmailHistoryInfo.mhSuccessyn }</td>
			</tr>
			<tr>
				<th>발송성공시간</th>
				<td>${sendEmailHistoryInfo.mhSuccessDatetime }</td>
			</tr>
			<tr>
				<th>발송실패사유</th>
				<td>${sendEmailHistoryInfo.mhFailReason }</td>
			</tr>
			<%-- <tr>
				<td><a href="updateFaqInfo.do?fq_number=${faqInfo.fq_number }">수정</a> | <a href="deleteFaqInfo.do?fq_number=${faqInfo.fq_number}">삭제</a></td>
			</tr> --%>
		</table>
		<a href="getComplaintsInfoList.do">글 목록</a>
	</div>
</body>
</html>