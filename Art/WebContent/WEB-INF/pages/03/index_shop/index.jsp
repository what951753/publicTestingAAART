<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my reservation</title>
<style>
.ellipsis {
	/* 行數設定 */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
	white-space: normal;
}
</style>

</head>
<body>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">AAART Shop</h1>
					<p class="text-white link-nav">
						<a href="index.html">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<a href="<c:url value='/03/index/shop/index.ctrl' />">
							Creative Shop</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<div class="container">
		<br> <br>
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-70 col-lg-8">
				<div class="title text-center">
					<h1 class="mb-10">藝文商店</h1>
				</div>
			</div>
		</div>
		<div class="back" align="left">
			<div class="submitButton">
				<a href="#" class="genric-btn primary radius">New!新上架</a> <a
					href="#" class="genric-btn primary radius">Hot~熱排行</a> <a href="#"
					class="genric-btn primary radius">Book&#x2606可預約</a> <a href="#"
					class="genric-btn primary radius">Cafe&#x26FE找餐廳</a>
			</div>
		</div>
		<br>
		<div id="id">
			<div class="row">
				<c:forEach items="${shopListbyId}" var="shopListbyId" varStatus="vs">
					<a
						href="<c:url value='/03/index/shop/shopDetails.ctrl?shopId=${shopListbyId.shopId}'/> ">
						<div class="col-lg-3 col-md-6 single-blog">
							<div class="thumb">
								<img class="img-fluid" src="${shopListbyId.image} " alt="">
							</div>
							<p class="date">10 Jan 2018</p>
							<a
								href="<c:url value='/03/index/shop/shopDetails.ctrl?shopId=${shopListbyId.shopId}'/> "><h3>${shopListbyId.shopName}</h3></a>
							<p class="ellipsis">${shopListbyId.intro}</p>
							<div class="meta-bottom d-flex justify-content-between">
								<p>
									<span class="lnr lnr-heart"></span> ${shopListbyId.clicks}
									Likes
								</p>
							</div>
						</div> <br>
					</a>
				</c:forEach>
			</div>
		</div>
		<div id="popularity">
			<div class="row">
				<c:forEach items="${shopListbyPopularity}"
					var="shopListbyPopularity" varStatus="vs">
					<a
						href="<c:url value='/03/index/shop/shopDetails.ctrl?shopId=${shopListbyPopularity.shopId}'/> ">
						<div class="col-lg-3 col-md-6 single-blog">
							<div class="thumb">
								<img class="img-fluid" src="${shopListbyPopularity.image} "
									alt="">
							</div>
							<br> <a
								href="<c:url value='/03/index/shop/shopDetails.ctrl?shopId=${shopListbyPopularity.shopId}'/> "><h4>${shopListbyPopularity.shopName}</h4></a>
							<div>
								<p class="ellipsis">${shopListbyPopularity.intro}</p>
							</div>
							<div class="meta-bottom d-flex justify-content-between">
								<p>
									<span class="lnr lnr-heart"></span>
									${shopListbyPopularity.clicks} Likes
								</p>
							</div>
						</div>
					</a>
					<br>
				</c:forEach>
			</div>
		</div>
		<br>
	</div>
</body>
<!-- ====================================================== -->
<script>
	
</script>