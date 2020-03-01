<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<body class="navbar-top" >
	<div class="modal-shiftfix">
		<jsp:include page="/menu2.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix mwi1200">
				<div class="heading clearfix">
					<i class="icon-reorder"></i>违章申诉<a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
				</div>

				<div class="widget-content padded clearfix">
					<form id="create_task_id" class="form-horizontal"
						action="IndividualTaskServlet?method=addTask" method="post"> 

						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">违章号</label>
							<div class="col-sm-8">
								<input type="text" id="recordno" class="form-control"
									name="topic" maxlength="40" placeholder="<%=request.getParameter("recordno")%>" readonly="readonly">
							</div>
						</div>
						
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">申诉类型</label>
							<div class="col-sm-8">
								<select id="messagetype" class="form-control" >
								<option >违章记录有误</option>
								<option >违章缴费有误</option>
								</select>
							</div>
						</div>
						
						
						
						<div class="form-group field-task-content">
							<label class="control-label col-sm-2" for="task-content">请输入问题描述</label>
							<div class="col-sm-8">
								<textarea id="sendmessage" class="form-control"
									name="description" rows="6" placeholder="留言只能为文字信息。"></textarea>
							</div>
						</div>
                          	</form> 
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-lg-10">
								<button type="button" class="btn btn-success"
									onclick="send()">发送</button>
								<button type="button" class="btn btn-default"
									onClick="history.go(-1);">返回</button>
								
							</div>
						</div>
			
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	     
	
	
	
		function send() {
			    var recordno=<%=request.getParameter("recordno")%>;
			    var sendmessage=$("#sendmessage").val();
			    var messagetype=$("#messagetype").val();
			    var messagedate=$("#messagedate").val();
			    var data={};
			    alert(recordno);
			    alert(sendmessage);
			    alert(messagetype);
			    alert(messagedate);
			    data.recordno=recordno;
			   
			    data.message=sendmessage;
			    data.type=messagetype;
	    	 $.ajax({
	    		 
	    	    url:'message/driversendmessage',
	    	    type:'post',
	    	    data: data,
	    	    cache:false,
	    	    async:false,
	    	    success:function()
	    	    {
	    	    	alert("success");
	    	    },
	    	    error:function()
	    	    {
	    	    	alert("error!");
	    	    }
	    	 }); 
		}
		</script>
</body>

</html>
