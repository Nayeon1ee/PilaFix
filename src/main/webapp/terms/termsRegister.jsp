<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>이용약관 등록</title>
</head>
<body>
	<h1>이용약관 등록</h1>

	<form action="/addTerms" method="post">
		<label for="tmName">약관명:</label> <input type="text" id="tmName"
			name="tmName" required><br> <br> <label
			for="tmDetail">약관상세:</label>
		<textarea id="tmDetail" name="tmDetail" rows="5" required></textarea>
		<br> <br> <label for="tmRequiredYn">필수여부:</label> <input
			type="radio" id="tmRequiredYn" name="tmRequiredYn" value="true"
			required> <label for="tmRequiredYn">필수</label> <input
			type="radio" id="tmRequiredYn" name="tmRequiredYn" value="false"
			required> <label for="tmRequiredYn">선택</label><br> <br>
		<label for="tmOpenYn">공개여부:</label> <input type="radio" id="tmOpenYn"
			name="tmOpenYn" value="true" required> <label for="tmOpenYn">공개</label>
		<input type="radio" id="tmOpenYn" name="tmOpenYn" value="false"
			required> <label for="tmOpenYn">비공개</label><br> <br>
		<input type="submit" value="등록"> <input type="reset"
			value="취소">
	</form>
</body>
</html>
