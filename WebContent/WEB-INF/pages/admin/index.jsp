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

    <body>

        <!-- Top Bar Start -->
        <div class="topbar">
             <!-- Navbar -->
             <nav class="navbar-custom">

                <!-- LOGO -->
                <div class="topbar-left">
                    <a href="<%=basePath %>manage/index" class="logo">
                        <span>
                            <img src="<%=basePath %>static/assets/images/logo-sm.png" alt="logo-small" class="logo-sm">
                        </span>
                        <span>
                            <img src="<%=basePath %>static/assets/images/logo.png" alt="logo-large" class="logo-lg">
                        </span>
                    </a>
                </div>
    
                <ul class="list-unstyled topbar-nav float-right mb-0">

                    <li class="dropdown">
                        <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" 
                        href="<%=basePath %>" >
                            <i class="mdi mdi-home-outline nav-icon"></i>                            
                        </a>
                        
                    </li>

                    <li class="dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                            aria-haspopup="false" aria-expanded="false">
                            <img src="<%=basePath %>${thumb}" alt="profile-user" class="rounded-circle" /> 
                            <span class="ml-1 nav-user-name hidden-sm"> 
                            <i class="mdi mdi-chevron-down"></i> </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                        	<c:if test="${usertype!=3 }">
                        	<a class="dropdown-item" target="mainframe" href="<%=basePath%>users/charge"><i class="dripicons-user text-muted mr-2"></i> 我的钱包</a>	
                        	</c:if>
                            <a class="dropdown-item" target="mainframe" href="<%=basePath%>users/profile"><i class="dripicons-user text-muted mr-2"></i> 资料更新</a>                            
                            <a class="dropdown-item" target="mainframe" href="<%=basePath%>users/password"><i class="dripicons-gear text-muted mr-2"></i> 密码设置</a>                            
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="<%=basePath%>manage/quit?retUrl=index.html"><i class="dripicons-exit text-muted mr-2"></i> 注销登录</a>
                        </div>
                    </li>
                </ul>
    
                <ul class="list-unstyled topbar-nav mb-0">
                        
                    <li>
                        <button class="button-menu-mobile nav-link waves-effect waves-light">
                            <i class="mdi mdi-menu nav-icon"></i>
                        </button>
                    </li>

                  
                    
                </ul>

            </nav>
            <!-- end navbar-->
        </div>
        <!-- Top Bar End -->
        <div class="page-wrapper-img">
            <div class="page-wrapper-img-inner">
                <div class="sidebar-user media">                    
                    <img src="<%=basePath %>${thumb}" alt="user" class="rounded-circle img-thumbnail mb-1">
                    <span class="online-icon"><i class="mdi mdi-record text-success"></i></span>
                    <div class="media-body">
                        <h5 class="text-light">欢迎您，${username }！ </h5>
                        <ul class="list-unstyled list-inline mb-0 mt-2">
                            <li class="list-inline-item">
                                <a target="mainframe" href="<%=basePath%>users/profile" class=""><i class="mdi mdi-account text-light"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a target="mainframe" href="<%=basePath%>users/password" class=""><i class="mdi mdi-settings text-light"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="<%=basePath%>manage/quit?retUrl=index.html" class=""><i class="mdi mdi-power text-danger"></i></a>
                            </li>
                        </ul>
                    </div>                    
                </div>
                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <div class="float-right align-item-center mt-2">
                            <c:if test="${usertype==1 and user.grade==null}">
                            <a class="btn btn-danger" href="<%=basePath%>users/sq">我要申请会员</a>
                            </c:if>
                             <c:if test="${usertype==1 and user.grade==0}">
                            <a class="btn btn-danger" href="javascript:;">申请会员审核中</a>
                            </c:if>
                            <c:if test="${usertype!=3 }">
                            
                                <button onclick="$('#iframe').attr('src','<%=basePath%>users/charge')" class="btn btn-info px-4 align-self-center report-btn">我的钱包</button>
                                </c:if>
                            </div>
                            <h4 class="page-title mb-2"><i class="mdi mdi-monitor mr-2"></i>
                            
                            <c:if test="${usertype eq 1}">
                            <span class="badge badge-danger">普通用户
                            </span>
                            
                            
                            
                            </c:if>
                            
                        <c:if test="${usertype eq 2}"><span class="badge badge-warning">会员</c:if>
                        <c:if test="${usertype eq 3}"><span class="badge badge-primary">管理员</c:if>
                        </span>
                            </h4>  
                            <div class="">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>                                    
                                    <li class="breadcrumb-item active">welcome</li>
                                </ol>
                            </div>                                      
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->
            </div>
        </div>
        
        <div class="page-wrapper">
            <div class="page-wrapper-inner">

                <!-- Left Sidenav -->
                <div class="left-sidenav">
                    
                    <ul class="metismenu left-sidenav-menu" id="side-nav">

                        <li class="menu-title">Main</li>

