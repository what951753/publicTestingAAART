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
/* p, div { */

/* } */
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
						<a
							href="<c:url value='/03/front/reservation/chooseNumberAndDate' />">
							食堂訂位</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<div class="container">
		<p>加上輪播圖片</p>
		<br>
		<div class=title>
			<h3 align="center" style="margin-top: 20px;">得藝食堂線上訂位</h3>
		</div>
		<div class=title>
			<h3 align="center" style="margin-top: 20px;">修改用餐人數</h3>
		</div>
		<br>
		<div class=content>
			<form method="post"
				action="<c:url value="/03/front/reservation/update.ctrl"/>">
				<table id="03" class="display table table-hover table-blue">
					<thead>
						<tr class="head">
							<th scope="col" colspan="4"
								style="font-size: larger;">您所預定的用餐時段 &ensp;${moment}&ensp;目前還剩下${remainingNum}個座位</th>
						</tr>
						<tr class="head">
							<th scope="col" colspan="4"
								style="font-size: larger; background-color: #FAD689">修改用餐人數</th>
						</tr>
					</thead>
					<tfoot></tfoot>
					<tbody>
						<tr>
							<td style="font-size: larger">請選擇大人人數:</td>
							<td>
							
							
							<select id="newAdultsNum" name="newAdultsNum"
								required="required">
									<option value="1">1位大人</option>
									<option value="2">2位大人</option>
									<option value="3">3位大人</option>
									<option value="4">4位大人</option>
									<option value="5">5位大人</option>
							</select>
							
							
							
							</td>
							<td style="font-size: larger">請選擇小孩人數:</td>
							<td><select id="newChildrenNum" name="newChildrenNum"
								required="required">
									<option value="0">0位小孩</option>
									<option value="1">1位小孩</option>
									<option value="2">2位小孩</option>
									<option value="3">3位小孩</option>
									<option value="4">4位小孩</option>
									<option value="5">5位小孩</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="submitButton" align="center" style="font-size: larger">
					<input type="submit" name="submit" value="修改用餐人數">
				</div>
				<br>
				
				
				
				
				
			</form>
		</div>
	</div>
</body>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});
</script>