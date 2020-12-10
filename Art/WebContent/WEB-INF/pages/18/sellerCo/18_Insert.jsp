<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!-- https://code.jquery.com/       jQuery Core 3.5.1 - uncompressed -->

<div>請輸入欲新增的課程資訊</div>
<form action="<c:url value="/18/cInsert.ctrl"/>" method="POST"
	enctype="multipart/form-data">
	<div class="form-row" style="text-align: center;">


		<div class="form-group">
			<label>課程名稱</label> <input type="text" class="form-control"
				name="coTitle" id='coTitle' value="">
		</div>

		<div class="form-group">
			<label>課程類型</label>
			<p>
				<select name="coAct_Type" id='coAct_Type'>
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
				name="coAct_Location" id='coAct_Location' value="">
		</div>

		<div class="form-group">
			<label>場地名稱</label> <input type="text" class="form-control"
				name="coLocation_Name" id='coLocation_Name' value="">
		</div>
		
		<div class="form-group">
			<label>名額</label> <input type="number" class="form-control"
				name="coNum" id="coNum" value="">
		</div>
		
		<div class="form-group">
			<label>售價</label> <input type="number" class="form-control"
				name="coPrice" id='coPrice' value="">
		</div>

		<div class="form-group">
			<label>開始日期</label> <input type="date" class="form-control"
				name="coAct_Date" id='coAct_Date' value="">
		</div>

		<div class="form-group">
			<label>開始時間</label> <input type="time" class="form-control"
				name="coAct_Time" id='coAct_Time' value="">
		</div>

		<div class="form-group">
			<label>結束日期</label> <input type="date" class="form-control"
				name="coEnd_Date" id='coEnd_Date' value="">
		</div>

		<div class="form-group">
			<label>結束時間</label> <input type="time" class="form-control"
				name="coEnd_Time" id='coEnd_Time' value="">
		</div>

		<div class="form-group">
			<label>簡介說明</label>
			<textarea name="coAct_Description" id="coAct_Description" rows="4" cols="50"></textarea>		
		</div>
		
		<div class="form-group">
			<label>點擊次數</label> <input type="number" class="form-control"
				name="coHot" id="coHot" value="">
		</div>

		<div class="form-group">
			<label>課程圖片</label> <input type="file" accept="image/*"
				onchange="loadFile(event)" class="form-control" name="coAct_Image">
			<img id="output" />
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

<!-- id需與下方script相同 -->
   <button id="OneBuyer" >一鍵輸入課程資訊</button>

<script>
<!-- $("最上方的id:識別名稱") -->
$("#OneBuyer").click(function(){
	$("#coTitle").val("國畫L2-彩墨山水(中級)");
	$("#coAct_Type").val("國畫書法");
	$("#coAct_Location").val("臺北市中正區中山南路21號");
	$("#coLocation_Name").val("國立中正紀念堂 W314教室");
	$("#coNum").val("50");
	$("#coPrice").val("2400");
	$("#coAct_Date").val("2021-01-21");
	$("#coAct_Time").val("09:00");
	$("#coEnd_Date").val("2021-06-01");
	$("#coEnd_Time").val("12:00");
	$("#coAct_Description").val("山石變化多端，取勢聚合，穿插、用筆、用墨皆表現不同之精神與趣味。山石靜態，因有浮雲流水方顯生命，雲水型態因自然條件不同各有所異，勾、染、留白…各種技法交互運用。");
	$("#coHot").val("0");
})
</script>