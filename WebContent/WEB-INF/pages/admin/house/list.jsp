<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

	

   <body class="container_12">
   <div class="box round first" style="margin:15px;">

                <h2>数据列表</h2>

                

                <div class="block">

            
<div>
<a class="btn btn-primary" href="<%=basePath%>admin/house/add.do">新增客房</a>	
</div>
                           

                             <table id="example" class="data display datatable">
                    <thead>
                    <tr>
                      <th>客房名称</th>
                        <th>发布人</th>
                        <th>大小</th>
                        <th>位置</th> <th>价格</th>
                      <th>会员价</th>
                        <th>客房类型</th>
                        <th>状态</th>              
                        <th style="width: 150px;">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                   <c:forEach items="${list}" var="item">

                            <tr class="even gradeA">
                                <td>
                                   
                                    ${item.rooname}</td>  <td>${item.username}</td>
                                <td>${item.size}</td>
                                 <td>${item.address}</td>
                                   <td>${item.price}</td>
                   <td>${item.price2}</td>
                                <td>${item.cate}</td>
                               <td>
                                <c:if test="${item.state==1 }">闲置</c:if>
                                <c:if test="${item.state==2 }">使用中</c:if>
                                </td>
                                <td>
                                
                                 
                                
                                
                                    <a href="<%=basePath%>house/house/edit.do?id=${item.id}">
                                    <i class="icon-pencil"></i>
                                    编辑
                                    </a>
                                   
                                    
                                    
                                    <a class="deletemodal" href="<%=basePath%>house/house/delete.do?ret=list&id=${item.id}"><i class="icon-remove"></i>
                                    移除
                                    </a>
                                </td>
                            </tr>

                       </c:forEach>

                    </tbody>
                </table>

                            

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

