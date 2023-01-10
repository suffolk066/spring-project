<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
  $(document).ready(function() {
	  
	// 장바구니 전체 선택
	 $("#cartListAllCheck").click(function() {
		var check = $("#cartListAllCheck").prop("checked");
		if (check) {
			$(".checkbox").prop("checked", true);
			itemNum();
		}
			else {
			$(".checkbox").prop("checked", false);
			itemNum();
		}
	 }); //  $("#cartListAllCheck").click(function()
   
			 
	// 한 개 이상 체크박스 해제할 경우
	 $(".checkbox").click(function () {
        $("#cartListAllCheck").prop("checked", false);
     });
	 
	 
  	// 금액 합
  	 function itemNum() {
	     var str = "";
	     var sum = 0;
	     var count = $(".checkbox").length;
	     for (var i = 0; i < count; i++) {
	         if ($(".checkbox")[i].checked == true) {
	             sum += parseInt($(".checkbox")[i].value);
	         }
	     }
	     $("#spanCartPay").text(sum + " 원");
    }
			 
  });
</script>
<style>
.cartImg img {
	width:70px;
	height:70px;
}

th, td {
	color : #fff;
 	padding : 30px; 
}

td img {
	width:100px;
}

.countNum{
	width:70px;
	height:25px;
	text-align:center;
}

.btnStorePay{
	margin-top:20px;
	margin-left:1060px;
}
</style>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">

					<!-- ***** 장바구니 시작 ***** -->
					<div class="row">
						<div class="col-lg-12">
							<div class="cart-table_title">
								<div class="heading-section cartImg">
									<h4>
										<img src="/assets/images/storeCartImg.png"> 장바구니
									</h4>
									<br>
								</div>
								<!-- heading-section 부분 -->
								<div class="cart-table">
									<table border="2"; style="width: 100%; color: white; text-align: center">
										<thead>
											<tr>
												<!-- 상품 전체선택 -->
												<th><input type="checkbox" name="cartListAllCheck" id="cartListAllCheck" checked /></th>
												<th scope="col" class="checkboxAll">상품명</th>
												<th scope="col">상품 금액</th>
												<th scope="col">수량</th>
												<th scope="col">총 구매 금액</th>
											</tr>
										</thead>
										<tbody>
<%-- 					              				<c:forEach items="${cartList}" var="cartList"> --%>
											<tr>
												<td><input type="checkbox" onClick="itemNum()" class="checkbox" value="" data-cartNum="${cartList.cartNum}" checked/></td>
												<td class="td-product"><img src="${cartList.productImg}" alt="${cartList.productImg}" />상품${cartList.product}</td>
												<td class="td-price"><f:formatNumber pattern="###,###" value="${cartList.price}" />원</td>
												<td><input type="number" class="countNum" />${cartList.cartCountNum}</td>
												<td class="td-totalPrice"><f:formatNumber pattern="###,###" value="${cartList.totalPrice}" />원</td>
											</tr>
<%-- 											 	</c:forEach> --%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** 장바구니 끝 ***** -->

					<!-- 결제 모달 시작 -->
					<button type="button" class="btn btn-lg btn-danger btnStorePay" id="btnStorePayModal"
						data-toggle="modal" data-target="#myModal">구매하기</button>
					<div class="modal fade" id="myModal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title" style="color:black">결제 확인</h4>
								</div>

								<!-- Modal body -->
								<div class="modal-body" style="font-size:15pt">
									총 상품 금액 : <span id="spanCartPrice"></span><br><br>
							        할인 금액 : <span id="spanCartDiscount"></span><br><br>
							        총 결제 예정 금액 : <span id="spanCartPay"></span><br>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-success"
										data-dismiss="modal">결제</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
								</div>

							</div>
						</div>
					</div>
					<!-- 결제 모달 끝 -->
				</div>
			</div>
		</div>
	</div>

 <%@include file="../include/footer.jspf" %>