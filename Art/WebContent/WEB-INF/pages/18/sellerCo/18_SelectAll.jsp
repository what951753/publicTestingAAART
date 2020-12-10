<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>${Update}</h3>
<h3>${Delete}</h3>
<table id="cTable" class="table table-bordered" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>課程編號</th>
									<th>課程名稱</th>
									<th>課程類型</th>
									<th>上課地址</th>
									<th>場地名稱</th >
									<th>名額</th>
									<th>售價</th>
									<th>開始日期</th>
									<th>開始時間</th>
									<th>結束日期</th>
									<th>結束時間</th>
									<th>簡介說明</th>
									<th>點擊次數</th>
									<th>課程圖片</th>
									<th>編輯課程</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>課程編號</th>
									<th>課程名稱</th>
									<th>課程類型</th>
									<th>上課地址</th>
									<th>場地名稱</th >
									<th>名額</th>
									<th>售價</th>
									<th>開始日期</th>
									<th>開始時間</th>
									<th>結束日期</th>
									<th>結束時間</th>
									<th>簡介說明</th>
									<th>點擊次數</th>
									<th>課程圖片</th>
									<th>編輯課程</th>
								</tr>
							</tfoot>
								<tbody>
							<c:forEach var="cSelectAllList" varStatus="stat" items="${cList}">
									<tr>
										<td>${cSelectAllList.coId}</td>
										<td>${cSelectAllList.coTitle}</td>
										<td>${cSelectAllList.coAct_Type}</td>
										<td>${cSelectAllList.coAct_Location}</td>
										<td>${cSelectAllList.coLocation_Name}</td>
										<td>${cSelectAllList.coNum}</td>
										<td>${cSelectAllList.coPrice}</td>
										<td>${cSelectAllList.coAct_Date}</td>
										<td>${cSelectAllList.coAct_Time}</td>
										<td>${cSelectAllList.coEnd_Date}</td>
										<td>${cSelectAllList.coEnd_Time}</td>
										<td>${cSelectAllList.coAct_Description}</td>
										<td>${cSelectAllList.coHot}</td>
										<td><img style='display:block; width:64px;height:36px;' src="data:image/jpg;base64, ${cSelectAllList.coAct_ImageStr}" ></td>
										<form action="<c:url value="/18/UpdateData.ctrl"/>">
										<td> <input type="submit" name="button" value="修改">
										<input type="hidden" name="coId" value="${cSelectAllList.coId}">
										<input type="hidden" name="coTitle" value="${cSelectAllList.coTitle}">
										<input type="hidden" name="coAct_Type" value="${cSelectAllList.coAct_Type}">
										<input type="hidden" name="coAct_Location" value="${cSelectAllList.coAct_Location}">
										<input type="hidden" name="coLocation_Name" value="${cSelectAllList.coLocation_Name}">
										<input type="hidden" name="coNum" value="${cSelectAllList.coNum}">
										<input type="hidden" name="coPrice" value="${cSelectAllList.coPrice}">
										<input type="hidden" name="coAct_Date" value="${cSelectAllList.coAct_Date}">
										<input type="hidden" name="coAct_Time" value="${cSelectAllList.coAct_Time}">
										<input type="hidden" name="coEnd_Date" value="${cSelectAllList.coEnd_Date}">
										<input type="hidden" name="coEnd_Time" value="${cSelectAllList.coEnd_Time}">
										<input type="hidden" name="coAct_Description" value="${cSelectAllList.coAct_Description}">
										<input type="hidden" name="coHot" value="${cSelectAllList.coHot}">
										<input type="hidden" name="coAct_Image" value="${cSelectAllList.coAct_Image}">
										</form>
										<form action="<c:url value="/18/cDelete.ctrl"/>">
										<input type="submit" name="button" value="刪除">
										<input type="hidden" name="coId" value="${cSelectAllList.coId}">
										<input type="hidden" name="coTitle" value="${cSelectAllList.coTitle}">
										<input type="hidden" name="coAct_Type" value="${cSelectAllList.coAct_Type}">
										<input type="hidden" name="coAct_Location" value="${cSelectAllList.coAct_Location}">
										<input type="hidden" name="coLocation_Name" value="${cSelectAllList.coLocation_Name}">
										<input type="hidden" name="coNum" value="${cSelectAllList.coNum}">
										<input type="hidden" name="coPrice" value="${cSelectAllList.coPrice}">
										<input type="hidden" name="coAct_Date" value="${cSelectAllList.coAct_Date}">
										<input type="hidden" name="coAct_Time" value="${cSelectAllList.coAct_Time}">
										<input type="hidden" name="coEnd_Date" value="${cSelectAllList.coEnd_Date}">
										<input type="hidden" name="coEnd_Time" value="${cSelectAllList.coEnd_Time}">
										<input type="hidden" name="coAct_Description" value="${cSelectAllList.coAct_Description}">
										<input type="hidden" name="coHot" value="${cSelectAllList.coHot}">
										<input type="hidden" name="coAct_Image" value="${cSelectAllList.coAct_Image}">
										</td>							
										</form>
									</tr>
							</c:forEach>
								</tbody>
						</table>
<script>
$(document).ready( function () {
    $('#cTable').DataTable({

    	
    } );
} );
</script>
