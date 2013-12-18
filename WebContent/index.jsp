<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/matrix-style.css" />
		<link rel="stylesheet" href="css/matrix-media.css" />
        <link rel="stylesheet" href="css/matrix-login.css" />
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
  
  </head>
  
  <body>
        <div id="loginbox">  
        
            <form id="loginform" class="form-vertical" >
				<div class="control-group normal_text"> <h3><img src="img/logo.png" alt="Logo" /></h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"></i></span><input id="username" type="text" placeholder="账号" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input id="password" type="password"  placeholder="密码" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">注册</a></span>
                    <span class="pull-right"><a type="button" onclick="doLogin()"  class="btn btn-success" /> 登录</a></span>
                </div>
            </form>
            
            <form id="recoverform" class="form-vertical">
				<p class="normal_text">请如实填写以下信息，提交之后，请与我们联系，我们会激活您的账号。</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-phone"></i></span><input id="new_username" type="text" placeholder="手机号码（登陆账号）" /><br>
                            <span class="add-on bg_lo"><i class="icon-lock"></i></span><input id="new_password" type="password" placeholder="密码" /><br>
                            <span class="add-on bg_lo"><i class="icon-lock"></i></span><input id="new_password1" type="password" placeholder="密码确认 " /><br>
                            <span class="add-on bg_lo"><i class="icon-group"></i></span><input id="name" type="text" placeholder="商家名称" /><br>
                            <span class="add-on bg_lo"><i class="icon-comments"></i></span><input id="qq" type="text" placeholder="QQ号" /><br>
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input id="email" type="text" placeholder="邮箱地址" /><br>
                            <span class="add-on bg_lo"><i class="icon-user"></i></span><input id="contact" type="text" placeholder="联系人" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">返回登录</a></span>
                    <span class="pull-right"><a class="btn btn-info" onclick="doReg()"/>提交</a></span>
                </div>
            </form>
        </div>
        <div id="loginModal" class="modal hide">
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
        
        <script src="js/jquery.min.js"></script> 
		<script src="js/jquery.ui.custom.js"></script> 
		<script src="js/bootstrap.min.js"></script> 
        <script src="js/matrix.login.js"></script> 
	    <script type="text/javascript">
	    
		function doLogin(){
			
			var username = $("#username").attr("value");
			var password = $("#password").attr("value");
			
			if(username == ""){
				$("#msg").html("用户名不能为空!");
				$("#loginModal").modal();
				return false;
			}
			if(password == ""){
				$("#msg").html("密码不能为空!");
				$("#loginModal").modal();
				return false;
			}
			
			$.ajax({
     			type: "POST",
      			url: "loginServlet",
      			data: {type:"login", username: username, password: password},
      			success: function(result){
      				if(result == "loginFail"){
      					$("#msg").html("用户名或者密码错误！");
						$("#loginModal").modal();
						return false;
      				}else if(result == "accountFail"){
      					$("#msg").html("您的账户尚未被激活，请电话联系我们！18629304350。");
						$("#loginModal").modal();
						return false;
      				}else if (result == "loginSuccess"){
      					location.href="main.jsp";
      				}
        		}
  			});
		};
		
		function doReg(){
			
			var username = $("#new_username").attr("value");
			var password = $("#new_password").attr("value");
			var password1= $("#new_password1").attr("value");
			var name = $("#name").attr("value");
   			var qq = $("#qq").attr("value");
   			var email = $("#email").attr("value");
   			var contact = $("#contact").attr("value");
   		
			if(username == ""){
				$("#msg").html("用户名不能为空！");
				$("#loginModal").modal();
				return false;
			}
			if(password == ""){
				$("#msg").html("密码不能为空！");
				$("#loginModal").modal();
				return false;
			}
			if(password1 == ""){
				$("#msg").html("密码确认不能为空!");
				$("#loginModal").modal();
				return false;
			} 
			if(password != password1){
				$("#msg").html("两次输入的密码不一致！");
				$("#loginModal").modal();
				return false;
			}					
   		
			if(name == ""){
				$("#msg").html("商户名称不能为空！");
				$("#loginModal").modal();
				return false;
			}
			if(qq == ""){
				$("#msg").html("QQ号码不能为空!");
				$("#loginModal").modal();
				return false;
			} 
			if(email == ""){
				$("#msg").html("邮箱不能为空!");
				$("#loginModal").modal();
				return false;
			}
			if(contact == ""){
				$("#msg").html("联系人不能为空!");
				$("#loginModal").modal();
				return false;
			}
			
			$.ajax({
     			type: "POST",
      			url: "loginServlet",
      			data: {type:"reg", username:username, password:password, name:name, qq:qq, email:email, contact:contact},
      			error: function(){alert('加载系统消息失败，请联系管理员。');},
      			success: function(result){
      				if( result == "regFail"){
      					$("#msg").html("注册失败，请直接电话联系：18629304350，王工。");
						$("#loginModal").modal();
						return false;
      				} else if(result == "accountFail"){
      					$("#msg").html("您填写的账号已存在，请重新填写!");
						$("#loginModal").modal();
						return false;
      				}else if(result == "regSuccess"){
      					$("#msg").html("注册成功，请电话联系凯信科技：18629304350，完成账号激活。");
						$("#loginModal").modal();
      				}
        		}
  			});			
		};
    </script>
  </body>
</html>
