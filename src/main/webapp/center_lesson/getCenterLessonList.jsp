<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 목록</title>
</head>
<body>
	<div align="center">
		<h1>수업 목록</h1>
		<hr>
		<table>
			<tr>
				<th>No</th>
				<th>수업명</th>
				<th>강사</th>
				<th>수업 유형</th>
				<th>수업 정원</th>
				<th>수업 날짜</th>
				<th>수업 시간</th>
				<th>폐강 여부</th>
			</tr>
			<c:if test="${CenterLessonList == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="centerLesson" items="${CenterLessonList }">
				<tr>
					<td>${centerLesson.lsCode }</td>
					<td><a href="getCenterLesson.do?seq=${centerLesson.lsCode }">${centerLesson.lsName }</a></td>
					<td>${centerLesson.csName }</td>
					<c:if test="${centerLesson.lsTypYN == true}">
						<td>그룹</td>
					</c:if>
					<c:if test="${centerLesson.lsTypYN == false}">
						<td>그룹</td>
					</c:if>
					<td>${centerLesson.lsCurrentApplicants } / ${centerLesson.lsCapacity }</td>
					<td>${centerLesson.lsDate }</td>
					<td>${centerLesson.lsTime }:00</td>
					<c:if test="${centerLesson.lsColseYN == true}">
						<td>개강</td>
					</c:if>
					<c:if test="${centerLesson.lsColseYN == false}">
						<td>폐강</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<a href="insertCenterLesson.do">수업 등록</a>
	</div>
</body>
</html>