<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
 $(document).ready(function(){
	  $("#a_more").hide();
	  var story = $(".story").text();
	  var cut_story = story.substring(0, 150) + "...";
	  
	  if(story.length >= 150){
		  $("#a_more").css("color", "#ec6090").show();
		  $("#content").html(cut_story);
		  getBtn();
	  } else{
		  $("#content").html(story);
	  }
	  
	  function getBtn(){
		  $("#a_more").click(function(e){
		  var text = $("#a_more").text(); 
			  console.log(text)
			  e.preventDefault();
			  if(text == "더 보기"){
			  $("#content").html(story);
				  $(this).text("접기");
			  } else if(text == "접기"){
				  $("#content").html(cut_story);
				  $(this).text("더 보기");
			  }
		  }); 
	  }
	  
	  // movieVo
	  var list = "${movieVo.staff_list}";
	  list = list.split(', ');
	  var director = list[0].substr(5); // 감독
	  var staff_list = list[1].substr(6); // 출연진
	  $("#director").text('감독  ' + director);
	  
	  // 예약 날짜 구하기
	  var date = "${movieVo.release_date}";
	  date = date.split(" ");
	  var year = date[0].substr(0, 4);
	  var month = date[1].substr(0, 2);
	  var date = date[2].substr(0, 2);
	  date = year + "-" + month + "-" + date;
	  var get_date = new Date(date); // 개봉일
	  var today = new Date(); // 현재 날짜
	  var diff = get_date - today; // 개봉일 - 현재날짜 -> 밀리세컨드로 나옴
	  var diffDay = Math.floor(diff / (1000*60*60*24) + 1); // 밀리세컨드 날짜로 변환
	  $("#diffDay").text("예매 중 D-" + diffDay);
	  
	  // 등급 구하기
	  var rating = "${movieVo.rating}";
	  switch (rating) {
		case "1":
			rating = "전체이용가";
			break;
		case "2":
			rating = "12세 이용가";
			break;
		case "3":
			rating = "15세 이용가";
			break;
		case "4":
			rating = "청소년 이용불가";
			break;
	  }
	  $("#rating").text("등급 " + rating);
});
</script>

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="${movieVo.posters}" alt="" style="border-radius: 23px;">
                  </div>
                  <div class="col-lg-8">
                    <div class="main-info header-text">
                      <c:choose>
                        <c:when test="${movieVo.status eq '상영중'}">
                          <span>현재상영중</span>
                        </c:when>
                        <c:when test="${movieVo.status eq '상영예정'}">
                          <span id="diffDay"></span>
                        </c:when>
                      </c:choose>
                      <h2>${movieVo.movie_title}</h2><br>
                      <h6 id="director"></h6>
                      <h6>장르  ${movieVo.genre}</h6>
                      <h6>국가  ${movieVo.nation}</h6>
                      <h6 id="rating"></h6>
                      <h6>개봉  ${movieVo.release_date}</h6>
                      <h6>타입  ${movieVo.movie_type}</h6>
                      <h6>러닝타임  ${movieVo.runtime }</h6>
                      <div class="main-border-button">
                        <a href="booking">예매하기</a> <!-- 상영 예정작: 날짜에 따라 없을 수도.. -->
                      </div> <br>
                      <div class="col-lg-8">
                      	<a  href="#btnStory"><span>줄거리</span></a>
                      	<a href="#btnStillCut"><span>스틸컷</span></a>
                      	<a href="#btnProducer"><span>감독 및 출연진</span></a>
                      	<a href="#btnReview"><span>리뷰</span></a>
	                 </div>
                  </div> 
                </div>
                <!-- 줄거리 시작 -->
                <div class="row"  id="btnStory">
                  <div class="col-lg-12">
                    <div class="clips">
                      <div class="row">
                      
                        <div class="col-lg-12">
                          <div class="heading-section">
                            <h4><em>줄거리</em></h4>
                          </div>
                        </div>
                        
                        <div class="col-lg-12 story"> <!-- div -->
                            <h5 id="content">${movieVo.movie_story}</h5>
                        </div>
                        
                      </div>
                      
                      <div class="col-lg-12 col-sm-6">
                        <h6><a href="#" id="a_more">더 보기</a></h6>
                      </div>
                      
                    </div>
                  </div>
                </div>
                
                </div>
              </div>
            </div>
          </div>
          <!-- ***** 줄거리 끝 ***** -->
          
          <!-- 스틸컷 시작-->
          <div class="other-games"  id="btnStillCut">
	          <div class="row">
	                  <div class="col-lg-12">
	                      <div class="row">
	                        <div class="col-lg-12">
	                          <div class="heading-section">
	                            <h4>
	                            	<em style="margin-right: 980px">스틸컷</em>
