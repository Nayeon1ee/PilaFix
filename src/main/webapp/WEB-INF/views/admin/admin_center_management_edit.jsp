<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common.jsp" %> 
  <main id="main" class="main">

    <div class="pagetitle">
			<h1>센터 정보 수정</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<p style="magin-top: 1%;"></p>
							<form name="admin_info" action="updateCenter.do" method="post">
								<input type="hidden" name="ctCode" value="${center.ctCode }">
								
								<div class="col-4000">
										<label class="form-label">센터명</label>
				                 		<input type="text" class="form-control" name="ctName" value=${center.ctName }>
				                </div>
								<!-- 센터주소 넣어야 함 
								우편번호는 입력 못 하게 막아두고 api 통해서 가져온 우편번호 값을 넣어줘야 함-->
								
								<div class="col-40000">
									<label class="form-label">센터주소</label> 
									<input type="text" class="form-control" value="${center.ctAddress1}${center.ctAddress2 }${center.ctAddress3 }">
								</div>
								<!-- ########### 주소 가입에서 api 완료되면 바꿀 수 있도록 수정해야 함 ###########
								<div class="col-40000">
									<input type="text" class="form-control" placeholder="우편번호" style="width: 42%;">
									<div class="col-sm-100">
										<button type="button" class="btn btn-primary">찾기</button>
									</div>
								</div>
								<div class="col-40000">
									<label class="form-label">상세주소 1</label> 
									<input type="text" class="form-control" >
								</div>
								<div class="col-40000" >
									<label class="form-label">상세주소 2</label>
									<input type="text" class="form-control" >
								</div>
								<!-- ################################################################## -->
								
								<!-- 주소  -->
								<div class="col-6">
									<label class="form-label">센터주소</label> 
								</div>
								<div class="col-120">
									<input type="text" readonly class="form-control" placeholder="우편번호" id="ctAddress1" name="ctAddress1" value=${center.ctAddress1 } style="width: 42%;">
									<div class="col-sm-100">
										<button type="button" class="btn btn-outline-primary" onclick="address()" >우편번호 찾기</button>
									</div>
								</div>
								<div class="col-12">
									<label class="form-label">도로명</label> 
									<input type="text" readonly class="form-control" id="ctAddress2" placeholder="도로명주소" size="60" name="ctAddress2" value=${center.ctAddress2 }>
								</div>
								<div class="col-12" >
									<label class="form-label">상세주소</label>
									<input type="text" class="form-control" placeholder="상세주소" name="ctAddress3" size="60" value=${center.ctAddress3 }>
								</div>
								
								
								
								<div class="col-40000">
									<label class="form-label">센터 번호</label>
										<select class="form-select" name="ctPhoneNumber1">
											<option value="02" selected="selected" >02</option>
											<option value="070">070</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
										</select>
										<input type="text" class="form-control" name="ctPhoneNumber2" value=${center.ctPhoneNumber2 }><input type="text" class="form-control" name="ctPhoneNumber3" value=${center.ctPhoneNumber3 }> </p> 
								</div>
								
								<div class="col-40000" style="margin-top: 1%;">
									<label class="form-label">계약일</label>
									<input type="date" class="form-control"  name="contractStartDate" value=${center.contractStartDate }>
								
								</div>
								<div class="col-40000" style="margin-top: 1%;">
									<label class="form-label">계약만료일</label>
									<input type="date" class="form-control" name="contractEndDate" value=${center.contractEndDate }>
								
								</div>
								<div class="col-40000">
									<label class="form-label">아이디</label> 
									<input type="text" readonly disabled class="form-control" value=${center.ctId }>
								</div>
								<div class="col-40000" style="margin-top: 1%;">
									<label class="form-label">계약 상태</label>
									<!-- 만료여부 Y이면 만료/해지여부 Y이면 해지/둘 다 N값이면 계약  -->
									<c:choose>
										<c:when	test="${center.contractExpiryYN eq false and center.contractRevokeYN eq false}">
											<input type="text" readonly disabled class="form-control" value="계약">
										</c:when>
										<c:when test="${center.contractExpiryYN eq true and center.contractRevokeYN eq false}">
											<input type="text" readonly disabled class="form-control" value="만료">
										</c:when>
										<c:when	test="${center.contractExpiryYN eq false and center.contractRevokeYN eq true}">
											<input type="text" readonly disabled class="form-control" value="해지">
										</c:when>
									</c:choose>
								</div>
								<div class="col-40000" style="margin-top: 1%;">
									<label class="form-label">만료여부</label>
									<!-- 만료여부 처리 -->
										<c:choose>
											<c:when test="${center.contractExpiryYN }">
												<input type="text" readonly disabled class="form-control" value="Y">					
											</c:when>
											<c:otherwise>
												<input type="text" readonly disabled class="form-control" value="N">
											</c:otherwise>
										</c:choose>
								</div>
								<div class="row mb-300" style="width: 122%; margin-top: 1%;">
								<div class="col-sm-10">
									<input type="text" class="form-control" value="대표자 정보" disabled>
								</div>
								</div>
								<div class="col-4000">
									<label class="form-label">대표자명</label> 
									<input type="text" readonly disabled class="form-control" value=${center.ownerName }>
								</div>
								<div class="col-4000" style="margin-top: 1%;">
									<label class="form-label">대표자 이메일</label>
									<input type="email" class="form-control" id="ownerEmail" name="ownerEmail" value=${center.ownerEmail }>
									<button type="button" class="btn btn-primary" id="ctEmailCheck">중복확인</button>
									<div id="ctEmailCheckMessage"></div>
								</div>
								<div class="col-4000">
									<label class="form-label">대표자 번호</label> 
									<input type="text" class="form-control" name="ownerPhoneNumber1" value=${center.ownerPhoneNumber1 }><input type="text" class="form-control" name="ownerPhoneNumber2" value=${center.ownerPhoneNumber2 }><input type="text" class="form-control" name="ownerPhoneNumber3" value=${center.ownerPhoneNumber3 }>
								</div>
								<div class="col-4000" style="margin-top: 1%;">
									<label class="form-label">사업자 등록번호</label>
									<input type="text" readonly disabled class="form-control" value=${center.businessRegistrationNumber}>
								</div>
				               <div class="row mb-6">
									<div class="col-sm-1000">
										<button type="submit" class="btn btn-primary">수정</button>
									</div>
							   </div>
							</form>
			               </div>
					</div>
				</div>
			</div>
		</section>

  </main><!-- End #main -->
  
<script type="text/javascript">
<!-- 이메일 중복확인 -->
$(function(){
    $("#ctEmailCheck").click(function(){
        let ownerEmail = $("#ownerEmail").val();  //아이디
        $.ajax({
            type: 'post', 
            url: "ctEmailCheck.do", 
            data: {"ownerEmail": ownerEmail}, 
            success: function(data){ 
                let messageDiv = $("#ctEmailCheckMessage");
                if(data < 1){ 
                    // 사용 가능한 아이디인 경우 메시지 표시
                    messageDiv.html("사용 가능한 이메일입니다.");
                    messageDiv.css("color", "green"); 
                } else { 
                    // 중복된 아이디인 경우 메시지 표시
                    messageDiv.html("중복된 이메일입니다. 다른 이메일을 입력해주세요.");
                    messageDiv.css("color", "red");
                }
            },
            error: function(error){ alert(error); }
        });
    });
});
</script>
 
 
<%@ include file="admin_footer_common.jsp" %> 
