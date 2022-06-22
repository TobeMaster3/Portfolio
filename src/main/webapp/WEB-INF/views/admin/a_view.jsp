<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD

<%@page import="com.camper.model.NboardTO"%>
<% 

	NboardTO to = (NboardTO)request.getAttribute( "to" );
	String nseq = to.getNseq();
	String title = to.getTitle();
	String nick = to.getNick();
	String content = to.getContent();
	String wdate = to.getWdate();
	
%>
    
    
<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>CAMPER</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="../../image/png" sizes="16x16" href="../../iamges/favicon.png">
    <!-- Custom CSS -->
   <link href="../../css_a/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="../../admin/main.do">
                        <!-- Logo icon -->
                        <b class="logo-icon">
                            <!-- Dark Logo icon camper앞에 로고 추가시 여기사용-->
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span class="logo-text">
                            <!-- dark Logo text -->
                            <img src="../../plugins_a/images/camper.png" alt="homepage" />
                        </span>
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                        href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">

                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav ms-auto d-flex align-items-center">

                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class=" in">
                            <form role="search" class="app-search d-none d-md-block me-3">
                                <input type="text" placeholder="Search..." class="form-control mt-0">
                                <a href="" class="active">
                                    <i class="fa fa-search"></i>
                                </a>
                            </form>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li>
                            <a class="profile-pic" href="#">
                                <img src="../../plugins_a/images/users/varun.jpg" alt="user-img" width="36"
                                    class="img-circle"><span class="text-white font-medium">Admin</span></a>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
      <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/main.do" aria-expanded="false">
                                <i class="fas fa-chart-area" aria-hidden="true"></i>
                                <span class="hide-menu">관리자메인</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/member.do" aria-expanded="false">
                                <i class="fas fa-id-badge" aria-hidden="true"></i>
                                <span class="hide-menu">회원관리</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/comm.do" aria-expanded="false">
                                <i class="fa fa-globe" aria-hidden="true"></i>
                                <span class="hide-menu">커뮤니티</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/notice.do" aria-expanded="false">
                                <i class="fa fa-info" aria-hidden="true"></i>
                                <span class="hide-menu">고객지원</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/ask.do" aria-expanded="false">
                                <i class="fa fa-comment-dots" aria-hidden="true"></i>
                                <span class="hide-menu">1:1문의</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/site.do" aria-expanded="false">
                                <i class="fa fa-font" aria-hidden="true"></i>
                                <span class="hide-menu">사이트정보</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/admin.do" aria-expanded="false">
                                <i class="fas fa-cog" aria-hidden="true"></i>
                                <span class="hide-menu">관리자설정</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/terms.do" aria-expanded="false">
                                <i class="fas fa-clipboard-list" aria-hidden="true"></i>
                                <span class="hide-menu">가입약관</span>
                            </a>
                        </li>
                        
                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper" style="min-height: 250px;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">고객지원</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <div class="d-md-flex">
                            <ol class="breadcrumb ms-auto">
                                <li><a href="#" class="fw-normal">로그아웃</a></li>
                            </ol>
                            <a href="https://www.wrappixel.com/templates/ampleadmin/" target="_blank"
                                class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">
                                홈페이지 바로가기</a>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                            <!-- 상단 디자인 -->

<div class="con_txt">
	<div class="contents_sub">
		<!--게시판-->
		<div class="board_view">
			<table>
			<tr>
				<th width="10%">제목</th>
				<td width="60%"><%=title%></td>
				<th width="10%">등록일</th>
				<td width="20%"><%=wdate%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=nick%></td>

			</tr>
			<tr>
				<td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%">
                    <%=content%>
                </td>
			</tr>
		</table>
	</div>

    <br><br><br>

        <!-- 버튼 시작 -->
        <div style="margin:10px 0 0;">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr>
                        <td align="right">
                                <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='/admin/notice.do'" />
                                <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.html'" />
                                <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_delete1.jsp'" />
                                <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.html'" />
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 버튼 끝-->
        <br><br><br>


<!-- 댓글 목록-->

