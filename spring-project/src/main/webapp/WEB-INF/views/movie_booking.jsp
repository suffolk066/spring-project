<%@page import="com.kh.project.util.MovieShuffle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>

<script>
$(function() {
	var adult_personnel = 0;
	var student_personnel = 0;
	var total_personnel = 0;
	var check_personnel = 0;
	
	var select_movie = "";
	var select_theater = "";
	var select_day = "";
	var select_time = "";
	
	
	if (adult_personnel == 0 && student_personnel == 0) {
		$("#table-seat").css("opacity", 0.3);
	}
	
	
	// 영화선택
	$(".td-movie").click(function() {
		$(".td-movie").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-theater").css("opacity", 1)
						 .attr("data-op", 1);
		select_movie = $(this).text();
	});
	
	// 상영관 선택
	$(".td-theater").click(function() {
		var op = $("#div-theater").attr("data-op");
		if(op == 0.5) {
			return;
		}
		$(".td-theater").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-day").css("opacity", 1)
					 .attr("data-op", 1);
		select_theater = $(this).text();
	});
	
	// 날짜 선택
	$(".td-day").click(function() {
		var op = $("#div-day").attr("data-op");
		if(op == 0.5) {
			return;
		}
		$(".td-day").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-time").css("opacity", 1)
					  .attr("data-op", 1);
		select_day = $(this).text();
	});
	
	// 시간 선택
	$(".td-time").click(function() {
		var op = $("#div-time").attr("data-op");
		if(op == 0.5) {
			return;
		}
		$(".td-time").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-seat").slideDown(1000);
		select_time = $(this).text();
	});
	
	// 인원 선택
	// 성인
	$("#adult-personnel").change(function() {
		adult_personnel = $(this).val();
		if (adult_personnel != 0) {
			$("#table-seat").css("opacity", 1);
		} 
	});
	// 청소년
	$("#student-personnel").change(function() {
		student_personnel = $(this).val();
		if (student_personnel != "0") {
			$("#table-seat").css("opacity", 1);
		} 
	});
	
	
	
	// 좌석 선택
	$(".a-seat").click(function(e) {
		e.preventDefault();
		total_personnel = parseInt($("#adult-personnel").val())+parseInt($("#student-personnel").val());
		if (total_personnel == 0) {
			$(".a-seat").text("□");
			$(".a-seat").css("color", "#fff");
			$(".a-seat").attr("data-check", "false");
			alert("최소 1명 이상의 인원을 선택하셔야 합니다.");
			$("#table-seat").css("opacity", 0.3);
			check_personnel = 0;
			return;
		}
		
		
		var isChecked = $(this).attr("data-check");
		if(isChecked == "false") {
			if (check_personnel == total_personnel) {
				alert("인원수를 확인해 주세요.");
				return;
			} if (check_personnel > total_personnel) {
				$(".a-seat").text("□");
				$(".a-seat").css("color", "#fff");
				$(".a-seat").attr("data-check", "false");
				check_personnel = 0;
			}
			check_personnel += 1;
			$(this).text("■");
			$(this).css("color", "#e75e8d");
			$(this).attr("data-check", "true");
		} else {
			check_personnel -= 1;
			$(this).text("□");
			$(this).css("color", "#fff");
			$(this).attr("data-check", "false");
		}
		console.log("선택 좌석 수 : ", check_personnel);
		
	});
	// 사용불가 좌석
	$(".a-noseat").click(function(e) {
		e.preventDefault();
	}); // 좌석선택
	
	
	
	// 결제
	$("#btn-payment").click(function(e) {
		e.preventDefault();
		if (adult_personnel == 0 && student_personnel == 0) {
			alert("최소 1명 이상의 인원이 선택되어야 합니다.");
			return;
		}
		if (check_personnel != 0 && check_personnel == total_personnel) {
			alert("완료");
		} else {
			alert("인원수 및 좌석을 확인해주세요.");
			$("#adult-personnel").focus();
		}
	});//결제
	
	
});
</script>

