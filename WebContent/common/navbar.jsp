<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">您好，用户</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="editMessage.jsp"><i class="icon-cog"></i>资料修改</a></li>
        <li class="divider"></li>
        <li><a href="editPassword.jsp"><i class="icon-lock"></i>密码修改</a></li>
        <li class="divider"></li>
        <li><a href="common/exit.jsp"><i class="icon-key"></i>退出</a></li>
      </ul>
    </li>

    <li class=""><a title="" href="common/exit.jsp"><i class="icon icon-share-alt "></i> <span class="text">退出</span></a></li>
  </ul>
</div>
