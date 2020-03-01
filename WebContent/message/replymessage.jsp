<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>

<body class="navbar-top">
	<div class="modal-shiftfix">
		<jsp:include page="/menu.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix mwi1200">
				<div class="heading clearfix">
					<i class="icon-reorder"></i>添加留言<a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
				</div>

				<div class="widget-content padded clearfix">
					<form id="create_task_id" class="form-horizontal"
						action="" method="post">
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">收件人账号</label>
							<div class="col-sm-8">
								<input type="text" id="receiver_id" class="form-control"
									name="topic" maxlength="40" placeholder="<%=request.getParameter("driveraccount")%>" readonly="readonly">
							</div>
						</div>
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">留言主题</label>
							<div class="col-sm-8">
								<input type="text" id="message_theme" class="form-control"
									name="topic" maxlength="40" placeholder="回复">
							</div>
						</div>
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">关联违章号</label>
							<div class="col-sm-8">
								<input type="text" id="related_recordno" class="form-control"
									name="topic" maxlength="40" placeholder="<%=request.getParameter("relatedrecordno")%>" readonly="readonly">
							</div>
						</div>
						<div class="form-group field-task-content">
							<label class="control-label col-sm-2" for="task-content">留言内容</label>
							<div class="col-sm-8">
								<textarea id="sendmessage" class="form-control"
									name="description" rows="6" placeholder="内容只能为文字信息。"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-lg-10">
								<button type="button" class="btn btn-success"
									onclick="send()">发送</button>
								<button type="button" class="btn btn-default"
									onClick="history.go(-1);">返回</button>
								<input type="hidden" name="reback">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
         function send()
         {      var data={};
                var   receiveuseraccount=<%=request.getParameter("driveraccount")%>;
                var   theme=$("#message_theme").val();
                var   message=$("#sendmessage").val();
                var    recordno=<%=request.getParameter("relatedrecordno")%>;
                alert(receiveuseraccount);
                alert(recordno);
                data.receiveuseraccount=receiveuseraccount;
                data.message=message;
                data.theme=theme;
                data.recordno=recordno;
                data.state=0;
                data.senduseraccount=<%=session.getAttribute("useraccount")%>;
                
        	 $.ajax({
        		url:'message/sendmessage',
        		type:'post',
        		data:data,
        		success:function()
        		{alert("success!");},
        		error:function()
        		{alert("error！");}
        	 });
        	 
         }

	</script>

	

</body>

</html>
