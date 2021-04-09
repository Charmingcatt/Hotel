<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.app.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String usertype = session.getAttribute("userType")+"";
Object user = session.getAttribute("user");
if(user!=null)
{
	user = (Users)user;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>格林酒店管理系统</title>

<!-- Bootstrap -->
<link href="<%=basePath %>static/app/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Main styles -->
<link href="<%=basePath %>static/app/css/style.css" rel="stylesheet" />
<!--<link rel="stylesheet/less" href="css/style.less" />-->
<!-- IE styles -->
<link href="<%=basePath %>static/app/css/ie.css" rel="stylesheet" />
<!-- Font Awesome -->
<link href="<%=basePath %>static/app/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- OWL Carousel -->
<link href="<%=basePath %>static/app/css/owl.carousel.css"
	rel="stylesheet" />
<!-- Jquery UI -->
<link href="<%=basePath %>static/app/css/jquery-ui.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<!-- Overlay preloader-->
	<div class="htlfndr-loader-overlay"></div>

	<div class="htlfndr-wrapper">
		<header>
			<div class="htlfndr-top-header">
				<div class="navbar navbar-default htlfndr-blue-hover-nav">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#htlfndr-first-nav">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="htlfndr-logo navbar-brand" href="http://localhost:8080/HSS/app/index"> <img
								src="<%=basePath %>static/app/images/logo.png" alt="Logo" />
								<p class="htlfndr-logo-text">
									格林酒店 <span>Hotel</span>
								</p>
							</a>
						</div>
						<!-- .navbar-header -->
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse navbar-right"
							id="htlfndr-first-nav">
							<!-- List with sing up/sing in links -->
							<ul class="nav navbar-nav htlfndr-singup-block">
								<c:if test="${user==null }">
									<li id="htlfndr-singup-link"><a
										href="<%=basePath %>manage/reg"><span>注册</span></a></li>
									<li id="htlfndr-singin-link"><a
										href="<%=basePath %>manage/login"><span>登录</span></a></li>
								</c:if>
								<c:if test="${user!=null }">
									<li id="htlfndr-singup-link"><a
										href="<%=basePath %>manage/index"><span>欢迎您,${user.username }</span></a>
									</li>
									<li id="htlfndr-singin-link"><a
										href="<%=basePath%>manage/quit?retUrl=index.html"><span>注销</span></a>
									</li>
								</c:if>
							</ul>
							<!-- .htlfndr-singup-block -->
							<!-- List with currency and language dropdons -->


						</div>
						<!-- .collapse.navbar-collapse -->
					</div>
					<!-- .container -->
				</div>
				<!-- .navbar.navbar-default.htlfndr-blue-hover-nav-->
			</div>
			<!-- .htlfndr-top-header -->
			<!-- Start of main navigation -->
			<div class="htlfndr-under-header">
				<nav class="navbar navbar-default">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#htlfndr-main-nav">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<!-- .navbar-header -->
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="htlfndr-main-nav">
							<ul class="nav navbar-nav">
								<li class="active"><a href="index.html">首页</a></li>
								<li><a href="<%=basePath%>app/house">客房</a></li>

								<c:forEach items="${cates}" var="item">
									<li class="dropdown"><a
										href="<%=basePath%>app/cates?id=${item.id}">${item.title }</a>
										<ul class="dropdown-menu">
											<c:forEach items="${item.subs}" var="item1">
												<li class=""><a
													href="<%=basePath%>app/cates?id=${item1.id}">${item1.title }</a></li>
											</c:forEach>


										</ul>
									</li>
								</c:forEach>
								<li>
									<form method="POST" action="<%=basePath%>house/house/houseSerch" enctype="multipart/form-data">
									     <table>
									     <tr>
									     <td>
									     <input class="form-control" id="message" name="message" type=text placeholder="输入名称、类型或价格">
									     </td>
									     <td>
									     <button  type="submit" class="btn">搜索</button>	  </td>
									     </tr>  
									     </table>  
									</form>
								</li>
							</ul>
						</div>
						<!-- .collapse.navbar-collapse -->
					</div>
					<!-- .container -->
				</nav>
				<!-- .navbar.navbar-default.htlfndr-blue-hover-nav -->
			</div>
			<!-- .htlfndr-under-header -->
			<!-- End of main navigation -->
		</header>
	</div>
</body>
</html>
