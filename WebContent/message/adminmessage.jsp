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
		      
				$.ajax({
					url : 'message/receiveallmessage',
					type : 'post',
					async : false,
					cache : false,
					success : function(list) {
						alert("success");
						var length = list.length;
						$("#table").html("");
						for (var i = 0; i < list.length; i++) {
							switch (list[i].state) {
							case 1:list[i].state="已读";break;
							case 0:list[i].state="未读";break;	
							default:
								break;
							}
							var str2 = '<td><label class="label label-success" name="see" data-toggle="modal" data-target="#myModal"    >查看</label></td><td> <td><a class="label label-success" href="${pageContext.request.contextPath }/message/replymessage.jsp?driveraccount='+list[i].senduseraccount+'&relatedrecordno='+list[i].recordno+'">回复</a></td></tr>';
							var str = "<tr>" + "<td>" + list[i].senduseraccount
									+ "</td>" 
									+ "</td>" + "<td>" + list[i].theme
									+ "</td>" + "<td>" + list[i].state
									+ "</td>" + "<td>"+list[i].date+"</td>"+"<td>" + list[i].recordno + "</td>";
							$("#table").append(str + str2);
						}
						 var labels=document.getElementsByName("see");
						  for(var i=0;i<labels.length;i++)
							  {
							   var b=labels[i];
							       b.setAttribute("no",i+1);
							   b.onclick=function()//为查看标签添加响应事件
							   {  
					               var t=this.getAttribute("no");
								   document.getElementById("modal").value=list[t-1].message;
					               var data={};
					               data.receiveuseraccount=<%=session.getAttribute("useraccount")%>;
					               data.senduseraccount=document.getElementById("table").rows[t-1].cells[0].innerHTML;
							       data.theme=document.getElementById("table").rows[t-1].cells[1].innerHTML;		
							       data.state=document.getElementById("table").rows[t-1].cells[2].innerHTML; 
							       if(data.state=="未读")
							         data.state=0;
							       if(data.state=="已读")
							         data.state=1;
							        var d=new Date(document.getElementById("table").rows[t-1].cells[3].innerHTML); 
							       var youWant=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds(); 
							       data.date=youWant;
							       data.recordno=document.getElementById("table").rows[t-1].cells[4].innerHTML;
							       data.message=list[t-1].message;  
							       $.ajax({
							    	  url:'message/setmessageread',
							    	  type:'post',
							    	  data:data,
							    	  success:function()
							    	  {
							    		alert("已经置为已读！");
							    	  },
							    	  error:function()
							    	  {
							    		 alert("error!"); 
							    	  } 
							       });
							   }	  
							  }
					},
					error : function() {
						alert("error");
					}
				});
	}
	function messagereceived() {
				$.ajax({
					url : 'message/searchreceivemessage',
					type : 'post',
					success : function(list) {
						alert("success");
						var length = list.length;
						alert(list.length);
						var str2 = '<td><label class="label label-success" >查看</label></td><td> <td><a class="label label-success" href="${pageContext.request.contextPath }/message/replymessage.jsp">回复</a></td></tr>';
						$("#table").html("");
						for (var i = 0; i < list.length; i++) {
							switch (list[i].state) {
							case 1:list[i].state="已读";break;
							case 0:list[i].state="未读";break;	
							default:
								break;
							}	
							str = "<tr>" + "<td>" + list[i].senduseraccount
									+ "</td>"  
									+ "</td>" + "<td>" + list[i].theme
									+ "</td>" + "<td>" + list[i].state
									+ "</td>" + "<td>" + list[i].date + "</td>";
							$("#table").append(str + str2);
						}
					},
					error : function() {
					}
				});
		  var labels=document.getElementsByTagName("label");
		  for(var i=0;i<labels.length;i++)
			  {
			   var b=labels[i];
			       b.setAttribute("no",i+1);
			   b.onclick=function()
			   {
				   $.ajax({
					   url:'message/getmessagebythree',
					   type:'post',
					   data:data,
					   success:function()
					   {
						   alert("success");
					   },
					   error:function()
					   {			   
					   }	   
				   });   
				   var  s1=confirm("我是"+this.getAttribute("no")+"号按钮！");
				   alert(s1);   
			   }
			  }	
	}
	function messagesent() {
				$.ajax({
					url : 'message/searchsendmessage',
					type : 'post',
					success : function(list) {
						alert("success");
						var length = list.length;
						var str2 = '<td><label class="label label-success" >查看</label></td><td> <td><a class="label label-success" href="${pageContext.request.contextPath }/message/replymessage.jsp">回复</a></td></tr>';
						$("#table").html("");
						for (var i = 0; i < list.length; i++) {
							
							str = "<tr>" + "<td>" + list[i].senduseraccount
									+ "</td>" + "</td>" + "<td>" + list[i].theme
									+ "</td>" + "<td>" + list[i].state
									+ "</td>" + "<td>" + list[i].date + "</td>";
							$("#table").append(str + str2);
						}
					},
					error : function() {
					}
				});
		  var labels=document.getElementsByTagName("label");
		  for(var i=0;i<labels.length;i++)
			  {
			   var b=labels[i];
			       b.setAttribute("no",i+1);
			   b.onclick=function()
			   {
				  	   
			   } 
			  }
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


</style>



</head>
<body class="navbar-top" onload="init()">
	<div class="modal-shiftfix">
		<jsp:include page="/menu.jsp"></jsp:include>
		<div>
			<div>
				<div class="widget-container fluid-height">
					<div class="heading">
						<i class="icon-bar-chart"></i>留言管理：
						<button id="receivemessage" onclick="messagereceived()">我收到的留言</button>
						<button id="sendmessage" onclick="messagesent()">我发出的留言</button>
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
					<div class="widget-content" id="main" style="height: 800px;"></div>
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
