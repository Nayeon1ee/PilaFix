<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common.jsp" %> 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>고객관리</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li><!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">회원관리</h5>
              <p>웹 관리자가 회원 상세페이지를 볼 수 있는 페이지입니다.</p>

   <!-- Multi Columns Form -->
              <form class="row g-3">
              	<div class="col-md-4">
                  <label class="form-label">이름</label>
                  <input type="text" readonly class="form-control" value="${member.csName }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">이메일아이디</label>
                  <input type="text" readonly class="form-control" value="${member.csEmailId }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">전화번호</label>
                  <input type="text" readonly class="form-control" value="${member.csPhoneNumber1 }-${member.csPhoneNumber2 }-${member.csPhoneNumber3 }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">생년월일</label>
                  <input type="text" readonly class="form-control" value="${member.csBirth }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">성별</label>
                  <input type="text" readonly class="form-control" value="${member.csGenderMw }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">회원가입일</label>
                  <input type="text" readonly class="form-control" value="${member.csRegistrationDate }" disabled>
                </div>
                
                
                <div class="col-md-4">
                  <label class="form-label">회원상태</label>
                  <c:choose>
					<c:when test="${member.csDeleteYn}">
						<input type="text" readonly class="form-control" value="탈퇴회원" disabled>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control" value="일반회원" disabled>
					</c:otherwise>
				</c:choose>
                  
                </div>
                <div class="col-md-4">
                  <label class="form-label">가입유형</label>
                  <input type="text" readonly class="form-control" value="${member.csRegistrationType }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">현재연동센터</label>
                  <c:choose>
                  <c:when test="${member.connectedCenterCode1 eq 0}">
                   <input type="text" readonly class="form-control" placeholder="현재 연동된 센터 없음" disabled>
                  </c:when>
                  <c:otherwise>
                  	
                  	<c:if test="${member.connectedCenterCode1 != 0 && member.connectedCenterCode2 == 0 && member.connectedCenterCode3 == 0 }">
                  		<input type="text" readonly class="form-control" value="${member.connectedCenterName1 }" disabled>
                  	</c:if>
                  	<c:if test="${member.connectedCenterCode1 != 0 && member.connectedCenterCode2 != 0 && member.connectedCenterCode3 == 0 }">
                  		<input type="text" readonly class="form-control" value="${member.connectedCenterName1 },&nbsp;${member.connectedCenterName2 }" disabled>
                  	</c:if>
                  	<c:if test="${member.connectedCenterCode1 != 0 && member.connectedCenterCode2 != 0 && member.connectedCenterCode3 != 0 }">
	                	<input type="text" readonly class="form-control" value="${member.connectedCenterName1 },&nbsp;${member.connectedCenterName2 },&nbsp;${member.connectedCenterName3 }" disabled>
                  	</c:if>
                  	
                </c:otherwise>
                </c:choose>
                </div>
                
                
              </form><!-- End Multi Columns Form -->

<c:if test="${type ne 'T' }">
				<!-- 강사의 경우 해당 화면이 보이지 않음  -->
		<div class="card card_box_shadow">
            <div class="card-body">
              <h5 class="card-title">수강권결제내역</h5>
              <p>회원이 최근에 결제한 수강권내역입니다.</p>
	
	
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">수강권명</th>
                    <th scope="col">센터명</th>
                    <th scope="col">결제일자</th>
                    <th scope="col">결제수단</th>
                    <th scope="col">결제금액</th>
                  </tr>
                </thead>
					
                <tbody>
                <c:if test="${empty paymentList}">
					<tr>
						<td colspan="6">결제 내역이 없습니다.</td>
					</tr>
				</c:if>
                <c:forEach var="pay" items="${paymentList }">
                  <tr>
                    <td>${pay.paId }</td>
                    <td>${pay.ticketCode }</td><!-- 티켓코드에서 센터명 가져와야 함 --> 
                    <td>${pay.ticketCode }</td><!-- 티켓코드에서 센터명 가져와야 함 --> 
                    <td>${pay.paDatetime }</td>
                    <td>${pay.paMethod }</td>
                    <td>${pay.paAmount }</td>
                  </tr>
				</c:forEach>
                  
                  
                </tbody>
              </table>
              
            </div>
          </div>
             </c:if> 	 
             	 



		<div class="card card_box_shadow">
            <div class="card-body">
              <h5 class="card-title">연동센터이력</h5>
              <p>연동한 센터들이 보여집니다.</p>
	
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">센터명</th>
                    <th scope="col">주소</th>
                  </tr>
                </thead>
			
                <tbody>
				 <c:if test="${empty centerConnectList  }">
					<tr>
						<td colspan="3">연동된 센터가 없습니다.</td>
					</tr>
				</c:if>
                <c:forEach var="center" items="${centerConnectList }">
                  <tr>
                    <td>${center.chCode  }</td>
                    <td>${center.centerName }</td><!--센터코드로 센터명 가져와야 함-->
                    <td>${center.centerAddress }</td><!--센터코드로 센터주소 가져와야 함-->
                  </tr>

                  </c:forEach>
                </tbody>
              </table>
              <!-- End Table with stripped rows -->
              
            </div>
          </div>             	 
             	
             	<div class="text-center">
                  <button class="btn btn-secondary" onclick="location.href='#'">목록</button>
                </div>
             	
             	 

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
 
<%@ include file="admin_footer_common.jsp" %> 
