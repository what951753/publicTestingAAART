<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	body{
		background:"./pic/bkc.png";
	}
	.bor{
		background-color: white;
		width: 400px;
		height: 520px;
		border: rgb(11, 73, 134) dashed 2px;
		border-radius: 50px;
		background-color: white;
		margin: 50px auto; 
	}
	.aaa{
		width: 300px;
		height: 220px;
		padding: 0px;
		margin: auto;
	}
</style>
	<c:forEach var="userView" varStatus="stat" items="${dataForWeb}">
<!-- 黑底起點 -->
<section class="banner-area relative" id="home">	
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">
					${userView.name_SA }
				</h1>	
				<p class="text-white link-nav">
					<a href="index.html">Home </a>
					<span class="lnr lnr-arrow-right"></span>
					<a href='<c:url value="/userStreetArtistPage.ctrl"/>'> 總覽</a>
					<span class="lnr lnr-arrow-right"></span>
					${userView.name_SA }
				</p>
			</div>
		</div>
	</div>
</section>
<!-- 黑底終點 -->
<div>
	<article class="bor">
		<h2 align="center" style="color: red;">藝人資訊</h2>
		<div class="aaa">
        	<figure>
        		<!-- 再想想怎麼導入其他網站 -->
        		<a href="https://www.google.com/">
            		<img src="data:image/jpg;base64, ${userView.pic2_SA}" alt="網路不穩" title="${mas}" width="300" align="middle">
            	</a>
            	<!-- <figcaption>目前暫定可以寫字</figcaption> -->
        	</figure>
		</div>
		<table align="center"  style="border:3px #cccccc solid;" cellpadding="10" border='1'>
			<tr>
				<td style="border-right: ">藝名</td>
				<td>${userView.name_SA }</td>
			</tr>
			<tr>
				<td>來自</td>
				<td>${userView.country_SA }</td>
			</tr>
			<tr>
				<td>表演項目</td>
				<td>${userView.theme_SA }</td>
			</tr>
			<tr>
				<td>分類</td>
				<td>${userView.classification_SA }</td>
			</tr>
			<tr>
				<td>喜歡的話支持一下吧，</td>
				<td>
					<form action="ToDonate.ctrl">
						<input type="hidden" value="${userView.id_SA}"  name="id_SA"/>
						<input type="submit" name="submit" value="支持他" id="bbb"/>
					</form>
				</td>
			</tr>
		</table>
	</article>
</div>
	</c:forEach>