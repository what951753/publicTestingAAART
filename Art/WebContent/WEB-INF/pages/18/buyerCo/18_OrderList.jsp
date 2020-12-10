<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">訂單一覽</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a> <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a> <span
						class="lnr lnr-arrow-right"></span> <a
						href="<c:url value='/18/toCoCart.ctrl' />">購物車</a> 
						<span class="lnr lnr-arrow-right"></span> <a
						href="<c:url value='/18/coOrderList.ctrl' />">訂單一覽</a>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->


<table class="table table-bordered">
	<thead>
		<tr>
			<th colspan="4" align="center">訂單一覽</th>
		</tr>
		<tr>
			<th>訂單編號</th>
			<th>下單日期</th>
			<th>收件地址</th>


		</tr> 
		<c:forEach varStatus="stat" var="orderListCo" items="${col}">
			<tr>
				<td><a
					href='<c:url value='/18/coOrderListOne.ctrl?orderNoCo=${orderListCo.orderNoCo}' />'>
						${orderListCo.orderNoCo}</a></td>
				<td>${orderListCo.date}</td>
				<td>${orderListCo.customerAddress}</td>

			</tr>
		</c:forEach>
		<tr height='36' id='borderA'>
			<td id='borderA' align="center" colspan="4"><a
				href="<c:url value='/18/cSelectAllFront.ctrl' />">回首頁</a></td>
		</tr>
</table>
