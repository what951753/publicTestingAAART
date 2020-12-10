<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">訂單</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a>
				    <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a>
					<span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/toCoCart.ctrl' />">購物車</a> 
						<span class="lnr lnr-arrow-right"></span> <a
						href="<c:url value='/18/coOrderList.ctrl' />">訂單一覽</a>
					<span class="lnr lnr-arrow-right"></span>
					<span>單筆訂單</span>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->


<table class="table table-bordered">
<tr><th colspan="6" align="center">單筆訂單</th></tr>
<tr>
<td colspan="6">
<table>
<tr>
  <td>訂單編號：${cooo.orderNoCo}</td>
  <td>下單日期：${cooo.date}</td>
  <td>地址：${cooo.customerAddress}</td>
</tr>
</table>
</td>
</tr>
<tr>
<th id='borderA' width="100px" align="center">#</th>
			<th id='borderA' width="100px" align="center">品項</th>
			<th id='borderA' width="70px" align="center">單價</th>
			<th id='borderA' width="50px" align="center">數量</th>
			<th id='borderA' width="100px" align="center">總價</th>
</tr>
		<c:set var="subtotal" value="0" />
		<c:forEach var="olone" varStatus="stat" items="${cooo.courseOrderItems}"> 
		<!-- 因為有兩層所以要選到courseOrderItems層
		cooo.courseOrderItems 在CourseCartController #130 + CourseOrders #46 -->
			<tr id='borderA' bgColor="FFFFFF" height='30'>
				<td id='borderA' align="center">${stat.count}</td>
				<td id='borderA' align="center">${olone.courseTitle}</td>
				<td id='borderA' align="center">${olone.coursePrice}</td>
				<td id='borderA' align="center">${olone.courseNum}</td>
				<td id='borderA' align="center">${olone.coursePrice * olone.courseNum}</td>
				
				
				<c:set var="total"
					value="${ total + olone.coursePrice * olone.courseNum }" />
			</tr>
		</c:forEach>
		<tr height='30'>
			<TD id='borderA' align="center">&nbsp;</TD>
			<TD id='borderA' width="60px" align="center" colspan="2"><b>合 計</b></TD>
			<TD id='borderA' width="100px" align="right" colspan="2">
			   <fmt:formatNumber value="${total}" pattern="#,###,###" />元</TD>
		
	</TABLE>