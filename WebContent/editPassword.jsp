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

	<div id="content">
		<div id="content-header">
	  		<div id="breadcrumb"> <a href="main.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="editPassword.jsp" class="current">修改密码</a> </div>
    		<h1>修改密码</h1>
  		</div>
  		
	<!--Action boxes-->
  	<div class="container-fluid">
  	  <hr>
  	<div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>修改密码</h5>
        </div>
        <div class="widget-content nopadding">
          <form  class="form-horizontal">
            <div class="control-group">
              <label class="control-label">原始密码 :</label>
              <div class="controls">
                <input id="password" type="password" class="span11" placeholder="原始密码" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">新密码 :</label>
              <div class="controls">
                <input id="newpassword" type="password" class="span11" placeholder="新密码" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">新密码确认:</label>
              <div class="controls">
                <input id="newpassword1" type="password"  class="span11" placeholder="新密码确认"  />
              </div>
            </div>
            <div class="form-actions">
              <button type="button" onclick="passwordUpdate()" class="btn btn-success">确认修改</button>
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
				$("#msg").html("原始密码不能为空！");
				$("#updateModal").modal();
				return false;
			}
			if(newpassword == ""){
				$("#msg").html("新密码不能为空!");
				$("#updateModal").modal();
				return false;
			} 
			if(newpassword1 == ""){
				$("#msg").html("新密码确认不能为空!");
				$("#updateModal").modal();
				return false;
			}
			if(newpassword != newpassword1){
				$("#msg").html("新密码与新密码确认不一致！");
				$("#updateModal").modal();
				return false;
			}
			
			$.ajax({
     			type: "POST",
      			url: "userServlet",
      			data: {type:"passwordupdate",  password:password, newpassword:newpassword},
      			error: function(){alert('加载系统消息失败，请联系管理员。');},
      			success: function(result){
      				if( result == "Erro"){
      					location.href = "index.jsp";
						return false;
      				}else if(result == "passwordErro"){
      					$("#msg").html("原始密码错误！");
						$("#updateModal").modal();
						return false;
      				}else if(result == "updateFail"){
      					$("#msg").html("密码更新失败，请重新试一下！");
						$("#updateModal").modal();
						return false;
      				}else if(result == "updateSuccess"){
      					$("#msg").html("密码更新成功！");
						$("#updateModal").modal();
						return false;
      				}      				      				
        		}
  			});
		};
	
</script>

</body>
</html>
