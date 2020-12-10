<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form action="<c:url value="/18/cUpdate.ctrl"/>" method="POST" enctype="multipart/form-data">
	<div class="form-row" style="text-align: center;">
		<div class="form-group">
			<label>課程編號</label> <input type="text" class="form-control"
				name="coId" value="${coId}">
		</div>
		<div class="form-group">
			<label>課程名稱</label> <input type="text" class="form-control"
				name="coTitle" value="${coTitle}">
		</div>
		<div class="form-group">
			<label>課程類型</label> 
			<p>
				<select name="coAct_Type">
					<option value="" disabled>請選擇課程類型</option>
					<option value="語文">語文</option>
					<option value="園藝">園藝</option>
					<option value="風俗信仰">風俗信仰</option>
					<option value="手工製作">手工製作</option>
					<option value="國畫書法">國畫書法</option>
					<option value="運動">運動</option>
					<option value="藝術鑑賞">藝術鑑賞</option>
					<option value="美術">美術</option>
					<option value="戲劇">戲劇</option>
				</select>
			</p>
		</div>
		<div class="form-group">
			<label>上課地址</label> <input type="text" class="form-control"
				name="coAct_Location" value="${coAct_Location}">
		</div>
		<div class="form-group">
			<label>場地名稱</label> <input type="text" class="form-control"
				name="coLocation_Name" value="${coLocation_Name}">
		</div>
		<div class="form-group">
			<label>名額</label> <input type="number" class="form-control"
				name="coNum" value="${coNum}">
		</div>
		<div class="form-group">
			<label>課程售價</label> <input type="number" class="form-control"
				name="coPrice" value="${coPrice}">
		</div>
		<div class="form-group">
			<label>開始日期</label> <input type="date" class="form-control"
				name="coAct_Date" value="${coAct_Date}">
		</div>
		<div class="form-group">
			<label>開始時間</label> <input type="time" class="form-control"
				name="coAct_Time" value="${coAct_Time}">
		</div>
		<div class="form-group">
			<label>結束日期</label> <input type="date" class="form-control"
				name="coEnd_Date" value="${coEnd_Date}">
		</div>
		<div class="form-group">
			<label>結束時間</label> <input type="time" class="form-control"
				name="coEnd_Time" value="${coEnd_Time}">
		</div>
		<div class="form-group">
			<label>簡介說明</label> 
			<textarea id="te" name="coAct_Description" rows="4" cols="50">${coAct_Description}</textarea>
		</div>
		<div class="form-group">
			<label>點擊次數</label> <input type="number" class="form-control"
				name="coHot" value="${coHot}">
		</div>
		<div class="form-group">
			<label>課程圖片</label> <input type="file" accept="image/*"
				onchange="loadFile(event)" class="form-control" name="coAct_Image"
				value="${coAct_Image}"> <img id="output" />
			<script>
				var loadFile = function(event) {
					var output = document.getElementById('output');
					output.src = URL.createObjectURL(event.target.files[0]);
					output.onload = function() {
						URL.revokeObjectURL(output.src)
					}
				};
			</script>
		</div>


	</div>

	<button type="submit" class="btn btn-primary">送出</button>
</form>