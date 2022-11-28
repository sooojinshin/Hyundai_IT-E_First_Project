<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderList" value="${orderList}" />
<%@include file="/layout/header.jsp"%>
<div id="container">
	<section class="content-wrap">
		<input type="hidden" name="hPointEnableYn" id="hPointEnableYn" value="">
		<!-- snb -->
		<div class="snb-wrap">
			<h2 class="lnb-title">
				<a href="${contextPath}/user/mypage/mypage.jsp">MYPAGE</a>
			</h2>
			<nav id="lnb" class="lnb">
				<ul>
					<li>
						<div class="menu-depth1">쇼핑정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/user/mypage/listOrder.jsp">주문</a></li>
							<li><a href="${contextPath}/user/mypage/listClaimOrder.jsp">주문취소</a></li>

						</ul>
					</li>
					<li>
						<div class="menu-depth1">회원정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/user/mypage/pwdConfirm.jsp">회원정보 수정</a></li>
							<li><a href="${contextPath}/user/mypage/memberSecession.jsp">회원 탈퇴</a></li>
						</ul>
					</li>

				</ul>
			</nav>
		</div>
		<div class="snb-content-wrap">
			<h3 class="sec-title">
				최근 주문상품 <span class="sub2">(최근 1개월 기준)</span>
			</h3>
			<div class="order-list-wrap order-slide-section">
				<div class="order-tbl order-history order-slide">
					<div class="slide-container noswipe">
						<!-- 전체한번만 노출 -->
						<div class="swiper-wrapper">
							<!--  슬라이드 단위 주문 3건씩 노출 -->
							<div class="swiper-slide">
								<!-- body -->
								<div class="body">
									<!-- row -->
									<c:forEach var="item" items="${orderList}">

										<div class="row">
											<div class="inner">
												<div class="cell-pd-wrap">
													<!-- 상품1개씩 -->
													<div class="inner-row">
														<div class="info-row">
															<div class="cell-pd">
																<div class="item-img" godno="GM0122062466107">
																	<a href="Hfashion?command=detail&pno=${item.pro_no}"> <img src="${contextPath}/${item.img_url}">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-brand">
																		<a href="Hfashion?command=detail&pno=${item.pro_no}">${item.brand_name} </a>
																	</div>
																	<div class="item-name clear-ellipsis">
																		<a href="Hfashion?command=detail&pno=${item.pro_no}">${item.pro_name}</a>
																	</div>
																	<div class="item-opt">
																		<a href="Hfashion?command=detail&pno=${item.pro_no}"> <span>${item.product_option}</span> <span>수량 : ${item.order_amount} </a>
																	</div>
																	<div class="item-btn"></div>


																</div>
															</div>
															<div class="cell-price">
																<div class="cell-inner">
																	<div class="price">
																		<span><span class="num"><fmt:formatNumber value="${item.pro_price}" pattern="#,###" /></span> 원</span>
																	</div>
																</div>
															</div>
															<div class="cell-status">
																<div class="cell-inner">
																	<div class="status">
																		주문날짜<br> <span class="txt-cmt pcolor">${item.order_date}</span>
																	</div>
																</div>
															</div>
															<div class="cell-btn">
																<div class="cell-inner">
																	<div class="cell-inner">
																		<div class="btns">
																			<button type="button" class="btn-type3-sm" onclick="jsUnitCancel('OD202211267120945', 'Y', 'N');">
																				<span>주문취소</span>
																			</button>
																		</div>
																		<div>
																		
																			<form action="${contextPath}/Hfashion?command=reviewwriteform" method="get">
																				<input type="hidden" id="proname" value="${item.pro_name}">
																				<input type="hidden" id="r_check" value=""${item.review_check}""> 
																				
																				<input type="submit" class ="btn-type3-sm" value="리뷰작성">
																			</form>
																			<button type="button" class="btn-type3-sm" onclick="jsUnitCancel('OD202211267120945', 'Y', 'N');">
																				<span>후기작성</span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- //inner-row 상품1개씩-->

													<!--  orderList -->

												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 전체한번만 노출 -->


					</div>
					<div class="order-links">
						<ul>
							<li><a href="/secured/mypage/listOrder">주문/배송 조회</a></li>
							<li><a href="/secured/mypage/listClaimOrder">취소/교환/반품 <span class="num">0</span>건
							</a></li>
						</ul>
					</div>
					<div class="slide-util">
						<span class="slide-active"></span> <span class="bar">/</span> <span class="slide-total"></span> <span class="slide-nav type2">
							<button type="button" class="slide-nav-prev">이전</button>
							<button type="button" class="slide-nav-next">다음</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>