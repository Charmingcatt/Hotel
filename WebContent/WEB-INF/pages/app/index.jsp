<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String usertype = session.getAttribute("userType")+"";
%>


<jsp:include page="header.jsp"></jsp:include>

<!-- Start of slider section -->
<section class="htlfndr-slider-section">
	<div class="owl-carousel">

		<c:forEach items="${ads}" var="item">
			<div class="htlfndr-slide-wrapper">
				<img src="<%=basePath%>${item.thumb }" alt="img-1" />
				<div class="htlfndr-slide-data container">

					<h1 class="htlfndr-slider-title">${item.title }</h1>
					<div class="htlfndr-slider-under-title-line"></div>
				</div>
				<!-- .htlfndr-slide-data.container -->
			</div>
			<!-- .htlfndr-slide-wrapper-->

		</c:forEach>



	</div>

	<!-- Search form aside start -->

	<!-- Search form aside stop -->

</section>
<!-- .htlfndr-slider-section -->
<!-- End of slider section -->
<noscript>
	<h2>You have JavaScript disabled!</h2>
</noscript>
</header>

<!-- Start of main content -->
<main role="main"> <!-- Section with popular destinations -->
<section class="container-fluid htlfndr-categories-portfolio">
	<h2 class="htlfndr-section-title bigger-title">热门客房HOTS</h2>
	<div class="htlfndr-section-under-title-line"></div>
	<div class="container">
		<div class="row">

			<c:forEach items="${hs}" var="item" varStatus="x">
				<c:if test="${x.index<6 }">
					<div class="col-sm-4 col-xs-6">
						<div class="htlfndr-category-box" onclick="void(0)">
							<!-- The "onclick" is using for Safari (IOS)
								 that recognizes the 'div' element as a clickable element -->
							<img src="<%=basePath %>${item.thunb}" height="311" width="370"
								alt="category-img" />
							<div class="category-description">
								<div class="htlfndr-icon-flag-border">
									<i class="htlfndr-icon-flag flag-germany"></i>
								</div>
								<!-- .htlfndr-icon-flag-border -->
								<h2 class="subcategory-name">${item.rooname}</h2>
								<a href="<%=basePath %>app/detail?id=${item.id}"
									class="htlfndr-category-permalink"></a>
								<!-- This link will be displayed to "block" and
										 will overlay to whole box by hovering on large desktop and will be a circle link on small devices -->
								<h5 class="category-name">${item.cate}</h5>
								<p class="category-properties">
									<span>￥${item.price2 }</span> <span
										style="text-decoration: line-through;">￥${item.price }</span>
								</p>
							</div>
							<!-- .category-description -->
						</div>
						<!-- .htlfndr-category-box -->
					</div>
					<!-- .col-sm-4.col-xs-6 -->
				</c:if>
			</c:forEach>



		</div>
		<!-- .row -->
	</div>
</section>
<!-- .container-fluid.htlfndr-categories-portfolio --> <!-- Section called USP section -->
<section class="container-fluid htlfndr-usp-section">
	<h2 class="htlfndr-section-title htlfndr-lined-title">
		<span>酒店资讯NEWS</span>
	</h2>
	<!-- You need <span> and 'htlfndr-lined-title' class for both side line -->
	<div class="container">
		<div class="row">

			<c:forEach items="${list}" var="item" varStatus="x">
				<c:if test="${x.index<3 }">
					<div class="col-sm-4 htlfndr-icon-box">
						<img class="htlfndr-icon icon-drinks"
							style="width: 100%; height: 100%"
							src="<%=basePath %>${item.thumb}" alt="icon" />
						<h5 class="htlfndr-section-subtitle">${item.title }</h5>
						<p>${item.description}</p>
						<a href="<%=basePath %>app/view.do?id=${item.id}"
							class="htlfndr-read-more-button">read more</a>
					</div>
					<!-- .col-sm-4.htlfndr-icon-box -->
				</c:if>
			</c:forEach>

		</div>
		<!-- .row -->
	</div>
	<!-- .container -->
</section>
<!-- .container-fluid .htlfndr-usp-section --> <!-- Section with categories -->


<!-- Section with visitors cards --> </main>
<!-- End of main content -->

<jsp:include page="footer.jsp"></jsp:include>

