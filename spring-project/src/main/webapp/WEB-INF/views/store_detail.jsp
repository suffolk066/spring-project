<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
  $(document).ready(function() {
	  
	// 버튼 클릭 시 장바구니로 이동하면 됨
	// 선택한 값 같이 넘어가게 처리하기
	 $("#btnStoreCart").click(function() {

	 }
			 
  });
  
</script>

<style>
.top-downloaded img {
	width: 100%;
	height: 100%;
}
</style>
  
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
        	<div class="heading-section">
               <h4><em>MOVIE</em> STORE	<button type="button" class="btn btn-success" id="btnStoreCart" style="margin-left:800px">장바구니<span class="badge badge-light" style="font-size:9pt">4</span></button></h4>
			</div>
   <!-- ***** 스토어 시작 ***** -->
          <div class="row" style="margin-top:50px">
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>영화관람권</h4>
                </div>
                <ul>
					<li><img src="../images/storeTicketA.png" alt="storeTicketA"></li>
					<li><img src="../images/storeTicketB.png" alt="storeTicketB"></li>
					<li><img src="../images/storeTicketC.png" alt="storeTicketC"></li>
				</ul>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>기프트카드</h4>
                </div>
                <ul>
					<li><img src="../images/storeCardTypeA.png" alt="storeCardTypeA"></li>
					<li><img src="../images/storeCardTypeB.png" alt="storeCardTypeB"></li>
					<li><img src="../images/storeCardTypeC.png" alt="storeCardTypeC"></li>
				</ul>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>스낵</h4>
                </div>
                <ul>
					<li><img src="../images/storeSnackPopcorn.png" alt="storeSnackPopcorn"></li>
					<li><img src="../images/storeSnackHotdog.png" alt="storeSnackHotdog"></li>
					<li><img src="../images/storeSnackNacho.png" alt="storeSnackNacho"></li>
				</ul>
              </div>
            </div>
            <div class="col-lg-4" style="margin-top:50px">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>음료</h4>
                </div>
                <ul>
					<li><img src="../images/storeSnackPopcorn.png" alt="storeSnackPopcorn"></li>
					<li><img src="../images/storeSnackHotdog.png" alt="storeSnackHotdog"></li>
					<li><img src="../images/storeSnackNacho.png" alt="storeSnackNacho"></li>
				</ul>
              </div>
            </div>
            </div>
          
          <!-- ***** 스토어 끝 ***** -->
           </div>
      </div>
    </div>
  </div>
  
  <%@include file="../include/footer.jspf" %>