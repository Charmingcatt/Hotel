<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = (String) request.getSession().getAttribute("username");

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

<div class="article toolbar">
	<div class="title ue-clear">
    	<h2>数据列表</h2>
       
    </div>
    <div class="content">
    	
    	
    	
    	<div class="table-operate ue-clear">
	<a href="<%=basePath %>groups/groups/add" class="add">添加</a>
  
</div>

<div class="table-box">
	<table>
    	<thead>
    <tr>
    <th>编号</th>    
    <th>轮播名称</th>    
    <th>URL</th>
    <th>创建时间</th>
    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    
   
    <c:forEach items="${requestScope.list }" var="u">
      <tr>
      <td>
      ${u.id }
      </td>
      <td>
      ${u.title }
      </td>
     
      <td>
      ${u.url }
      </td>
      <td>
      ${u.created }
      </td>
      
       
       
      <td>
      <a href="<%=basePath%>ads/ads/edit?id=${u.id}">
     	更新
     </a>	
     
     <a href="<%=basePath%>ads/ads/delete?id=${u.id}">
     	[删除]     	
     </a>
      </td>
      </tr>
   </c:forEach>
    
    
    
    </tbody>
    </table>
</div>
    	
</div>

</div>
	

</body>

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