<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom:1px solid #ddd;">
    <tbody>
    <tr>
    	<td colspan="4" height="1" style="background:#ddd; "></td>
    </tr>
    <tr>
    	<td width="15%" height="45" class="AWbbs_comment_id" align="center">
           닉네임 
    	</td>
        
		<td align="left" style="padding:5px 10px; line-height:1.4;">댓글입니다.댓글입니다.댓글입니다.댓글입니다.</td>
        <td align="center" width="15%" style="font-weight:normal; font-size:8pt;">2022-01-13 10:57</td>
        <td align="right" width="7%">
            <a href="/adm/manage/bbs/bbs.php?ptype=passwd&amp;mode=delco&amp;cidx=5318&amp;idx=35&amp;code=notice&amp;page=1">
                <input type="button" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href=''" />
            </a>
        </td>
    </tr>

    <tr>
    	<td width="15%" height="45" class="AWbbs_comment_id" align="center">
           닉네잉
    	</td>
        
		<td align="left" style="padding:5px 10px; line-height:1.4;">댓글입니다.댓글입니다.댓글입니다.댓글입니다.</td>
        <td align="center" width="15%" style="font-weight:normal; font-size:8pt;">2022-01-13 10:57</td>
        <td align="right" width="7%">
            <a href="/adm/manage/bbs/bbs.php?ptype=passwd&amp;mode=delco&amp;cidx=5318&amp;idx=35&amp;code=notice&amp;page=1">
                <input type="button" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href=''" />
            </a>
        </td>
    </tr>

</tbody>
</table>


<!-- 댓글 목록 끝-->

<br><br>


<!-- 댓글 작성-->
        <div style="background:#f7f7f7; border:1px solid #ddd; padding:15px; margin-bottom:20px;">
            <form name="comment" action="/adm/manage/bbs/bbs.php?code=notice&amp;page=1" method="post" onsubmit="return commentCheck(this);">
            <input type="hidden" name="ptype" value="save">
            <input type="hidden" name="mode" value="comment">
            <input type="hidden" name="cidx" value="5318">
            <input type="hidden" name="tmp_vcode" value="0b421baece866d39ad4a90cd337450b0">
                <div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_comment_input_info"><tbody><tr>
                    <td><input type="text" name="name" value="관리자" class="input w80"></td>
                    <td><!--<img src='/adm/bbs/norobot_image.php?ss_norobot_key=940b33' border='0' style='border: 1px solid #343d4f;' align='absmiddle'> <input type='text' name='vcode' id='vcode' class='input w100' /><font class='comment left10'>* 왼쪽의 자동등록방지 코드를 입력하세요.</font> --></td>
                </tr></tbody></table>
                </div>
                

                <div style="margin:5px 0 0;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr>
                    <td>
                        <textarea name="content" onclick="memberCheck();" class="input" style="width:100%; height:55px; word-break:break-all; background:#fff; padding:3px 1px;"></textarea>
                    </td>
                    <td width="90" align="right">
                    <input type="button" value="등록" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href=''" />




                </tr></tbody></table>
                </div>
            </form>
            </div>
<!--댓글 작성 끝-->


		<!--//게시판-->
	</div>
