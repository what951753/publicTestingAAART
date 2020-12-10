<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;">得藝食堂 管理系統</h3>
	</div>
	<br>
	<div class="back" align="right">
		<form
			action="<c:url value='/03/cms/restaurant/restaurantManagement'/> "
			method="get">
			<div class="submitButton">
				<input type="submit" class="" name="submit" value="返回 營業時間管理首頁">
			</div>
		</form>
	</div>
	<br>
	<div class=content>
		<form method="post"
			action="<c:url value = "/03/cms/restaurant/updateRestaurant.ctrl"/>">
			<div align="center" style="font-size: large;">${restaurantList[0].year}年
				${restaurantList[0].month}月營業行事曆</div>
			<br>
			<table id="03"
				class="display table table-bordered table-hover table-blue">
				<thead>
					<tr>
						<th>日期</th>
						<th>當日是否營業</th>
						<th>線上訂位人數上限</th>
						<th>營業時段</th>
					</tr>
				</thead>
				<tfoot></tfoot>
				<tbody>
					<c:forEach items="${restaurantList}" var="restaurantList"
						varStatus="vs">
						<tr>
							<td><input type="hidden" name="day"
								value="${restaurantList.day}">${restaurantList.month}/${restaurantList.day}</td>
							<td><c:choose>
									<c:when test="${restaurantList.open == 1}">
										<select name="open">
											<option value="1" selected>營業日</option>
											<option value="0">店休日</option>
										</select>
									</c:when>
									<c:otherwise>
										<select name="open">
											<option value="1">營業日</option>
											<option value="0" selected>店休日</option>
										</select>
									</c:otherwise>
								</c:choose></td>
							<td><select name="maximum">
									<option value="${restaurantList.maximum}" selected>${restaurantList.maximum}位</option>
									<option value="1">1位</option>
									<option value="2">2位</option>
									<option value="3">3位</option>
									<option value="4">4位</option>
									<option value="5">5位</option>
									<option value="6">6位</option>
									<option value="7">7位</option>
									<option value="8">8位</option>
									<option value="9">9位</option>
									<option value="10">10位</option>
									<option value="11">11位</option>
									<option value="12">12位</option>
									<option value="13">13位</option>
									<option value="14">14位</option>
									<option value="15">15位</option>
									<option value="16">16位</option>
									<option value="17">17位</option>
									<option value="18">18位</option>
									<option value="19">19位</option>
									<option value="20">20位</option>
									<option value="21">21位</option>
									<option value="22">22位</option>
									<option value="23">23位</option>
									<option value="24">24位</option>
									<option value="25">25位</option>
									<option value="26">26位</option>
									<option value="27">27位</option>
									<option value="28">28位</option>
									<option value="29">29位</option>
									<option value="30">30位</option>
									<option value="31">31位</option>
									<option value="32">32位</option>
									<option value="33">33位</option>
									<option value="34">34位</option>
									<option value="35">35位</option>
									<option value="36">36位</option>
									<option value="37">37位</option>
									<option value="38">38位</option>
									<option value="39">39位</option>
									<option value="40">40位</option>
									<option value="41">41位</option>
									<option value="42">42位</option>
									<option value="43">43位</option>
									<option value="44">44位</option>
									<option value="45">45位</option>
									<option value="46">46位</option>
									<option value="47">47位</option>
									<option value="48">48位</option>
									<option value="49">49位</option>
									<option value="50">50位</option>
							</select></td>
							<td>
								<div class="default-select">
									<c:choose>
										<c:when test="${restaurantList.h09 != -1}">
											<label>09:00</label>
											<select name="oh09">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>09:00</label>
											<select name="oh09">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h10 != -1}">
											<label>10:00</label>
											<select name="oh10">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>10:00</label>
											<select name="oh10">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h11 != -1}">
											<label>11:00</label>
											<select name="oh11">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>11:00</label>
											<select name="oh11">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h12 != -1}">
											<label>12:00</label>
											<select name="oh12">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>12:00</label>
											<select name="oh12">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="default-select">
									<c:choose>
										<c:when test="${restaurantList.h13 != -1}">
											<label>13:00</label>
											<select name="oh13">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>13:00</label>
											<select name="oh13">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h14 != -1}">
											<label>14:00</label>
											<select name="oh14">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>14:00</label>
											<select name="oh14">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h15 != -1}">
											<label>15:00</label>
											<select name="oh15">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>15:00</label>
											<select name="oh15">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h16 != -1}">
											<label>16:00</label>
											<select name="oh16">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>16:00</label>
											<select name="oh16">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="default-select">
									<c:choose>
										<c:when test="${restaurantList.h17 != -1}">
											<label>17:00</label>
											<select name="oh17">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>17:00</label>
											<select name="oh17">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h18 != -1}">
											<label>18:00</label>
											<select name="oh18">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>18:00</label>
											<select name="oh18">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h19 != -1}">
											<label>19:00</label>
											<select name="oh19">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>19:00</label>
											<select name="oh19">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${restaurantList.h20 != -1}">
											<label>20:00</label>
											<select name="oh20">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>20:00</label>
											<select name="oh20">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="default-select">
									<c:choose>
										<c:when test="${restaurantList.h21 != -1}">
											<label>21:00</label>
											<select name="oh21">
												<option value="1" selected>營業時段</option>
												<option value="0">非營業時段</option>
											</select>
										</c:when>
										<c:otherwise>
											<label>21:00</label>
											<select name="oh21">
												<option value="1">營業時段</option>
												<option value="0" selected>非營業時段</option>
											</select>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
							<td style="display: none"><input type="hidden"
								name="restaurantNo" value="${restaurantList.restaurantNo}">
							</td>
							<td style="display: none"><input type="hidden" name="year"
								value="${restaurantList.year}"></td>
							<td style="display: none"><input type="hidden" name="month"
								value="${restaurantList.month}"></td>
							<td style="display: none"><input type="hidden"
								name="dateTime"
								value="${restaurantList.year}-${restaurantList.month}-${restaurantList.day}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- ====================================================== -->
			<br>
			<div class="submitButton" align="center" style="font-size: larger">
				<input type="submit" name="submit" value="更新行事曆">
			</div>
			<br>
		</form>
	</div>
</div>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});
</script>