<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;">藝文商店詳細資訊</h3>
	</div>
	<br>
	<div class="back" align="right">
		<form action="<c:url value='/03/cms/shop/index.ctrl'/> " method="post">
			<div class="submitButton">
				<input type="submit" class="" name="submit" value="返回 藝文商店管理">
			</div>
		</form>
	</div>
	<br>
	<div class=content>
		<table id="03"
			class="display table table-bordered table-hover table-blue">
			<thead></thead>
			<tbody>
				<c:if test="${acShopsList != null}">
					<c:forEach items="${acShopsList}" var="acShopsList" varStatus="vs">
						<tr>
							<td>商店編號</td>
							<td>${acShopsList.shopId}</td>
						</tr>
						<tr>
							<td>商店名稱</td>
							<td>${acShopsList.shopName}</td>
						</tr>
						<tr>
							<td>會員帳號</td>
							<td>${acShopsList.memberId}</td>
						</tr>
						<tr>
							<td>代表圖示 (icon)</td>
							<td>${acShopsList.image}</td>
						</tr>
						<tr>
							<td>簡介</td>
							<td><textarea placeholder="請輸入簡介內容" name="intro" readonly
									style="width:500px; height: 90px;">${acShopsList.intro}</textarea></td>
						</tr>

						<!-- ====================================================== -->

						<tr>
							<td>縣市名</td>
							<td>${acShopsList.cityName}</td>
						</tr>
						<tr>
							<td>地址</td>
							<td>${acShopsList.address}</td>
						</tr>
						<tr>
							<td>營業時間</td>
							<td>${acShopsList.openTime}</td>
						</tr>
						<tr>
							<td>連絡電話</td>
							<td>${acShopsList.phone}</td>
						</tr>
						<tr>
							<td>傳真號碼</td>
							<td>${acShopsList.fax}</td>
						</tr>

						<!-- ====================================================== -->

						<tr>
							<td>電子郵件</td>
							<td>${acShopsList.email}</td>
						</tr>
						<tr>
							<td>Facebook連結網址</td>
							<td>${acShopsList.facebook}</td>
							<td></td>
						</tr>
						<tr>
							<td>商店網站連結網址</td>
							<td>${acShopsList.website}</td>
						</tr>
						<tr>
							<td>點擊次數</td>
							<td>${acShopsList.clicks}</td>
						</tr>
						<tr>
							<td>是否允許使用預約系統</td>
							<td><div id="result"></div></td>
						</tr>
						<tr style="display: none">
							<td><input type="hidden" name="reservation" id="reservation"
								value="${acShopsList.reservation}"></td>
						</tr>
						<!-- ====================================================== -->
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<br>
		<c:if test="${acShopsSerachMsg != null}">
			<div align="center" style="font-size: larger">${acShopsSerachMsg}</div>
			<br>
		</c:if>
		<br>
	</div>
</div>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});

	window.onload = function() {
		var reservation = document.getElementById("reservation").value;
		if (reservation == 0) {
			var content = "不使用預約系統";
		} else {
			var content = "使用預約系統";
		}
		var result = document.getElementById("result");
		result.innerHTML = content;
	}
</script>