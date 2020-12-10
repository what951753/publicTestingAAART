<%@page import="tw.group4._04_.front.shopcart.model.Shoppingcart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>節目內容</title>
<style>
td {
	width: 100px;
}

.halfnum {
	width: 30px;
}

.adultnum {
	width: 30px;
}

.title {
	width: 200px;
}

.total1 {
	width: 120px;
}

.total2 {
	width: 120px;
}

.totalprice {
	width: 120px;
}

.price2 {
	width: 200px;
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
							<h1 class="text-white">
								AAART Ticket
							</h1>	
							<p class="text-white link-nav"><a href="<c:url value='/index.html' />">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href=""> Search</a><span class="lnr lnr-arrow-right"></span><a href=""> Detail</a></p>
						</div>											
					</div>
				</div>
			</section>
	<!-- End banner Area -->

<div class="container">

<!-- You can use Open Graph tags to customize link previews.
Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
<meta property="og:url"           content="http://localhost:8080/Art/04/showDetail.ctrl?actid=${actid}"  />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="Your Website Title" />
<meta property="og:description"   content="Your description" />
<meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" />
</head>
<body>



		<form name="order" action="<c:url value='/04/booking.ctrl'/>" method="get">

		<!-- 用param.取，相當於request.getParameter-->
		<c:set var="actid" value="${actid}" scope="session"/>
		<c:set var="title" value="${title}" scope="session" />
		<c:set var="site" value="${site}" scope="session" />
		<c:set var="description" value="${description}" scope="session" />
<%-- 		<jsp:useBean id="shoppingCart" class="tw.group4._04_.front.shopcart.model.Shoppingcart" scope="session"/>  --%>
<%-- 		<jsp:setProperty name="shoppingCart" property="*"/> --%>
		
<%-- 		<c:set var="title" value="${param.title}" scope="session" /> --%>
<%-- 		<c:set var="description" value="${param.description}" /> --%>


		<br><H1>節目詳細 </H1>
		<br><H4>節目名稱: ${title}</H4>	
		<br><H4>地點: ${site}</H4>		
<!-- 		<H2>主辦單位:</H2>		 -->
<%-- 		<H2>${}</H2> --%>
<!-- 		<H2>演出單位:</H2>		 -->
<%-- 		<H2>${}</H2> --%>
		<br><H4>活動日期: ${startdate} ~ ${enddate}</H4>		

		
		
		<br><h4>節目簡介:</h4>
		<P>${description}</P><br><br>
		
		
		<img style='display:block;width:800px;' src="data:image/jpg;base64,${photo}" >
		
		<br><br><iframe width="100%" height="250" frameborder="0" src="https://www.google.com/maps?q=${site}&output=embed"></iframe>

		<br><br><H2>票券資訊</H2>
		<table class="table table-bordered">
		<tr> 
				<td>節目名稱</td>
				<td>票種</td>
				<td>座位</td>
				<td>票價</td>
				
				

			</tr>
			<tr> 
				<td class="title">${title}</td>
				<td>半票</td>
				<td>自行劃位</td>
				<td>NT$1000</td>
		
				
			</tr>
						<tr> 
				<td class="title">${title}</td>
				<td>全票</td>
				<td>自行劃位</td>
				<td>NT$2000</td>
				
			</tr>
		</table>
		
				<br><br><input type="submit" class="genric-btn primary-border radius" value="購買">

		</form>
		
	<!-- 				Start blog Area
			<section class="blog-area section-gap" id="blog">
				<div class="container">
			
				<h1 class="mb-10">找類似</h1>
					<div class="row">
						<div class="col-lg-3 col-md-6 single-blog">
							<div class="thumb">
								<img class="img-fluid" src="/Art/frontstyle/img/blog_5.jpg" alt="">								
							</div>
							<p class="date">10 Jan 2018</p>
							<a href="#"><h4>藝術課程 #1</h4></a>
							<p>
								inappropriate behavior ipsum dolor sit amet, consectetur.
							</p>
							<div class="meta-bottom d-flex justify-content-between">
								<p><span class="lnr lnr-heart"></span> 15 Likes</p>
								<p><span class="lnr lnr-bubble"></span> 02 則回應</p>
							</div>									
						</div>
						<div class="col-lg-3 col-md-6 single-blog">
							<div class="thumb">
								<img class="img-fluid" src="/Art/frontstyle/img/blog_2.jpg" alt="">								
							</div>
							<p class="date">10 Jan 2018</p>
							<a href="#"><h4>藝術課程 #2</h4></a>
							<p>
								inappropriate behavior ipsum dolor sit amet, consectetur.
							</p>
							<div class="meta-bottom d-flex justify-content-between">
								<p><span class="lnr lnr-heart"></span> 15 Likes</p>
								<p><span class="lnr lnr-bubble"></span> 02 則回應</p>
							</div>									
						</div>
						<div class="col-lg-3 col-md-6 single-blog">
							<div class="thumb">
								<img class="img-fluid" src="/Art/frontstyle/img/blog_3.jpg" alt="">								
							</div>
							<p class="date">10 Jan 2018</p>
							<a href="#"><h4>藝術課程 #3</h4></a>
							<p>
								inappropriate behavior ipsum dolor sit amet, consectetur.
							</p>
							<div class="meta-bottom d-flex justify-content-between">
								<p><span class="lnr lnr-heart"></span> 15 Likes</p>
								<p><span class="lnr lnr-bubble"></span> 02 則回應</p>
							</div>									
						</div>
						<div class="col-lg-3 col-md-6 single-blog">
							<div class="thumb">
								<img class="img-fluid" src="/Art/frontstyle/img/blog_4.jpg" alt="">								
							</div>
							<p class="date">10 Jan 2018</p>
							<a href="#"><h4>藝術課程 #4</h4></a>
							<p>
								inappropriate behavior ipsum dolor sit amet, consectetur.
							</p>
							<div class="meta-bottom d-flex justify-content-between">
								<p><span class="lnr lnr-heart"></span> 15 Likes</p>
								<p><span class="lnr lnr-bubble"></span> 02 則回應</p>
							</div>									
						</div>							
					</div>
				</div>	
			</section>
			End blog Area -->
		
		

</body>

</html>