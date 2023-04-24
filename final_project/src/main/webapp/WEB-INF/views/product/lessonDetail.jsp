<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>${lesson.lessonTitle} - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
<style>
.product-detail>div{
	margin-top:20px;
	margin-bottom:20px;
}
.nav-item { background-color: #3ac5c8;}
.nav-link { color: #ffffff; }
.inquiryTitleText:hover {
	cursor: pointer;
}
.inquiryTd {
	text-align: right;
}
.pagination {
	text-align: center;
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
						<h2>강습 상품</h2>
						<p class="lead">
						<input type="hidden" name="lessonStatus" value="${lesson.lessonStatus }">
						<c:if test="${lesson.lessonStatus == 0}">판매 중지된 상품입니다.
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
				<div class="row">
					<div class="col-md-5">
						<c:choose>
						<c:when test="${lesson.lessonInfoPic == null }">
						<div class="row" style="height: 450px;">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<div class="waveEffect" style="margin: 0 auto;">
									<p class="waveEffectWord-back" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
									<p class="waveEffectWord-front" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
								</div>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div style="height: 450px; overflow: clip"><img class="bigThumbnailImage" src="resources/upload/lesson/${lesson.lessonInfoPic }" style="width: 100%;"></div>
						</c:otherwise>
						</c:choose>
					</div>
					<!-- end col -->

					<div class="col-md-1"></div>

					<div class="col-md-6 product-detail">
							<p>${lesson.lessonTeacher } 강사</p>
							<hr>
							<div class="row">
								<h1 style="padding-bottom: 40px;">${lesson.lessonTitle }</h1>
								<input type="hidden" name="lessonPrice" value="${lesson.lessonPrice }">
								<h3><span style="font-size: 36px; font-weight: bold;"><fmt:formatNumber value="${lesson.lessonPrice }" pattern="#,###" /></span>원</h3>
								<div class="col-md-6">
								</div>
								<div class="col-md-6">
									<input type="hidden" name="lessonMaxNo" value="${lesson.lessonMaxNo }">
									<p style="text-align: left; font-size: 22px; font-weight: bold"><span class="label label-primary">
									<c:choose>
										<c:when test="${lesson.lessonLevel == 1}">초급</c:when>
										<c:when test="${lesson.lessonLevel == 2}">중급</c:when>
										<c:when test="${lesson.lessonLevel == 3}">상급</c:when>
									</c:choose>
									</span>&nbsp;
									<span class="label label-info">${lesson.getLessonStartTime5() } ~ ${lesson.getLessonEndTime5() }</span></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									판매량 ()숫자
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5">
									별평점넣을자리
								</div>
							</div>
							<p>지역 <span>${lesson.lessonCity }</span></p>
						<div>
							<button onclick="goWishList()">관심상품</button>
							<button type="button" data-toggle="modal" data-target="#bookingModal" id="goBooking">예약하기</button>
						</div>
						<c:if test="${sessionScope.m.memberGrade == 2}">
						<div>
							<a class="btn btn-default" href="/lessonUpdate.do?lessonNo=${lesson.lessonNo}">상품 수정</a>
						</div>
						</c:if>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->




<!-- 예약 진행용 Modal -->
  <div class="modal fade bd-example-modal-lg" id="bookingModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div id="bookingArea" class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">예약하기</h4>
        </div>
        <div class="modal-body">
        <form action="/orderLesson.do" onsubmit="return checkOrder();" method="post">
        	<fieldset>
				<input type="hidden" name="lessonNo" value="${lesson.lessonNo }">
				<select name="lessonPeople">
<!-- kiosk에서는 미리 받은 인원 수에 따라 선택지 제한걸도록 작성해야됨 -->
					<option>인원 수를 먼저 선택해주세요.</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
					<option value="6">6명</option>
					<option value="7">7명</option>
					<option value="8">8명</option>
				</select>
        		<div class="row">
						<input type="text" name="lessonBookDate" id="bookStart" placeholder="강습일" required disabled>
        		</div>
				<input type="hidden" name="lessonBookPrice">
				<button type="submit">주문</button>
        	</fieldset>
        </form>
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>




<!-- 상품 정보 표시 시작 -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-9 card mt-3 tab-card">
						<div class="row tab-card-header">
							<ul class="nav nav-tabs card-header-tabs">
								<li class="nav-item active">
									<a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="false">상품설명</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">상품평</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="three-tab" data-toggle="tab" href="#three" role="tab" aria-controls="Three" aria-selected="false">상품문의</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade p-3 active in" id="one" role="tabpanel" aria-labelledby="one-tab">
								${lesson.lessonInfo }</div>
							<div class="tab-pane fade p-3" id="two" role="tabpanel" aria-labelledby="two-tab">
<!-- 별점 후기 영역 시작  -->

								상품 평 div

<!-- 별점 후기 영역 끝  -->
							</div>
							<div class="tab-pane fade p-3" id="three" role="tabpanel" aria-labelledby="three-tab">
							<!-- 상품 문의 영역 시작  -->
								<div class="inquiryBoard">
									<h4 style="line-height: 400%;"><span id="numberOfCount"></span>개의 문의글이 있습니다.</h4>
									<div class="row" style="margin: 20px;">
								 		<div class="btn-group">
											<button type="button" class="btn btn-info" onclick="getInquiries(1, 1)">내 문의보기</button>
											<button type="button" class="btn btn-info" onclick="getInquiries(1, 0)">전체 문의보기</button>
										</div>
									<c:if test="${sessionScope.m.memberGrade == 3}">
										<button type="button" class="btn" data-toggle="modal" data-target="#inquiryWrite">문의하기</button>
									</c:if>
									</div>
									<table class="table table-hover"><thead>
										<tr>
											<th width="8%">번호</th>
											<th style="display: none;">inquiryNo</th>
											<th width="15%">답변상태</th>
											<th width="42%">제목</th>
											<th width="17%">문의자</th>
											<th width="18%">등록일</th>
										</tr>
									</thead>
									<tbody id="forInquiries"></tbody></table>
									<div class="row" style="margin: 20px;" id="forPageNavi"></div>
								</div>
							<!-- 상품 문의 영역 끝  -->
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="panel panel-default">
							<div class="panel-body" style="height: 600px; overflow: clip">광고 등 배너 영역<br>높이 600px을 넘는 사진은 종횡비는 고정하되 아래쪽을 잘라서 출력됨</div>
						</div>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
<!-- 상품 정보 표시 끝 -->


<!-- 문의글 등록 Modal -->
  <div class="modal fade" id="inquiryWrite" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <form action="javascript:;" onsubmit="insertInquiryAjax(this)" method="post">
          <fieldset>
	        <div class="modal-header">
	          <button type="button" id="writeModalClose" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">문의하기</h4>
	        </div>
        	<div class="modal-body">
          		<label><input type="checkbox" name="privately" value="1" style="width: 25px; height: 25px; vertical-align: bottom;"> 비밀글</label>
          		<input type="text" class="form-control" name="inquiryTitle" placeholder="제목: 한글 최대 100자" required>
          		<textarea class="form-control" rows="6" name="inquiryContent" placeholder="본문: 한글 최대 333자" required></textarea>
          		<input type="hidden" name="productCategory" value="1">
          		<input type="hidden" name="productNo" value="${lesson.lessonNo}">
	        </div>
	        <div class="modal-footer">
          		<button type="reset" id="writeFormReset" style="display: none;">reset</button>
          		<button type="submit" class="btn btn-info" style="float: right;">문의글 등록</button>
        	</div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/moment.min.js"></script>
	<script src="resources/js/daterangepicker.js"></script>



	<script type="text/javascript">
	//url로부터 lessonNo값 알아내기
		const ltrim = /^\S{0,}lessonNo=/;
		const currentUrl = window.location.href;
		const needRtrim = currentUrl.replace(ltrim, "");
		const rtrim = /[&]\S{0,}$/;
		const lessonNoFromUrl = needRtrim.replace(rtrim, "");
	//url로부터 lessonNo 도출 끝

		const lessonPeopleMax = $("[name=lessonMaxNo]").val();

	// 예약하기 modal 띄우면 실행되는 함수 시작
		$("#goBooking").on("click", function(){
			$("[name=lessonPeople]").on("change", function(){
				const lessonCapa = lessonPeopleMax - $("[name=lessonPeople]").val();
	console.log($("[name=lessonPeople]").val() +"명을 예약하려고 함");
	console.log("강습정원 - 지금 예약할 인원 수 = " + lessonCapa +"(필요한 남은 자리 수)");
			// 이미 결제완료 인원 된 날짜들을 invalidDateRanges 변수에 넣어주는 ajax
				if($("[name=lessonPeople]").val()>=1){
					$.ajax({
						url : "/bookOneLesson.do",
						data: {lessonNo : lessonNoFromUrl},
						dataType : "json",
						success : function(List){
							let invalidDateRanges = [];
							for(let i=0; i<List.length; i++){
	console.log(List[i].lessonBookDate +"에는 결제완료 상태의 인원이 이미 "+ List[i].lessonPeople +"명 있음");
								if(List[i].lessonPeople > lessonCapa){
	console.log("남은 자리가 "+ $("[name=lessonPeople]").val() +"이 안 되므로 "+ List[i].lessonBookDate +"는 막음");
								invalidDateRanges[i] = { 'start': moment(List[i].lessonBookDate), 'end': moment(List[i].lessonBookDate) };}
							}
	
						// 선택된 인원 수 바뀔 때마다 날짜 관련 데이터들 모두 초기화
							$("#bookStart").val("");
							$("#bookStart").attr("value", null);
							$("#bookStart").prop("disabled", false);
	
						// 예약일을 선택하는 date range picker 생성
							$('#bookStart').daterangepicker({
							    parentEl: "#bookingArea .modal-body",
								locale: {
								format: "YYYY-MM-DD",
								fromLabel: "시작",
								toLabel: "종료"
					    		},
						    	alwaysShowCalendars: true,
								autoApply: true,
								singleDatePicker: true,
								showDropdowns: true,
								minDate: moment().add(1, 'days'),	// 오늘까지는 예약 불가. 내일부터 예약 가능
								maxDate: moment().add(3, 'months'),	// 시작일은 3개월 이내에서 지정 가능
								isInvalidDate: function(date) {
									return invalidDateRanges.reduce(function(bool, range) {
										return bool || (date >= range.start && date <= range.end);
									}, false);
								}
							});
							$("#bookStart").val("");
							$("#bookStart").attr("value", null);	// value 없는 상태로 생성 필요
						},
						error : function(){
							console.log("인원 수를 먼저 선택해주세요에 focus됨");
							$(".daterangepicker").remove();
							$("#bookStart").val("");
							$("#bookStart").attr("value", null);
							$("#bookStart").prop("disabled", true);
						}
					});
				}else{
					$("#bookStart").val("");
					$("#bookStart").attr("value", null);
					$("#bookStart").prop("disabled", true);
				}
			});
		});
	// 예약하기 modal 띄우면 실행되는 함수 끝


	// input에 값이 없으면 form 제출을 막는 함수
		function checkOrder(){
			if ( $("[name=lessonBookDate]").val() == "" ) {
				alert('강습일을 선택해주십시오.');
				return false;
			}
			fullPrice();
			return true;
		}


	// lessonBookPrice를 계산하는 함수
		const onePersonPrice = $("[name=lessonPrice]").val();
		function fullPrice(){
			return Number(onePersonPrice) * Number($("[name=lessonPeople]").val());
		}


	// 나의 관심상품
		function goWishList(){
			const lessonNo = $("[name=lessonNo]").val();
			const lessonStatus = $("[name=lessonStatus]").val();
				if(lessonStatus==1){
					$.ajax({
						url : "/insertWishList.do",
						data: {house_no : 0, lesson_no : lessonNo},
						dataType : "text",
						success : function(message){
							alert(message);
						},
						error : function(){
							alert("알 수 없는 오류가 발생했습니다.");
						}
					});
				}else{
					alert("판매중인 상품이 아닙니다.");
				}
		}


	// 문의글 목록을 <tr>단위로 불러오는 ajax
		function getInquiries(reqPage, range){
			$.ajax({
					url : "/getInquiries.do",
					data: {reqPage : reqPage, productCategory : 1, productNo : $("[name=lessonNo]").val(), range : range},
					dataType : "json",
					success : function(InquiryPagination){
						$("#forInquiries").empty();
						$("#forPageNavi").empty();
						$("#numberOfCount").text(InquiryPagination.totalCount);
						if(InquiryPagination.totalCount == 0){
							$("#forInquiries").append( $("<tr>").addClass("hasNoInquiry").append($("<td>").attr("colspan", "6").css("text-align", "center").text("조회된 문의 내역이 없습니다.") ) );
						}else{
							for(let i=0; i<InquiryPagination.list.length; i++){
								const td1 = $("<td>").text((InquiryPagination.start)+i);
								
								const td2 = $("<td>").css("display", "none").text(InquiryPagination.list[i].inquiryNo);
								
								const td3 = $("<td>");
								if( InquiryPagination.list[i].answered > 0 ){
									td3.text("답변완료");
								}else{ td3.text("미답변"); }
								
								const td4 = $("<td>");
								if( InquiryPagination.list[i].privately > 0 ){
									td4.append($("<a>").addClass("inquiryTitleText").attr("onclick","expandIt(this)").text((InquiryPagination.list[i].inquiryTitle) + " 🔒 "));
								}else{
									td4.append($("<a>").addClass("inquiryTitleText").attr("onclick","expandIt(this)").text(InquiryPagination.list[i].inquiryTitle));
								}
								
								const idLength = InquiryPagination.list[i].inquirer.length;
								const td5 = $("<td>").text(InquiryPagination.list[i].inquirer);
								
								const td6 = $("<td>").text(InquiryPagination.list[i].regDate.substring(0,10));
		
								const tr = $("<tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
								$("#forInquiries").append(tr);
			    			}
						$("#forPageNavi").append(InquiryPagination.pageNavi);
					}
				}
			});
		}

	// 이 .jsp 페이지를 방문할 때 문의글 첫 페이지 조회로 시작
		$(document).ready(function() {
			getInquiries(1, 0);
		});


	// 문의글의 제목을 누르면 아래에 tr로 문의글 내용이 삽입되면서 펼쳐지는 효과로 출력
		function expandIt(obj){
			const targetInquiryNo = $(obj).parent().prev().prev().text();
			if( $(obj).parent().parent().next().children().eq(2).attr("colspan") == 4 ){
				 $(obj).parent().parent().parent().find(".expandedTr").remove();
			}else{
				$.ajax({
					url : "/inquiryView.do",
					data: {inquiryNo : targetInquiryNo, productCategory : 1, productNo : $("[name=lessonNo]").val()},
					dataType : "json",
					async : false,
					success : function(Inquiry){
						if(Inquiry.inquiryNo <= 0){
							alert(Inquiry.inquiryContent);
						}else{
							if(Inquiry.answerList.length>0){
								for(let j=0; j<Inquiry.answerList.length; j++){
									$(obj).parent().parent().after( $("<tr>").addClass("expandedTr").append( $("<td>") ).append( $("<td>").addClass("inquiryTd").text("답변: ") ).append($("<td>").addClass("inquiryExpanded").attr("colspan", "4").html(Inquiry.answerList[j].answerContent.replaceAll("\n","<br>")) ) );
								}
							}
							$(obj).parent().parent().after( $("<tr>").addClass("expandedTr").append( $("<td>") ).append( $("<td>").addClass("inquiryTd").text("문의 내용") ).append($("<td>").addClass("inquiryExpanded").attr("colspan", "4").html(Inquiry.inquiryContent.replaceAll("\n","<br>")) ) );
						}
					}
				});
			}
		}


	// 문의글 등록 폼 제출
	function insertInquiryAjax(obj){
		let privately = 0;
		if($(obj).find("[name=privately]").prop("checked")){
			privately = 1;
		}
		$.ajax({
			url : "/insertInquiry.do",
			data: {privately : privately , inquiryTitle : $(obj).find("[name=inquiryTitle]").val() , inquiryContent : $(obj).find("[name=inquiryContent]").val(), productCategory : 1, productNo : $("[name=lessonNo]").val()},
			dataType : "text",
			success : function(result){
				alert(result);
				$("#writeFormReset").click();
				$("#writeModalClose").click();
				getInquiries(1, 0);
			}
		});
	}
	</script>

</body>
</html>