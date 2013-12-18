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
  </head>
  <body>
  	<!--Base Model--> 
	<%@ include file="common/header.jsp" %>
	<%@ include file="common/navbar.jsp" %>
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>��ҳ</a>
  		<ul>
    		<li><a href="main.jsp"><i class="icon icon-home"></i> <span>��ҳ</span></a> </li>
			<li class="submenu active"> <a href="#"><i class="icon icon-heart"></i> <span>��������</span> <span class="label label-important">2</span></a>
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
	  		<div id="breadcrumb"> <a href="main.jsp" title="������ҳ" class="tip-bottom"><i class="icon-home"></i>��ҳ</a> <a href="editPassword.jsp" class="current">�޸�����</a> </div>
    		<h1>�޸�����</h1>
  		</div>
  		
	<!--Action boxes-->
  	<div class="container-fluid">
  	  <hr>
  	<div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>�޸�����</h5>
        </div>
        <div class="widget-content nopadding">
          <form  class="form-horizontal">
            <div class="control-group">
              <label class="control-label">ԭʼ���� :</label>
              <div class="controls">
                <input id="password" type="password" class="span11" placeholder="ԭʼ����" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">������ :</label>
              <div class="controls">
                <input id="newpassword" type="password" class="span11" placeholder="������" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">������ȷ��:</label>
              <div class="controls">
                <input id="newpassword1" type="password"  class="span11" placeholder="������ȷ��"  />
              </div>
            </div>
            <div class="form-actions">
              <button type="button" onclick="passwordUpdate()" class="btn btn-success">ȷ���޸�</button>
            </div>
          </form>
        </div>
      </div>  
     </div>
	</div>
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

	<script src="js/jquery.min.js"></script> 
	<script src="js/jquery.ui.custom.js"></script> 
	<script src="js/bootstrap.min.js"></script> 
	<script src="js/jquery.uniform.js"></script> 
	<script src="js/matrix.js"></script> 
	<script src="js/cordova-1.5.0.js"></script>
	<script src="js/json2.js"></script>
	<script type="text/javascript">
	function passwordUpdate(){
		var password = $("#password").attr("value");
		var newpassword = $("#newpassword").attr("value");
   		var newpassword1 = $("#newpassword1").attr("value");
   		
			if(password == ""){
				$("#msg").html("ԭʼ���벻��Ϊ�գ�");
				$("#updateModal").modal();
				return false;
			}
			if(newpassword == ""){
				$("#msg").html("�����벻��Ϊ��!");
				$("#updateModal").modal();
				return false;
			} 
			if(newpassword1 == ""){
				$("#msg").html("������ȷ�ϲ���Ϊ��!");
				$("#updateModal").modal();
				return false;
			}
			if(newpassword != newpassword1){
				$("#msg").html("��������������ȷ�ϲ�һ�£�");
				$("#updateModal").modal();
				return false;
			}
			
			$.ajax({
     			type: "POST",
      			url: "userServlet",
      			data: {type:"passwordupdate",  password:password, newpassword:newpassword},
      			error: function(){alert('����ϵͳ��Ϣʧ�ܣ�����ϵ����Ա��');},
      			success: function(result){
      				if( result == "Erro"){
      					location.href = "index.jsp";
						return false;
      				}else if(result == "passwordErro"){
      					$("#msg").html("ԭʼ�������");
						$("#updateModal").modal();
						return false;
      				}else if(result == "updateFail"){
      					$("#msg").html("�������ʧ�ܣ���������һ�£�");
						$("#updateModal").modal();
						return false;
      				}else if(result == "updateSuccess"){
      					$("#msg").html("������³ɹ���");
						$("#updateModal").modal();
						return false;
      				}      				      				
        		}
  			});
		};
	
</script>

</body>
</html>
