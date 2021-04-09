<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String usertype = session.getAttribute("userType")+"";
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

                <h2>文章编辑</h2>

                

                <div class="block">
<form style="width:50%" method="POST" action="<%=basePath%>/news/news/update" enctype="multipart/form-data">
 
                    <table class="form">

                        <tbody><tr>

                            <td class="col1">

                                <label>

                                    文章标题</label>

                            </td>

                            <td class="col3">

                                <input name="title" required value="${model.title }" type="text" class="medium" id="grumble">
                                <input name="id" value="${model.id}" type="hidden"/>
                            </td>

                        </tr>
                        
                        
                       
                        
                        <tr>

                            <td class="col1">

                                <label>

                                    文章封面</label>

                            </td>

                            <td class="col2">
  <a target="_blank" href="<%=basePath %>${model.thumb }">
                            	<img style="width:150px;height:150px;" src="<%=basePath %>${model.thumb }"/>
                            </a>
                            <br/>
                               
                                <input name="thumb"  value="${model.thumb }" type="text" id="thumb">
                              <a href="javascript:;" class="uploadImg ">点击上传</a>
                            </td>

                        </tr>
                        
<tr>

                            <td>

                                <label>

                                  文章简介</label>

                            </td>

                            <td>
                            <textarea name="description" required style="width:550px;height:80px;">
                            ${model.description }
                            </textarea>

                            </td>

                        </tr>
                        
                        
                        <tr>

                            <td>

                                <label>

                                   文章正文内容</label>

                            </td>

                            <td>
                            <textarea name="contents" required style="width:550px;height:80px;">
                            ${model.contents }
                            </textarea>

                            </td>

                        </tr>
                        
                        
                        
                        
                        
                         
                        
                        <tr>
                        <td></td>
                        <td colspan="">
                        <button type="submit" class="btn btn-blue">提交数据</button>
                        </td>
                        </tr>
                      

                    </tbody></table>

                    </form>
                                    

                           

                            

                        </div>

                

            </div>

    
</body>
        <script src="<%=basePath %>static/assets/js/vendor.min.js"></script>

        <!-- optional plugins -->
        <script src="<%=basePath %>static/assets/libs/moment/moment.min.js"></script>
        <script src="<%=basePath %>static/assets/libs/apexcharts/apexcharts.min.js"></script>
        <script src="<%=basePath %>static/assets/libs/flatpickr/flatpickr.min.js"></script>

        <!-- page js -->
        <script src="<%=basePath %>static/assets/js/pages/dashboard.init.js"></script>

        <!-- App js -->
        <script src="<%=basePath %>static/assets/js/app.min.js"></script>
        <script src="<%=basePath %>static/js.js"></script>
<script src="<%=basePath %>static/window.js"></script>

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
  <script src="<%=basePath%>source/js2.js"></script>
  
<script src="<%=basePath %>static/kindeditor-4.1.10/kindeditor-min.js"></script>
				<script>
				
				KindEditor.ready(function (K) {
					editor = K.create('textarea[name="contents"]', {
						uploadJson: '<%=basePath %>static/admin/js/kindeditor-4.1.10/php/upload_json.php',
						fileManagerJson: '<%=basePath %>static/admin/js/kindeditor-4.1.10/php/file_manager_json.php',
						allowFileManager: true,
						items : ['source',
							'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
							'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
							'insertunorderedlist', '|', 'emoticons', 'image', 'link','fullscreen'],
						afterBlur: function () {
							this.sync();
						}
					});
				});
					


				</script> <!-- Vendor js -->
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

