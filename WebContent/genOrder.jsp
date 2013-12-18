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
   						$("#email").val(result.email);
   						$("#contact").val(result.contact);
   						$("#bank").val(result.bank);
   						$("#bank_no").val(result.bank_no);
   						$("#tran_type").val(result.tran_type);
   						$("#tran_contact").val(result.tran_contact);
   						$("#tran_phone").val(result.tran_phone);
   						$("#address").val(result.address);
					} 
   				});//回调函数 
   				
    		$.ajax({
    			type:"POST", 
   				url:"cartServlet",
   				data:{type:"load"},
   				dataType: "json",//此处要设置成jason 
   				error: function(){alert('操作失败，请通过电话联系我们。');},
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
   					$("#total").html("<span>合计人民币："+sumMonery+"元</span>");
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
			<li class="submenu"> <a href="#"><i class="icon icon-heart"></i> <span>个人中心</span> <span class="label label-important">2</span></a>
      			<ul>
        			<li><a href="editMessage.jsp">修改资料</a></li>
        			<li><a href="editPassword.jsp">修改密码</a></li>
      			</ul>
    		</li>
    		<li class="active"><a href="onlineOrder.jsp"><i class="icon icon-globe"></i> <span>在线订货</span></a></li>
			<li><a href="cart.jsp"><i class="icon icon-shopping-cart"></i> <span>购物车</span><span class="label label-important">8</span></a></li>
			<li><a href="#"><i class="icon icon-book"></i> <span>我的订单</span></a></li>
			<li><a href="#"><i class="icon icon-truck"></i> <span>快递查询</span></a></li>
			<li><a href="#"><i class="icon icon-volume-up"></i> <span>系统公告</span></a></li>
			<li><a href="#"><i class="icon icon-group"></i> <span>关于我们</span></a></li>
    		<li><a href="#"><i class="icon icon-envelope"></i> <span>给我留言</span></a></li>
  		</ul>
	</div>
	<!--Base Model End--> 

	<div id="content">
		<div id="content-header">
	  		<div id="breadcrumb"> <a href="main.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="onlineOrder.jsp" class="current">在线订货</a> </div>
    		<h1>在线订货</h1>
  		</div>
  		
	<!--Action boxes-->
  	<div id="mainContent" class="container-fluid">
  	  <hr>
	<div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-briefcase"></i> </span>
            <h5 >生成订单</h5>
          </div>
          <div class="widget-content">
            <div class="row-fluid">
            
            <div class="span6">
            	<div class="widget-box">
        			<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          				<h5>账户信息</h5>
        			</div>
        			<div class="widget-content nopadding">
          				<form  class="form-horizontal">
            				<div class="control-group">
              					<label class="control-label">用户名 ：</label>
              					<div class="controls">
                					<input id="username" disabled="" type="text" class="span11" placeholder="用户名" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">商家名称 ：</label>
              					<div class="controls">
                					<input id="name" disabled="" type="text" class="span11" placeholder="商家名称" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">联系人：</label>
              					<div class="controls">
                					<input id="contact" disabled="" type="text"  class="span11" placeholder="联系人"  />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">邮箱 ：</label>
              					<div class="controls">
                					<input id="email" disabled="" type="text" class="span11" placeholder="邮箱 " />
              					</div>
            				</div>
          				</form>
        			</div>
      			</div>
           </div>
           
           
            <div class="span6">
            	<div class="widget-box">
        			<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          				<h5>收货信息</h5>
        			</div>
        			<div class="widget-content nopadding">
          				<form  class="form-horizontal">
            				<div class="control-group">
              					<label class="control-label">收货人：</label>
              					<div class="controls">
                					<input id="tran_contact" type="text" class="span11" placeholder="收货人" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">联系电话 ：</label>
              					<div class="controls">
                					<input id="tran_phone" type="text" class="span11" placeholder="联系电话" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">物流方式：</label>
              					<div class="controls">
                					<select id="tran_type"><option>顺丰</option><option>申通</option><option>中通</option><option>圆通</option><option>EMS</option><option>邮政</option></select>
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">收货地址 ：</label>
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
            			<h5>购物车信息</h5>
          			</div>
          			<div class="widget-content nopadding">
            			<table class="table table-bordered table-striped">
              				<thead>
                				<tr>
                  					<th>编号</th>
                  					<th>品牌</th>
                  					<th>名称</th>
                  					<th>颜色</th>
                  					<th>配置</th>
                  					<th>价格</th>
                  					<th>数量</th>
                  					<th>合计</th>
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
              					<label class="control-label">订单数量 ：</label>
              					<div class="controls">
                					<input id="sumCount" type="text" disabled="" class="span11" placeholder="订单数量" />
              					</div>
            				</div>           				
            				<div class="control-group">
              					<label class="control-label">订单金额 ：</label>
              					<div class="controls">
                					<input id="sumMonery" type="text" disabled="" class="span11" placeholder="订单金额" />
              					</div>
            				</div>   
            				<div class="control-group">
              					<label class="control-label">付款银行 ：</label>
              					<div class="controls">
                					<input id="bank" type="text" class="span11" placeholder="付款银行" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">银行卡号 ：</label>
              					<div class="controls">
                					<input id="bank_no" type="text" class="span11" placeholder="银行卡号" />
              					</div>
            				</div>
            				<div class="control-group">
              					<label class="control-label">订单备注 ：</label>
              					<div class="controls">
                					<input id="remark" type="text" class="span11" placeholder="订单备注" />
              					</div>
            				</div>            				
          				</form>
        			</div>
      			</div>
           </div> 
                           
                <div class="pull-right">
                  <h4 id="total" > </h4>
                  <br>
                  <a class="btn btn-primary btn-large pull-right"  onclick="genOrder()">确认订单</a>
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
      			url: "orderServlet",
      			data: {type:"insert", username:username, bank:bank, bank_no:bank_no, tran_type:tran_type, tran_contact:tran_contact, tran_phone:tran_phone, address:address, sumMonery:sumMonery, sumCount:sumCount,remark:remark},
      			error: function(){alert('加载系统消息失败，请联系管理员。');},
      			success: function(result){
      				if( result == "insertFail"){
      					$("#msg").html("生成订单失败！");
						$("#updateModal").modal();
						return false;
      				}else if( result == "insertSuccess"){
      					$("#msg").html("生成成功！");
						$("#updateModal").modal();
      				}
        		}
  			});
		};
</script>

</body>
</html>
