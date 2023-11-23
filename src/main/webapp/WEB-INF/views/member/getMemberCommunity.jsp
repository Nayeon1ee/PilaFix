<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 세부 내용</title>
<style>
	#my_modal {
	    display: none;
	    width: 350px;
	    padding: 20px 60px;
	    background-color: #fefefe;
	    border: 1px solid #888;
	    border-radius: 3px;
	}
	
	#my_modal .modal_close_btn {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	}
</style>
</head>
<body>
	<div align="center">
		<h1>글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${memberCommunity.memberCmNumber }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${memberCommunity.memberCmTitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${memberCommunity.memberCmContent }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${memberCommunity.memberCmRegdate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${memberCommunity.memberCmViews }</td>
			</tr>
			<tr>
				<td><a href="updateMemberCommunity.do?memberCmNumber=${memberCommunity.memberCmNumber }">수정</a> | <a href="deleteMemberCommunity.do?memberCmNumber=${memberCommunity.memberCmNumber}">삭제</a></td>
			</tr>
		</table>
		<a href="getMemberCommunityList.do">글 목록</a>
		<div id="my_modal">
			
			<p>게시글 신고</p>
			<p>신고 사유를 선택하여 주시기 바랍니다.</p>
            <form action="insertBlamer.do" method="post">
			    <input type="hidden" name="memberCmNumber" value="${memberCommunity.memberCmNumber}">
			    <input type="hidden" name="memberCmWriterMemberCode" value="${memberCommunity.memberCmWriterMemberCode}">
			    <input type="hidden" name="memberBlamerIp" value="${memberCommunity.cmWriterIp}">
			    <div class="radio-box">
				    <c:forEach items="${blameList}" var="blameList">
				        <input type="radio" name="memberBlameReasonCode" value="${blameList.memberBlameReasonCode}">${blameList.memberBlameReasonName}<br>
				    </c:forEach>
			    </div>
			    <input type="submit" value="신고">
			</form>
            <a class="modal_close_btn">닫기</a>
        </div>
        
        <c:if test="${memberList == null }">
        	<button id="popup_open_btn" >신고하기</button>
		</c:if>
		<c:forEach var="memberList" items="${memberList }">
			<p>신고중</p>
		</c:forEach>
		</div>
		<hr>
		<!-- 답변 영역 -->
		<c:if test="${empty memberCommunityReply}">
			<p>총 0개의 댓글이 있습니다.</p>
		</c:if>
		<c:forEach var="CommunityReply" items="${memberCommunityReply }">
			<table>
				<tr>
					<th>답변내용</th>
					<td>${CommunityReply.memberReContent }</td>
				</tr>
				<tr>
					<th>작성자회원코드</th>
					<td>${CommunityReply.memberWriterCode }</td>
				</tr>
				<tr>
					<th>작성일시</th>
					<td>${CommunityReply.memberReRegdate }</td>
				</tr>
			</table>
			<div id='form_${CommunityReply.memberReNumber}' style='display: none;'>
				<form action="updateMemberCommunityReply.do" method="post">
					<input type="hidden" name="memberCmNumber" value="${memberCommunity.memberCmNumber}">
					<input type="hidden" name="memberReNumber" value="${CommunityReply.memberReNumber}" />
					<input type="text" name="memberReContent" value="${CommunityReply.memberReContent}" />
					<input type="submit" value="수정" />
				</form>
			</div>
			<button type="button" class='updatebtn' onclick='updateButton("${CommunityReply.memberReNumber}")'>수정</button> | <a href="deleteMemberCommunityReply.do?memberReNumber=${CommunityReply.memberReNumber}&&memberCmNumber=${memberCommunity.memberCmNumber}">삭제</a>
		</c:forEach>
			
			<form action="insertMemberCommunityReply.do" method="post">
				 <input type="hidden" name="memberReTitle" value='[답글]'>
				 <input type="hidden" name="memberCmNumber" value="${memberCommunity.memberCmNumber}">
				
           		<%--  
           		############### 센터 로그인 완료되면 ###########
           		<input type="hidden" name="writerMemberCode" value="여기에 세션에서 맴버코드 뽑기" >
           		--> 회원의 문의사항에 답변이 보이게 
           		#######################################
           		--%>
           		
				답변내용 <input type="text" name="memberReContent">
				<input type="submit" value="답변등록">
			</form>
<script>
	// 신고 모달
     function modal(id) {
         var zIndex = 9999;
         var modal = document.getElementById(id);

         var bg = document.createElement('div');
         bg.setStyle({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // 레이어 색갈은 여기서 바꾸면 됨
             backgroundColor: 'rgba(0,0,0,0.4)'
         });
         document.body.append(bg);

         // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
         modal.querySelector('.modal_close_btn').addEventListener('click', function() {
             bg.remove();
             modal.style.display = 'none';
         });

         modal.setStyle({
             position: 'fixed',
             display: 'block',
             boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

             // 시꺼먼 레이어 보다 한칸 위에 보이기
             zIndex: zIndex + 1,

             // div center 정렬
             top: '50%',
             left: '50%',
             transform: 'translate(-50%, -50%)',
             msTransform: 'translate(-50%, -50%)',
             webkitTransform: 'translate(-50%, -50%)'
         });
     }

     // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
     Element.prototype.setStyle = function(styles) {
         for (var k in styles) this.style[k] = styles[k];
         return this;
     };

     document.getElementById('popup_open_btn').addEventListener('click', function() {
         // 모달창 띄우기
         modal('my_modal');
     });
     
     function updateButton(memberReNumber) {
    	    var form = document.getElementById('form_' + memberReNumber);
    	    if (form.style.display === 'none' || form.style.display === '') {
    	        form.style.display = 'block';
    	    } else {
    	        form.style.display = 'none';
    	    }
    	}
</script>
</body>
</html>