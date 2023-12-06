<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- 판매횟수 Card -->
            <div class="col-xxl-4 col-xl-12">
              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">판매횟수</h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${count.paymentCount }회</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- 판매횟수 Card -->

            <!-- 판매금액 Card -->
            <div class="col-xxl-4 col-xl-12">
              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">매출액</h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${count.amountCount }원</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- 판매금액 Card -->
            
            <!-- 회원수 Card -->
            <div class="col-xxl-4 col-xl-12">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">회원수</h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${count.centerMemberCount }명</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- 회원수 Card -->

            <!-- 통계 -->
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">월별 현황</h5>

                  <!-- 차트 시작 -->
                  <div id="reportsChart"></div>

                 <script>
                    document.addEventListener("DOMContentLoaded", () => {
                    	 $.ajax({
	                  	        url: "monthlyAmount.do", 
	                  	        type: 'POST',  
	                  	        success: function(data) {
	                  	            console.log('yn' + data);
	                  	      
		                      new ApexCharts(document.querySelector("#reportsChart"), {
		                        series: [{
		                        	name: '판매횟수',
		                        	data: data.monthlyAmount
		                        }],
		                        
		                        chart: {
		                          height: 320,
		                          type: 'area',
		                          toolbar: {
		                            show: false
		                          },
		                        },
		                        markers: {
		                          size: 4
		                        },
		                        colors: ['#4154f1'],
		                        fill: {
		                          type: "gradient",
		                          gradient: {
		                            shadeIntensity: 1,
		                            opacityFrom: 0.3,
		                            opacityTo: 0.4,
		                            stops: [0, 25, 50]
		                          }
		                        },
		                        dataLabels: {
		                          enabled: false
		                        },
		                        stroke: {
		                          curve: 'smooth',
		                          width: 1
		                        },
		                        xaxis: {
		                          
		                          categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		                        },
		                        tooltip: {
		                          x: {
		                            format: ''
		                          },
		                        }
		                      }).render();
                      
	                  	      },
	                  	        error: function(jqXHR, textStatus, errorThrown) {
	                  	            console.error('AJAX 오류:', textStatus, errorThrown);
	                  	        }
	                  	    });
                 
                    });
                  </script>
                  <!-- 차트 끝 -->

                </div>

              </div>
            </div><!-- 통계 끝 -->

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- 수업 비중 -->
          <div class="card">
            <div class="card-body pb-0">
              <h5 class="card-title">수업 비중</h5>

              <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

               <script>
                document.addEventListener("DOMContentLoaded", () => {
                	 $.ajax({
               	        url: "getPopularLesson.do", 
               	        type: 'POST',  
               	        success: function(data) {
               	            console.log(data);
               	            
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['35%', '70%'], 
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '20',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: data.diet.totalCount,
                          name: '다이어트'
                        },
                        {
                          value: data.bodyShaoe.totalCount,
                          name: '체형교정'
                        },
                        {
                         value: data.stretching.totalCount,
                         name: '스트레칭'
                        },
                        {
                          value: data.balance.totalCount,
                          name: '밸런스'
                        },
                        {
                          value: data.rehabilitation.totalCount,
                          name: '재활'
                        },
                      ]
                    }]
                  });
               	     },
           	        error: function(jqXHR, textStatus, errorThrown) {
           	            console.error('AJAX 오류:', textStatus, errorThrown);
           	        }
           	    });
                });
              </script>

            </div>
          </div><!-- End Website Traffic -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

<%@ include file="center_footer_common.jsp" %>