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
		<jsp:include page="/menu.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix mwi1200">
				<div class="heading clearfix">
					<i class="icon-reorder"></i>添加留言1<a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
				</div>

				<div class="widget-content padded clearfix">
					<form id="create_task_id" class="form-horizontal"
						action="IndividualTaskServlet?method=addTask" method="post"> 

						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">收件人账号</label>
							<div class="col-sm-8">
								<input type="text" id="receiver_account" class="form-control"
									name="topic" maxlength="40" placeholder="请输入正确的收件人账号">
							</div>
						</div>
						
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">留言主题</label>
							<div class="col-sm-8">
								<input type="text" id="message_theme" class="form-control"
									name="topic" maxlength="40" placeholder="请输入留言主题">
							</div>
						</div>
						<div class="form-group field-task-content">
							<label class="control-label col-sm-2" for="task-content">留言内容</label>
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
									onclick="commitCheck()">发送</button>
								<button type="button" class="btn btn-default"
									onClick="history.go(-1);">返回</button>
								<input type="hidden" name="reback">
							</div>
						</div>
			
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		function commitCheck() {
			 var receiveuseraccount=$("#receiver_account").val();
			 var theme=$("#message_theme").val();
	         var message=$("#sendmessage").val();
	         alert("test");
	        
			if (receiveuseraccount.length == 0) {
				alert("收件人账号不能为空！");
				return;
			}
          
            if(theme.length==0)
            	{
            	alert("主题不能为空");
            	return ;
            	}
            if(message.length==0)
        	{
        	alert("内容不能为空");
        	return ;
        	}
              var data={};
	         var date1=new Date();
	         date1.getFullYear();
	         date1.getMonth();
	         date1.getDate();
	       /*   date1.getHours();
	         date1.getMinutes();
	         date1.getSeconds(); */
	         var date2=date1.toLocaleString();
	         data.receiveuseraccount=receiveuseraccount;
	         data.theme=theme;
	         data.message=message;
	        /*  data.date=date2;  */
	        /*  data.state=0;  */
	    	 $.ajax({
	    	    url:'message/sendmessage',
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
