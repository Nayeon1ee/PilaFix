<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>수강권 등록</h1>
			<nav>
				<ol class="breadcrumb">
					<!-- 소제목 필요 시 작성 -->
					<li class="breadcrumb-item"></li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<!-- Multi Columns Form -->
							<form class="row g-3" action="insertCenterTicket.do" method="post" name="myForm">
							<input type="hidden" class="form-control" name="tkCode" value="${centerTicket.tkCode }">
								<div class="col-md-12 col-top radio-box">
									<label class="form-label">수업 유형</label>
									<div class="radio-box">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="tkLessonType" value="그룹" id="flexRadioDefault1" onclick="updateList('그룹')">
											<label class="form-check-label" for="flexRadioDefault1">그룹</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="tkLessonType" value="개인" id="flexRadioDefault1" onclick="updateList('개인')">
											<label class="form-check-label" for="flexRadioDefault1">개인</label>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권명</label>
									<input type="text" name="tkName" class="form-control" placeholder="수강권명을 입력하세요">
								</div>
								<div class="col-md-12">
									<label class="form-label">정원</label>
									<select class="form-select" name="tkCapacity" id="tkCapacity" aria-label="Default select example">
										<option selected>수업 정원</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권 사용 가능 횟수</label>
									<select class="form-select" name="tkUsageCount" id="tkUsageCount" aria-label="Default select example">
										<option selected>수강권 사용 횟수</option>
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
										<option value="60">60</option>
									</select>
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권 사용 가능 기간</label>
									<select class="form-select" name="tkUsageNumMonth" id="tkUsageNumMonth" aria-label="Default select example">
										<option selected>수강권 사용 기간</option>
										<option value="1">1개월</option>
										<option value="2">2개월</option>
										<option value="3">3개월</option>
										<option value="4">4개월</option>
										<option value="5">5개월</option>
										<option value="6">6개월</option>
									</select>
								</div>
								<div class="col-md-12">
									<label class="form-label">가격</label>
									<input type="text" name="tkPrice" class="form-control" placeholder="가격을 입력하세요(숫자만 입력하세요)">
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권 설명</label>
									<textarea name="tkDescription" class="form-control" style="height: 300px;" placeholder="내용을 입력하세요"></textarea>
								</div>
								<div class="col-sm-10">
									<label class="form-label">구매 가능 여부</label>
									<fieldset class="row mb-3">
								    	<div class="col-sm-10">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="purchaseAvailableYN" id="flexRadioDefault2" value=true>
												<label class="form-check-label" for="flexRadioDefault2">구매 가능</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="purchaseAvailableYN" id="flexRadioDefault2" value=false>
												<label class="form-check-label" for="flexRadioDefault2">구매 불가</label>
											</div>
										</div>
									</fieldset>
								</div>
								<div class="p-check">
									<p>('구매 가능' 선택 시, 수강권이 즉시 회원에게 보여집니다.)</p>
									<p>('구매 불가' 선택 시, 수강권은 생성되지만, 회원에게는 보여지지 않습니다.)</p>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">등록</button>
									<button type="reset" class="btn btn-secondary" onclick="location.href='getCenterTicketList.do'">취소</button>
								</div>
							</form>
							<!-- End Multi Columns Form -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
<script type="text/javascript">
// 개인일 경우 1명만 선택 가능
function Activity(name, list){
    this.name = name;
    this.list = list;
}

var acts = new Array();
    acts[0] = new Activity('그룹', ['2', '3', '4', '5', '6']);
    acts[1] = new Activity('개인', ['1']);

function updateList(str){
    var frm = document.myForm;
    var oriLen = frm.tkCapacity.length;
    var numActs;

    for (var i = 0; i < acts.length; i++){
        if (str == acts[i].name) {
            numActs = acts[i].list.length;
            for (var j = 0; j < numActs; j++)
                frm.tkCapacity.options[j] = new Option(acts[i].list[j], acts[i].list[j]);
            for (var j = numActs; j < oriLen; j++)
                frm.tkCapacity.options[numActs] = null;
        }
    }
}

function removeForm(formElement) {
    formElement.parentNode.removeChild(formElement);
}
</script>
	
<%@ include file="center_footer_common.jsp" %>