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




<div class="navbar navbar-fixed-top scroll-hide bjclass">
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
                	<a href="driverinfo.jsp" class="">
                		<span aria-hidden="true" class="se7en-home"></span>用户信息
                	</a>
                </li>
                <li class="">
                	<a href="javascript:;" class="" data-toggle="dropdown" data-hover="dropdown">
						<span aria-hidden="true" class="se7en-star"></span> 留言<b class="caret"></b>
                	</a>
                    <ul class="dropdown-menu">
                        <li><a href="message/drivermessage.jsp" class="">查看留言</a></li>
                       
                    </ul>
                </li>
                
                
                <li class="current"><a href="javascript:;" class="current" data-toggle="dropdown" data-hover="dropdown">
                    <span aria-hidden="true" class="se7en-gear"></span> 违章情况<b class="caret"></b>
                	</a>
                    <ul class="dropdown-menu">
                        <li><a href="record/driverrecord.jsp" class="">违章查询</a></li>
                        
                    </ul>
                </li>
                
                
                <li class="current"><a href="javascript:;" class="current" data-toggle="dropdown" data-hover="dropdown">
                    <span aria-hidden="true" class="se7en-flag"></span> 车辆登记<b class="caret"></b>
                	</a>
                    <ul class="dropdown-menu">
                        <li><a href="driverlicense/driverlicensebangding.jsp" class="">驾照绑定</a></li>
                        <li><a href="car/drivercarbangding.jsp" class="">车牌绑定</a></li>
                        
                    </ul>
                </li>
                
                
                
                
                
            </ul>
        </div>
    </div>
</div>