<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<script>
    function  jiefeiandkoufen()
    {   var recordno=<%=request.getParameter("recordno")%>;
        var driverlicense=$("#relatedlicenses").val();
        var decreasescore=<%=request.getParameter("decreasescore")%>;
    	var data={};
    	data.driverlicense=driverlicense;
    	data.recordno=recordno;
    	data.decreasescore=decreasescore;
    	$.ajax({
    		url:'search/driverjiaofei',
    		type:'post',
    		data:data,
    		success:function(data)
    		{   if(data==0)
    			alert("该驾照账户已经失效！");
    			alert("success!");
    		},
    		error:function()
    		{
    			alert("error!");
    		}	
    	});
    }
   function init()
   {
	 $.ajax({
		 url:'search/getalldriverlicenses',
		 type:'post',
		 success:function(list)
		 {
			 alert("success!");
			 alert(list.length); 
		 },
		 error:function()
		 {
			 alert("error!");
		 }
	 });   
   }
</script>
<body class="navbar-top" onload="init()">
	<div class="modal-shiftfix">
		<jsp:include page="/menu2.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix mwi1200">
				<div class="heading clearfix">
					<i class="icon-reorder"></i>违章缴费<a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
				</div>
				<div class="widget-content padded clearfix">
					<form id="weizhangjiaofei" class="form-horizontal"
						action="search/driverjiaofei" method="post"> 
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">违章号</label>
							<div class="col-sm-8">
								<input type="text" id="recordno" class="form-control"
									name="topic" maxlength="40" placeholder="<%=request.getParameter("recordno")%>" readonly="readonly">
							</div>	
						</div>	
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">扣分</label>
							<div class="col-sm-8">
								<input type="text" id="decreasescore" class="form-control"
									name="topic" maxlength="40" placeholder="<%=request.getParameter("decreasescore")%>"  readonly="readonly">
							</div>
						</div>
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">请选择驾照</label>
							<div class="col-sm-8">
								<select id="relatedlicenses" class="form-control" >
								<c:forEach  var="Driverlicensebangding"  items="${relatedlicenses}"> 
								<option  value="${Driverlicensebangding.driverlicense }">${Driverlicensebangding.driverlicense }</option>
								</c:forEach>
								</select>
							</div>
						</div>
                        </form> 
					<div class="form-group">
							<label class="col-sm-2 control-label"></label>
						<div class="col-lg-10">
								<button type="button" class="btn btn-success"
									onclick="jiefeiandkoufen()">确定缴费</button>
								<button type="button" class="btn btn-default"
									onClick="history.go(-1);">返回</button>
								<input type="hidden" name="reback"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
