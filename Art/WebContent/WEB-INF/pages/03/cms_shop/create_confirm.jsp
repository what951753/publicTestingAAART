<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;">上架藝文商店</h3>
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
		<form method="post"
			action="<c:url value = "/03/cms/shop/createShop.ctrl"/>">
			<table>
				<thead>
					<tr class="head">
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tfoot></tfoot>
				<tbody>
					<tr style="display: none">
						<td>會員帳號</td>
						<td><input type="hidden" name="memberId" value="${memberId}">${memberId}</td>
						<td></td>
					</tr>
					<tr>
						<td>商店名稱*</td>
						<td><input type="text" placeholder="請輸入商店名稱 " name="shopName"
							required="required"></td>
						<td></td>
					</tr>
					<tr>
						<td>代表圖示 (icon)*</td>
						<td><input type="text" placeholder="請輸入圖片網址" name="image"></td>
						<td></td>
					</tr>
					<tr>
						<td>簡介*</td>
						<td><textarea placeholder="請輸入簡介內容" name="intro"
								style="width: 500px; height: 100px;" required="required"> </textarea></td>
						<td style="width: 200px;"></td>
					</tr>
					<!-- ====================================================== -->
					<tr>
						<td>縣市名*</td>
						<td><input type="text" placeholder="請輸入縣市名" name="cityName"
							required="required"></td>
						<td>範例:台北市</td>
					</tr>
					<tr>
						<td>地址*</td>
						<td><input type="text" placeholder="請輸入地址" name="address"
							required="required"></td>
						<td>範例:臺北市信義區市府路45號</td>
					</tr>
					<tr>
						<td>營業時間*</td>
						<td><input type="text" placeholder="請輸入營業時間" name="openTime"
							required="required"></td>
						<td>無格式要求</td>
					</tr>
					<tr>
						<td>連絡電話*</td>
						<td><input type="text" placeholder="請輸入連絡電話" name="phone"
							required="required"></td>
						<td>無格式要求</td>
					</tr>
					<tr>
						<td>電子郵件*</td>
						<td><input type="text" placeholder="請輸入電子郵件" name="email"
							required="required"></td>
						<td></td>
					</tr>
					<tr>
						<td>傳真號碼</td>
						<td><input type="text" placeholder="請輸入傳真號碼" name="fax"></td>
						<td></td>
					</tr>

					<!-- ====================================================== -->
					<tr>
						<td>Facebook連結網址</td>
						<td><input type="text" placeholder="請輸入facebook 網址"
							name="facebook"></td>
						<td></td>
					</tr>
					<tr>
						<td>商店網站連結網址</td>
						<td><input type="text" placeholder="請輸入網址" name="website"></td>
						<td></td>
					</tr>
					<tr style="display: none">
						<td>點擊次數</td>
						<td><input type="text" value="0" name="clicks"></td>
						<td></td>
					</tr>
					<tr>
						<td>是否允許使用預約系統</td>
						<td><select name="reservation" required="required">
								<option selected value="0">否</option>
								<option value="1">是</option>
						</select></td>
						<td></td>
					</tr>
					<!-- ====================================================== -->
				</tbody>
			</table>
			<br>
			<div class="submitButton" align="center" style="font-size: larger">
				<input type="submit" name="submit" value="資料送出">
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