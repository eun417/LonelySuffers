<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>나의 상품 목록 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
<style>
	/*table*/
	table th:nth-child(1){
		width: 6%;
	}
	table th:nth-child(2){
		width: 13%;
	}
	table th:nth-child(3){
		width: 300px;
		text-align: center;
	}
	table td:nth-child(3){
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	/*table th:nth-child(4){
		width: 30%;
	}
	table th:nth-child(5){
		width: 20%;
	}
	table th:nth-child(6){
		width: 20%;
	}
	table th:nth-child(7){
		width: 30%;
	}*/
	/*별점*/
	.rating-color{
	    color:#fbc634 !important;
	}
	.small-ratings i{
	  color:#cecece;   
	}
	th:last-child, td-last-child{
		width: 50px;
	}
	.pagination {
		text-align: center;
	}
	.product-check {
		border: none;
		width: 2.4rem;
		height: 2.4rem;
	}
	.product-check:focus {
		outline: none;
	}
</style>
</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>내가 등록한 상품</h2>
						<p class="lead">
						<input type="hidden" name="houseStatus" value="${house.houseStatus }">
						<c:if test="${house.houseStatus == 0}">판매 중지된 상품입니다.
						</c:if>
						</p>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		
		<section class="section">
			<div class="container">
			<div class="product-list">
				<div class="table-content">
					<div class="product-choice">
						<a href="/productListBySeller.do?reqPage=1" style="background-color:#19A7CE; color:#fff">전체</a>
						<a href="/lessonListBySeller.do?reqPage=1">강습</a>
						<a href="/houseListBySeller.do?reqPage=1">숙박</a>
					</div>
					<div class="list-wrapper">
						<input type="hidden" value="${hiddenVal }" class="hidden-input">
						<form action="/searchProductBySeller.do" method="get"
						class="search-bar" name="search-product">
						<input type="hidden" name="jspPage" value="pl">
						<select name="productSearchType" class="search-type">
							<option value="n">상품명</option>
							<option value="lo">지역</option>
						</select>
						<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
						<input
							type="text" placeholder="검색어를 입력하세요" name="productSearchKeyword"
							onkeyup="enterkey();"> <input type="submit"
							style="display: none;">
							<div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
					</form>
						<div class="productList-top list-top">
							<div class="count">
								전체 상품 <span>${productCount }</span>
							</div>
							<table>
								<tr>
									<th style="text-align: center;">종류</th>
									<th style="text-align: center;">사진</th>
									<th style="text-align: center;">상품명</th>
									<th style="text-align: center;">지역</th>
									<th style="text-align: center;">평점</th>
									<th style="text-align: center;">상품 상태</th>
									<th></th>
								</tr>
								<c:choose>
								<c:when test="${empty productList }">
								<tr>
									<td colspan="7">
									    <div class="noInfo-wrapper">
									        <div>
									            <span class="material-symbols-outlined noInfo-icon">info</span>
									            <div class="noInfo-text">조회된 정보가 없습니다.</div>
									        </div>
									    </div>
								    </td>
								</tr>
								</c:when>
								<c:otherwise>
								<c:forEach items="${productList }" var="p">
                                	<tr>
                                		<td>${p.productType }</td>
                                		<td>
                                		<c:choose>
	                                		<c:when test="${p.productPic eq null}">
	                                			<div class="material-symbols-outlined no-pic">quiz</div>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:choose>
		                                		<c:when test="${p.productType == '강습'}">
			                                		<img src="resources/upload/lesson/${p.productPic }">
		                                		</c:when>
		                                		<c:when test="${p.productType == '숙박'}">
			                                		<img src="resources/upload/house/${p.productPic }">
		                                		</c:when>
		                                		</c:choose>
                                			</c:otherwise>
                                		</c:choose>
                                		</td>
										<td>
										<c:choose>
	                                		<c:when test="${p.productType == '강습'}">
	                                			<a href="/lessonView.do?lessonNo=${p.productNo }">${p.productTitle }</a>
	                                		</c:when>
	                                		<c:when test="${p.productType == '숙박'}">
	                                			<a href="/houseView.do?houseNo=${p.productNo }">${p.productTitle }</a>
	                                		</c:when>
	                                	</c:choose>
										</td>
										<td>${p.productCity }</td>
										<td>
										<c:choose>
										<c:when test="${p.productScore < 1}">		
												<div class="small-ratings">
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 1 && p.productScore < 2}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 2 && p.productScore < 3}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 3 && p.productScore < 4}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 4 && p.productScore < 5}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore == 5 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									            </div>
										</c:when>
										</c:choose>
										</td>
										<td><c:choose>
												<c:when test="${p.productStatus == 1}">판매중</c:when>
												<c:when test="${p.productStatus == 0}">판매중지</c:when>
												<c:when test="${p.productStatus == -1}">승인대기</c:when>
												<c:when test="${p.productStatus == -2}">승인반려</c:when>
											</c:choose></td>
										<td><span class="material-symbols-outlined more-detail">more_vert</span>
											<div class="list-detail-box" style="display: none" onblur="">
												<div>
			                                		<c:choose>
				                                		<c:when test="${p.productType == '강습'}">
															<a href="/lessonUpdate.do?lessonNo=${p.productNo }" class="update-detail">상품 정보 수정</a>
														</c:when>
				                                		<c:when test="${p.productType == '숙박'}">
															<a href="/houseUpdate.do?houseNo=${p.productNo }" class="update-detail">상품 정보 수정</a>
				                                		</c:when>
													</c:choose>
			                                		<c:choose>
				                                		<c:when test="${p.productStatus == 1}">
															<div onclick="toSoldOut(this)">상품 판매 중지</div>
														</c:when>
				                                		<c:when test="${p.productStatus == 0}">
															<div onclick="toResale(this)">판매 재개</div>
														</c:when>
													</c:choose>
													<input type="hidden" value="${p.productNo }">
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
								</c:otherwise>
								</c:choose>
							</table>
							<div id="pageNavi">
								${pageNavi }
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminProductList.js"></script>
	
	<script>
		/*검색 결과에 count 출력 삭제*/
		$(function(){
		    if($('.hidden-input').val()==1) {
		        $(".count").hide();
		    } else {
		        $(".count").show();
		    }
		});



	// 판매 중지를 누르면 동작하는 ajax
		function toSoldOut(obj){
			$.ajax({
				url : "/toSoldOut.do",
				data: {productNo : $(this).next().val(), productType : $(this).parent().parent().parent().parent().find("td").eq(1).text()},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "성공"){
						location.reload()
					}
				}
			});
		}



	// 판매 재개를 누르면 동작하는 ajax
		function toResale(obj){
			$.ajax({
				url : "/toResale.do",
				data: {productNo : $(this).next().val(), productType : $(this).parent().parent().parent().parent().find("td").eq(1).text()},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "성공"){
						location.reload()
					}
				}
			});
		}



	// 승인 재요청을 누르면 동작하는 ajax
		function toReview(obj){
			$.ajax({
				url : "/toResale.do",
				data: {productNo : $(this).next().val(), productType : $(this).parent().parent().parent().parent().find("td").eq(1).text()},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "성공"){
						location.reload()
					}
				}
			});
		}
	</script>

</body>
</html>