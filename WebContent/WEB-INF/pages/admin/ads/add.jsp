<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = (String) request.getSession().getAttribute("username");
String message = (String)request.getAttribute("message");


%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>格林酒店管理系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        

        <!-- App favicon -->
        <link rel="shortcut icon" href="<%=basePath %>static/assets/images/favicon.ico">

        <link href="<%=basePath %>static/assets/plugins/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet">

        <!-- App css -->
        <link href="<%=basePath %>static/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath %>static/assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath %>static/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath %>static/assets/css/style.css" rel="stylesheet" type="text/css" />

    </head>
<body>
<c:if test="${inpost!=null}">
 <c:if test="${message!=null}">
   <script>
swal("操作提示", "恭喜您，数据添加成功.", "success")
</script>
</c:if>
 
</c:if>
<div class="article toolbar">
	<div class="title ue-clear">
    	<h2>轮播添加</h2>
       
    </div>
    <div class="content" style="padding-bottom:50px;">
    	
    	
    	<form method="POST" action="<%=basePath%>ads/ads/save">
    	
    	<div class="main" >
	<p class="short-input ue-clear">
    	<label>轮播标题：</label>
        <input name="title"  required value="" type="text" placeholder="" >        
        <span></span>
    </p>
    
   <p class="short-input ue-clear">
    	<label>轮播URL：</label>
        <input name="url"  required value="" type="text" placeholder="" >        
        <span></span>
    </p>
    
    <p class="short-input ue-clear">
    	<label>轮播大图：</label>
        	<input readonly type="text"   required   id="thumb" value="" name="thumb" >
		    <a href="javascript:;" class="uploadImg">点击上传</a>        
        <span></span>
    </p>
    
    
    
    
</div>
<div class="btn1 ue-clear">
	<button type="submit" class="confirm">确定</button>
    <a href="javascript:;" class="clear">取消</a>
</div>
</div>

</form>
</div>
	
        <!-- jQuery  -->
        <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
        <script src="<%=basePath %>static/assets/js/bootstrap.bundle.min.js"></script>
        <script src="<%=basePath %>static/assets/js/metisMenu.min.js"></script>
        <script src="<%=basePath %>static/assets/js/waves.min.js"></script>
        <script src="<%=basePath %>static/assets/js/jquery.slimscroll.min.js"></script>

        <script src="<%=basePath %>static/assets/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="<%=basePath %>static/assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

        <script src="<%=basePath %>static/assets/plugins/moment/moment.js"></script>
        <script src="<%=basePath %>static/assets/plugins/apexcharts/apexcharts.min.js"></script>        
        <script src="<%=basePath %>static/assets/pages/jquery.dashboard.init.js"></script>
        <!-- App js -->
        <script src="<%=basePath %>static/assets/js/app.js"></script>  
  <script src="<%=basePath%>source/scripts/window.js"></script>
  <script src="<%=basePath%>source/js.js"></script>
  <script>
$().ready(function(){
	$(".uploadImg").click(function(){
		openWindow("<%=basePath%>upload.jsp");
	});
	$("#thumb").on("input",function(){
		$(".oldImg").attr("src","<%=basePath%>"+$("#thumb").val());
	});
});
</script>
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

































