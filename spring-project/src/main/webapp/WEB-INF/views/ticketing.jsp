<%@page import="com.kh.project.util.MovieShuffle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/header.jspf" %>
<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- 예매 -->
          <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4><em>예매</em></h4>
                </div>
					
				<div class="pagination"> <!-- 페이징(날짜) -->
					<a href="#"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
					<c:forEach begin="1" end="7" var="i">
						<a href="#">${i}</a>
					</c:forEach>
					<a href="#"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
					<a href="#"><i class="fa fa-calendar" aria-hidden="true"></i></a>
				</div> <!-- 페이징(날짜) 끝  -->
				
				<!-- 예매 구성  -->
               	<div class="row">
					<div class="col-md-3"><!-- 영화선택 -->
						<!-- <div class="heading-section" style="margin-top: 20px; text-align: center">
		                  <h4>영화</h4>
		                </div>   -->
		                  <div style="background-color: white; overflow: scroll; height: 200px">
		                  		<table class="table table-hover">
									<thead>
										<tr>
											<th>
												영화
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="5">
										<tr>
											<td>
												영화${v}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
		                
					</div><!-- 영화선택 끝 -->
					
					<div class="col-md-4"><!-- 상영관 선택 -->
						<div style="background-color: white; overflow: scroll; height: 200px">
		                  		<table class="table table-hover">
									<thead>
										<tr>
											<th>
												상영관
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="5">
										<tr>
											<td>
												상영관${v}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
					
					<div class="col-md-5"><!-- 시간 선택 -->
						<div style="background-color: white; overflow: scroll; height: 200px">
		                  		<table class="table table-hover">
									<thead>
										<tr>
											<th>
												시간
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="5">
										<tr>
											<td>
												시간${v}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
				</div><!-- 예매 구성 끝  -->
               	
              </div>
            </div>
          </div> <!-- 예매 끝 -->

          
          <!-- ***** Featured Games End ***** -->
          <!-- ***** Start Stream Start ***** -->
          <div class="start-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>How To Start Your</em> Live Stream</h4>
              </div>
              <div class="row">
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="/assets/images/service-01.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>Go To Your Profile</h4>
                    <p>Cyborg Gaming is free HTML CSS website template provided by TemplateMo. This is Bootstrap v5.2.0 layout.</p>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="/assets/images/service-02.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>Live Stream Button</h4>
                    <p>If you wish to support us, you can make a <a href="https://paypal.me/templatemo" target="_blank">small contribution via PayPal</a> to info [at] templatemo.com</p>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="/assets/images/service-03.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>You Are Live</h4>
                    <p>You are not allowed to redistribute this template's downloadable ZIP file on any other template collection website.</p>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="main-button">
                    <a href="profile.html">Go To Profile</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Start Stream End ***** -->

          <!-- ***** Live Stream Start ***** -->
          <div class="live-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>Most Popular</em> Live Stream</h4>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img src="/assets/images/stream-01.jpg" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> KenganC</span>
                    <h4>Just Talking With Fans</h4>
                  </div> 
                </div>
              </div>
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img src="/assets/images/stream-02.jpg" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/assets/images/avatar-02.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> LunaMa</span>
                    <h4>CS-GO 36 Hours Live Stream</h4>
                  </div> 
                </div>
              </div>
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img src="/assets/images/stream-03.jpg" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/assets/images/avatar-03.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> Areluwa</span>
                    <h4>Maybe Nathej Allnight Chillin'</h4>
                  </div> 
                </div>
              </div>
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img src="/assets/images/stream-04.jpg" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/assets/images/avatar-04.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> GangTm</span>
                    <h4>Live Streaming Till Morning</h4>
                  </div> 
                </div>
              </div>
              <div class="col-lg-12">
                <div class="main-button">
                  <a href="streams.html">Discover All Streams</a>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Live Stream End ***** -->

        </div>
      </div>
    </div>
  </div>
<%@include file="../include/footer.jspf" %>

