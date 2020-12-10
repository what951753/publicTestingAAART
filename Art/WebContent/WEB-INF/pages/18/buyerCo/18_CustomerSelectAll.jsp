<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">尋找您想要的課程</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a> <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->


<!-- Start blog-posts Area -->
			<section class="blog-posts-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 post-list blog-post-list">

<!-- End-Start blog-posts Area -->



<div>
<form action="<c:url value="/18/searchByWord.ctrl"/>">
	<p style="text-align: center; display: block">課程名稱關鍵字查詢：
		<input type="text" name="searchWord">
		<input type="submit" name="" value="送出">
	</p>
</form>
</div>

<div>
<form action="<c:url value="/18/searchByType.ctrl"/>">
<p style="text-align: center; display: block">請選擇分類：
	<button type="submit" name="searchType" value="語文">語文</button>
	<button type="submit" name="searchType" value="園藝">園藝</button>
	<button type="submit" name="searchType" value="風俗信仰">風俗信仰</button>
	<button type="submit" name="searchType" value="手工製作">手工製作</button>
	<button type="submit" name="searchType" value="國畫書法">國畫書法</button>
	<button type="submit" name="searchType" value="運動">運動</button>
	<button type="submit" name="searchType" value="藝術鑑賞">藝術鑑賞</button>
	<button type="submit" name="searchType" value="美術">美術</button>
	<button type="submit" name="searchType" value="戲劇">戲劇</button>	
</p>			
</form>
</div>

<div style="text-align: center;">
				<form action="toCoCart.ctrl">
                <input type="hidden" name="method" value="order"/>
                <input type="submit" style="margin-left: 10px;" class="genric-btn primary-border small" name="check" value="前往結帳">
                </form>
			</div>


<table id="cTableF" class="table table-bordered" width="100%"
	cellspacing="0">
	<thead>
		<tr>
			<th>課程編號</th>
			<th>課程名稱</th>
			<th>課程類型</th>
			<th>課程圖片</th>
			<th>剩餘名額</th>
			<th>課程詳細及購買</th>
			<th>點擊次數</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="cSelectAllListF" varStatus="stat" items="${cListF}">
			<tr>
				<td>${cSelectAllListF.coId}</td>  <!--直接設定編號${stat.count}-->
				<td>${cSelectAllListF.coTitle}</td>
				<td>${cSelectAllListF.coAct_Type}</td>
				<td><img style='display: block; width: 320px; height: 180px;'
					src="data:image/jpg;base64, ${cSelectAllListF.coAct_ImageStr}"></td>
				<td>${cSelectAllListF.coNum}</td>
				<td><a href="<c:url value='/18/cCourseDetail.ctrl?coId=${cSelectAllListF.coId}' /> "><input class='toDetail' type='button' value='查看課程詳細'/></a></td>
				<td>${cSelectAllListF.coHot}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</div>
</div>
</div>
</section>



<script>
	$(document).ready(function() {
		$('#cTableF').DataTable({

		});
	});
</script>


