<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="en">还
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

<body data-type="index">


    





       
          
            <div class="row" style="padding-left:30px;padding-right:30px;">
              
<div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-list"></span> 用户数据
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                              
                                </div>
                        </div>
                    </div>


                </div>
                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form">


                        <div class="am-u-sm-12 am-u-md-12">
                            
                            <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                       <tr>
    <th>账号</th>
    <th>电话</th>
    <th>邮箱</th>
    <th>qq</th>
    <th>联系地址</th>
    <th style="text-align:left;padding-left:10px;">用户类型</th>
   
    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    
   
    <c:forEach items="${requestScope.list }" var="u">
    
      <tr>
      <td>
      ${u.username }
      </td>
       
      <td>
      ${u.tel }
      </td>
      <td>
      ${u.email }
      </td>
      <td>
      ${u.qq }
      </td>
      <td>
      ${u.address }
      </td>
       <td style="text-align:left;padding-left:10px;">
    
      <c:if test="${u.type==1}">
      <span class="badge badge-danger">
    用户    
    </span>
    <c:if test="${u.grade==2}">
    	<span class="badge badge-warning">未通过会员申请</span>
    </c:if>
     <c:if test="${u.grade==0}">
     	<a href="<%=basePath%>users/pass?grade=1&id=${u.id}">通过会员申请</a>
     	<a href="<%=basePath%>users/pass?grade=2&id=${u.id}">不通过</a>
     </c:if>
      </c:if>
       <c:if test="${u.type==2}">
      <span class="badge badge-primary">
  会员
    </span>
      </c:if>
    
      <c:if test="${u.type==3}">
      <span class="badge badge-success">
     管理员
     </span>
      </c:if>
       
      </td>
       
      <td>
      <a href="<%=basePath%>users/profile?id=${u.id}">
     	资料
     </a>	
     |
     <a href="<%=basePath%>users/password?id=${u.id}">
     	[密码重置]     	
     </a>     
     |
     <a href="<%=basePath%>users/users/delete?id=${u.id}&ret=list">
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

            </div>
    </div>    </div>
    

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

