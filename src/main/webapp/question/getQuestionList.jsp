<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
	<div align="center">
    <h1>문의사항</h1>
    <table>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성일시</th>
            <th>답변여부</th>
        </tr>
        <c:if test="${questionList == null }">
			<tr>
			<td colspan="5">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
        <c:forEach var="list" items="${questionList }">
   		<tr data-member-code="${list.qsWriterMemberCode}" onclick="getJSON(${list.qsWriterMemberCode})">
	        <td>${list.qsNumber}</td>
	        <td>${list.qsTitle}</td>
	        <td>${list.qsRegdate}</td>
	        <td><a href="getQuestion.do?qsNumber=${list.qsNumber}">${list.qsAnswerYn}</a></td>
	        <td> <button type="button" onclick="getJSON()"> 답변 불러오기 </button> </td>
   		</tr>
   		<!-- 
   			 <tr>
   		    <td>내용 : ${list.qsContent}</td>
   			</tr>
   			<tr>
   			<td>센터답변 :</td>
   			</tr>
   		
   		 -->
   		
		</c:forEach>
		
		
    </table>
    
    <hr>
     <div id="detail-view"> </div>

    <br><br>
    
    <a href="insertQuestion.do">문의사항 작성</a>
    </div>

<script>
function getJSON(qsWriterMemberCode) {
    const view = document.getElementById('detail-view');
    $.ajax({
        type: "get",
        url: "getQuestionReplyOnJS.do",
        dataType: "json",
        data: { qsWriterMemberCode: qsWriterMemberCode },
        success: function (data) {
            console.log("통신성공");
            console.log(data);
            let output = "";

            for (var i = 0; i < data.length; i++) {
                output += "<table class='table'>";
                output += "<tr>";
                output += "<td>" + data[i].reNumber + "</td>";
                output += "<td>" + data[i].reTitle + "</td>";
                output += "<td>" + data[i].reContent + "</td>";
                output += "<td>" + data[i].writerRoleCode + "</td>";
                output += "<td>" + data[i].writerMemberCode + "</td>";
                output += "<td>" + data[i].reRegdate + "</td>";
                output += "<td>" + data[i].reTargetPostType + "</td>";
                output += "<td>" + data[i].reTargetPostNumber + "</td>";
                output += "</tr>";
                output += "</table>";
            }
            view.innerHTML = output;
        },
        error: function () {
            console.log("통신에러");
        }
    });
}

document.addEventListener('DOMContentLoaded', function () {
    // 모든 <tr>에 대한 클릭 이벤트 핸들러 추가
    const rows = document.querySelectorAll('tr[data-member-code]');
    rows.forEach(function (row) {
        row.addEventListener('click', function () {
            const qsWriterMemberCode = this.getAttribute('data-member-code');
            getJSON(qsWriterMemberCode);
        });
    });
});
</script>
</body>
</html>