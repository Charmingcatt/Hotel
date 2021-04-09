<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>

 
              <div class="col-lg-12" style="padding-top:15px;">
                <!-- big box -->
                <div class="big-box">
                  <div class="col-lg-6">
                    
                    <form method="POST"  action="<%=basePath%>users/users/update">
                    <div class="card">
                      <div class="card-head">
                        <div class="left">资料更新</div>
                        <div class="right">
                          <i class="zmdi zmdi-chevron-down"></i>
                          <i class="zmdi zmdi-refresh-sync"></i>
                          <i class="zmdi zmdi-close-circle-o"></i>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="form">
                          <p>用户名</p>                          
                          <input name="username" class="form-control" readonly value="${user.username }" type="text" placeholder="" >
        <input name="id" type="hidden" value="${user.id }">
                        </div>
                        
                             <div class="form">
                          <p style="">头像                      
                           <c:if test="${!empty user.thumb}">
                           <a href="<%=basePath %>${user.thumb}" target="_blank">
		查看
		</a>
		<br>
</c:if>
		<br>
		<input type="hidden"   id="thumb" value="${user.thumb}" name="thumb" >
		<a href="javascript:;" style="width:400px;display:block;" class="uploadImg ">点击上传</a></p>    
                        </div>
                        
                        
                        <div>
                           <div class="form" style="display:inline-block">
                          <p>姓名</p>                          
                           <input name="realname" class="form-control" type="text" value="${user.realname }">
                        </div>
                        
                         
                        
                         <div class="form" style="display:inline-block">
                          <p>年龄</p>                          
                           <input name="age" required class="form-control" type="text" value="${user.age }">
                        </div>
                         <div class="form" style="display:inline-block">
                          <p>性别</p>                          
                           
                           <select name="sex">
                           	<option <c:if test="${user.sex==1 }">selected</c:if> value="1"> 男</option>
                           	<option <c:if test="${user.sex==2 }">selected</c:if> value="2"> 女</option>
                           </select>
                        </div>
                        
                        </div>
                         <div class="form">
                          <p>身份证</p>                          
                           <input name="ecard" class="form-control" type="text" value="${user.ecard }">
                        </div>
                         <div class="form">
                          <p>地址</p>                          
                           <input name="address" class="form-control" type="text" value="${user.address }">
                        </div>
                        
                        
                        <div class="form">
                          <p>邮箱</p>                          
                            <input name="email" class="form-control" type="text" value="${user.email }">
                        </div>
                        
                        <div class="form">
                          <p>QQ</p>                          
                            	<input name="qq" class="form-control" type="text" value="${user.qq }">
                        </div>
                        
                        <div class="form">
                          <p>电话</p>                          
                          <input name="tel" class="form-control" type="text" value="${user.tel }">
                        </div>
                        
                        
                           <div class="form">
                          <p></p>                          
                          <button class="am-btn am-btn-primary" type="submit">提交</button>
                        </div>
                        <div class="form">
                        <h1 style="height:50px;"></h1>
                        </div>
                      </div>
                    </div>
                    
                    </form>
                    
                    
                  </div>
                    
                </div>
              </div>
            </div>
        
  <!-- end Layout -->

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

