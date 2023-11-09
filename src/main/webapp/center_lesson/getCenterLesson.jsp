<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 세부 내용</title>
</head>
<body>
	<div align="center">
		<h1>수업 내용</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${centerLesson.lsCode }</td>
			</tr>
			<tr>
				<th>수업명</th>
				<td>${centerLesson.lsName }</td>
			</tr>
			<tr>
				<th>강사명</th>
				<td>${centerLesson.csName }</td>
			</tr>
			<tr>
				<th>수업 유형</th>
				<td>${centerLesson.lsTypYN }</td>
			</tr>
			<tr>
				<th>수업 정원</th>
				<td>${centerLesson.lsCurrentApplication }/${centerLesson.lsCapacity }</td>
			</tr>
			<tr>
				<th>수업 내용</th>
				<td>${centerLesson.lsContent }</td>
			</tr>
			<tr>
				<th>수업 날짜</th>
				<td>${centerLesson.lsDate }</td>
			</tr>
			<tr>
				<th>수업 시간</th>
				<td>${centerLesson.lsTime}:00</td>
			</tr>
			<tr>
				<th>폐강 여부</th>
				<c:if test="${centerLesson.lsColseYN == true}">
					<td>개강</td>
				</c:if>
				<c:if test="${centerLesson.lsColseYN == false}">
					<td>폐강</td>
				</c:if>
			</tr>
			<tr>
				<th>등록 일자</th>
				<td>${centerLesson.lsRegistrationDateToString }</td>
			</tr>
			<tr>
				<td><a href="deleteCenterLesson.do?lsCode=${centerLesson.lsCode }">삭제</a></td>
			</tr>
		</table>
		<a href="getCenterLessonList.do">글 목록</a>
	</div>
</body>
</html>