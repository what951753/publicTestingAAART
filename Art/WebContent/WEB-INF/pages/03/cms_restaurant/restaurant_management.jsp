<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;">得藝食堂 管理系統</h3>
	</div>
	<br>
	<div class=content>
		<form method="post"
			action="<c:url value = "/03/cms/restaurant/searchByYearMonth.ctrl"/>">
			<table id="03A"
				class="display table table-bordered table-hover table-blue">
				<thead>
					<tr class="head">
						<th scope="col" colspan="5" style="font-size: larger">營業時間管理</th>
					</tr>
				</thead>
				<tfoot></tfoot>
				<tbody>
					<tr>
						<td style="font-size: larger">請選擇年份:</td>
						<td><select id="year" name="year" required="required">
								<option selected value="2020">2020年</option>
								<option value="2021">2021年</option>
						</select></td>
						<td style="font-size: larger">請選擇月份:</td>
						<td><select id="month" name="month" required="required">
								<option value="01">1月</option>
								<option value="02">2月</option>
								<option value="03">3月</option>
								<option value="04">4月</option>
								<option value="05">5月</option>
								<option value="06">6月</option>
								<option value="07">7月</option>
								<option value="08">8月</option>
								<option value="09">9月</option>
								<option value="10">10月</option>
								<option value="11">11月</option>
								<option selected value="12">12月</option>
						</select></td>
						<td><input id='btn' type="button" value="查詢"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<br>
	<div class=content id="result"></div>
</div>


<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03A').DataTable({});
	});

	window.onload = function() {
		var btn = document.getElementById("btn"); //按鈕的事件處理函數

		btn.onclick = function() {
			//先清空之前查詢的資料
			document.getElementsById("result").value = "";
			
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			var xhr = new XMLHttpRequest();

			xhr.open("POST","<c:url value='/03/cms/restaurant/searchByYearMonth.ctrl' />",true);

			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send("year=" + year + "&month=" + month);

			xhr.onreadystatechange = function() {
				// 向伺服器提出的請求已經收到回應
				if (xhr.readyState == 4 && xhr.status == 200) {
					// status: HTTP通訊協定的狀態碼伺服器，
					// 200表示Server成功的處理請求
					// getResponseHeader: 取得回應內容的MIME Type

					var restaurantList = JSON.parse(xhr.responseText);
					console.log("restaurantList has loaded completely");

					// 假如有預約資料
					if (restaurantList.length > 0) {
						console.log("restaurantList > 0");
						// 插入該月營業行事曆已存在
						var content = "<div class='submitButton' align='center' style='font-size: larger'>該月營業行事曆已存在</div><br>";

						// 插入詳情(X)、更新與刪除的按鈕表單
						content += "<div class='submitButton' align='center' style='font-size: larger'>";

						// 插入更新的 From 表單
						content += "<div><form method='post' action='<c:url value='/03/cms/restaurant/updateRrestaurantConfirm.ctrl'/>'> ";
						// 預約編號的迴圈
						for (var i = 0; i < restaurantList.length; i++) {
							content += "<div style='display: none'><Input type='hidden' name='restaurantNo' value=" + restaurantList[i].restaurantNo +"></div>";
						}
						content += "<button name='updateButton' type='submit'>修改該月營業行事曆</button>"
								+ "</form></div>";

						// 插入刪除的 From 表單
						content += "<div><form method='post' action='<c:url value='/03/cms/restaurant/deleteRestaurant.ctrl'/>'> ";
						// 預約編號的迴圈
						for (var i = 0; i < restaurantList.length; i++) {
							content += "<div style='display: none'><Input type='hidden' name='restaurantNo' value=" + restaurantList[i].restaurantNo +"></div>";
						}
						content += "<button name='deleteButton' type='submit'>刪除該月營業行事曆</button>"
								+ "</form></div></div>";

						content += "<table id='03B' class='display table table-bordered table-hover table-blue'>";
						content += "<thead><tr><th>日期</th><th>當日是否營業</th><th>線上訂位人數上限</th></tr></thead><tbody>";

						// 迴圈印出預約資料
						for (var i = 0; i < restaurantList.length; i++) {
							if (restaurantList[i].open == 0) {
								var openMsg = "店休日"
							} else {
								var openMsg = "營業日";
							}

							content += "<tr><td>" 
									+ month/ restaurantList[i].day 
									+ "</td>" 
									+ "<td>"
									+ openMsg 
									+ "</td>" 
									+ "<td>"
									+ restaurantList[i].maximum 
									+ "人</td></tr>";
						}
						content += "</tbody></table><br>";

						var result = document.getElementById("result");
						result.innerHTML = content;
					} else {
						// 假如沒有該月行事曆資料
						// 新增的 From
						console.log("沒有該月行事曆資料，新增行事曆表單");
						var content = "<div class='submitButton' align='center' style='font-size: larger'>查無該月營業行事曆</div><br>"
						content += "<div><form method='post' action='<c:url value='/03/cms/restaurant/createRestaurantConfirm.ctrl'/>' > "
								+ "<div class='submitButton' align='center' style='font-size: larger'> "
								+ "<div style='display: none'>"
								+ "<Input type='hidden' name='year' value=" + year +">"
								+ "<Input type='hidden' name='month' value=" + month +">"
								+ "</div>"
								+ "<input type='submit' name='submit' value='新增該月營業行事曆'> "
								+ "</div></form></div>";
						var result = document.getElementById("result");
						result.innerHTML = content;
					}
				}
			}
		}
	}

	$("#result").change(function() {
		$('#03B').DataTable({});
	});
</script>