<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="common/sessionCheck.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/fullcalendar.css" />
	<link rel="stylesheet" href="css/matrix-style.css" />
	<link rel="stylesheet" href="css/matrix-media.css" />
	<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/jquery.gritter.css" />
	
	<script src="js/jquery.min.js"></script> 
	<script src="js/jquery.ui.custom.js"></script> 
	<script src="js/bootstrap.min.js"></script> 
	<script src="js/cordova-1.5.0.js"></script>
	<script src="js/json2.js"></script>
	<script src="js/matrix.js"></script> 
	<script type="text/javascript">
	
		$(document).ready(function requestServlet(){
    		
			//����JQuery�ṩ��Ajax���� 
    		$.ajax({
    			type: "POST", 
   				url: "noticeServlet",
   				data: {type:"load"},
   				dataType: "json", 
   				error: function(){alert('����ϵͳ��Ϣʧ�ܣ�����ϵ����Ա��');},
   				success: function(result){
   				var resultType = Object.prototype.toString.call(result.notice_date);
   				if( resultType =="[object Array]"){
   						for(var i=0; i < result.notice_date.length; i++){
   							if((i+1)%2 == 0){
   								$("#notice").append('<div class="alert alert-info alert-block"> <a class="close" data-dismiss="alert" href="#">��</a> <h4 class="alert-heading">'+result.notice_name[i]+'</h4> <h5><span class="label label-success">'+result.notice_date[i]+'</span> '+result.notice_content[i]+'</h5></div>');
   							}else{
   								$("#notice").append('<div class="alert alert-error alert-block"><a class="close" data-dismiss="alert" href="#">��</a> <h4 class="alert-heading">'+result.notice_name[i]+'</h4> <h5><span class="label label-success">'+result.notice_date[i]+'</span> '+result.notice_content[i]+'</h5></div>');
   							}
   						};
					}else if(resultType =="[object String]"){
   						$("#notice").append('<div class="alert alert-info alert-block"> <a class="close" data-dismiss="alert" href="#">��</a> <h4 class="alert-heading">'+result.notice_name+'</h4> <h5><span class="label label-success">'+result.notice_date+'</span> '+result.notice_content+'</h5></div>');
					}
				}
   				});//�ص����� 
   			});
	</script>
	
  </head>
  <body>
  	<!--Base Model--> 
	<%@ include file="common/header.jsp" %>
	<%@ include file="common/navbar.jsp" %>
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>��ҳ</a>
  		<ul>
    		<li class="active"><a href="main.jsp"><i class="icon icon-home"></i> <span>��ҳ</span></a> </li>
			<li class="submenu"> <a href="#"><i class="icon icon-heart"></i> <span>��������</span> <span class="label label-important">2</span></a>
      			<ul>
        			<li><a href="editMessage.jsp">�޸�����</a></li>
        			<li><a href="editPassword.jsp">�޸�����</a></li>
      			</ul>
    		</li>
    		<li><a href="onlineOrder.jsp"><i class="icon icon-globe"></i> <span>���߶���</span></a></li>
			<li><a href="cart.jsp"><i class="icon icon-shopping-cart"></i> <span>���ﳵ</span><span class="label label-important">8</span></a></li>
			<li><a href="#"><i class="icon icon-book"></i> <span>�ҵĶ���</span></a></li>
			<li><a href="#"><i class="icon icon-truck"></i> <span>��ݲ�ѯ</span></a></li>
			<li><a href="#"><i class="icon icon-volume-up"></i> <span>ϵͳ����</span></a></li>
			<li><a href="#"><i class="icon icon-group"></i> <span>��������</span></a></li>
    		<li><a href="#"><i class="icon icon-envelope"></i> <span>��������</span></a></li>
  		</ul>
	</div>
	<!--Base Model End--> 

	<div id="content">
		<div id="content-header">
	  		<div id="breadcrumb"> <a href="main.jsp" title="������ҳ" class="tip-bottom"><i class="icon-home"></i>��ҳ</a></div>
  		</div>
	<!--Action boxes-->
  	<div class="container-fluid">
    	<div class="quick-actions_homepage">
      		<ul class="quick-actions">
        		<li class="bg_lb"> <a href="onlineOrder.jsp"> <i class="icon-globe"></i> ���߶��� </a> </li>
        		<li class="bg_ly"> <a href="cart.jsp"> <i class="icon-shopping-cart"></i><span class="label label-success">8</span> ���ﳵ </a></li>
        		<li class="bg_lo"> <a href="#"> <i class="icon-book"></i><span class="label label-success">8</span> �ҵĶ���</a> </li>
				<li class="bg_lg"> <a href="editMessage.jsp"> <i class="icon-cog"></i> �޸�����</a> </li>
	    		<li class="bg_lr"> <a href="editPassword.jsp"> <i class="icon-lock"></i> �޸�����</a> </li>
				<li class="bg_ls span2"> <a href="#"> <i class="icon-truck"></i> ��ݲ�ѯ </a> </li>
      		</ul>
    	</div>
     </div>
	<!--End-Action boxes-->    

    <hr/>
    <div id="notice" class="widget-content">
	</div>
	
</div>

<%@ include file="common/foot.jsp" %>

</body>
</html>
