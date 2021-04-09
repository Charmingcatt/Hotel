<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String usertype = session.getAttribute("userType")+"";
%>


<jsp:include page="header.jsp"></jsp:include>

			</header>
<script src="<%=basePath %>static/My97DatePicker/WdatePicker.js"></script>
	<!-- Start of main content -->
	<div class="container">
	<div class="htlfndr-steps">
			<ul class="htlfndr-progress">
				<li><a href="">
						<span class="htlfndr-step-number">1</span> <span class="htlfndr-step-description">results</span></a>
					</li>
					<li><a href="">
						<span class="htlfndr-step-number">2</span> <span class="htlfndr-step-description">hotel</span></a>
					</li>
					<li><a href="">
						<span class="htlfndr-step-number">3</span> <span class="htlfndr-step-description">room</span></a>
					</li>
					<li class="htlfndr-active-step">
						<span class="htlfndr-step-number">4</span> <span class="htlfndr-step-description">payment</span>
					</li>
			</ul>
		</div>
		<div class="row htlfndr-page-content">
			<main id="htlfndr-main-content" class="col-sm-12 col-md-8 col-lg-9 htlfndr-single-blog-page" role="main">
				
				<form action="<%=basePath %>app/post" id="htlfndr-payment-form" method="post">
					<input type="hidden" name="id" value="${model.id }">		
					<section class="htlfndr-form-section">
						<header>
							<h2 class="htlfndr-form-section-title">预定 <span>${model.rooname }</span></h2>
							<h5 class="htlfndr-form-section-description">Please tell us who will be checking in.</h5>
						</header>
						<div id="htlfndr-accordion-3" class="htlfndr-form-block">
							<h3 class="htlfndr-form-block-title htlfndr-accordion-title">Checking in info</h3>
							<div class="htlfndr-form-block-inner htlfndr-accordion-inner">
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<label for="htlfndr-first-adult-name" class="htlfndr-required htlfndr-top-label">入住联系人</label>
										<input type="text" id="htlfndr-first-adult-name" name="username" class="htlfndr-input "
													 placeholder="输入入住联系人" />
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<label for="htlfndr-first-adult-last-name" class="htlfndr-required htlfndr-top-label">身份证</label>
										<input type="text" id="htlfndr-first-adult-last-name" name="idcard" class="htlfndr-input"
													 placeholder="输入联系人身份证" />
									</div>
								</div><!-- .row -->
								
								<div class="row">
									<div class="col-md-6 htlfndr-classic-radio">
										<label class="htlfndr-required htlfndr-top-label">性别</label>
										<input type="checkbox" checked id="htlfndr-first-adult-male" name="sex" value="男" />
										<label for="htlfndr-first-adult-male">男</label>
										<input type="checkbox" id="htlfndr-first-adult-female" name="sex" value="女" />
										<label for="htlfndr-first-adult-female">女</label>
									</div>
									<div class="col-md-6">
										<label for="htlfndr-first-adult-phone" class="htlfndr-required htlfndr-top-label">联系人电话</label>
										<input type="tel" id="htlfndr-first-adult-phone" class="htlfndr-input" name="tel" placeholder="输入联系人电话..." />
									</div>
								</div><!-- .row -->
								
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<label for="htlfndr-first-adult-name" class="htlfndr-required htlfndr-top-label">入住时间</label>
										<input type="text" onclick="WdatePicker()" id="htlfndr-first-adult-name" name="indate" class="htlfndr-input "
													 placeholder="入住" />
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<label for="htlfndr-first-adult-last-name" class="htlfndr-required htlfndr-top-label">离店时间</label>
										<input type="text" onclick="WdatePicker()" id="htlfndr-first-adult-last-name" name="outdate" class="htlfndr-input"
													 placeholder="离店" />
									</div>
								</div><!-- .row -->
								
							</div><!-- .htlfndr-form-block-inner -->
						</div><!-- .htlfndr-form-block -->
						<input type="submit" class="htlfndr-payment-submit" value="提交预定信息">
</section>
						
				</form>
				
				
		
			</main><!-- #htlfndr-main-content -->
			<aside id="htlfndr-right-sidebar" class="col-sm-12 col-md-4 col-lg-3 htlfndr-sidebar htlfndr-sidebar-in-right" role="complementary">
				
<div class="widget htlfndr-hotel-visit-card">
						<div class="htlfndr-widget-main-content htlfndr-widget-padding">
							<div class="htlfndr-hotel-logo">
								<img style="width:100%" src="<%=basePath %>static/x.png" alt="Hotel logo">
							</div><!-- .htlfndr-hotel-logo -->
							<div class="htlfndr-hotel-price">
								<span style="text-decoration: line-through;">￥${model.price2 }</span>
								 <span> 每晚</span> 
								<span class="htlfndr-cost">￥${model.price }</span> 
							</div> <!-- .htlfndr-hotel-price -->
						</div><!-- .htlfndr-widget-main-content -->
					</div>
					
					<c:if test="${usertype eq 1 }">
					<c:if test="${model.state eq 1 }">
					<form action="<%=basePath %>app/ordering" method="get">
					<input type="hidden" name="id" value="${model.id }">						
						
					</form>
					</c:if>
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
			</div>
			</div></div>
<jsp:include page="footer.jsp"></jsp:include>

