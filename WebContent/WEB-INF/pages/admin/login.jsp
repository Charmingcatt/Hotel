<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Object result= request.getParameter("result");
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>格林酒店管理系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        

        <!-- App favicon -->
        <link rel="shortcut icon" href="<%=basePath %>static/assets/images/favicon.ico">

        <!-- App css -->
        <link href="<%=basePath %>static/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath %>static/assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath %>static/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath %>static/assets/css/style.css" rel="stylesheet" type="text/css" />

    </head>

    <body class="account-body">

        <!-- Log In page -->
        <div class="row vh-100">
            <div class="col-lg-3  pr-0">
                <div class="card mb-0 shadow-none">
                    <div class="card-body">
                        
                        <div class="px-3">
                            <div class="media">
                                <a href="index.html" 
                                class="logo logo-admin"><img src="<%=basePath %>static/assets/images/logo-sm.png" height="55" alt="logo" class="my-3"></a>
                                <div class="media-body ml-3 align-self-center">                                                                                                                       
                                    <h4 class="mt-0 mb-1">用户登录</h4>
                                    <p class="text-muted mb-0">Sign in to continue to bxd.</p>
                                </div>
                            </div>                            
                            
                            <form class="form-horizontal my-4" action="<%=basePath %>manage/dologin" method="POST">
    
                                <div class="form-group">
                                    <label for="username">账号</label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"><i class="mdi mdi-account-outline font-16"></i></span>
                                        </div>
                                        <input type="text" class="form-control" id="username" placeholder="输入账号" name="username" required>
                                    </div>                                    
                                </div>
    
                                <div class="form-group">
                                    <label for="userpassword">密码</label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon2"><i class="mdi mdi-key font-16"></i></span>
                                        </div>
                                        <input type="password" class="form-control" id="userpassword" placeholder="输入密码" name="password" required>
                                    </div>                                
                                </div>
    
                                <div class="form-group row mt-4">
                                    <div class="col-sm-6">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" checked class="custom-control-input" id="customControlInline">
                                            <label class="custom-control-label" for="customControlInline">记住我</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 text-right">
                                                                            
                                    </div>
                                </div>
    
                                <div class="form-group mb-0 row">
                                    <div class="col-12 mt-2">
                                        <button class="btn btn-primary btn-block waves-effect waves-light" type="submit">登录 <i class="fas fa-sign-in-alt ml-1"></i></button>
                                    </div>
                                </div>                            
                            </form>
                        </div>
                        
                        <div class="m-3 text-center bg-light p-3 text-primary">
                            <h5 class="">还不是会员 ? </h5>
                            <p class="font-13">马上 <span>加入</span> 博辛顿</p>
                            <a href="<%=basePath %>manage/reg" class="btn btn-primary btn-round waves-effect waves-light">免费注册</a>                
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="col-lg-9 p-0 d-flex justify-content-center">
                <div class="accountbg d-flex align-items-center"> 
                    <div class="account-title text-white text-center">
                        <img src="<%=basePath %>static/assets/images/logo-sm.png" alt="" class="thumb-sm">
                        <h4 class="mt-3">博辛顿酒店欢迎您</h4>
                        <div class="border w-25 mx-auto border-primary"></div>
                        <h1 class="">Enjoy your Journey</h1>
                        <p class="font-14 mt-3">
                        <a href="<%=basePath %>" class="text-primary">
                        点击</a>查看更多超值套房
                         </p>
                       
                    </div>
                </div>
            </div>
        </div>
        <!-- End Log In page -->


        <!-- jQuery  -->
        <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
        <script src="<%=basePath %>static/assets/js/bootstrap.bundle.min.js"></script>
        <script src="<%=basePath %>static/assets/js/metisMenu.min.js"></script>
        <script src="<%=basePath %>static/assets/js/waves.min.js"></script>
        <script src="<%=basePath %>static/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App js -->
        <script src="<%=basePath %>static/assets/js/app.js"></script>
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