</div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            
=======
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>CAMPER</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="../../image/png" sizes="16x16" href="../../iamges/favicon.png">
    <!-- Custom CSS -->
   <link href="../../css_a/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="../../admin/main.do">
                        <!-- Logo icon -->
                        <b class="logo-icon">
                            <!-- Dark Logo icon camper앞에 로고 추가시 여기사용-->
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span class="logo-text">
                            <!-- dark Logo text -->
                            <img src="../../plugins_a/images/camper.png" alt="homepage" />
                        </span>
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                        href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">

                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav ms-auto d-flex align-items-center">

                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class=" in">
                            <form role="search" class="app-search d-none d-md-block me-3">
                                <input type="text" placeholder="Search..." class="form-control mt-0">
                                <a href="" class="active">
                                    <i class="fa fa-search"></i>
                                </a>
                            </form>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li>
                            <a class="profile-pic" href="#">
                                <img src="../../plugins_a/images/users/varun.jpg" alt="user-img" width="36"
                                    class="img-circle"><span class="text-white font-medium">Admin</span></a>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
      <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/main.do" aria-expanded="false">
                                <i class="fas fa-chart-area" aria-hidden="true"></i>
                                <span class="hide-menu">관리자메인</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/member.do" aria-expanded="false">
                                <i class="fas fa-id-badge" aria-hidden="true"></i>
                                <span class="hide-menu">회원관리</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/comm.do" aria-expanded="false">
                                <i class="fa fa-globe" aria-hidden="true"></i>
                                <span class="hide-menu">커뮤니티</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/notice.do" aria-expanded="false">
                                <i class="fa fa-info" aria-hidden="true"></i>
                                <span class="hide-menu">고객지원</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/ask.do" aria-expanded="false">
                                <i class="fa fa-comment-dots" aria-hidden="true"></i>
                                <span class="hide-menu">1:1문의</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/site.do" aria-expanded="false">
                                <i class="fa fa-font" aria-hidden="true"></i>
                                <span class="hide-menu">사이트정보</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/admin.do" aria-expanded="false">
                                <i class="fas fa-cog" aria-hidden="true"></i>
                                <span class="hide-menu">관리자설정</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../../admin/terms.do" aria-expanded="false">
                                <i class="fas fa-clipboard-list" aria-hidden="true"></i>
                                <span class="hide-menu">가입약관</span>
                            </a>
                        </li>
                        
                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper" style="min-height: 250px;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">view</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <div class="d-md-flex">
                            <ol class="breadcrumb ms-auto">
                                <li><a href="#" class="fw-normal">Dashboard</a></li>
                            </ol>
                            <a href="https://www.wrappixel.com/templates/ampleadmin/" target="_blank"
                                class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">Upgrade
                                to Pro</a>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                            <!-- 상단 디자인 -->

<div class="con_txt">
	<div class="contents_sub">
		<!--게시판-->
		<div class="board_view">
			<table>
			<tr>
				<th width="10%">제목</th>
				<td width="60%">제목입니다.</td>
				<th width="10%">등록일</th>
				<td width="20%">2022.01.31 09:57</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>닉네임</td>
				<th>좋아요</th>
				<td>3</td>
			</tr>
			<tr>
				<th>첨부 파일</th>
				<td>test.txt(1024 Kbyte)</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%">
                    찬 바람이 조금씩 불어오면은 밤 하늘이 반짝이더라 긴 하루를 보내고 집에 들어가는 길에 
                    네 생각이 문득 나더라 어디야 지금 뭐 해 나랑 별 보러 가지 않을래
                    너희 집 앞으로 잠깐 나올래 가볍게 겉옷 하나 걸치고서 나오면 돼 너무 멀리 가지 않을게 그렇지만 네 손을 꼭 잡을래 멋진 별자리 이름은 모르지만
                    나와 같이 가줄래 찬 바람이 조금씩 불어 오면은 네 생각이 난 그렇게 나더라 긴 하루 끝 고요해진 밤거리를 걷다 밤 하늘이 너무 좋더라 어디야 지금 뭐해
                    나랑 별 보러 가지 않을래 어디든 좋으니 나와 가줄래 네게 하고 싶었던 말이 너무도 많지만 너무 서두르지 않을게 그치만 네 손을 꼭 잡을래
                    멋진 별자리 이름은 모르지만 나와 같이 가줄래 너와 나의 걸음이 향해 가는 그곳이 어디 일진 모르겠지만 혼자였던 밤 하늘 너와 함께 걸으면 그거면 돼
                    찬 바람이 조금씩 불어오면은 밤 하늘이 반짝이더라 긴 하루를 보내고 집에 들어가는 길에 네 생각이 문득 나더라 어디야 지금 뭐 해 나랑 별 보러 가지 않을래
                    너희 집 앞으로 잠깐 나올래 가볍게 겉옷 하나 걸치고서 나오면 돼 너무 멀리 가지 않을게 그렇지만 네 손을 꼭 잡을래 멋진 별자리 이름은 모르지만
                    나와 같이 가줄래 찬 바람이 조금씩 불어 오면은 네 생각이 난 그렇게 나더라 긴 하루 끝 고요해진 밤거리를 걷다 밤 하늘이 너무 좋더라 어디야 지금 뭐해
                    나랑 별 보러 가지 않을래 어디든 좋으니 나와 가줄래 네게 하고 싶었던 말이 너무도 많지만 너무 서두르지 않을게 그치만 네 손을 꼭 잡을래
                    멋진 별자리 이름은 모르지만 나와 같이 가줄래 너와 나의 걸음이 향해 가는 그곳이 어디 일진 모르겠지만 혼자였던 밤 하늘 너와 함께 걸으면 그거면 돼
                </td>
			</tr>
		</table>
	</div>

    <br><br><br>

        <!-- 버튼 시작 -->
        <div style="margin:10px 0 0;">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr>
                        <td align="right">
                                <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='faq.html'" />
                                <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.html'" />
                                <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_delete1.jsp'" />
                                <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.html'" />
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 버튼 끝-->
        <br><br><br>


