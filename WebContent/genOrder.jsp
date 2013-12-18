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
   						$("#email").val(result.email);
   						$("#contact").val(result.contact);
   						$("#bank").val(result.bank);
   						$("#bank_no").val(result.bank_no);
   						$("#tran_type").val(result.tran_type);
   						$("#tran_contact").val(result.tran_contact);
   						$("#tran_phone").val(result.tran_phone);
   						$("#address").val(result.address);
					} 
   				});//�ص����� 
   				
    		$.ajax({
    			type:"POST", 
   				url:"cartServlet",
   				data:{type:"load"},
   				dataType: "json",//�˴�Ҫ���ó�jason 
   				error: function(){alert('����ʧ�ܣ���ͨ���绰��ϵ���ǡ�');},
   				success: function(result){
   					var resultType = Object.prototype.toString.call(result.p_id);
   					var sumMonery=0;
   					var sumCount =0;
   					if(resultType =="[object Array]"){
   						for(var i=0; i < result.p_id.length; i++){
   							$("#mainTable").append('<tr id="tr'+result.p_id[i]+'"><td class="taskStatus">'+(i+1)+'</td><td class="taskStatus">'+result.p_brand[i]+'</td><td class="taskStatus">'+result.p_name[i]+'</td><td class="taskStatus">'+result.p_color[i]+'</td><td class="taskStatus">'+result.remark[i]+'</td><td class="taskStatus">'+result.sa_price[i]+'</td><td class="taskStatus">'+result.cart_num[i]+'<td class="taskStatus">'+(result.sa_price[i]*result.cart_num[i])+'</td></tr>');
   							sumMonery = sumMonery + (result.sa_price[i]*result.cart_num[i]);
   							sumCount = sumCount + result.cart_num[i];
   						};
   					}else if(resultType =="[object String]"){
   						$("#mainTable").append('<tr id="tr'+result.p_id+'"><td class="taskStatus">1</td><td class="taskStatus">'+result.p_brand+'</td><td class="taskStatus">'+result.p_name+'</td><td class="taskStatus">'+result.p_color+'</td><td class="taskStatus">'+result.remark+'</td><td class="taskStatus">'+result.sa_price+'</td><td class="taskStatus">'+result.cart_num+'</td><td class="taskStatus">'+(result.sa_price*result.cart_num)+'</td></tr>');
   						sumMonery = (result.sa_price*result.cart_num);
   						sumCount =  result.cart_num;
   					}
   					$("#sumCount").val(sumCount);
   					$("#sumMonery").val(sumMonery);
   					$("#total").html("<span>�ϼ�����ң�"+sumMonery+"Ԫ</span>");
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
	<div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-briefcase"></i> </span>
            <h5 >���ɶ���</h5>
          </div>
          <div class="widget-content">
            <div class="row-fluid">
            
            <div class="span6">
            	<div class="widget-box">
        			<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          				<h5>�˻���Ϣ</h5>
        			</div>
        			<div class="widget-content nopadding">
          				<form  class="form-horizontal">
            				<div class="control-group">
              					<label class="control-label">�û��� ��</label>
              					<div class="controls">
                					<input id="username" disabled="" type="text" class="span11" placeholder="�û���" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">�̼����� ��</label>
              					<div class="controls">
                					<input id="name" disabled="" type="text" class="span11" placeholder="�̼�����" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">��ϵ�ˣ�</label>
              					<div class="controls">
                					<input id="contact" disabled="" type="text"  class="span11" placeholder="��ϵ��"  />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">���� ��</label>
              					<div class="controls">
                					<input id="email" disabled="" type="text" class="span11" placeholder="���� " />
              					</div>
            				</div>
          				</form>
        			</div>
      			</div>
           </div>
           
           
            <div class="span6">
            	<div class="widget-box">
        			<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          				<h5>�ջ���Ϣ</h5>
        			</div>
        			<div class="widget-content nopadding">
          				<form  class="form-horizontal">
            				<div class="control-group">
              					<label class="control-label">�ջ��ˣ�</label>
              					<div class="controls">
                					<input id="tran_contact" type="text" class="span11" placeholder="�ջ���" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">��ϵ�绰 ��</label>
              					<div class="controls">
                					<input id="tran_phone" type="text" class="span11" placeholder="��ϵ�绰" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">������ʽ��</label>
              					<div class="controls">
                					<select id="tran_type"><option>˳��</option><option>��ͨ</option><option>��ͨ</option><option>Բͨ</option><option>EMS</option><option>����</option></select>
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">�ջ���ַ ��</label>
              					<div class="controls">
                					<textarea id="address" class="span11" ></textarea>
              					</div>
            				</div>
          				</form>
        			</div>
      			</div>
           </div>                      
           
          </div>
            
          <div class="row-fluid">
             <div class="span12">
                 <div class="widget-box">
          			<div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            			<h5>���ﳵ��Ϣ</h5>
          			</div>
          			<div class="widget-content nopadding">
            			<table class="table table-bordered table-striped">
              				<thead>
                				<tr>
                  					<th>���</th>
                  					<th>Ʒ��</th>
                  					<th>����</th>
                  					<th>��ɫ</th>
                  					<th>����</th>
                  					<th>�۸�</th>
                  					<th>����</th>
                  					<th>�ϼ�</th>
                				</tr>
              				</thead>
              				<tbody id="mainTable">
              				</tbody>
            			</table>
          			</div>
        		</div>
        		
        		
		<div class="row-fluid">
            
            <div class="span6">
            	<div class="widget-box">

        			<div class="widget-content nopadding">
          				<form class="form-horizontal">
            				<div class="control-group">
              					<label class="control-label">�������� ��</label>
              					<div class="controls">
                					<input id="sumCount" type="text" disabled="" class="span11" placeholder="��������" />
              					</div>
            				</div>           				
            				<div class="control-group">
              					<label class="control-label">������� ��</label>
              					<div class="controls">
                					<input id="sumMonery" type="text" disabled="" class="span11" placeholder="�������" />
              					</div>
            				</div>   
            				<div class="control-group">
              					<label class="control-label">�������� ��</label>
              					<div class="controls">
                					<input id="bank" type="text" class="span11" placeholder="��������" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">���п��� ��</label>
              					<div class="controls">
                					<input id="bank_no" type="text" class="span11" placeholder="���п���" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">������ע ��</label>
              					<div class="controls">
                					<input id="remark" type="text" class="span11" placeholder="������ע" />
              					</div>
            				</div>            				
          				</form>
        			</div>
      			</div>
           </div> 
                           
                <div class="pull-right">
                  <h4 id="total" > </h4>
                  <br>
                  <a class="btn btn-primary btn-large pull-right"  onclick="genOrder()">ȷ�϶���</a>
               </div>
         </div>    		

              </div>
            </div>
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
	function genOrder(){
		var sumMonery = $("#sumMonery").attr("value");
		var sumCount = $("#sumCount").attr("value");
		var remark = $("#remark").attr("value");
		
		var username = $("#username").attr("value");
   		var bank = $("#bank").attr("value");
   		var bank_no = $("#bank_no").attr("value");
   		var tran_type = $("#tran_type  option:selected").text();
   		var tran_contact = $("#tran_contact").attr("value");
   		var tran_phone = $("#tran_phone").attr("value");
   		var address = $("#address").attr("value");
   		
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
      			url: "orderServlet",
      			data: {type:"insert", username:username, bank:bank, bank_no:bank_no, tran_type:tran_type, tran_contact:tran_contact, tran_phone:tran_phone, address:address, sumMonery:sumMonery, sumCount:sumCount,remark:remark},
      			error: function(){alert('����ϵͳ��Ϣʧ�ܣ�����ϵ����Ա��');},
      			success: function(result){
      				if( result == "insertFail"){
      					$("#msg").html("���ɶ���ʧ�ܣ�");
						$("#updateModal").modal();
						return false;
      				}else if( result == "insertSuccess"){
      					$("#msg").html("���ɳɹ���");
						$("#updateModal").modal();
      				}
        		}
  			});
		};
</script>

</body>
</html>
