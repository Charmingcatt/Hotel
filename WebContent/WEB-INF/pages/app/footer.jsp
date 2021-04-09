<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="com.app.utils.*" %>
<%@ page language="java" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String usertype = session.getAttribute("userType")+"";

%>

			<!-- Start of the Footer -->
			<footer class="htlfndr-footer">
				
				<button class="htlfndr-button-to-top" role="button"><span>Back to top</span></button><!-- Button "To top" -->

				

				<div class="htlfndr-copyright">
					<div class="container" role="contentinfo">
						<p>Copyright 2020 | 博辛顿酒店管理系统 | All Rights Reserved |
						</p>
					</div><!-- .container -->
				</div><!-- .htlfndr-copyright -->
			</footer>
		</div><!-- .htlfndr-wrapper -->
		
		

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="<%=basePath %>static/app/js/jquery-1.11.3.min.js"></script>
		<!-- Include <%=basePath %>static/app/Jquery UI script file -->
		<script src="<%=basePath %>static/app/js/jquery-ui.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<!-- Include Query UI Touch Punch is a small hack that enables the use
		 of touch events on sites using the jQuery UI user interface library. -->
		<script src="<%=basePath %>static/app/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=basePath %>static/app/js/bootstrap.min.js"></script>
		<!-- Include Owl Carousel script file -->
		<script src="<%=basePath %>static/app/js/owl.carousel.min.js"></script>
		<!-- Include main script file -->
		<script src="<%=basePath %>static/app/js/script.js"></script>

		<!--<script src="js/less.min.js" ></script> -->
		 <link href="<%=basePath %>static/toastr-master/toastr.min.css" rel="stylesheet" type="text/css" />        
        <script src="<%=basePath %>static/toastr-master/toastr.min.js"></script>
        <script>
        <c:if test="${!empty state }">
        toastr.${state}('${message}', '提示');
        setTimeout(function(){
        	window.location.href = "<%=basePath%>${url}";
        },1500)
        </c:if>
        </script>
	</body>
</html>
