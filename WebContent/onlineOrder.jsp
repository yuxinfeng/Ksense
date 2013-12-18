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
			//调用JQuery提供的Ajax方法 
    		$.ajax({
    			type:"POST", 
   				url:"phoneServlet",
   				data:{type:"load"},
   				dataType: "json",//此处要设置成jason 
   				error: function(){alert('产生报价单错误，请通过微信给我们发信息。');},
   				success: function(result){
   					for(var i=0; i < result.brand.length; i++){
   						$("#mainContent").append('<div class="row-fluid"><div class="span12"><div class="widget-box"><div class="widget-title"> <span class="icon"><i class="icon-th"></i></span><h5>'+result.brand[i]+'</h5><span class="label label-info">'+result.brand[i]+'</span></div><div class="widget-content nopadding"><table class="table table-bordered data-table"><thead><tr><th width="8%">品牌</th><th width="15%">产品名称</th><th width="10%">产品颜色</th><th width="10%">产品价格</th><th>产品配置</th><th width="10%">操作</th></tr></thead><tbody id="'+result.brand[i]+'"></tbody></table></div></div></div></div>');
   						var eValue=eval('result.' + result.brand[i]);
   						for(var j=0; j < eValue.length; j=j+5){ 
   							$("#"+result.brand[i]+"").append('<tr><td class="taskStatus">'+result.brand[i]+'</td><td>'+eValue[j+1]+'</td><td class="taskStatus">'+eValue[j+2]+'</td><td class="taskStatus">'+eValue[j+3]+'</td><td class="taskStatus">'+eValue[j+4]+'</td><td class="taskOptions"><button id= '+eValue[j]+' class="btn btn-primary btn-mini">加入购物车</button></td></tr>');
   							}
   						}
					}
   				});//回调函数 
   				
		$(".btn").live("click",function(){
    		var buttonid = $(this).attr("id");
			
    		$.ajax({
    			type:"POST", 
   				url:"cartServlet",
   				data:{type:"insert",p_id:buttonid},
   				dataType: "text",
   				error: function(){alert('操作失败，请通过电话联系我们。');},
   				success: function(result){
   					if(result == "insertSuccess"){
   						$("#msg").html("添加成功！");
						$("#updateModal").modal();
   					}else if(result == "insertFail"){
   						$("#msg").html("添加失败！");
						$("#updateModal").modal();
   					}else if(result == "insertHave"){
   						$("#msg").html("已经存在购物车中了！");
						$("#updateModal").modal();
   					}
				}
   			});//回调函数			
		});
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
