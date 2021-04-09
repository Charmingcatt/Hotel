<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String usertype = session.getAttribute("userType")+"";
%>


<jsp:include page="header.jsp"></jsp:include>

			</header>

	<!-- Start of main content -->
	<div class="container">
		<div class="row htlfndr-page-content">
			<main id="htlfndr-main-content" class="col-sm-12 col-md-8 col-lg-9 htlfndr-single-blog-page" role="main">
				
				<article class="post htlfndr-room-post">
						<header>
							<h1 class="htlfndr-entry-title">
							${model.rooname } </h1>
							<a href=""><span>/ ${model.cate }</span></a>
							<a href=""><span>/ ${model.size } 平方</span></a>
							<a href=""><span>/ 楼层 ${model.address }</span></a>
						</header>
						<!-- Article slider -->
						<div id="htlfndr-room-slider" class="owl-carousel">
							<div class="htlfndr-room-slide-wrapper">
								<img src="<%=basePath%>${model.thunb }" alt="room picture" />
							</div><!-- .htlfndr-room-slide-wrapper -->
							
						</div><!-- #htlfndr-room-slider -->

						<div class="htlfndr-entry-content">
							<p>${model.description }</p>
							<p>${model.content }</p>
						</div><!-- .htlfndr-entry-content -->

						
					</article><!-- .post .htlfndr-room-post -->
				
				
		
			</main><!-- #htlfndr-main-content -->
			<aside id="htlfndr-right-sidebar" class="col-sm-12 col-md-4 col-lg-3 htlfndr-sidebar htlfndr-sidebar-in-right" role="complementary">
				
<div class="widget htlfndr-hotel-visit-card">
						<div class="htlfndr-widget-main-content htlfndr-widget-padding">
							<div class="htlfndr-hotel-logo">
								<img style="width:100%" src="<%=basePath %>static/x.png" alt="Hotel logo">
							</div><!-- .htlfndr-hotel-logo -->
							<div class="htlfndr-hotel-price">
								<span style="text-decoration: line-through;">￥${model.price }</span>
								 <span> 每晚</span> 
								<span class="htlfndr-cost">￥${model.price2 }</span> 
							</div> <!-- .htlfndr-hotel-price -->
						</div><!-- .htlfndr-widget-main-content 
					</div>
					<!--
					<c:if test="${model.state eq 2 }">
					<input style="background:#e10f72" class="htlfndr-book-now-button" type="button" value="房间已被预定">
					</c:if>
					-->
					
					<c:if test="${not empty usertype and usertype!=3 }">
					
					<form action="<%=basePath %>app/ordering" method="get">
					<input type="hidden" name="id" value="${model.id }">						
						<input class="htlfndr-book-now-button" type="submit" value="我要预定">
					</form>
					
					</c:if>
				<div class="widget htlfndr-near-properties">
					<div class="htlfndr-widget-main-content">
						<h3 class="widget-title">客房推荐</h3>
						
						 <c:forEach items="${hs}" var="item" varStatus="x">
   <c:if test="${x.index<4 }">
						<div class="htlfdr-hotel-post">
							<div class="htlfndr-post-inner htlfndr-table-view">
								<div class="htlfndr-hotel-thumbnail">
									 <a href="<%=basePath %>app/detail?id=${item.id}">
                                    <img src="<%=basePath %>${item.thunb}" alt="">
                                </a>
								</div>
								<!-- .htlfndr-hotel-thumbnail -->
								<div class="htlfndr-hotel-info">
									<a href="<%=basePath %>app/detail?id=${item.id}"><h6>${item.rooname}</h6></a>
									
									<p class="htlfndr-hotel-price"><span>
									每天
									</span> <span class="htlfndr-cost-normal"><span>￥${item.price2 }</span> 
										<span style="text-decoration: line-through;">￥${item.price }</span></span>
									</p>
								</div><!-- .htlfndr-hotel-info -->
							</div><!-- .htlfndr-post-inner -->
						</div><!-- .htlfdr-hotel-post -->
						</c:if>
						</c:forEach>
						
						

						
					</div><!-- .htlfndr-widget-main-content .htlfndr-widget-padding -->
				</div><!-- .widget .htlfndr-near-properties -->

				<div class="widget htlfndr-widget-archive">
					<div class="htlfndr-widget-main-content htlfndr-widget-padding">
						<h3 class="widget-title">栏目</h3>
						<ul>
							  <c:forEach items="${cs}" var="item">
                                  <li><a href="<%=basePath%>app/cates?id=${item.id}" class="categories-name">${item.title } <span></span></a></li>										
							</c:forEach>
						</ul>
					</div><!-- .htlfndr-widget-main-content .htlfndr-widget-padding -->
				</div><!-- .widget .htlfndr-widget-archive -->
			</aside><!-- .htlfndr-sidebar-in-right -->
			</div>
			</div></div>
<jsp:include page="footer.jsp"></jsp:include>

