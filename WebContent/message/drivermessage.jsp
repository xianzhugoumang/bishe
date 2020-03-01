<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/common.jsp"></jsp:include>
<script>
	function init()//加载所有与该管理员有关的留言信息
	{
		      
	}
	function messagereceived() //加载所有已经接受到的留言信息
	{
		$.ajax({
		    url:'message/drivergetreceivedmessage',
		    type:'post',
		    success:function(list)
		    {
		    	alert(list.length);
		    	
		    },
		    error:function()
		    {
		    	alert("error!");
		    }
			
			
			
		});		
		
	}
	function messagesent()//加载所有已经发出的信息
	{
				
	}
</script>
<style>
.myinput{
   border-radius:4px;
   display:block;
    padding: 6px 12px;
    width:100%;
    border:0px;
    height:80%;
    background-color:#ddd;
}

.mybutton1{
   border-radius:14px;
   border:0px;
   color:#000;
    background-color:#ff1010;
}
.mybutton2{
   border-radius:14px;
   border:0px;
   color:#000;
   background-color:#0cec10;
}
</style>
</head>
<body class="navbar-top" onload="init()">
	<div class="modal-shiftfix">
		<jsp:include page="/menu2.jsp"></jsp:include>
		<div>
			<div>
				<div class="widget-container fluid-height">
					<div class="heading">
						<!-- <i class="icon-bar-chart"></i>留言管理： -->
						<button id="receivemessage"  class="mybutton1" onclick="messagereceived()">申诉回复</button>
						<button id="sendmessage"  class="mybutton2" onclick="messagesent()">我的申诉</button>
						<a id="add-row" class="btn btn-sm btn-primary-outline pull-right"
							href="${pageContext.request.contextPath }/message/addmessage.jsp"><i
							class="icon-plus"></i> 添加留言</a>
						<table class="table table-hover">
							<thead>
								<tr>
									<th nowrap>留言人账户</th>
									<th nowrap>留言主题</th>
									<th nowrap>状态</th>
									<th nowrap>留言时间</th>
									<th nowrap>关联违章号</th>
									<th nowrap>操作</th>
								</tr>
							</thead>
							<tbody id="table">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
 <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">消息内容</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- 模态框主体 -->
        <div class="modal-body"  id="message" >
          <input id="modal" type="text"  class="myinput "   />
        </div>
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
    </div>
  </div>
 </div>
</body>
</html>
