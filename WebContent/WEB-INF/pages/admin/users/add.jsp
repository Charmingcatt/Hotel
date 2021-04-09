<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<body data-type="index">


    





       
          
            <div class="row" style="padding-left:30px;padding-right:30px;">
              
<div style="width:100%;" class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-plus"></span> 用户创建
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


                        <div class="col-md-6 ">
                            <form class="am-form" action="<%=basePath %>users/users/save" method="POST">
                            
                           
                                
                                 
                                
                                <div style="clear:both"></div>
                            
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">账号</label>
                                    <div class="">
                                        <input type="text" name="username" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                   <div style="clear:both">
                                 <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">密码</label>
                                    <div class="">
                                        <input type="password" name="password" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">确认密码</label>
                                    <div class="">
                                        <input type="password" name="password2" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>  </div>
                                
                                    <div style="clear:both"></div>
                                
                                
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">头像</label>
                                    <div class="">
                                        <input readonly type="text"   required   id="thumb" value="" name="thumb" >
																<a href="javascript:;" class="uploadImg">点击上传</a>
                                        <small></small>
                                    </div>
                                </div>
                                    <div style="clear:both">
                                <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">姓名</label>
                                    <div class="">
                                        <input type="text" name="realname" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                
                                
                             
                                    <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">年龄</label>
                                    <div class="">
                                        <input type="number" name="age" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                
                                <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">性别</label>
                                    <div class="">
                                       <select name="sex">
                           	<option <c:if test="${user.sex==1 }">selected</c:if> value="1"> 男</option>
                           	<option <c:if test="${user.sex==2 }">selected</c:if> value="2"> 女</option>
                           </select>
                                        <small></small>
                                    </div>
                                </div>
                                </div>
    <div style="clear:both"></div>
   <div style="clear:both">
 <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">身份证</label>
                                    <div class="">
                                        <input type="text" name="ecard" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">联系地址</label>
                                    <div class="">
                                        <input type="text" name="address" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                  </div>
                                
                                  <div style="clear:both">
                                    <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">邮箱</label>
                                    <div class="">
                                        <input type="text" name="email" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                    <div style="clear:both"></div>
                                
                                   <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">qq</label>
                                    <div class="">
                                        <input type="text" name="qq" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group" style="display:inline-block;">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">电话</label>
                                    <div class="">
                                        <input type="text" name="tel" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                </div>
                                
                                 <div class="am-form-group">
                                    <label for="user-name"  class="am-u-sm-2 am-form-label">类型</label>
                                    <div class="am-u-sm-6">
                                         <select name="type" style="height:40px;" class="form-control">
        	 <option value="1">普通用户</option>
        	 <option value="2">会员</option>
        	<option value="3">管理员</option>
        </select>
                                        <small></small>
                                    </div> <div class="am-u-sm-3"></div>
                                </div>
                               
   <div style="clear:both"></div> <br><br>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="submit" class="am-btn am-btn-primary">保存数据</button>
                                    </div>
                                </div>
                            </form>
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

