<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="currProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="house-list">
				<form action="/adminSearchHouse.do" method="get"
					class="search-bar" name="search-product">
					<input type="hidden" name="jspPage" value="pl">
					<select name="houseSearchType" class="search-type">
						<option value="n">상품명</option>
						<option value="s">판매자</option>
						<option value="rt">숙박소 이름</option>
						<option value="lo">지역</option>
					</select>
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="검색어를 입력하세요" name="houseSearchKeyword"
						onkeyup="enterkey();"> <input type="submit"
						style="display: none;">
					<div class="search-icon">검색</div>
				</form>
				<div class="table-content">
					<div class="product-choice">
						<a href="/productListLesson.do">강습</a>
						<a href="/productListHouse.do">숙박</a>
					</div>
					<div class="list-wrapper">
						<div class="productList-top list-top">
							<div class="count">
								숙박 전체 상품 <span>${houseCount }</span>
							</div>
							<input type="hidden" value="2" class="house-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="houseCheck"
										class="house-all-check chk"></th>
									<th>상품명</th>
									<th>판매자</th>
									<th>숙박소 이름</th>
									<th>지역</th>
									<th>평점</th>
									<th>상품 상태</th>
									<th></th>
									<th></th>
								</tr>
								<c:forEach items="${houseList }" var="h">
									<tr>
										<td><input type="checkbox" name="houseCheck"
											class="house-check chk" value="${h.houseNo }"></td>
										<td><a href="#">${h.houseTitle }</a></td>
										<td>${h.writer }</td>
										<td>${h.roomTitle }</td>
										<td>${h.houseCity }</td>
										<td>${h.houseScore }</td>
										<td><c:choose>
												<c:when test="${h.houseStatus == 1}">
													<select class="status-change">
														<option value="1" selected>판매중</option>
														<option value="0">판매중지</option>
													</select>
												</c:when>
												<c:when test="${h.houseStatus == 0}">
													<select class="status-change">
														<option value="1">판매중</option>
														<option value="0" selected>판매중지</option>
													</select>
												</c:when>
											</c:choose></td>
										<td>
										<td><span class="material-symbols-outlined more-detail">more_vert</span>
											<div class="list-detail-box" style="display: none">
												<div>
													<a href="#">상품 정보 수정</a>
													<div class="product-stop-selling">상품 판매 중지</div>
													<input type="hidden" value="${h.houseNo }">
												</div>
											</div></td>
									</tr>
								</c:forEach>
							</table>
							<div></div>
						</div>
						<div class="list-bottom">
							<div>
								<button class="checkedUpdateHouseStatus btn bc1">선택 상품 상태 변경</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminProductList.js"></script>
</body>
</html>