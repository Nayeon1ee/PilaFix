<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group ml-auto">
				<button type="button" class="btn btn-secondary"
					onclick="location.href='admin_terms.do'">목록</button>
			</div>
			<div class="btn-group ms-auto me-2">
				<button type="button" class="btn btn-primary"
					onclick="location.href='admin_terms_edit.do'">수정</button>
			</div>
			<div class="btn-group ml-2">
				<button type="button" class="btn btn-danger" data-bs-toggle="modal"
					data-bs-target="#basicModal">삭제</button>
			</div>
		</div>
</body>
</html>