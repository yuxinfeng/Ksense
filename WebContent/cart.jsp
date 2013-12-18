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
    			type:"POST", 
   				url:"cartServlet",
   				data:{type:"load"},
   				dataType: "json",//�˴�Ҫ���ó�jason 
   				error: function(){alert('����ʧ�ܣ���ͨ���绰��ϵ���ǡ�');},
   				success: function(result){
   					var resultType = Object.prototype.toString.call(result.p_id);
   					if(resultType =="[object Array]"){
   						for(var i=0; i < result.p_id.length; i++){
   							$("#mainTable").append('<tr id="tr'+result.p_id[i]+'"><td class="taskStatus">'+(i+1)+'</td><td class="taskStatus">'+result.p_brand[i]+'</td><td class="taskStatus">'+result.p_name[i]+'</td><td class="taskStatus">'+result.p_color[i]+'</td><td class="taskStatus">'+result.sa_price[i]+'</td><td class="taskStatus"><input id='+result.p_id[i]+' type="text" class="span7" value="'+result.cart_num[i]+'"/></td><td class="taskStatus">'+result.remark[i]+'</td><td class="taskStatus"><button id='+result.p_id[i]+' class="btn btn-primary btn-mini">ɾ��</button></td></tr>');
   						};
   					}else if(resultType =="[object String]"){
   						$("#mainTable").append('<tr id="tr'+result.p_id+'"><td class="taskStatus">1</td><td class="taskStatus">'+result.p_brand+'</td><td class="taskStatus">'+result.p_name+'</td><td class="taskStatus">'+result.p_color+'</td><td class="taskStatus">'+result.sa_price+'</td><td class="taskStatus"><input id='+result.p_id+' type="text" class="span7" value="'+result.cart_num+'"/></td><td class="taskStatus">'+result.remark+'</td><td class="taskStatus"><button id='+result.p_id+' class="btn btn-primary btn-mini">ɾ��</button></td></tr>');
   					}
				}
   				});//�ص����� 
   			});
		
		$(".btn").live("click",function(){
			var type;
    		var buttonid = $(this).attr("id");
    		
			if(buttonid == "genOrder"){
				buttonid="";
				
				var inputArray=$("input");
				if(inputArray.length == 0){
					$("#msg").html("û�ж�����Ʒ�����Ƚ���Ʒ���빺�ﳵ��");
					$("#updateModal").modal();
					return false; 
				}else{
				  inputArray.each(function (){
                    var input =$(this);
                    if(input.attr("value")==0){
      					$("#msg").html("���еĶ�����������Ϊ0��");
						$("#updateModal").modal();
						buttonid="";
						return false;                   	
                    }else{
                    	buttonid=buttonid+input.attr("id")+","+input.attr("value")+";";
                    	}
                	});
                }
                if(buttonid == ""){
                	return false;
                }else{
					type="order";
                }
			}else if(buttonid == "deleteAll"){
				type="clear";
			}else{
				type="delete";
			}
			
    		$.ajax({
    			type:"POST", 
   				url:"cartServlet",
   				data:{type:type,p_id:buttonid},
   				dataType: "text",
   				error: function(){alert('����ʧ�ܣ���ͨ���绰��ϵ���ǡ�');},
   				success: function(result){
   					if(result == "updateSuccess"){
   						var trValue=eval('tr' + buttonid);
   						$(trValue).remove();
   					}else if(result == "updateFail"){
   						$("#msg").html("ɾ��ʧ�ܣ�");
						$("#updateModal").modal();
   					}else if(result == "clearSuccess"){
   						location.reload();
   					}else if(result == "clearFail"){
   						$("#msg").html("���ʧ�ܣ�");
						$("#updateModal").modal();   						
   					}else if(result == "orderFail"){
   						$("#msg").html("��������ʧ�ܣ���绰��ϵ���ǣ�");
						$("#updateModal").modal();   						
   					}else if(result == "orderSuccess"){
						location.href = "genOrder.jsp";   						
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
    		<li><a href="main.jsp"><i class="icon icon-home"></i> <span>��ҳ</span></a> </li>
			<li class="submenu"> <a href="#"><i class="icon icon-heart"></i> <span>��������</span> <span class="label label-important">2</span></a>
      			<ul>
        			<li><a href="editMessage.jsp">�޸�����</a></li>
        			<li><a href="editPassword.jsp">�޸�����</a></li>
      			</ul>
    		</li>
    		<li class="#"><a href="onlineOrder.jsp"><i class="icon icon-globe"></i> <span>���߶���</span></a></li>
			<li class="active"><a href="cart.jsp"><i class="icon icon-shopping-cart"></i> <span>���ﳵ</span><span class="label label-important">8</span></a></li>
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
    		<h1>���ﳵ</h1>
  		</div>
  		
	<!--Action boxes-->
  	<div id="mainContent" class="container-fluid">
  	  <hr>
  	<div class="row-fluid">
     <div class="span12">
	<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>�ҵĹ��ﳵ</h5>
          </div>
          <div class="widget-content">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th width="5%">���</th>
                  <th width="8%">Ʒ��</th>
                  <th width="15%">����</th>
                  <th width="8%">��ɫ</th>
                  <th width="10%">�۸�</th>
                  <th width="12%">����</th>
                  <th>����</th>
                  <th width="5%">����</th>
                </tr>
              </thead>
              <tbody id="mainTable">
                
              </tbody>
            </table>
            <button id="genOrder" class="btn btn-primary">���ɶ���</button>
            <button id="deleteAll" class="btn btn-success">��չ��ﳵ</button>
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

</body>
</html>
