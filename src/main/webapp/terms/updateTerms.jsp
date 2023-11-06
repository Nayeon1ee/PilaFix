<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
    <h1>게시글 수정</h1>
    
    <form action="/updateBoard" method="post">
        <input type="hidden" name="tmCode" value="${board.tmCode}">
        
        <label for="tmName">제목:</label>
        <input type="text" id="tmName" name="tmName" value="${board.tmName}" required><br><br>
        
        <label for="tmDetail">내용:</label>
        <textarea id="tmDetail" name="tmDetail" rows="5" required>${board.tmDetail}</textarea><br><br>
        
        <label for="tmRequiredYn">필수여부:</label>
        <select id="tmRequiredYn" name="tmRequiredYn">
            <option value="true" ${board.tmRequiredYn ? 'selected' : ''}>필수</option>
            <option value="false" ${!board.tmRequiredYn ? 'selected' : ''}>선택</option>
        </select><br><br>
        
        <label for="tmOpenYn">공개여부:</label>
        <select id="tmOpenYn" name="tmOpenYn">
            <option value="true" ${board.tmOpenYn ? 'selected' : ''}>공개</option>
            <option value="false" ${!board.tmOpenYn ? 'selected' : ''}>비공개</option>
        </select><br><br>
        
        <label for="tmRegdate">약관작성일자:</label>
        <input type="text" id="tmRegdate" name="tmRegdate" value="${board.tmRegdate}" disabled><br><br>
        
        <label for="tmModifiedDate">최근수정일자:</label>
        <input type="text" id="tmModifiedDate" name="tmModifiedDate" value="${board.tmModifiedDate}" disabled><br><br>
        
        <input type="submit" value="수정">
        <input type="button" value="삭제" onclick="confirmDelete()">
        <input type="button" value="취소" onclick="goBack()">
    </form>
    
   <script>
        function confirmDelete() {
            if (confirm("게시글을 삭제하시겠습니까?")) {
                // 삭제 작업을 수행하는 URL로 리다이렉트
                window.location.href = "/deleteBoard?tmCode=${board.tmCode}";
            }
        }

        function goBack() {
            // 이전 페이지로 돌아가는 기능 (브라우저의 뒤로 가기와 동일)
            window.history.back();
        }
    </script>
</body>
</html>