<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">課程個別詳細介紹</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a> <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a> <span
						class="lnr lnr-arrow-right"></span> 
					<span>${cfd.coTitle}</span>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->

<div class="">
	<div>
		<div>
			<div>
				<img style='display: block; width: 64px; height: 36px;'src="data:image/jpg;base64, ${cfd.coAct_ImageStr}">
			</div>
			<div>
				<!--<form action="CoSubmit.ctrl">-->
				<form action="<c:url value="/18/CoSubmit.ctrl"/>">
					<h2>${cfd.coId}</h2>
				    <h2>${cfd.coTitle}</h2>
					<h4>${cfd.coAct_Type}</h4>
				    <h4>${cfd.coAct_Location}</h4>
					<h4>${cfd.coLocation_Name}</h4>
					<h4>${cfd.coPrice}</h4>
					<h4>${cfd.coHot}</h4>
					<span>請選擇數量<input type="number" min="1" max="${cfd.coNum}" name="orderNum" value="1">
                            </span>
                    <div>${cfd.coAct_Date}</div>       
					<div>${cfd.coAct_Time}</div>
					<div>${cfd.coEnd_Date}</div>
					<div>${cfd.coEnd_Time}</div>
					<div>${cfd.coAct_Description}</div>
					<div>${cfd.coHot}</div>
					
					<input type="hidden" name="coId" value="${cfd.coId}"/>
					<input type="hidden" name="ordertitle" value="${cfd.coTitle}"/>
					<input type="hidden" name="orderPrice" value="${cfd.coPrice}"/>
				    <!-- <input type="hidden" name="coAct_ImageStr" value="${cfd.coAct_ImageStr}"/>-->
					<div><button type="submit" name="coTitle" value="${cfd.coTitle}">放入購物車</button></div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#cTableFD').DataTable({

		});
	});
</script>