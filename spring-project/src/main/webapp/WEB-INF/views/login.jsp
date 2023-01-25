<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	var loginResult = "${loginResult}";
	if (loginResult == "fail") {
		console.log("loginResult",loginResult);
		alert("로그인에 실패했습니다.\n아이디와 비밀번호를 확인해주세요.");
	}
});
</script>

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="/assets/images/profile.jpg" alt="" style="border-radius: 23px;">
                  </div>
                  <div class="col-lg-4 align-self-center">
                  <form name="login" method="post" action="login" id="login">
                  <span>로그인</span>
                    <ul>
                      <li>
                      <input type="text" title="아이디" id="loginid" name="loginid" data-title="아이디를 " data-message="입력하세요." required="required" placeholder="아이디" autofocus>
                      </li>
                      <li>
                      <input type="password" title="비밀번호" id="loginpw" name="loginpw" data-title="비밀번호 " data-message="입력하세요." required="required" placeholder="비밀번호 ">
                      </li>
                    </ul>
                    <div class="main-border-button" style="margin-top: 25px">
                       <div style="float: left;">
                        <button type="submit" id=btnLogin>로그인</button>
                        </div>
                        <div style="float: right;">
                        <a href="register" id="btnregister">회원가입</a>
                        </div>
                    </div>
                    </form>             
                    </div>
                  </div>
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
<%@ include file="../include/footer.jspf" %>          