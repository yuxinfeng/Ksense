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
	<script src="js/jquery.uniform.js"></script> 
	<script src="js/matrix.js"></script> 
	<script src="js/cordova-1.5.0.js"></script>
	<script src="js/json2.js"></script>
  	<script type="text/javascript">
	
		$(document).ready(function requestServlet(){
			//����JQuery�ṩ��Ajax���� 
    		$.ajax({
    			type: "POST", 
   				url: "userServlet",
   				data: {type:"load"},
   				dataType: "json", 
   				error: function(){alert('����ϵͳ��Ϣʧ�ܣ�����ϵ����Ա��');},
   				success: function(result){
   						$("#username").val(result.username);
   						$("#name").val(result.name);
   						$("#qq").val(result.qq);
   						$("#email").val(result.email);
   						$("#contact").val(result.contact);
   						$("#remark").val(result.remark);
   						$("#bank").val(result.bank);
   						$("#bank_no").val(result.bank_no);
   						$("#tran_type").val(result.tran_type);
   						$("#tran_contact").val(result.tran_contact);
   						$("#tran_phone").val(result.tran_phone);
   						$("#address").val(result.address);
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

	<div id="content" >
		<div id="content-header">
	  		<div id="breadcrumb"> <a href="main.jsp" title="������ҳ" class="tip-bottom"><i class="icon-home"></i>��ҳ</a> <a href="editMessage.jsp" class="current">�޸�����</a> </div>
    		<h1>�޸�����</h1>
  		</div>
  		
	<!--Action boxes-->
	<div class="container-fluid">
  	<hr>
	  <div class="row-fluid">
    	<div class="span6">
	      <div class="widget-box">
        	<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          		<h5>��������</h5>
        	</div>
        	<div class="widget-content nopadding">
          		<form id="base_form" class="form-horizontal">
            	<div class="control-group">
              		<label class="control-label">�û���</label>
              		<div class="controls">
                		<input id="username" type="text" disabled="" class="span11" placeholder="�û���(�ֻ���)" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">�̼�����</label>
              		<div class="controls">
                		<input id="name" type="text" class="span11" placeholder="�̼�����" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">QQ</label>
              		<div class="controls">
                		<input id="qq" type="text" class="span11" placeholder="QQ" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">����</label>
              		<div class="controls">
                		<input id="email" type="text" class="span11" placeholder="����" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">��ϵ��</label>
              		<div class="controls">
                		<input id="contact" type="text" class="span11" placeholder="��ϵ��" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">��ע:</label>
              		<div class="controls">
                		<textarea id="remark" class="span11" ></textarea>
              		</div>
            	</div>
            	<div class="form-actions">
            	</div>
          		</form>
        	</div>
      	</div>
     </div>
     
     <div class="span6">
	      <div class="widget-box">
        	<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          		<h5>������Ϣ</h5>
        	</div>
		<div class="widget-content nopadding">
          <form id="tran_form" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">������</label>
              <div class="controls">
                <input id="bank" type="text" class="span11" placeholder="������" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">���п���</label>
              <div class="controls">
                <input id="bank_no" type="text" class="span11" placeholder="���п���" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">�������</label>
              <div class="controls">
                <select id="tran_type">
                  <option>˳��</option>
                  <option>��ͨ</option>
                  <option>��ͨ</option>
                  <option>Բͨ</option>
                  <option>EMS</option>
                  <option>����</option>
                </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">�ջ���</label>
              <div class="controls">
                <input id="tran_contact" type="text" class="span11" placeholder="�ջ���" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">��ϵ�绰</label>
              <div class="controls">
                <input id="tran_phone" type="text" class="span11" placeholder="��ϵ�绰" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">�ջ���ַ</label>
              <div class="controls">
                <textarea id="address" class="span11" ></textarea>
              </div>
            </div>
            <div class="form-actions">
              <button id="base_button" type="button" onclick="baseUpdate()" class="btn btn-success">ȷ���޸�</button>
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

<script type="text/javascript">
	function baseUpdate(){
		
		var username = $("#username").attr("value");
		var name = $("#name").attr("value");
   		var qq = $("#qq").attr("value");
   		var email = $("#email").attr("value");
   		var contact = $("#contact").attr("value");
   		var remark = $("#remark").attr("value");
   		var bank = $("#bank").attr("value");
   		var bank_no = $("#bank_no").attr("value");
   		var tran_type = $("#tran_type  option:selected").text();
   		var tran_contact = $("#tran_contact").attr("value");
   		var tran_phone = $("#tran_phone").attr("value");
   		var address = $("#address").attr("value");
   		
			if(name == ""){
				$("#msg").html("�̻����Ʋ���Ϊ�գ�");
				$("#updateModal").modal();
				return false;
			}
			if(qq == ""){
				$("#msg").html("QQ���벻��Ϊ��!");
				$("#updateModal").modal();
				return false;
			} 
			if(email == ""){
				$("#msg").html("���䲻��Ϊ��!");
				$("#updateModal").modal();
				return false;
			}
			if(contact == ""){
				$("#msg").html("��ϵ�˲���Ϊ��!");
				$("#updateModal").modal();
				return false;
			}
			if(bank == ""){
				$("#msg").html("���в���Ϊ��!");
				$("#updateModal").modal();
				return false;
			}
			if(bank_no == ""){
				$("#msg").html("���п��Ų���Ϊ��!");
				$("#updateModal").modal();
				return false;
			}	
			if(tran_type == ""){
				$("#msg").html("��ݲ���Ϊ��!");
				$("#updateModal").modal();
				return false;
			}	
			if(tran_contact == ""){
				$("#msg").html("�ջ���ϵ�˲���Ϊ��!");
				$("#updateModal").modal();
				return false;
			}	
			if(tran_phone == ""){
				$("#msg").html("�ջ���ϵ���벻��Ϊ��!");
				$("#updateModal").modal();
				return false;
			}
			if(address == ""){
				$("#msg").html("�ջ���ַ����Ϊ��!");
				$("#updateModal").modal();
				return false;
			}
			$.ajax({
     			type: "POST",
      			url: "userServlet",
      			data: {type:"baseupdate", username:username, name:name, qq:qq, email:email, contact:contact, remark:remark, bank:bank, bank_no:bank_no, tran_type:tran_type, tran_contact:tran_contact, tran_phone:tran_phone, address:address},
      			error: function(){alert('����ϵͳ��Ϣʧ�ܣ�����ϵ����Ա��');},
      			success: function(result){
      				if( result == "updateFail"){
      					$("#msg").html("����ʧ�ܣ�����ϵ����Ա��");
						$("#updateModal").modal();
						return false;
      				}else{
      					window.location.reload(true);
      					$("#msg").html("���³ɹ���");
						$("#updateModal").modal();
      					
      				}
        		}
  			});
		};
	
</script>

</body>
</html>
