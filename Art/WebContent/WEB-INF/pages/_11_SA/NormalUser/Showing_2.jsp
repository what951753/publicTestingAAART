<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<head>
<style>
	span{
		margin: 10px;
		padding: 5px;
	}
	body {
/* 		background-color: rgb(204,204,137); */
	}
	
</style>
 <script>
$(document).ready( function () {
    $('#events').section({
    	language: {
    		zeroRecords: "没有符合的结果",
    		paginate: {
                first: "首頁",
                previous: "上一頁",
                next: "下一頁",
                last: "末頁"
            }
    	}
    } );
} );
</script>
</head>

<!-- 黑底起點 -->
<section class="banner-area relative" id="home">	
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">
					街頭藝人一覽
				</h1>	
				<p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href='<c:url value="/userStreetArtistPage.ctrl"/>'> 總覽</a></p>
			</div>											
		</div>
	</div>
</section>
<!-- 黑底終點 -->
<div>
<form action="searchSA2.ctrl" method="POST">
	<span style="text-align: center;display: block;">
		依樂器或分類查詢：
		<input type="text" name="word">
		<input type="submit" name="submit" value="送出">
	</span>
</form>
</div>
<!-- 研究jsp foreach 迴圈控制 -->
 <section class="upcoming-event-area section-gap" id="events">
 	<div class="container">
 		<div class="row">
 		<c:forEach var="userView" varStatus="stat" items="${BeanList_SA}">
 			<c:choose>
 				<c:when test="${userView.id_SA %2!=0}">
		 			<div class="col-lg-6 event-left" style="border-bottom: rgb(100,100,100) 1px solid; margin: auto; padding: 10px">
			 			<div class="single-events">
							<img class="img-fluid" src="data:image/jpg;base64, ${userView.pic2_SA}" alt="" width=450px height=450px;>
							<a href="#"><h4>Street Artist</h4></a>
							<h6><span>姓名：</span> ${userView.name_SA }</h6>
							<p>
								Somebody show their skill to other people in the street.
							</p>
							<a href='<c:url value="/ToWeb.ctrl?id_SA=${userView.id_SA}"/>' class="primary-btn text-uppercase">View Details</a>
						</div>
					</div>
 				</c:when>
 				<c:otherwise>
					<div class="col-lg-6 event-right" style="border-bottom: rgb(100,100,100) 1px solid; margin: 0px; padding: 10px">
						<div class="single-events">
							<a href="#"><h4>Street Artist</h4></a>
							<h6><span>姓名：</span> ${userView.name_SA }</h6>
							<p>
								Somebody show their skill to other people in the street.
							</p>
							<a href='<c:url value="/ToWeb.ctrl?id_SA=${userView.id_SA}"/>' class="primary-btn text-uppercase">View Details</a>
							<img class="img-fluid" src="data:image/jpg;base64, ${userView.pic2_SA}" alt="" width=450px height=450px;>
						</div>
					</div>
 				</c:otherwise>
 			</c:choose>
		</c:forEach>
		
		<nav aria-label="Page navigation example" style="margin: auto;">
			<ul style="margin: auto;" class="pagination">
				<li style="margin: auto;" class="page-item">
					<c:if test="${PageMum_SA>1 }">
						<a class="page-link" href='<c:url value="/userStreetArtistPage.ctrl?page=${PageMum_SA-1 }&query=${query }"/>'>
							<span aria-hidden="true">
								&laquo;
							</span>
						</a>
					</c:if>
					<c:forEach var="page" items="${allPages}">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/userStreetArtistPage.ctrl?page=${page}&query=${query}" />' >
								${page}
							</a>
						</li>
					</c:forEach>
					<c:if test="${PageMum_SA != totalPages_SA}">
						<li class="page-item">
							<a class="page-link" href="<c:url value="/userStreetArtistPage.ctrl?page=${PageMum_SA+1 }&query=${query }"/>">
								<span aria-hidden="true">
									&raquo;
								</span>
							</a>
						</li>
					</c:if>
				</li>
			</ul>
		</nav>
 		</div>
 	</div>
</section>

<script>
$(function(){
    $("#queryType").change(function() {
        var query = $("#queryType").val();
    	window.location.href="<c:url value='/userStreetArtistPage.ctrl?query="+query+"'/>" ;   
    })
})
</script>