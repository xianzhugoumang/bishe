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
					<i class="icon-reorder"></i>添加违章记录<a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
				</div>
				<div class="widget-content padded clearfix">
				 	<form id="create_reord" class="form-horizontal"
						action="control/addphoto" method="post" enctype="multipart/form-data"> 

						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">警员姓名</label>
							<div class="col-sm-8">
								<input type="text" id="policename" class="form-control"
									name="topic" maxlength="40" placeholder="请输入正确的警员姓名">
							</div>
						</div>
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">驾驶人姓名</label>
							<div class="col-sm-8">
								<input type="text" id="drivername" class="form-control"
									name="topic" maxlength="40" placeholder="请输入正确的驾驶人姓名">
							</div>
						</div>
						<div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">违章号</label>
							<div class="col-sm-8">
								<input type="text" id="record_no" class="form-control"
									name="topic" maxlength="40" placeholder="请输入正确格式的违章号">
							</div>
						</div>
                        <div class="form-group field-task-subject required">
							<label class="control-label col-sm-2" for="task-subject">车牌号</label>
							<div class="col-sm-8">
								<input type="text" id="car_no" class="form-control"
									name="topic" maxlength="40" placeholder="请输入正确的车牌号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label class="control-label col-sm-2" for="task-relation_id">违章时间</label>
							<div class="col-sm-5">
								<input type="date" id="Date"
									class="form-control form_datetime" name="endTime"
									style="width:170px;">
							</div>
						</div>
						<div class="form-group field-task-status">
							<label class="control-label col-sm-2" for="task-priority">违章类型</label>
							<div class="col-sm-8">
								<select id="record_type" class="form-control" name="priority">
									<option value=1>闯红灯</option>
									<option value=2>违章停车</option>
									<option value=3>压线</option>
									<option value=4>超速</option>
								</select>
							</div>
						</div>
						<div class="form-group field-task-status">
							<label class="control-label col-sm-2" for="task-status">状态</label>
							<div class="col-sm-8">
								<select id="record_state" class="form-control" name="status">
									<option value=0>已缴清</option>
									<option value=1>未缴清</option>
								</select>
							</div>
						</div>
						<div class="form-group field-task-content">
							<label class="control-label col-sm-2" for="task-content">违章凭证</label>	         
					      <input type="file" name="file">				
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-lg-10">
								<button type="button" class="btn btn-success"
									onclick="commitCheck()">创建</button>
								<button type="button" class="btn btn-default"
									onclick="history.go(-1);">返回</button>
								<input type="hidden" name="reback">
							</div>
						</div>
					 </form> 
				</div>
			</div>
		</div>
	</div>
	<script  type="text/javascript">
		function commitCheck() {
			var policename = $("#policename").val();
			var drivername =$("#drivername").val();
			var carno= $("#car_no").val();
			var Date = $("#Date").val();
            var recordno=$("#record_no").val();
            var state=$("#record_state").val();
            var type=$("#record_type").val();
            var pattern = /^[\u4E00-\u9FA5]{1,6}$/;//中文姓名正则表达式
            var reg=/^\d{16}$/;
            var xreg=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF]$)|([DF][A-HJ-NP-Z0-9][0-9]{4}$))/;
            var creg=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1}$/;
			if(policename.length == 0) {
				alert("警员姓名不能为空！");
				return;
			}
            if(drivername.length==0)
            	{
            	alert("请填写驾驶人姓名");
            	return ;
            	}
            if(!reg.test(recordno))
			    {alert("请输入16位数字违章号！");
			    return;}
            if(carno.length==0)
            	{
            	alert("车牌号不能为空");
            	return ;
            	}
            if(carno.length==7)
            	  {
            	       if(!(creg.test(carno)))
            	    	   alert("车牌号格式不正确！");
            	  }
            if(carno.length==8)
            	{
            	       if(!(xreg.test(carno)))
            	          alert("车牌号格式不正确！");
            	} 
            if(Date==0)
            	{alert("请填写日期");
               return ;}
			$("#create_reord").submit();
			var a=3;
			var b=1;
			var adminaccount=<%=session.getAttribute("useraccount")%>;
			var date=Date.toString();
			alert(date);
			var data={};	
			data.recordno=recordno;
			data.drivername=drivername;
			data.policename=policename;
		 	data.date=date;   
            data.state=state;
            data.type=type; 
            data.score=a;
            data.adminaction=b;
            data.adminaccount=adminaccount; 
            data.carno=carno;
            data.src="";
            alert("test");
            $.ajax({
            	type:'post',
            	url:'search/addrecord',   
            	cache:false,
            	async:false,
            	data:data,     
            	success:function()
            	{
            		alert("添加成功!");
            	},
            	error:function()
            	{
            		alert("添加失败!");
            	}
            });
		}
	</script>
</body>
</html>
