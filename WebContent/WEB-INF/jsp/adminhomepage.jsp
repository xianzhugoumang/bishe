<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<body  class="navbar-top">
<div>
  <jsp:include page="/menu.jsp"></jsp:include>
</div> 

<script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.min.js">
</script>
<div class="col-sm-3 col-md-2 sidebar">
		 <div class="sidebar_top">
			 <h1>"${username}"</h1> 
			 <span>...</span>
			 <img src="images/avt.png" alt=""/>
			 <button id="upload" onclick="upload()">点击上传</button>
		 </div>
		<div class="details">
			 <h3>身份</h3>
			 <p>管理员</p>  	 
			 <h3>邮箱地址</h3>
			 <p><a href="mailto@example.com">mail@example.com</a></p>
			 <address>
			 <h3>状态</h3>
			 <span>正常工作</span>
			 </address> 
		</div>
</div>				
<div class="">
	<div class="content">
		 <div class="details_header">
			 <ul>
				 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});																
						});
				</script>
			 </ul>
		 </div>
		
		 <div class="skills">
			 <h3 class="clr2">个人信息</h3>
			 <div class="skill_list">
				 <div class="skill1">
					 <h4>详细信息</h4>
					 <ul>					 
						<li>住址：</li>
						<li>教育经历：</li>
						<li>工龄：</li>
						<li>电话:</li>
					 </ul>
				 </div>
				 <div class="clearfix"></div>
			 </div>
		 </div>
		 <div class="education">
			 <h3 class="clr3">已处理违章记录</h3>
			 <p>.............</p>
		 </div>
	 </div>
</div>
</body>
</html>