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
    			type:"POST", 
   				url:"cartServlet",
   				data:{type:"load"},
   				dataType: "json",//此处要设置成jason 
   				error: function(){alert('操作失败，请通过电话联系我们。');},
   				success: function(result){
   					var resultType = Object.prototype.toString.call(result.p_id);
   					if(resultType =="[object Array]"){
   						for(var i=0; i < result.p_id.length; i++){
   							$("#mainTable").append('<tr id="tr'+result.p_id[i]+'"><td class="taskStatus">'+(i+1)+'</td><td class="taskStatus">'+result.p_brand[i]+'</td><td class="taskStatus">'+result.p_name[i]+'</td><td class="taskStatus">'+result.p_color[i]+'</td><td class="taskStatus">'+result.sa_price[i]+'</td><td class="taskStatus"><input id='+result.p_id[i]+' type="text" class="span7" value="'+result.cart_num[i]+'"/></td><td class="taskStatus">'+result.remark[i]+'</td><td class="taskStatus"><button id='+result.p_id[i]+' class="btn btn-primary btn-mini">删除</button></td></tr>');
   						};
   					}else if(resultType =="[object String]"){
   						$("#mainTable").append('<tr id="tr'+result.p_id+'"><td class="taskStatus">1</td><td class="taskStatus">'+result.p_brand+'</td><td class="taskStatus">'+result.p_name+'</td><td class="taskStatus">'+result.p_color+'</td><td class="taskStatus">'+result.sa_price+'</td><td class="taskStatus"><input id='+result.p_id+' type="text" class="span7" value="'+result.cart_num+'"/></td><td class="taskStatus">'+result.remark+'</td><td class="taskStatus"><button id='+result.p_id+' class="btn btn-primary btn-mini">删除</button></td></tr>');
   					}
				}
   				});//回调函数 
   			});
		
		$(".btn").live("click",function(){
			var type;
    		var buttonid = $(this).attr("id");
    		
			if(buttonid == "genOrder"){
				buttonid="";
				
				var inputArray=$("input");
				if(inputArray.length == 0){
					$("#msg").html("没有订单产品，请先将产品加入购物车！");
					$("#updateModal").modal();
					return false; 
				}else{
				  inputArray.each(function (){
                    var input =$(this);
                    if(input.attr("value")==0){
      					$("#msg").html("所有的订单数量不能为0！");
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
   				error: function(){alert('操作失败，请通过电话联系我们。');},
   				success: function(result){
   					if(result == "updateSuccess"){
   						var trValue=eval('tr' + buttonid);
   						$(trValue).remove();
   					}else if(result == "updateFail"){
   						$("#msg").html("删除失败！");
						$("#updateModal").modal();
   					}else if(result == "clearSuccess"){
   						location.reload();
   					}else if(result == "clearFail"){
   						$("#msg").html("清空失败！");
						$("#updateModal").modal();   						
   					}else if(result == "orderFail"){
   						$("#msg").html("产生订单失败，请电话联系我们！");
						$("#updateModal").modal();   						
   					}else if(result == "orderSuccess"){
						location.href = "genOrder.jsp";   						
   					}
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
    		<li class="#"><a href="onlineOrder.jsp"><i class="icon icon-globe"></i> <span>在线订货</span></a></li>
			<li class="active"><a href="cart.jsp"><i class="icon icon-shopping-cart"></i> <span>购物车</span><span class="label label-important">8</span></a></li>
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
    		<h1>购物车</h1>
  		</div>
  		
	<!--Action boxes-->
  	<div id="mainContent" class="container-fluid">
  	  <hr>
  	<div class="row-fluid">
     <div class="span12">
	<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>我的购物车</h5>
          </div>
          <div class="widget-content">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th width="5%">编号</th>
                  <th width="8%">品牌</th>
                  <th width="15%">名称</th>
                  <th width="8%">颜色</th>
                  <th width="10%">价格</th>
                  <th width="12%">数量</th>
                  <th>配置</th>
                  <th width="5%">操作</th>
                </tr>
              </thead>
              <tbody id="mainTable">
                
              </tbody>
            </table>
            <button id="genOrder" class="btn btn-primary">生成订单</button>
            <button id="deleteAll" class="btn btn-success">清空购物车</button>
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

</body>
</html>
