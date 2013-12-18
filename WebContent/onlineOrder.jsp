<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="common/sessionCheck.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/uniform.css" />
	<link rel="stylesheet" href="css/select2.css" />
	<link rel="stylesheet" href="css/matrix-style.css" />
	<link rel="stylesheet" href="css/matrix-media.css" />
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script> 
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.uniform.js"></script> 
	<script src="js/select2.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script> 
	<script src="js/matrix.js"></script> 
	<script src="js/matrix.tables.js"></script>

	<script src="js/cordova-1.5.0.js"></script>
	<script src="js/json2.js"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function requestServlet(){
			//����JQuery�ṩ��Ajax���� 
    		$.ajax({
    			type:"POST", 
   				url:"phoneServlet",
   				data:{type:"load"},
   				dataType: "json",//�˴�Ҫ���ó�jason 
   				error: function(){alert('�������۵�������ͨ��΢�Ÿ����Ƿ���Ϣ��');},
   				success: function(result){
   					for(var i=0; i < result.brand.length; i++){
   						$("#mainContent").append('<div class="row-fluid"><div class="span12"><div class="widget-box"><div class="widget-title"> <span class="icon"><i class="icon-th"></i></span><h5>'+result.brand[i]+'</h5><span class="label label-info">'+result.brand[i]+'</span></div><div class="widget-content nopadding"><table class="table table-bordered data-table"><thead><tr><th width="8%">Ʒ��</th><th width="15%">��Ʒ����</th><th width="10%">��Ʒ��ɫ</th><th width="10%">��Ʒ�۸�</th><th>��Ʒ����</th><th width="10%">����</th></tr></thead><tbody id="'+result.brand[i]+'"></tbody></table></div></div></div></div>');
   						var eValue=eval('result.' + result.brand[i]);
   						for(var j=0; j < eValue.length; j=j+5){ 
   							$("#"+result.brand[i]+"").append('<tr><td class="taskStatus">'+result.brand[i]+'</td><td>'+eValue[j+1]+'</td><td class="taskStatus">'+eValue[j+2]+'</td><td class="taskStatus">'+eValue[j+3]+'</td><td class="taskStatus">'+eValue[j+4]+'</td><td class="taskOptions"><button id= '+eValue[j]+' class="btn btn-primary btn-mini">���빺�ﳵ</button></td></tr>');
   							}
   						}
					}
   				});//�ص����� 
   				
		$(".btn").live("click",function(){
    		var buttonid = $(this).attr("id");
			
    		$.ajax({
    			type:"POST", 
   				url:"cartServlet",
   				data:{type:"insert",p_id:buttonid},
   				dataType: "text",
   				error: function(){alert('����ʧ�ܣ���ͨ���绰��ϵ���ǡ�');},
   				success: function(result){
   					if(result == "insertSuccess"){
   						$("#msg").html("��ӳɹ���");
						$("#updateModal").modal();
   					}else if(result == "insertFail"){
   						$("#msg").html("���ʧ�ܣ�");
						$("#updateModal").modal();
   					}else if(result == "insertHave"){
   						$("#msg").html("�Ѿ����ڹ��ﳵ���ˣ�");
						$("#updateModal").modal();
   					}
				}
   			});//�ص�����			
		});
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
    		<li><a href="main.jsp"><i class="icon icon-home"></i> <span>��ҳ</span></a> </li>
			<li class="submenu"> <a href="#"><i class="icon icon-heart"></i> <span>��������</span> <span class="label label-important">2</span></a>
      			<ul>
        			<li><a href="editMessage.jsp">�޸�����</a></li>
        			<li><a href="editPassword.jsp">�޸�����</a></li>
      			</ul>
    		</li>
    		<li class="active"><a href="onlineOrder.jsp"><i class="icon icon-globe"></i> <span>���߶���</span></a></li>
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
	  		<div id="breadcrumb"> <a href="main.jsp" title="������ҳ" class="tip-bottom"><i class="icon-home"></i>��ҳ</a> <a href="onlineOrder.jsp" class="current">���߶���</a> </div>
    		<h1>���߶���</h1>
  		</div>
  		
  		
	<!--Action boxes-->
  	<div id="mainContent" class="container-fluid">
  	<hr>
	
  </div>
</div>

        <div id="updateModal" class="modal hide">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">��</button>
                <h3>ϵͳ��Ϣ</h3>
             </div>
             <div class="modal-body">
             <div class="alert alert-error alert-block">
              	<h4 id="msg" class="alert-heading"></h4>
              </div>
             </div>
        </div>

<%@ include file="common/foot.jsp" %>

</body>
</html>
