<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jspf" %>
<script>
$(document).ready(function(){
	$(".n_score").css("color", "#ec6090");
	$("#pre").hide();
	$("#a_now").css("color", "#ec6090");
	
	var toggle_command = false;
	$("#a_pre").click(function(e){
 	  e.preventDefault();
 	  if (toggle_command == true) return;
 	  toggle_command = true;
 	  $("#pre").show();
 	  $("#now").hide();
	  $("#a_now").unwrap("<em></em>");
	  $(this).wrap("<em></em>");
	  $(this).css("color", "#ec6090");
	  $("#a_now").css("color", "#CCC");
	});
	$("#a_now").click(function(e){
	  e.preventDefault();
 	  if (toggle_command == false) return;
 	  toggle_command = false;
	  $("#now").show();
 	  $("#pre").hide();
	  $("#a_pre").unwrap("<em></em>");
	  $(this).wrap("<em></em>");
	  $(this).css("color", "#ec6090");
	  $("#a_pre").css("color", "#CCC");
	});
});
</script>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** 영화 리스트 ***** -->
			<div class="row">

				<div class="col-lg-3">
					<div class="heading-section">
						<h4><em><a href="#" id="a_now">현재 상영작</a></em></h4>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="heading-section">
						<h4><a href="#" id="a_pre">예정 상영작</a></h4>
					</div>
				</div>
				<div class="col-lg-12" id="now">
					<div class="row">
						<!-- 영화 한 편 시작:복사 시작 -->
						<c:forEach items="${movie_list}" var="list" begin="0" end="3" varStatus="status">
						<div class="col-lg-3 col-sm-6">
							<div class="item">
								<!-- 섬네일 -->
								<div class="thumb">
									<h4 class="n_score"><i class="fa fa-check"> No.${status.count}</i></h4><br>
									<a href="/movie/detail?movie_no=${list.movie_no}">
										<img src="${list.posters}" alt="" style="border-radius: 23px;">
								    </a>
								</div>
								
								<!-- 타이틀 -->
								<div class="down-content" style="margin-top:15px;height: 60px;">
									<h4>
										<a href="/movie/detail">${list.movie_title}</a>
									</h4>
								</div>
								
								<!-- 평점 -->
								<div class="down-content" style="margin-top:5px;">
									<h6>
	<!-- 									예매율 66%<br> -->
										<span><i class="fa fa-star" style="color: yellow;"></i>	${list.score}</span>
									</h6>
								</div>
								
								<!-- 상영일 -->
								<div class="down-content">
									<h6>${list.release_date}</h6>
								</div>
								
								<!-- 예매 버튼 -->
								<div class="down-content">
									<div class="main-button" style="margin-top:10px">
										<a href="/movie/booking">예매하기</a>
									</div>
								</div>
								
							</div>
						</div>
						</c:forEach>
						<!--영화 한 편 끝: 복사 끝 -->
					</div>
				</div> 
				<!-- 현재 상영작 끝-->
				
				
				<!-- 상영 예정작 시작-->
				<div class="col-lg-12" id="pre">
					<div class="row">
						<!-- 영화 한 편 시작:복사 시작 -->
						<c:forEach items="${pre_movie_list}" var="list" begin="0" end="3" varStatus="status">
						<div class="col-lg-3 col-sm-6">
							<div class="item">
								<!-- 섬네일 -->
								<div class="thumb">
									<h4 class="n_score"><i class="fa fa-check"> No.${status.count}</i></h4><br>
									<a href="/movie/detail?movie_no=${list.movie_no}">
										<img src="${list.posters}" alt="" style="border-radius: 23px;">
								    </a>
								</div>
								
								<!-- 타이틀 -->
								<div class="down-content" style="margin-top:15px;height: 60px;">
									<h4>
										<a href="/movie/detail">${list.movie_title}</a>
									</h4>
								</div>
								
								<!-- 평점 -->
								<div class="down-content" style="margin-top:5px;">
									<h6>
	<!-- 									예매율 66%<br> -->
<%-- 										<span><i class="fa fa-star" style="color: yellow;"></i>	${list.score}</span> --%>
									</h6>
								</div>
								
								<!-- 상영일 -->
								<div class="down-content">
									<h6>${list.release_date}</h6>
								</div>
								
								<!-- 예매 버튼 -->
								<div class="down-content">
									<div class="main-button" style="margin-top:10px">
										<a href="/movie/booking">예매하기</a>
									</div>
								</div>
								
							</div>
						</div>
						</c:forEach>
						<!--영화 한 편 끝: 복사 끝 -->
					</div>
				</div> 
				<!-- 상영 예정작 끝 -->
			</div>
        </div>
      </div>
    </div>
  </div>
  
  <%@include file="../include/footer.jspf" %>