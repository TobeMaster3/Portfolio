
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--  캠핑가자 List MVC Model2 구조 -->

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CAMPER</title>

<script>
$('#userprofil').on('show.bs.modal', function (e) {
    var nick = $(e.relatedTarget).data('id');
});
</script>

<!-- FAVICON -->
<link href="../../images/favicon.png" rel="shortcut icon">
<!-- PLUGINS CSS STYLE -->
<!-- <link href="plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet"> -->
<!-- Bootstrap -->
<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap-slider.css">
<!-- Font Awesome -->
<link href="../../plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- Owl Carousel -->
<link href="../../plugins/slick-carousel/slick/slick.css" rel="stylesheet">
<link href="../../plugins/slick-carousel/slick/slick-theme.css" rel="stylesheet">
<!-- Fancy Box -->
<link href="../../plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="../../plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
<!-- CUSTOM CSS -->
<link href="../../css/style.css" rel="stylesheet">
<link href="../../css/board_main.css" rel="stylesheet">


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  	<![endif]-->

</head>

<!--  Header part -->
<body class="body-wrapper">
 	 <jsp:include page="../../component/header.jsp"></jsp:include>

	<!--  캠핑가자 List Section -->
		<section class="blog section">
			<div class="container">
				<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0"">
					<h2><i class="ico"><img src="../../images/community/icon_car.png"></i>
					캠핑가자
					</h2><hr />     
				</div>
			</div>
			
		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0">

					<!--  List 내용 표시 -->
					<c:forEach var="board" items="${boardLists3}" varStatus="status">
						<article>
							<div>
								<a href="/community/view.do?cpage=${board.cpage}&pseq=${board.pseq}&type=${board.type}">${board.title}</a>
							</div>
							<ul class="list-inline">
								<li class="list-inline-item">by <a href="" data-toggle="modal" data-target="#userprofile" onclick="userProfile('${board.nick}')">${board.nick}</a></li>
								<li class="list-inline-item">${board.wdate}</li>
							</ul>
						</article>
					</c:forEach>
					
					<!--  버튼 Part -->					
					<c:choose>
						<c:when test="${empty sessionScope.nick}">
							<input type="button" value="글쓰기" class="btn btn-transparent" style="float: right;" onclick="javascript:alert('로그인을 하셔야합니다.')" >
						</c:when>
						<c:otherwise>
							<input type="button" value="글쓰기" class="btn btn-transparent" style="float: right;" onclick="location.href='/community/write3.do'" >
						</c:otherwise>
					</c:choose>

					<!--  페이지네이션 Part -->
					<nav aria-label="Page navigation">
						<ul class="pagination" style="margin-top: 0px;">
						
							<!--  페이지네이션 내용 표시 -->
							<li class='page-item'><a class='page-link' href='/community/camplog.do?cpage=1' aria-label='DNext'><span aria-hidden='true'><i class='fa fa-angle-double-left'></i></span><span class='sr-only'>DPrevious</span></a></li>
							<c:choose>
								<c:when test="${paging.cpage == 1}">
									<li class='page-item'><a class='page-link' href='#' aria-label='Previous'><span aria-hidden='true'><i class='fa fa-angle-left'></i></span><span class='sr-only'>Previous</span></a></li>
								</c:when>
								<c:otherwise>
									<li class='page-item'><a class='page-link' href='/community/camplog.do?cpage=${paging.cpage-1}' aria-label='Previous'><span aria-hidden='true'><i class='fa fa-angle-left'></i></span><span class='sr-only'>Previous</span></a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${paging.startBlock}" end="${paging.endBlock}">
								<c:choose>
									<c:when test="${paging.cpage == i}">
										<li class='page-item'><a class='page-link' href='#'>${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class='page-item'><a class='page-link' href='/community/camplog.do?cpage=${i}'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${paging.cpage == paging.totalPage}">
									<li class='page-item'><a class='page-link' href='#' aria-label='Next'><span aria-hidden='true'><i class='fa fa-angle-right'></i></span><span class='sr-only'>Next</span></a></li>
								</c:when>
								<c:otherwise>
									<li class='page-item'><a class='page-link' href='/community/camplog.do?cpage=${paging.cpage+1}' aria-label='Next'><span aria-hidden='true'><i class='fa fa-angle-right'></i></span><span class='sr-only'>Next</span></a></li>
								</c:otherwise>
							</c:choose>
							<li class='page-item'><a class='page-link' href='/community/camplog.do?cpage=${paging.totalPage}' aria-label='Next'><span aria-hidden='true'><i class='fa fa-angle-double-right'></i></span><span class='sr-only'>DNext</span></a></li>
						</ul>
					</nav>
				</div>
				
				<!--  우측 사이드 part -->
				<jsp:include page="../../component/community.jsp"></jsp:include>

			</div>
		</div>
	</section>
	
	<!-- Footer part -->
 	<jsp:include page="../../component/footer.jsp"></jsp:include>
 	<!-- 사용자 프로필 모달 -->
 	<jsp:include page="../../modal/userProfile.jsp"></jsp:include>
 
  	<!-- JAVASCRIPTS -->
	<script src="../../plugins/jQuery/jquery.min.js"></script>
	<script src="../../plugins/bootstrap/js/popper.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap-slider.js"></script>
	<!-- tether js -->
	<script src="../../plugins/tether/js/tether.min.js"></script>
	<script src="../../plugins/raty/jquery.raty-fa.js"></script>
	<script src="../../plugins/slick-carousel/slick/slick.min.js"></script>
	<script src="../../plugins/jquery-nice-select/js/jquery.nice-select.min.js"></script>
	<script src="../../plugins/fancybox/jquery.fancybox.pack.js"></script>
	<script src="../../plugins/smoothscroll/SmoothScroll.min.js"></script>
	<!-- google map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&libraries=places"></script>
	<script src="../../plugins/google-map/gmap.js"></script>
	<script src="../../js/script.js"></script>
	
</body>

</html>