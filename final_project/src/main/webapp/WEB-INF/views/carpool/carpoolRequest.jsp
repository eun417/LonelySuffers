<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카풀 신청 상세페이지</title>
<link rel="stylesheet" href="css/carpool/carpoolRequest.css">
</head>
<body>
	<!-- Basic -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- Mobile Meta -->
	<meta name="viewport"
		content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<!-- Site Meta -->
	<title>이 페이지의 제목을 적어주세요 - Lonely Suffers</title>
	<meta name="keywords" content="서핑,파도타기">
	<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
	<meta name="author" content="KH정보교육원">
</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<section >
			<div class="container">
				<div class="row" style="display: flex; align-items: center;">
					<a href="carpoolMain.do"><img src="/capool-img/left-arrow.png"
						alt="img" style="width: 45px; height: 50px;"></a>
					<h1 class="head"
						style="text-align: center; font-weight: 600; margin-left: 500px;">카풀 탑승신청</h1>
				</div>
			</div>
		</section>
		
		<section class="section" style="padding:50px; margin:50px;">
			<div class="container" style="padidng: 50px;">
				<!-- section ＞  container 안에 class가 invis1인 hr 태그를 넣으시면, 가로로 큰 공백이 생깁니다. 이 태그를 여러 개를 넣으면 그만큼 공백 높이가 더 높아집니다. -->
				<div class="row">
					<div class="driver-info" style="margin-left: 190px; font-size:20px; font-weight:700; line-height: 40px;">
					<img src="/capool-img/car.png" alt="img" style="width: 50px; height: 50px; margin-right:10px; margin-bottom: 10px; ">
					<c:choose>
						<c:when test="${not empty sessionScope.m }">
						${c.driverName }(${c.maleFemale })
						</c:when>
						<c:otherwise>
						회원에게만 정보가 표시됩니다.
						</c:otherwise>
					</c:choose>
					</div><hr>
					<div><p style="font-size:15px; font-weight: 600; margin-left:200px; font-size:20px;">함께가요<p>
					<img src="/capool-img/clock.png"alt="img" style="width: 20px; height: 20px; margin-right:10px; margin-left:200px;">
					<span class="regdate">${c.regDate}</span> <span class="dayinKorean"></span> 
					</div>
					<div class="infobox row" style="background-color: #FFF4D2; margin:0 auto;  border-top-left-radius:20px; 
					border-top-right-radius: 20px ;height: 200px; width: 800px; ">
						<div class="col-md-4" style="height: 200px; padding: 20px 130px 20px 50px;">
						<div class="row onewayRound" style="border-radius: 10px; background-color: #E5D1FA; width:100px; height: 35px;
						text-align: center; margin: 20px; line-height: 35px">
						${c.tripType }
						</div>
						<img src="/capool-img/destination2.png" alt="img" style="margin-left: 30px;">
						</div>
						<div class="col-md-8" style="height: 200px; padding: 40px;">
							<div class="departure" style="margin-bottom: 20px;">
								<span class="timeInfo" style="margin-right: 5px; font-weight: 600;">${c.departureDate }<span class="dayinKorean" style="margin-left:10px;"></span></span>
								<span class="ampm" style="font-weight: 600;">${c.departureTimeRange }</span>
							</div>
							<div class="col-md-3" style="font-weight: 900;">
								<div class="row district" style="margin-bottom: 30px;"><출발></div>
								<div class="row district"><도착></div>
							</div>
							<div class="col-md-3">
								<div class="row district" style="margin-bottom: 30px; font-weight: 700;">${c.departureRegion }</div>
								<div class="row district" style="font-weight: 700;">${c.arrivalRegion }</div>
							</div>
							<div class="col-md-6">
								<div class="row district" style="margin-bottom: 30px;">${c.departureDistrict }</div>
								<div class="row district">${c.arrivalDistrict }</div>
							</div>
						</div>
				</div>
				<div class="people" style="margin: 0 auto;  height: 20px; width: 800px; display:flex;  justify-content: center; align-items: center; ">
						<div class="attendant"style="border-bottom-left-radius: 20px;  border-bottom-right-radius: 20px; text-align: center; margin-top: 20px; background-color:#F0EEED;
						 width: 800px; height: 50px; line-height: 52px; margin-top: 20px;">모집인원 ${c.reserved}/${c.capacity }명 </div>
				</div><br><br><hr>
						<div class="price-box" style="margin: 0 auto; text-align:center; font-size:20px; font-weight: 600;">
						희망가격 <span class="price" style="color: #82CD47; font-size:30px; font-weight: 900;">${c.carpoolPrice}원</span>(편도/인당)
						</div>
						<hr>
						
						<!-- 모달!!! -->
						<!-- Trigger the modal with a button -->
				<div class="button-wrap" style="width:500px; margin: 0 auto; text-align:center;">		
				  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"> 
				  <img src="/capool-img/warning.png"alt="img" style="width: 30px; height: 30px;">
				  	꼭 읽어주세요 ! 아름다운 문화 만들기
				  </button>
				</div>  
				
				  <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">꼭 읽어주세요! </h4>
				        </div>
				        <div class="modal-body">
				          <p>Lonely surfers는 카풀에 관여하지 않습니다.<br> 다만, 사용자 보호를 위하여 불건전한 내용 또는 사기로 의심되는 행위 적발 시 사기 피해확산을 막기 위해 사기 이용자의 계정을 차단하고 서비스 이용이 제한할 수 있으며 경찰 등 수사시관에 적극 협조하고 있습니다.</p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal"> 동의합니다. </button>
				        </div>
				      </div>
				      
				    </div>
 				 </div>
				</div>
					</div>
				<c:if test="${not empty sessionScope.m }">	
			<div id="wrapper-cool-btn">
			  <a href="/carpoolMatch.do?carpoolNo=${c.carpoolNo }" class="my-super-cool-btn">
			    <div class="dots-container">
			      <div class="dot"></div>
			      <div class="dot"></div>
			      <div class="dot"></div>
			      <div class="dot"></div>
			    </div>
			    <span style="color: #F16767; font-size:25px; font-weight: 800;">태워주세요</span>
			  </a>
			</div>
			</c:if>
				<!-- end row -->

				<!-- section ＞ container 안에 class가 invis1인 hr 태그를 넣으시면, 가로로 큰 공백이 생깁니다. 이 태그를 여러 개를 넣으면 그만큼 공백 높이가 더 높아집니다. -->
				<hr class="invis1">

			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="js/moment.min.js"></script>
	
	<script>
		// moment와 jQuery로 날짜 가져와서 요일값 추출하기
		// c.regDate 값에서 날짜 정보를 추출
		// jQuery를 쓰기 위해서는 class명으로 호출한다.
		const date = moment($(".regdate"));
		console.log(date);
		
		// 요일을 표시하는 문자열을 생성한다.
		const dayOfWeek = date.format('dddd');
		console.log(dayOfWeek);
		
		// 한국어로 번역된 요일을 표시하는 문자열을 생성한다다.
		const dayOfWeekKorean = {
		  'Sunday': '일요일',
		  'Monday': '월요일',
		  'Tuesday': '화요일',
		  'Wednesday': '수요일',
		  'Thursday': '목요일',
		  'Friday': '금요일',
		  'Saturday': '토요일'
		}[dayOfWeek];
		
		// 결과를 출력해보고!
		console.log(dayOfWeekKorean); // 예: "목요일"
		
		//특정 클래스에 값을 집어넣어줘. 값을 집어넣기위해 html에 span class를 만들어줬다. 그 장소에 집어넣어달라고.
		$(".dayinKorean").text(dayOfWeekKorean);
		console.log($(".dayinKorean").text(dayOfWeekKorean));
	
		//참고로 input인경우에는 감싸는 괄호가 없다. 그때는 text가 아니라  value를 의미하는 val을 쓴다. val() : 읽어온다., val(매개변수) : 값을 준다. 
	
	</script>

</body>
</html>