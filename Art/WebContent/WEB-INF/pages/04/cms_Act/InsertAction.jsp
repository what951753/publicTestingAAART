<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#demo{
width: 400px;
}
</style>
</head>
<body>
<%-- 	<jsp:include page="/fragment/top.jsp" /> --%>
		<br>
		<br>
	<form method=POST action="<c:url value='/04/CMS/Insert.ctrl'/>" enctype="multipart/form-data">

		<div class="container">
		<div class="form-group">
	<h1>活動新增</h1>
			<p></p>
			<table class="table table-bordered">
				<!-- 				<tr> -->
				<!-- 					<td>NO</td> -->
				<!-- 					<td><input type="text" name="no" ></td> -->
				<!-- 				</tr> -->
				<tr>
					<td>標題</td>
					<td><input type="text" name="title" id="title"required="required" class="form-control" ></td>
				</tr>
				<tr>
					<td>分類</td>
					<td><select id="category" class="form-control" name="category" required="required" >
							<option value="" selected>選擇分類</option>
							<option value="1">音樂</option>
							<option value="2">戲劇</option>
							<option value="3">舞蹈</option>
							<option value="4">親子</option>
							<option value="5">獨立音樂</option>
							<option value="6">展覽</option>
							<option value="7">講座</option>
							<option value="8">電影</option>
							<option value="11">綜藝</option>
							<option value="13">競賽</option>
							<option value="14">徵選</option>
							<option value="15">其他</option>
							<option value="16">科教</option>
							<option value="17">演唱會</option>
							<option value="19">研習課程</option>
					</select></td>
				</tr>
				<tr>
					<td>縣市名</td>
					<td><select id="site"  name="location" class="form-control" required="required">
							<option value="" selected>選擇地區</option>
							<optgroup label="==北部地區==">
						<option value="基隆">基隆</option>
						<option value="台北">台北</option>
						<option value="新北">新北</option>
						<option value="桃園">桃園</option>
						<option value="新竹">新竹</option>
						</optgroup>
						<optgroup label="==中部地區==">
						<option value="苗栗">苗栗</option>
						<option value="台中">台中</option>
						<option value="彰化">彰化</option>
						<option value="南投">南投</option>
						<option value="雲林">雲林</option>
						</optgroup>
						<optgroup label="==南部地區==">						
						<option value="嘉義">嘉義</option>
						<option value="南投">南投</option>
						<option value="高雄">高雄</option>
						<option value="屏東">屏東</option>
						</optgroup>
						<optgroup label="==東部地區==">						
						<option value="宜蘭">宜蘭</option>
						<option value="花蓮">花蓮</option>
						<option value="台東">台東</option>
						</optgroup>

					</select></td>
				</tr>
				<tr>
					<td>地點</td>
					<td><input type="text" name="locationName" id="locationName" required="required" class="form-control" ></td>
				</tr>
				<!-- 				<tr> -->
				<!-- 					<td>活動開始日</td> -->
				<!-- 					<td><input type="date" name="time"></td> -->
				<!-- 				</tr> -->
				<tr>
					<td>主辦單位</td>
					<td><input type="text" name="mainunit" id="mainunit" required="required" class="form-control" ></td>
				</tr>
				<tr>
					<td>演出單位</td>
					<td><input type="text" name="showunit" id="showunit"required="required" class="form-control" ></td>
				</tr>
				<tr>
					<td>活動開始日</td>
					<td><input type="date" name="startdate"  required="required" id="startdate" class="form-control" ></td>
				</tr>
				<tr>
					<td>活動結束日</td>
					<td><input type="date" name="enddate" required="required" id="enddate" class="form-control" ></td>
				</tr>
				<tr>
					<td>活動描述</td>
					<td><textarea rows="8" cols="" name="description" id="description"
							required="required" class="form-control" ></textarea></td>
				</tr>
				<tr>
					<td>圖片上傳</td>
					<td><Input Type="File" Name="file" id="file"></td>
				</tr>
				<tr>
					<td>圖片預覽</td>
					<td><img id="demo" /></td>
				</tr>

			</table>

			<input type="submit" value="送出新增" name=""
				class="btn btn-outline-info" id="" onclick="return insert()">
				
			<input type="button" value="DEMO" name="" class="btn btn-outline-info" id="DEMO" >
	</form>


	</form>
	</div>
	</div>

	<script>
	$("#DEMO").click(function() {
				$("#title").val("2021高雄大港開唱音樂祭");
				$("#category").val("17");
				$("#site").val("高雄");
				$("#locationName").val("高雄市駁二藝術特區");
				$("#mainunit").val("THE WALL MUSIC");
				$("#showunit").val("大港開唱");
				$("#startdate").val("2021-03-27");
				$("#enddate").val("2021-03-28");
				$("#description").val("2021年即將邁入第十二屆的《大港開唱》，是每年三月於高雄舉辦的大型音樂祭典，受到全台灣及日本香港年輕觀眾的喜愛，近年已成為台灣最具指標性的大型戶外音樂祭活動。\n大港舉辦在高雄港邊，獨特的海港地景和人文風情，常勾起人生中各種酸甜苦辣的回憶。大港因此找來有著豐富人生歷程的知名藝人及業界前輩演出，或是與新一代的樂團或藝人一起合作，交融出出代之間的化學變化，往往成為當年度為人津津樂道的經典現場，包括《黃金夜總會》的賀一航、《古惑仔》裡的大飛哥-黃秋生，永駐在人們青春回憶中的日本偶像酒井法子，再到唱出《心事誰人知》的沈文程和演出《花甲男孩》的三金得主蔡振南。除此之外，唱著《少年吔，安啦！》的伍佰以及後來變成姐姐的謝金燕，也曾是大港舞台的主角之一。大明星們的風采在大港開唱魅力四射，震懾了台下的男男女女。\n當然，身為一個音樂祭，各種多元曲風和娛樂節目是絕對必備的。在大港「人生」與「音樂」的主題下，無論透過各種充滿個性的獨立音樂、生猛有力的搖滾或嘻哈，或是輕柔順耳的流行曲風，讓觀眾們生活中的喜怒哀樂、生命中的潮起潮落，在這個音樂的世界中得到了共鳴。歷年演出樂團的陣容集結了國內外實力堅強的藝人，包括茄子蛋、玖壹壹、草東沒有派對、9m88、Leo王、大象體操等等，每年近百組的演出藝人，搭配著意想不到的特別來賓做feat演出，每每都讓台下的樂迷驚喜連連，更是創造了南方港都風味的獨特回憶。");
	});
		function insert() {
			var msg = "確認是否新增?";
			if (confirm(msg) == true) {
				return true;
			} else {
				return false;
			}
		}

		document.getElementById("startdate").onchange = function () {
		    var input = document.getElementById("enddate");
		    input.setAttribute("min", this.value);
		}
		//圖片預覽
		$('#file').change(function() {
			  var file = $('#file')[0].files[0];
			  var reader = new FileReader;
			  reader.onload = function(e) {
			    $('#demo').attr('src', e.target.result);
			  };
			  reader.readAsDataURL(file);
			});
	</script>
</body>
</html>