<!-- 댓글 목록-->

<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom:1px solid #ddd;">
    <tbody>
    <tr>
    	<td colspan="4" height="1" style="background:#ddd; "></td>
    </tr>
    <tr>
    	<td width="15%" height="45" class="AWbbs_comment_id" align="center">
           닉네임 
    	</td>
        
		<td align="left" style="padding:5px 10px; line-height:1.4;">댓글입니다.댓글입니다.댓글입니다.댓글입니다.</td>
        <td align="center" width="15%" style="font-weight:normal; font-size:8pt;">2022-01-13 10:57</td>
        <td align="right" width="7%">
            <a href="/adm/manage/bbs/bbs.php?ptype=passwd&amp;mode=delco&amp;cidx=5318&amp;idx=35&amp;code=notice&amp;page=1">
                <input type="button" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href=''" />
            </a>
        </td>
    </tr>

    <tr>
    	<td width="15%" height="45" class="AWbbs_comment_id" align="center">
           닉네잉
    	</td>
        
		<td align="left" style="padding:5px 10px; line-height:1.4;">댓글입니다.댓글입니다.댓글입니다.댓글입니다.</td>
        <td align="center" width="15%" style="font-weight:normal; font-size:8pt;">2022-01-13 10:57</td>
        <td align="right" width="7%">
            <a href="/adm/manage/bbs/bbs.php?ptype=passwd&amp;mode=delco&amp;cidx=5318&amp;idx=35&amp;code=notice&amp;page=1">
                <input type="button" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href=''" />
            </a>
        </td>
    </tr>

</tbody>
</table>


<!-- 댓글 목록 끝-->

<br><br>


<!-- 댓글 작성-->
        <div style="background:#f7f7f7; border:1px solid #ddd; padding:15px; margin-bottom:20px;">
            <form name="comment" action="/adm/manage/bbs/bbs.php?code=notice&amp;page=1" method="post" onsubmit="return commentCheck(this);">
            <input type="hidden" name="ptype" value="save">
            <input type="hidden" name="mode" value="comment">
            <input type="hidden" name="cidx" value="5318">
            <input type="hidden" name="tmp_vcode" value="0b421baece866d39ad4a90cd337450b0">
                <div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_comment_input_info"><tbody><tr>
                    <td><input type="text" name="name" value="관리자" class="input w80"></td>
                    <td><!--<img src='/adm/bbs/norobot_image.php?ss_norobot_key=940b33' border='0' style='border: 1px solid #343d4f;' align='absmiddle'> <input type='text' name='vcode' id='vcode' class='input w100' /><font class='comment left10'>* 왼쪽의 자동등록방지 코드를 입력하세요.</font> --></td>
                </tr></tbody></table>
                </div>
                

                <div style="margin:5px 0 0;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr>
                    <td>
                        <textarea name="content" onclick="memberCheck();" class="input" style="width:100%; height:55px; word-break:break-all; background:#fff; padding:3px 1px;"></textarea>
                    </td>
                    <td width="90" align="right">
                    <input type="button" value="등록" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href=''" />




                </tr></tbody></table>
                </div>
            </form>
            </div>
<!--댓글 작성 끝-->


		<!--//게시판-->
	</div>
</div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center"> 2021 © Ample Admin brought to you by <a
                    href="https://www.wrappixel.com/">wrappixel.com</a>
            </footer>
>>>>>>> refs/heads/main
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../../plugins_a/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../../bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="../../js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../../js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../../js/custom.js"></script>
</body>

</html>