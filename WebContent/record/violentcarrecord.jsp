<%@page import="org.springframework.web.context.support.HttpRequestHandlerServlet"%>
<%@page import="org.springframework.http.HttpRequest"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/common.jsp"></jsp:include>
<style>
.status_style {
	color: #D3D6DA;
}

.status_style strong {
	color: #001930;
}

.at {
	font-weight: bold;
	color: #000000;
}
</style>
</head>
<script>
   var a=false;
   function test()
   {        <%-- <%HttpRequest.this.%> --%>
	        var deletebutton=document.getElementsByName("delete");//为删除按钮赋值
	        var modifybutton=document.getElementsByName("modify");
	        
		    for(var i=0;i<deletebutton.length;i++)
			{  var b=deletebutton[i];
			   b.setAttribute("no",i+1);
			   b.onclick=function()
			   {   var  s=confirm("我是"+this.getAttribute("no")+"号按钮！");
				   alert(s);	
				   var y=this.getAttribute("no");  
				   var recordno=document.getElementById("recordtable").rows[y].cells[0].innerHTML;
				   
				   var data={};
				   data.recordno=recordno; 
				   alert(recordno);
				   $.ajax({
				    	type:'post',
				    	url:'search/deleterecord',
				    	data:data,
				    	success:function()
				    	{
				    		alert("success4");
				    	},
				        error:function()
				        {
				        	error("error"); 	
				        }
				    });	 
				   location.reload();
			 }
		} 
	         for(var a=0;a<modifybutton.length;a++)//为修改按钮赋值
	        	{
	        	 var b1=modifybutton[a];
				   b1.setAttribute("n",a+1);
				   b1.onclick=function()
				   {   var  s1=confirm("我是"+this.getAttribute("n")+"号按钮！");
					   alert(s1);	
					   var y1=this.getAttribute("n");  
					   var recordno=document.getElementById("recordtable").rows[y1].cells[0].innerHTML;
					   var policename=document.getElementById("recordtable").rows[y1].cells[1].innerHTML;
					   var drivername=document.getElementById("recordtable").rows[y1].cells[2].innerHTML;
					   var carno=document.getElementById("recordtable").rows[y1].cells[3].innerHTML;
					   var data={};
					   data.recordno=recordno; 
					   alert(recordno);
					   $.ajax({
					    	type:'post',
					    	url:'search/modifyrecord',
					    	data:data,
					    	cache:false,
			    		    async:true,
					    	success:function(data)
					    	{   alert(data.recordno);
					    	  
					    		alert("success4");
					    		window.location.href='view2/record/adminmodifyrecord.jsp?recordno='+recordno+'&policename='+policename+'&drivername='+drivername+'&carno='+carno;
					    	},
					        error:function()
					        {
					        	error("error"); 	
					        }
					    });	  
					   location.reload();
				 }
	        	}  
   }

 function searchadd()
{   
	 $.ajax(
			 {type:'post',
		      url:'search/adminsearchadd',		   
			  async:false,
			  success:function(list)
			  {alert("success!");
			   alert(list.length);
			  },
			  error:function()
			  {alert("error!");	  
			  }	 
			 }	 
	 );
	 location.reload(); 
} 
 function  searchmodify()
 {  
	 $.ajax(
			 {type:'post',
		      url:'search/adminsearchmodify',		 
			  async:false,
			  success:function(list1)
			  {alert("success2!");
			   alert(list1.length);
			  },
			  error:function()
			  {alert("error!");  
			  }	 
			 } 
	 ); 
	 location.reload();
 }
 function searchdelete()
 {  
 
	 $.ajax(
			 {type:'post',
		      url:'search/adminsearchdelete',		 			 
			  async:false,
			  success:function(list1)
			  {alert("success3!");
			  },
			  error:function()
			  {alert("error!");  
			  } 
			 }	 
	 ); 
	 location.reload(); 
	/*  var  deletebutton=document.getElementsByName("delete");
	 for(var i=0;i<deletebutton.length;i++)
		{
		 var c=deletebutton[i];
		 c.disabled=false;
		 c.disabled="disabled";
		
		 alert("disabled");
		} 
	  document.getElementById("test").disabled="disabled";
	  window.location.reload();
	  document.getElementById("test").disabled="disabled";
       if(a==false)
    	   alsert("atest"); */
   /*  $('#test').attr("disabled",disabled); */
 }
 
</script>

<body class="navbar-top" onload="test()">
	<div class="modal-shiftfix">
		<jsp:include page="/menu.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="panel panel-default">
				<div class="panel-body">
					<strong>违章记录：</strong>| 
					  <button onclick="searchadd()">我添加的</button>| &nbsp;&nbsp;&nbsp;
					  <button onclick="searchmodify()">我修改的</button> |
					  <button onclick="searchdelete()">我删除的</button> | 
				</div>
			</div>

			<div class="widget-container fluid-height clearfix">
				<div class="heading clearfix">
					<i  class="icon-table"></i> 违章记录管理 <a id="add-row"
						class="btn btn-sm btn-primary-outline pull-right"
						href="${pageContext.request.contextPath }/record/adminaddrecord.jsp"><i
						class="icon-plus"></i> 添加违章记录</a>
				</div>

				<div class="widget-content padded clearfix">
					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover" id="recordtable">
								<thead>
									<tr>
										<th nowrap>违章号</th>
										<th nowrap>警员</th>
										<th nowrap>驾驶人姓名</th>
										<th nowrap>车牌号</th>
										<th nowrap>扣分情况</th>
								
										<th nowrap>违章类型</th>
										<th nowrap>违章时间</th>
										<th nowrap>是否缴清</th>
										<th nowrap>违章凭证</th>
										<th class="action-column">操作</th>
									</tr>
								</thead>
				<tbody>
				<c:forEach var="Record"  items="${list }">
				<tr>
			 	<td>
				${Record.recordno}
				</td>
				<td>
				${Record.policename}
				</td>
				<td>
				${Record.drivername}
				</td>
				<td>
				${Record.carno}
				</td>
				<td>
				${Record.score}
				</td>
				<td>
				${Record.type}
				</td>
				<td>
				${Record.date}
				</td>
				<td>
				${Record.state}
				</td> 
				<td>
				${Record.src}
				</td> 
				<td>
				<a  href="${Record.src}" class="label label-success" >查看</a> 
				
				
				<input  style="color:#0a0909fa;background-color:#ff2000;    width: 70px;
    height: 25px;"  type="button"  name="delete" id="delete" value="删除"/>

			   <!--  <input  style="color:#0a0909fa; background-color:#ff2000;    width: 70px;
    height: 25px;"  type="button" name="modify" onclick="modifyrecord()" value="修改"/>  -->
				<%-- <label onclick="adminmodifyrecord()"><a href="${pageContext.request.contextPath }/view2/record/adminmodifyrecord.jsp"	class="label label-success"	>修改</a></label> 					 --%>
				<input  style="color:#0a0909fa;background-color:#ff2000;    width: 70px;
    height: 25px;"  type="button"  name="modify" id="modify" value="修改"/>
				</td>
										
				</tr>
				</c:forEach>
				
				</tbody>
							</table>
							<!-- <form id="modifyrecord" method="post" action="search/modifyrecord">
							 
							</form> -->
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>

</html>
