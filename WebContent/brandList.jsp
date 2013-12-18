<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="common/sessionCheck.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
	
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.tables.js"></script>
	
  </head>
  <body>
  	<!--Base Model--> 
	<%@ include file="common/header.jsp" %>
	<%@ include file="common/navbar.jsp" %>
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>首页</a>
  		<ul>
    		<li class="active"><a href="main.jsp"><i class="icon icon-home"></i> <span>首页</span></a> </li>
			<li class="submenu"> <a href="#"><i class="icon icon-heart"></i> <span>个人中心</span> <span class="label label-important">2</span></a>
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
	  		<div id="breadcrumb"> <a href="main.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  		</div>
	<!--Action boxes-->
  	<div class="container-fluid">
    	<div class="quick-actions_homepage">
      		<ul class="quick-actions">
        		<li class="bg_lb"> <a href="onlineOrder.jsp"> <i class="icon-th"></i> 诺基亚 </a> </li>
        		<li class="bg_ly"> <a href="cart.jsp"> <i class="icon-shopping-cart"></i><span class="label label-success"></span> 三星 </a></li>
        		<li class="bg_lo"> <a href="#"> <i class="icon-book"></i><span class="label label-success">8</span> 华为</a> </li>
				<li class="bg_lg"> <a href="editMessage.jsp"> <i class="icon-cog"></i> 中兴</a> </li>
	    		<li class="bg_lr"> <a href="editPassword.jsp"> <i class="icon-lock"></i> HTC</a> </li>
				<li class="bg_ls span2"> <a href="#"> <i class="icon-truck"></i> 摩托罗拉 </a> </li>
      		</ul>
    	</div>
     </div>
	<!--End-Action boxes-->    
  	<div class="container-fluid">
  	  <hr>
  	  
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
        <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Data table</h5>
          </div>
          <div class="widget-content">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                </tr>
              </thead>
              <tbody>
                <tr >
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0</td>
                  <td>Win 95+</td>
                  <td class="center">4</td>
                </tr>
                </tbody>
               </table>
             </div>
        </div>
      </div>
    </div>
    
   </div>
</div>

<%@ include file="common/foot.jsp" %>

</body>
</html>
