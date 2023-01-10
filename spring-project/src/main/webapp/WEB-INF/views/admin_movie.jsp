<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
});
</script>

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
           <a href="${contextPath}/movie/admin/movie" class="list-group-item list-group-item-action active">
             영화 관리
           </a>
           <a href="${contextPath}/movie/admin/article" class="list-group-item list-group-item-action">
             게시글 관리
           </a>
           <a href="${contextPath}/movie/admin/member" class="list-group-item list-group-item-action">
             회원 관리
           </a>
         </div>
         <!-- 메뉴 끝 -->
    </div>
     <!-- 사이드 바 메뉴 끝-->
  </div>
  
  <div class="container">
  
    <!-- ***** 영화 관리 페이지 ***** -->
    <div class="row">
      <div class="col-12">
        <div class="page-content" style="padding-top: 5px">
        
          <div class="game-details">
            <h2>영화 관리 페이지</h2>
          </div>
          
          <!-- 영화 관리 시작 -->
          <div class="most-popular header-text">
            <div class="row">
              <div class="col-lg-12">
              
                <div class="heading-section">
                  <h4><em>영화 관리</em></h4>
                </div>
                
                <div class="row">
                  <a></a>
                  <!-- 폼 테스트 -->
                  <div class="form-area">
                    <form id="form-input" action="#">
                      <input type="text" placeholder="대충 폼 뭐시기" id="searchText" name="searchKeyword" onkeypress="handle">
                      <i class="fa fa-search"></i>
                    </form>
                  </div>
                  <!-- // 폼 테스트 -->
                  
                </div>
                
              </div>
            </div>
          </div>
          <!-- 영화 관리 끝 -->
          
          <!-- 영화 리스트 -->
          <div class="game-details">
            <h2>영화 목록</h2>
          </div>
          
          <div class="gaming-library">
            <div class="col-lg-12">
            
              <!-- 폼 테스트 -->
              <div class="form-area">
                <form id="form-input" action="#">
                  <input type="text" placeholder="영화 제목 검색" id="searchText" name="searchKeyword" onkeypress="handle">
                  <i class="fa fa-search"></i>
                </form>
              </div>
              <!-- // 폼 테스트 -->
              
              <div class="item" style="margin-top: 50px">
                <ul>
                  <li><img src="/assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>제목</h4><span>Sandbox</span></li>
                  <li><h4>상영일</h4><span>05/01/2022</span></li>
                  <li><h4>상영시간</h4><span>1시간 50분</span></li>
                  <li><h4>상태</h4><span>상영중</span></li>
                  <li><div class="main-border-button"><a href="#">관리</a></div></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- 영화 리스트 -->
          
        </div>
      </div>
    </div>
    <!-- ***** 영화 관리 페이지 끝 ***** -->
    
  </div>

<%@ include file="../include/footer.jspf" %>