<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
          <!-- 예매 -->
          <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4>예매하기</h4>
                </div>

				<!-- <div style="text-align: center"> -->
				<%-- <div style="text-align: center"> <!-- 페이징(날짜) -->
					<div class="pagination" >
					<a href="#"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
					<c:forEach begin="1" end="7" var="i">
						<a href="#">${i}</a>
					</c:forEach>
					<a href="#"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
					<a href="#"><i class="fa fa-calendar" aria-hidden="true"></i></a>
					</div>
				</div> <!-- 페이징(날짜) 끝  -->
				</div> <!-- 페이징(날짜) 끝  --> --%>

				<!-- 예매 구성  -->
               	<div class="row">
					<div class="col-md-3"><!-- 영화선택 -->
		                  <div class="ticketing-list">
		                  		<table class="table table-hover">
									<thead class="ticketing-theader">
										<tr>
											<th>
												영화
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="8">
										<tr>
											<td class="td-movie">
												영화${v}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
		                
					</div><!-- 영화선택 끝 -->
					
					<div class="col-md-4"><!-- 상영관 선택 -->
						<div id="div-theater" class="ticketing-list" 
							style="opacity: 0.5" data-op="0.5">
		                  		<table class="table">
									<thead class="ticketing-theader">
										<tr>
											<th>
												상영관
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="9">
										<tr>
											<td class="td-theater">
												상영관${v}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
					
					
					<div class="col-md-2"><!-- 날짜 선택 -->
						<div id="div-day" class="ticketing-list" 
							style="opacity: 0.5" data-op="0.5">
		                  		<table class="table">
									<thead>
										<tr class="ticketing-theader">
											<th>
												날짜
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="31">
										<tr>
											<td class="td-day">
												${v}일
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
					
					
					<div class="col-md-3"><!-- 시간 선택 -->
						<div id="div-time" class="ticketing-list" 
							style="opacity: 0.5"  data-op="0.5">
		                  		<table class="table">
									<thead class="ticketing-theader">
										<tr>
											<th>
												시간
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="15">
										<tr>
											<td class="td-time">
												시간${v}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
				</div><!-- 예매 구성 끝  -->
				
				<!-- 좌석선택  -->
               	<div id="div-seat" style="margin-top: 30px; width: 100%; display: none">
               		<div class="heading-section">
	                	<div><h4>좌석선택</h4></div>
	                	<!-- 인원  -->
	                	<div style="margin-bottom: 20px">
	                	<label for="adult-personnel" style="color: white">성인
	                		<select id="adult-personnel">
	                			<c:forEach begin="0" end="10" var="i">
	                				<option value="${i}">${i}</option>
	                			</c:forEach>
	                		</select>
	                	</label>
	                	<label for="student-personnel" style="color: white; margin-left: 10px">청소년
	                		<select id="student-personnel">
	                			<c:forEach begin="0" end="10" var="i">
	                				<option value="${i}">${i}</option>
	                			</c:forEach>
	                		</select>
	                	</label>
	                	<div style="text-align: right;"><!-- 좌석 상태 설명 -->
	                		<span style="color: white; margin-right: 10px">□ : 선택가능</span>
	                		<span style="color: red"> ▩ : 선택불가능</span>
	                	</div>
	                	</div>
	                	<!-- 인원 끝  -->
	              	</div>
               		<table border="2; solid" id="table-seat"
               		style="width: 100%; color: white; text-align: center; opacity: 0.3">
               			<tr>
               				<td colspan="12"><h4>screen</h4></td>
               			</tr>
               			<c:forEach begin="1" end="7">
	               			<tr>
	               				<c:forEach begin="1" end="8" var="v">
	               					<td style="font-size: x-large;">
	               						<c:choose>
	               							<c:when test="${v%3 eq 0}">
	               								<a class="a-noseat" style="color: red" href="#">▩</a>
	               							</c:when>
	               							<c:otherwise>
	               								<a class="a-seat" data-check="false" href="#">□</a>
	               							</c:otherwise>
	               						</c:choose>
	               					</td>
	               				</c:forEach>	
	               			</tr>
               			</c:forEach>	

               		</table>
               		<div class="col-lg-12">
	                  <div id="btn-payment" class="main-button" style="text-align: center; margin-top: 25px">
	                    <a href="#" data-toggle="modal" data-target="#myModal">선택완료</a>
	                  </div>
	                </div>
               	</div><!-- 좌석선택 끝  -->
              </div>
            </div>
          </div> <!-- 예매 끝 -->
          
        </div>
      </div>
    </div>
  </div>
<%@include file="../include/footer.jspf" %>