<c:if test="${usertype!=3}">
  <li>
                            <a target="mainframe" href="<%=basePath %>apply/apply/list1"><i class="mdi mdi-format-list-bulleted-type"></i><span>订单管理</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>                          
                        </li>
                            <li>
                            <a target="mainframe" href="<%=basePath %>apply/report"><i class="mdi mdi-poll"></i><span>数据统计</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                           
                        </li>
</c:if>

<c:if test="${usertype eq 3 }">
                       
                        <li>
                            <a href="javascript: void(0);"><i class="mdi mdi-apps">
                            </i><span>用户管理</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                            <ul class="nav-second-level" aria-expanded="false">
                                <li><a target="mainframe" href="<%=basePath %>users/users/list"><span>用户管理</span></a></li>
                                <li><a target="mainframe" href="<%=basePath %>users/users/add"><span>创建用户</span></a></li> 
                            </ul>
                        </li>
                        
                          <li>
                            <a href="javascript: void(0);"><i class="mdi mdi-buffer"></i><span>客房管理</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                            <ul class="nav-second-level" aria-expanded="false">
                                <li><a target="mainframe" href="<%=basePath %>house/house/list">房间管理</a></li>
                                <li><a target="mainframe" href="<%=basePath %>house/house/add">发布房间</a></li>
                            </ul>
                        </li>

                        <li>
                            <a href="javascript: void(0);"><i class="mdi mdi-file"></i><span>栏目管理</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                            <ul class="nav-second-level" aria-expanded="false">
                                <li><a target="mainframe" href="<%=basePath %>cates/cates/list">栏目管理</a></li>
                                <li><a target="mainframe" href="<%=basePath %>cates/cates/add">创建栏目</a></li>
                            </ul>
                        </li>

                      

                        <li>
                            <a href="javascript: void(0);">
                            <i class="mdi mdi-cards-playing-outline"></i><span>内容管理</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                            <ul class="nav-second-level" aria-expanded="false">                                
                                <li><a target="mainframe" href="<%=basePath %>news/news/list">内容管理</a></li>                                
                                <li><a target="mainframe" href="<%=basePath %>news/news/add">在线发布</a></li>
                            </ul>
                        </li>
                        
                      

                        <li>
                            <a href="javascript: void(0);"><i class="mdi mdi-clipboard-outline"></i><span>轮播图管理</span></a>
                            <ul class="nav-second-level" aria-expanded="false">
                                <li><a target="mainframe" href="<%=basePath %>ads/ads/list">轮播图管理</a></li>
                                <li><a target="mainframe" href="<%=basePath %>ads/ads/add">上传轮播图</a></li>
                            </ul>
                        </li>
                        <li>
                            <a target="mainframe" href="<%=basePath %>apply/apply/list">
                            <i class="mdi mdi-format-list-bulleted-type"></i><span>订单管理</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>                          
                        </li>
                        <li>
                            <a target="mainframe" href="<%=basePath %>apply/report"><i class="mdi mdi-poll"></i><span>数据统计</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                           
                        </li>

</c:if>

                        
                    </ul>
                </div>
                <!-- end left-sidenav-->

                <!-- Page Content-->
                <div class="page-content">
                    <div class="container-fluid"> 
                        <div class="row">
                          <iframe name="mainframe" src="<%=basePath %>apply/report" id="iframe" style="min-height:1200px;overflow:hidden;" width="100%" height="100%" frameborder="0"></iframe>
                        </div><!--end row-->
                    </div><!-- container -->

                 
                </div>
                <!-- end page content -->
            </div>
        </div>
        <!-- end page-wrapper -->

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
