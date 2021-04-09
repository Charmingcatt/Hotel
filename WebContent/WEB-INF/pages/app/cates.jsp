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
			<main id="htlfndr-main-content" class="col-sm-12 col-md-8 col-lg-9" role="main">
				
				  <c:forEach items="${list}" var="item" varStatus="x">
				<article class="post htlfndr-post">
					<header class="htlfndr-entry-header">
						<a href="<%=basePath %>app/view?id=${item.id}">
						<h2 class="htlfndr-entry-title"> ${item.title }</h2></a>
						<div class="htlfndr-entry-meta">
							<span class="htlfndr-posted-by">Posted  
							</span>
							<span class="htlfndr-post-date"><a href="#"><time datetime="2015-08-25">${item.created }</time></a></span>
							
							
						</div><!-- .htlfndr-entry-meta -->
					</header>
					<a href="<%=basePath %>app/view?id=${item.id}" class="htlfndr-post-thumbnail">
						<img src="<%=basePath %>${item.thumb}" alt="post image" />
					</a>
					<div class="htlfndr-entry-content">
						<p>
						  ${item.description}
						</p>
						<a href="<%=basePath %>app/view?id=${item.id}" class="htlfndr-more-link">read more</a>
					</div><!-- .htlfndr-entry-content -->
				</article><!-- .post .htlfndr-post -->
				</c:forEach>
				

				

				

				<!-- Pagination -->
				
			</main><!-- #htlfndr-main-content -->

			<aside id="htlfndr-right-sidebar" class="col-sm-12 col-md-4 col-lg-3 htlfndr-sidebar htlfndr-sidebar-in-right" role="complementary">
				

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
									</span> <span class="htlfndr-cost-normal"><span>￥${item.price }</span> 
										<span style="text-decoration: line-through;">￥${item.price2 }</span></span>
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
		</div><!-- .row .htlfndr-page-content -->
	</div><!-- .container -->
	<!-- End of main content -->
			
<jsp:include page="footer.jsp"></jsp:include>

