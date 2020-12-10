<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:forEach var="userView" varStatus="stat" items="${streetArtist}">
<!-- 黑底起點 -->
<section class="banner-area relative" id="home">	
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">
					Donate介面
				</h1>	
				<p class="text-white link-nav">
					<a href="index.html">Home </a>
					<span class="lnr lnr-arrow-right"></span>
					<a href='<c:url value="/userStreetArtistPage.ctrl"/>'> 總覽</a>
					<span class="lnr lnr-arrow-right"></span>
					為 ${userView.name_SA } 獻上新台幣
				</p>
			</div>											
		</div>
	</div>
</section>
<!-- 黑底終點 -->
<div>
<form action="searchSA2.ctrl">
	<span style="text-align: center;display: block;">
		<input type="text" name="name">
		<input type="submit" value="搜尋（樂器或分類）">
	</span>
</form>
</div>
<h1 style="filter: glow(color=#3366FF,strength=3); height:10px; color:blue; padding:1px;font-style:oblique;text-align: center;">
	地方街頭藝人<u> ${userView.name_SA } </u>需要您的支持與鼓勵
</h1>
<form action="doDonate.ctrl" method="get">
<table class="display" align="center" style="background-color: rgb(196, 223, 77);margin-top: 40px">
	<tr>
		<td>姓名：</td>
		<td>${userView.name_SA }</td>
	</tr>
		<tr>
			<td>斗內：</td>
			<td>
				<input type="hidden" value="${userView.id_SA }" name="id_SA">
				<input type="text" name="sal" placeholder="請輸入金額">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" name="submit" value="確認並送出"></td>
		</tr>
</table>
</form>
</c:forEach>