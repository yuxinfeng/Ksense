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
			//调用JQuery提供的Ajax方法 
    		$.ajax({
    			type: "POST", 
   				url: "userServlet",
   				data: {type:"load"},
   				dataType: "json", 
   				error: function(){alert('加载系统消息失败，请联系管理员。');},
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
   				});//回调函数 
   				
   			});
	</script>
	
  </head>
  
  <body>
  	<!--Base Model--> 
	<%@ include file="common/header.jsp" %>
	<%@ include file="common/navbar.jsp" %>
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>首页</a>
  		<ul>
    		<li><a href="main.jsp"><i class="icon icon-home"></i> <span>首页</span></a> </li>
			<li class="submenu active"> <a href="#"><i class="icon icon-heart"></i> <span>个人中心</span> <span class="label label-important">2</span></a>
      			<ul>
        			<li><a href="editMessage.jsp">修改资料</a></li>
        			<li><a href="editPassword.jsp">修改密码</a></li>
      			</ul>
    		</li>
    		<li><a href="onlineOrder.jsp"><i class="icon icon-globe"></i> <span>在线订货</span></a></li>
			<li><a href="cart.jsp"><i class="icon icon-shopping-cart"></i> <span>购物车</span><span class="label label-important">8</span></a></li>
			<li><a href="#"><i class="icon icon-book"></i> <span>我的订单</span></a></li>
			<li><a href="#"><i class="icon icon-truck"></i> <span>快递查询</span></a></li>
			<li><a href="#"><i class="icon icon-volume-up"></i> <span>系统公告</span></a></li>
			<li><a href="#"><i class="icon icon-group"></i> <span>关于我们</span></a></li>
    		<li><a href="#"><i class="icon icon-envelope"></i> <span>给我留言</span></a></li>
  		</ul>
	</div>
	<!--Base Model End--> 

	<div id="content" >
		<div id="content-header">
	  		<div id="breadcrumb"> <a href="main.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="editMessage.jsp" class="current">修改资料</a> </div>
    		<h1>修改资料</h1>
  		</div>
  		
	<!--Action boxes-->
	<div class="container-fluid">
  	<hr>
	  <div class="row-fluid">
    	<div class="span6">
	      <div class="widget-box">
        	<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          		<h5>基本资料</h5>
        	</div>
        	<div class="widget-content nopadding">
          		<form id="base_form" class="form-horizontal">
            	<div class="control-group">
              		<label class="control-label">用户名</label>
              		<div class="controls">
                		<input id="username" type="text" disabled="" class="span11" placeholder="用户名(手机号)" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">商家名称</label>
              		<div class="controls">
                		<input id="name" type="text" class="span11" placeholder="商家名称" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">QQ</label>
              		<div class="controls">
                		<input id="qq" type="text" class="span11" placeholder="QQ" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">邮箱</label>
              		<div class="controls">
                		<input id="email" type="text" class="span11" placeholder="邮箱" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">联系人</label>
              		<div class="controls">
                		<input id="contact" type="text" class="span11" placeholder="联系人" />
              		</div>
            	</div>
            	<div class="control-group">
              		<label class="control-label">备注:</label>
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
          		<h5>订货信息</h5>
        	</div>
		<div class="widget-content nopadding">
          <form id="tran_form" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">开户行</label>
              <div class="controls">
                <input id="bank" type="text" class="span11" placeholder="开户行" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">银行卡号</label>
              <div class="controls">
                <input id="bank_no" type="text" class="span11" placeholder="银行卡号" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">发货快递</label>
              <div class="controls">
                <select id="tran_type">
                  <option>顺丰</option>
                  <option>申通</option>
                  <option>中通</option>
                  <option>圆通</option>
                  <option>EMS</option>
                  <option>邮政</option>
                </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">收货人</label>
              <div class="controls">
                <input id="tran_contact" type="text" class="span11" placeholder="收货人" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">联系电话</label>
              <div class="controls">
                <input id="tran_phone" type="text" class="span11" placeholder="联系电话" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">收货地址</label>
              <div class="controls">
                <textarea id="address" class="span11" ></textarea>
              </div>
            </div>
            <div class="form-actions">
              <button id="base_button" type="button" onclick="baseUpdate()" class="btn btn-success">确认修改</button>
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
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>系统消息</h3>
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
				$("#msg").html("商户名称不能为空！");
				$("#updateModal").modal();
				return false;
			}
			if(qq == ""){
				$("#msg").html("QQ号码不能为空!");
				$("#updateModal").modal();
				return false;
			} 
			if(email == ""){
				$("#msg").html("邮箱不能为空!");
				$("#updateModal").modal();
				return false;
			}
			if(contact == ""){
				$("#msg").html("联系人不能为空!");
				$("#updateModal").modal();
				return false;
			}
			if(bank == ""){
				$("#msg").html("银行不能为空!");
				$("#updateModal").modal();
				return false;
			}
			if(bank_no == ""){
				$("#msg").html("银行卡号不能为空!");
				$("#updateModal").modal();
				return false;
			}	
			if(tran_type == ""){
				$("#msg").html("快递不能为空!");
				$("#updateModal").modal();
				return false;
			}	
			if(tran_contact == ""){
				$("#msg").html("收货联系人不能为空!");
				$("#updateModal").modal();
				return false;
			}	
			if(tran_phone == ""){
				$("#msg").html("收货联系号码不能为空!");
				$("#updateModal").modal();
				return false;
			}
			if(address == ""){
				$("#msg").html("收货地址不能为空!");
				$("#updateModal").modal();
				return false;
			}
			$.ajax({
     			type: "POST",
      			url: "userServlet",
      			data: {type:"baseupdate", username:username, name:name, qq:qq, email:email, contact:contact, remark:remark, bank:bank, bank_no:bank_no, tran_type:tran_type, tran_contact:tran_contact, tran_phone:tran_phone, address:address},
      			error: function(){alert('加载系统消息失败，请联系管理员。');},
      			success: function(result){
      				if( result == "updateFail"){
      					$("#msg").html("更新失败，请联系管理员。");
						$("#updateModal").modal();
						return false;
      				}else{
      					window.location.reload(true);
      					$("#msg").html("更新成功！");
						$("#updateModal").modal();
      					
      				}
        		}
  			});
		};
	
</script>

</body>
</html>
