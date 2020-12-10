<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tw.group4._14_.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8"/>
<script>
$(function(){
    $("#queryType").change(function() {

		fetch(url)
			.then((response) => {
  			return response.blob();
		})

		.then((imageBlob) => {
  			let img = document.createElement('IMG')
  			document.querySelector('.newImg').appendChild(img);
  		// 將 blog 物件轉為 url
  			img.src = URL.createObjectURL(imageBlob);
		})

    })
})

</script>

<div class="container">

	<!-- 	<button type="button" class="btn btn-info btn-sm" value="button" -->
	<%-- 		onclick="location.href='<c:url value='/DemoServlet'/>'">回上一頁</button> --%>

	<br> <br>


	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">新增商品</h6>
		</div>
		<div class="card-body">
			新增商品<span style="color: crimson; font-size: smaller">(*字號欄位不可空白)</span>
		</div>

		<form class="form-group" ACTION="createProduct.ctrl" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="function" value="create" />

			<div>
				<p>
					品名<span style="color: crimson; font-size: larger">*</span>： <input
						type="text" name="APTITLE" id="title" required="required" value="新上架的商品">
				</p>
			</div>
			<div>
				<p>
					價格<span style="color: crimson; font-size: larger">*</span>： <input
						type="text" name="APPRICE" id="price" required="required" value="9999">
				</p>
				<p>
					數量<span style="color: crimson; font-size: larger">*</span>： <input
						type="number" name="APNUM" id="num" required="required" min="1" value="50">
				</p>
				<p>
					類型<span style="color: crimson; font-size: larger">*</span>：
<!-- 			<input	type="text" name="APTYPE" id="type" required="required" value="cook"> -->
					<select id="type">
 						 <option value="cook">家飾</option>
						 <option value="plate">食器</option>
 						 <option value="ink">飾品配件</option>
 						 <option value="pen">文具</option>
					</select>
				</p>
			</div>
			<div>
			<div>上傳圖片</div>
			<br /> <input type="file" name="myFiles" id="myFiles"/><br />
			<div>圖片預覽</div>
			<div><img id="demo"  width="300" height="250"/></div>
			
			</div>
			<div>
			<br>
			<div>商品簡介</div>
				<textarea name="APDES" class="cls" id="textArea" cols="100" rows="10"></textarea>

			</div>
			<div></div>
			<div>
				<input class="btn2" type="submit" name="check2" value="完成新增">
				<input class="btn2" type="button" name="btn" id="btn" value="一鍵生成">
			</div>
			<div class="test"></div>
		</form>


	</div>
</div>

<script> 
    $(function(){
    	  var Name1 = "物超所值";
          var Name2 = '買到賺到';

         
      $("#btn").click(function() {
    	  document.getElementById("textArea").innerHTML= 
              Name1 + "\r\n" + Name2;
        });
      });


	$('#myFiles').change(function() {
		  var file = $('#myFiles')[0].files[0];
		  var reader = new FileReader;
		  reader.onload = function(e) {
		    $('#demo').attr('src', e.target.result);
		  };
		  reader.readAsDataURL(file);
		});
  </script>
