<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
	
	var theater_name = "";
	$("#select_cinema").change(function() {
		var select = $("#select_cinema option:selected").val();
		if (select == "add_theater") {
			$("#input_theater").fadeIn(500).val("");
		} else {
			$("#input_theater").fadeOut(500).val("");
		}
	});
	
	$("#btnInsertCinema").click(function(e) {
		e.preventDefault();
		// 셀렉트에서 영화관 이름 선택
		var name = $("#select_cinema option:selected").val();
		// 영화관 추가하는 경우 input에서 영화관 이름 가져옴
		if (name == "add_theater") {
			name = $("#input_theater").val();
			console.log("추가한 영화관 이름 : " + name);
		}
		$("#cinema_name").val(name); // select or input에서 받아온 영화관 이름을 hidden의 value로 설정
		//var movie = $("#cinema_movie").val();
		
		// 시간 포맷 처리
		var input_time = $("#input_time").val(); // 2023-01-18T15:41
		
		$("#cinema_time").val(input_time);
		input_time = input_time.split("T"); // 2023-01-18
		var date = input_time[0].replace("/-/g", "/"); // 2023/01/18
		var time = input_time[1]; // 15:41
		var cinema_time = (date + " " + time); // 2023/01/18 15:41
		$("#cinema_time").val(cinema_time) // cinema_time의 value로 설정
		
		
		// 좌석정보
		var row = $("#input_row").val();
		var col = $("#input_col").val();
		if(row <= 0 || col <= 0 || row >=16 || col >=16) {
			alert("행, 열 정보는 1 이상 15 이하여야 합니다.");
			return;
		}
		
		console.log($("#cinema_name").val());
		console.log($("#cinema_movie_no").val());
		console.log($("#cinema_time").val());
		var row = $("#input_row").val();
		var col = $("#input_col").val();
		var seats = "";
		for(i = 0; i < row; i++) {
			for(j = 0; j < col; j++) {
				if(i == (row-1) && j == (col-1)) {
					seats += ((i+1)+"열 " + (j+1)+"번");
				} else {
					seats += ((i+1)+"열 " + (j+1)+"번,");
				}
			}
		}
		$("#seats").val(seats);
		$("#frmCinema").submit();
	});
});
</script>
  <!-- 사이드바 시작 -->
  <div class="sidebar">
    <!-- 사이드 바 메뉴-->
    <div class="panel panel-info">
    
    	<!-- 타이틀 -->
         <div class="panel-heading">
           <h3 class="panel-title">관리자 메뉴</h3>
         </div>
         <!-- 타이틀 끝 -->
         
         <div class="list-group">
           <a href="${contextPath}/movie/admin" class="list-group-item list-group-item-action" aria-current="true">
             관리자 페이지
           </a>
           <a href="${contextPath}/movie/admin/movie_management" class="list-group-item list-group-item-action">
             영화 관리
           </a>
           <a href="${contextPath}/movie/admin/theater_management" class="list-group-item list-group-item-action active">
             상영관 관리
           </a>
           <a href="${contextPath}/movie/admin/annList" class="list-group-item list-group-item-action">
             공지사항 관리
           </a>
           <a href="${contextPath}/movie/admin/qnaList" class="list-group-item list-group-item-action">
             QNA 관리
           </a>
           <a href="${contextPath}/movie/admin/member" class="list-group-item list-group-item-action">
             회원 관리
           </a>
         </div>
         <!-- 메뉴 끝 -->
    </div>
     <!-- 사이드 바 메뉴 끝-->
  </div>
  <!-- 사이드바 끝 -->
  
  <div class="container">
    <!-- ***** 관리자 페이지 ***** -->
    <div class="row">
      <div class="col-12">
        <div class="page-content" style="padding-top: 5px">
        
          <!-- 영화 관리 시작 -->
          <div class="most-popular header-text">
            <div class="row">
              <div class="col-lg-12">

                <div class="heading-section">
                  <h4><em>상영관 관리</em></h4>
                </div>

                <div class="row">
                  <div class="form-area" style="margin-top:10px">
                    <form class="form-input" id="frmCinema" action="addCinema" method="post">
                        
                      <!-- 상영관 선택 및 추가 -->
					  <div class="row row-theater-top">
					    <div class="col-md-12">
					      <h4>상영관 선택 및 추가</h4>
					      <select id="select_cinema" class="form-control">
					        <option value="disabled" selected disabled hidden="">상영관 선택</option>
					        <c:forEach items="${cinema_list}" var="cinema_list">
					        <option>${cinema_list}</option>
					        </c:forEach>
					        <option value="add_theater">상영관 추가하기</option>
					      </select>
					      <input type="text" id="input_theater" placeholder="추가할 상영관을 입력하세요." style="display: none">
					      <input type="hidden" id="cinema_name" name="cinema_name" value="">
					    </div>
					  </div>
					  <!-- // 상영관 선택 및 추가 -->
					  
					  <!-- 영화 선택 -->
					  <div class="row row-theater">
					    <div class="col-md-12">
					      <h4>영화 선택</h4>
					      <select id="cinema_movie_no" class="form-control" name="cinema_movie_no">
					        <option value="disabled" selected disabled hidden="">영화 선택</option>
					        <c:forEach items="${movieVo}" var="vo">
					        <option value="${vo.movie_no}">${vo.movie_title}</option>
					        </c:forEach>
					      </select>
					    </div>
					  </div>
					  <!-- // 영화 선택 -->
					  
					  <!-- 상영시간 선택 -->
					  <div class="row row-theater">
					    <div class="col-md-12">
					      <h4>상영 시간</h4>
					      <input type="datetime-local" id="input_time">
					      <input type="hidden" id="cinema_time" name="cinema_time" value="">
					    </div>
					  </div>
					  <!-- // 상영시간 선택 -->
						
						<!-- 열, 행 선택 -->
						<div class="row row-theater">
						    <div class="col-md-5">
						      <h4>열</h4>
						      <input type="number" id="input_row" required="required">
						    </div>
						    <div class="col-md-2"></div>
						    <div class="col-md-5">
						      <h4>행</h4>
						      <input type="number" id="input_col" required="required">
						    </div>
						    <input id="seats" type="hidden" name="seats" value="">
						  </div>
						<!-- 열, 행 선택 -->
						
					  <!-- 좌석선택  -->
					  <div class="row">
               	      <div id="div-seat" style="margin-top: 30px; width: 100%;">
               	    	<div class="col-lg-12">
	                      <div class="main-button" style="text-align: center; margin-top: 25px">
	                        <a id="btnInsertCinema" href="#">선택완료</a>
	                      </div>
	                    </div>
               	      </div>
               	      </div>
               	      <!-- 좌석선택 끝  -->
               	      
                    </form>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          <!-- 영화 관리 끝 -->
          
        </div>
      </div>
    </div>
    <!-- ***** 관리자 페이지 끝 ***** -->
    
  </div>
<%@ include file="../include/footer.jspf" %>