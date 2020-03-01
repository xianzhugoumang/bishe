	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.bjclass{

 background-image:url("images/background2.jpg");
 background-repeat:no-repeat;
 background-position:center;
}
</style>
<script>
</script>
<div class="bjclass">
<div class="navbar navbar-fixed-top scroll-hide ">
    <div class="container-fluid top-bar">
        <div class="pull-right">
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown user hidden-xs"><a data-toggle="dropdown" class="dropdown-toggle" href="#"> <img
                        width="34" height="34" src="picture/2_avatar_middle.jpg">${sessionScope.useraccount}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="login/logout"><i class="icon-signout"></i>Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <button class="navbar-toggle">
            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
        </button>
    </div>
    <div class="container-fluid main-nav clearfix">
        <div class="nav-collapse">
            <ul class="nav">
            
                <li class="">
                	<a href="control/showadminhomepage" class="">
                		<span aria-hidden="true" class="se7en-home"></span>管理员信息
                	</a>
                </li>
                <li class="">
                	<a href="javascript:;" class="" data-toggle="dropdown" data-hover="dropdown">
						<span aria-hidden="true" class="se7en-envelope"></span> 留言管理<b class="caret"></b>
                	</a>
                    <ul class="dropdown-menu">
                        <li><a href="message/adminmessage.jsp" class="">查看所有留言</a></li>    
                    </ul>
                </li>
                 <li class=""><a href="javascript:;" class="" data-toggle="dropdown" data-hover="dropdown"> <span
                        aria-hidden="true" class="se7en-gear"></span> 违章管理<b class="caret"></b>
                </a>
                    <ul class="dropdown-menu">
                        <li ><a href="control/myProductPage" class="">违章记录查询</a></li>
                       <!--  <li ><a href="record/violentcarrecord.jsp" class="">违章车辆查询</a></li> -->
                    </ul>
                </li> 
                <li class=""><a href="javascript:;" class="" data-toggle="dropdown" data-hover="dropdown"> <span
                        aria-hidden="true" class="se7en-gallery"></span> 车辆管理<b class="caret"></b>
                </a>
                    <ul class="dropdown-menu">
                        <li ><a href="car/carbangding.jsp" class="">车辆绑定</a></li>
                        <li ><a href="car/carloadin.jsp" class="">车牌录入</a></li>
                    </ul>
                </li>
                <li class=""><a href="javascript:;" class="" data-toggle="dropdown" data-hover="dropdown"> <span
                        aria-hidden="true" class="se7en-feed"></span> 驾照管理<b class="caret"></b>
                </a>
                    <ul class="dropdown-menu">
                         <li ><a href="driverlicense/driverlicenseloadin.jsp" class="">驾照录入</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>