<!-- 	                            <a href="#" style="color:#ec6090">...</a> -->
								</h4>
	                          </div>
	                        </div>
<!-- 	                        <div class="col-lg-12"> -->
							<!-- 스틸컷 시작 -->
							<c:choose>
							  <c:when test="${movieVo.stlls ne null}">
		                        <div class="owl-features owl-carousel">
		                          <c:forEach items="${movieVo.stlls}" var="vo">
		                  	      <div class="item">
		                        	<div class="thumb">
							    	  <img src="${vo}">
		                            </div>
							      </div>
							      </c:forEach>
	                		    </div>
	                		  </c:when>
	                		  <c:otherwise>
	                		    <div class="col-lg-12">
	                		      <h4>스틸컷이 없습니다.</h4><br>
	                		    </div>
	                		  </c:otherwise>
	                		</c:choose>
	                		<!-- 스틸컷 끝 -->
	                        </div>
	                      </div>
	                  </div>
	                </div>
          <!-- 스킬컷 끝 -->
          
          
          <!-- ***** 출연진 정보 ***** -->
          <div class="other-games"  id="btnProducer">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4>
                  	<em style="margin-right: 865px">감독 및 출연진</em>
<!--                   <a href="#" style="color:#ec6090">...</a> -->
                  </h4>
                </div>
              </div>
              <div class="col-lg-4"> <!-- 출연진 정보 시작 -->
                <div class="item">
                  <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item">
                  <h6>강형철</h6><span>감독</span>
                </div>
              </div> <!-- 출연진 정보 끝 -->
              <div class="col-lg-4">
                <div class="item">
                  <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item">
                  <h6>강형철</h6><span>감독</span>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="item">
                  <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item">
                  <h6>강형철</h6><span>감독</span>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** 출연진 끝 ***** -->
          
          <!-- ***** 리뷰 시작 ***** -->
          
<!--           <div class="other-games" id="btnReview"> -->
<!--             <div class="row"> -->
<!--               <div class="col-lg-12"> -->
<!--                 <div class="heading-section"> -->
<!--                   <h4><em style="margin-right: 1015px">리뷰</em><a href="#" style="color:#ec6090">...</a></h4> -->
<!--                 </div> -->
<!--               </div>  -->
<!--               <div class="col-lg-6">리뷰 시작 -->
<!--                 <div class="item"> -->
<!--                   <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item"> -->
<!--                   <h6>Dota 2</h6><br> -->
<!--                   <span>일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육</span> -->
<!--                   <span>일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육</span> -->
<!--                   <ul> -->
<!--                     <li><i class="fa fa-star"></i> 4.8</li> -->
<!--                     <li><i class="fa fa-download"></i> 2.3M</li> -->
<!--                   </ul> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="col-lg-6"> -->
<!--                 <div class="item"> -->
<!--                   <img src="/assets/images/game-02.jpg" alt="" class="templatemo-item"> -->
<!--                   <h4>Dota 2</h4><span>Sandbox</span> -->
<!--                   <ul> -->
<!--                     <li><i class="fa fa-star"></i> 4.8</li> -->
<!--                     <li><i class="fa fa-download"></i> 2.3M</li> -->
<!--                   </ul> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
          
          <!-- ***** 리뷰 끝 ***** -->
        </div>
      </div>
    </div>
  </div>
  
  <%@include file="../include/footer.jspf" %>