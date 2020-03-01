<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<style>
.class1 {
	width: 38%;
	margin-top: 20px;
	float: left;
	background-color: #fff;
}

.class3 {
	color: #196def;
}

.class2 {
	float: right;
	width: 60%;
	margin-top: 20px;
	background: #fff;
}

.class4 {
	font-size: 25px;
}
</style>
<script>
function init()
{   var t=<%=session.getAttribute("havebangdinged")%>;//判断是否已经有过绑定车辆
    if(t==false)
    	alert("您还未绑定车牌，请先绑定车辆！");
  
	
}

</script>
<body class="navbar-top"  onload="init()">
	<div class="modal-shiftfix">
		<!-- 菜单 -->
		<jsp:include page="/menu2.jsp"></jsp:include>

		<div class="container-fluid main-content">
			<div class="row">

				<div>
					<div class="widget-container stats-container">

						<div class="col-md-4">
							<div class="number">
								<div class="icon globe"></div>
								<a class="class4">总违章次数：</a> <a><%=session.getAttribute("alldriverrecordnums")%></a> <a class="class4">个</a>
							</div>
						</div>
						<div class="col-md-4">
							<div class="number">
								<div class="icon money"></div>
								<a class="class4">待缴费记录</a> <a><%=session.getAttribute("daijiaofeirecordsnum") %>	</a> <a class="class4">个</a>
							</div>
							<div class="text">
							<!-- 	<button id="searchdaijiao" class="label label-success"
									onclick="searchdaijiao()">去缴费</button> -->
									<a href="record/driverrecord.jsp"><label class="label label-success">去缴费</label></a>
							</div>

						</div>
						<div class="col-md-4">
							<div class="number">
								<div class="icon chat-bubbles"></div>
								<a class="class4">未读留言记录</a> <a><%=session.getAttribute("unreadmessagesnums") %></a> <a class="class4">条</a>
							</div>
							<div class="text">
									<a href="" ><label class="label label-success">去查看</label></a>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="class1">
						<div class="class3">
							<i class="icon-bar-chart"></i>最近一个月留言
							<table class="table table-hover">
								<thead>
									<tr>
										<th nowrap>留言人</th>
										<th nowrap>留言时间</th>
										<th nowrap>留言主题</th>
										<!-- <th nowrap>留言内容</th> -->
										<th nowrap>是否已读</th>
									</tr>
								</thead>
								<tbody>
								   <c:forEach var="Message" items="${driverreceivedmessages}">
									<tr >
										<td>${Message.senduseraccount}</td>
										<td>${Message.date}</td>
										<td>${Message.theme}</td>
										<%-- <td>${Message.message}</td> --%>
										<td>
										<c:if test="${Message.state == 0}">
										<a>未读</a></c:if> 
										<c:if test="${Message.state==1}">
										<a>已读</a>
										</c:if>
										</td>
										<td><button class="label label-success" >查看</button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="widget-content" id="main" style="height: 280px;"></div>
					</div>
					<div class="class2">
						<div class="class3">
							<i class="icon-bar-chart"></i>最近一个月违章
							<table class="table table-hover">
								<thead>
									<tr>
										<th nowrap>违章号</th>
										<th nowrap>违章时间</th>
										<th nowrap>警员</th>
										<th nowrap>违章车牌号</th>
										
									    <th nowrap>违章类型</th>	
									    <th nowrap>扣分</th>										   
									    <th nowrap>是否缴费</th>
									    <th nowrap>违章凭证</th>									    								
									 </tr>
								</thead>
								<tbody>	
									<c:forEach  var="Record" items="${driverrecords}"> 
									<tr>						
										<td>${Record.recordno}</td>
										<td>${Record.date}</td>
										<td>${Record.policename}</td>
										<td>${Record.carno}</td>
										<td>
										<c:if test="${Record.type==1}">
										<a>闯红灯</a>
										</c:if>
										<c:if test="${Record.type==2}">
										<a>压线</a>
										</c:if>
										<c:if test="${Record.type==3}">
										<a>违停</a>
										</c:if>
										<c:if test="${Record.type==4}">
										<a>超速</a>
										</c:if>
											<c:if test="${Record.type==5}">
										<a>酒驾</a>
										</c:if>
											<c:if test="${Record.type==6}">
										<a>醉驾</a>
										</c:if>
										</td>	
										<td>${Record.score}</td>
										<td>
										<c:if test="${Record.state==0}">
										<a>未缴费</a>	
										</c:if>
										<c:if test="${Record.state==1}">
										<a>已缴费</a>	
										</c:if>																
										</td>
										<td>	<a  href="${Record.src}"class="label label-success" >查看</a> </td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="widget-content" id="main" style="height: 280px;"></div>
					</div>
				</div>
			</div>
		</div>
</body>

</html>
