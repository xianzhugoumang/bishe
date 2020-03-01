<%@page
	import="org.springframework.web.context.support.HttpRequestHandlerServlet"%>
<%@page import="org.springframework.http.HttpRequest"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
function fmtDate(obj)//将时间戳转化为正常时间输出
{
    var date =  new Date(obj);
    var y = 1900+date.getYear();
    var m = "0"+(date.getMonth()+1);
    var d = "0"+date.getDate();
    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
}
     function init()
     {    
    	 $.ajax({
    		url:'search/driversearchrecords',
    		type:'post',
    		success:function(list)
    		{    
    			$("#table").html("");
    			for(var i=0;i<list.length;i++)
    		   {    var t=fmtDate(list[i].date);
    				switch (list[i].type) {
    				case 1: list[i].type="闯红灯" ;   break;
    				case 2: list[i].type="压线" ;     break;	
    				case 3: list[i].type="违停" ;     break;	
                    case 4: list[i].type="超速" ;    break;
                    case 5: list[i].type="醉驾" ;     break;	
                    case 6: list[i].type="酒驾" ;     break;	
    				default:
    					break;
    				}
        			switch (list[i].state) {
    				case 0:  list[i].state="未缴清";    break;
    				case 1:  list[i].state="已缴清";   break;
    				default:
    					break;
    				}
				var str="<tr>"+"<td>"+list[i].recordno+"</td>"+"</td>"+"<td>"+list[i].drivername+"</td>"+"<td>"+list[i].carno+"</td>"+"<td>"+list[i].score+"</td>"+"<td>"+list[i].type+"</td>"+"<td>"+t+"</td>"+"<td>"+list[i].state+"</td>"
				var str2='<td><a class="label label-warning edit" href="record/driverjiaofei.jsp?recordno='+list[i].recordno+'&decreasescore='+list[i].score+'">缴费</a>'; 
				var str3='<a class="label label-success" href="${pageContext.request.contextPath}/'+list[i].src+'">查看凭证</a><a class="label label-success" href="${pageContext.request.contextPath }/message/driveraddmessage.jsp?recordno='+list[i].recordno+'">申诉</a></td></tr>';
				$("#table").append(str+str2+str3);
    		   }
    			 var jiaofeis=document.getElementsByTagName("label"); 	
    			 for(var i=0;i<jiaofeis.length;i++)
    				 {
    			      	var label=jiaofeis[i];
    			      	label.setAttribute("no",i+1);
    			      	label.onclick=function()
    			      	{
    			      		var n=this.getAttribute("no");
    			      		alert(n);
    			      		var recordno=document.getElementById("table").rows[n-1].cells[0].innerHTML;
    			      		alert(recordno);
    			      		var data={};
    			      		data.recordno=recordno;
    			      		$.ajax({
    			      			url:'search/driverjiaofei',
    			      			type:'post',
    			      			data:data,
    			      			success:function()
    			      			{
    			      				alert("成功缴费!");
    			      			},
    			      			error:function()
    			      			{
    			      				alert("error!");
    			      			}	
    			      		});
    			      	}       			 
    				 }
    		},
    		error:function()
    		{
    			alert("error!");
    		}
    	 });
     }
    function searchyear()
    {
    	$.ajax({
    		url:'search/driversearchyearrecords',
    		type:'post',
    		success:function(list)
    		{
    			$("#table").html("");
    			for(var i=0;i<list.length;i++)
    		   {
    				switch (list[i].type) {
    				case 1: list[i].type="闯红灯" ;   break;
    				case 2: list[i].type="压线" ;     break;	
    				case 3: list[i].type="违停" ;     break;	
                    case 4: list[i].type="超速" ;    break;
                    case 5: list[i].type="醉驾" ;     break;	
                    case 6: list[i].type="酒驾" ;     break;	
    				default:
    					break;
    				}
        			switch (list[i].state) {
    				case 0:  list[i].state="未缴清";    break;
    				case 1:  list[i].state="已缴清";   break;
    				default:
    					break;
    				}
				var str="<tr>"+"<td>"+list[i].recordno+"</td>"+"</td>"+"<td>"+list[i].drivername+"</td>"+"<td>"+list[i].carno+"</td>"+"<td>"+list[i].score+"</td>"+"<td>"+list[i].type+"</td>"+"<td>"+list[i].date+"</td>"+"<td>"+list[i].state+"</td>"
				var str2='<td><a class="label label-warning edit" href="record/driverjiaofei.jsp?recordno='+list[i].recordno+'&decreasescore='+list[i].score+'">缴费</a>'; 
				var str3='<a class="label label-success" href="${pageContext.request.contextPath}/'+list[i].src+'">查看凭证</a><a class="label label-success" href="${pageContext.request.contextPath }/message/driveraddmessage.jsp?recordno='+list[i].recordno+'">申诉</a></td></tr>';
				$("#table").append(str+str2+str3);
    		   }
    			 var jiaofeis=document.getElementsByTagName("label"); 	
    			 for(var i=0;i<jiaofeis.length;i++)
    				 {
    			      	var label=jiaofeis[i];
    			      	label.setAttribute("no",i+1);
    			      	label.onclick=function()
    			      	{
    			      		var n=this.getAttribute("no");
    			      		alert(n);
    			      		var recordno=document.getElementById("table").rows[n-1].cells[0].innerHTML;
    			      		alert(recordno);
    			      		var data={};
    			      		data.recordno=recordno;
    			      		$.ajax({
    			      			url:'search/driverjiaofei',
    			      			type:'post',
    			      			data:data,
    			      			success:function()
    			      			{
    			      				alert("成功缴费!");
    			      			},
    			      			error:function()
    			      			{
    			      				alert("error!");
    			      			}	
    			      		});
    			      	}       			 
    				 }
    		},
    		error:function()
    		{
    			alert("查询失败！");
    		}
    	}
    			);
    }
    function searchweek()
    {
    	$.ajax({
    		url:'search/driversearchweekrecords',
    		type:'post',
    		success:function(list)
    		{
    			$("#table").html("");
    			for(var i=0;i<list.length;i++)
    		   {
    				switch (list[i].type) {
    				case 1: list[i].type="闯红灯" ;   break;
    				case 2: list[i].type="压线" ;     break;	
    				case 3: list[i].type="违停" ;     break;	
                    case 4: list[i].type="超速" ;    break;
                    case 5: list[i].type="醉驾" ;     break;	
                    case 6: list[i].type="酒驾" ;     break;	
    				default:
    					break;
    				}
        			switch (list[i].state) {
    				case 0:  list[i].state="未缴清";    break;
    				case 1:  list[i].state="已缴清";   break;
    				default:
    					break;
    				}
				var str="<tr>"+"<td>"+list[i].recordno+"</td>"+"</td>"+"<td>"+list[i].drivername+"</td>"+"<td>"+list[i].carno+"</td>"+"<td>"+list[i].score+"</td>"+"<td>"+list[i].type+"</td>"+"<td>"+list[i].date+"</td>"+"<td>"+list[i].state+"</td>"
				var str2='<td><a class="label label-warning edit" href="record/driverjiaofei.jsp?recordno='+list[i].recordno+'&decreasescore='+list[i].score+'">缴费</a>'; 
				var str3='<a class="label label-success" href="${pageContext.request.contextPath}/'+list[i].src+'">查看凭证</a><a class="label label-success" href="${pageContext.request.contextPath }/message/driveraddmessage.jsp?recordno='+list[i].recordno+'">申诉</a></td></tr>';
				$("#table").append(str+str2+str3);
    		   }
    			 var jiaofeis=document.getElementsByTagName("label"); 	
    			 for(var i=0;i<jiaofeis.length;i++)
    				 {
    			      	var label=jiaofeis[i];
    			      	label.setAttribute("no",i+1);
    			      	label.onclick=function()
    			      	{
    			      		var n=this.getAttribute("no");
    			      		alert(n);
    			      		var recordno=document.getElementById("table").rows[n-1].cells[0].innerHTML;
    			      		alert(recordno);
    			      		var data={};
    			      		data.recordno=recordno;
    			      		$.ajax({
    			      			url:'search/driverjiaofei',
    			      			type:'post',
    			      			data:data,
    			      			success:function()
    			      			{
    			      				alert("成功缴费!");
    			      			},
    			      			error:function()
    			      			{
    			      				alert("error!");
    			      			}	
    			      		});
    			      	}       			 
    				 }
    		},
    		error:function()
    		{
    			alert("查询失败！");
    		}
    	});
    }
    function searchmonth()
    {
    	$.ajax({
    		url:'search/driversearchmonthrecords',
    		type:'post',
    		success:function(list)
    		{   
    			$("#table").html("");
    			for(var i=0;i<list.length;i++)
    		   {
    				switch (list[i].type) {
    				case 1: list[i].type="闯红灯" ;   break;
    				case 2: list[i].type="压线" ;     break;	
    				case 3: list[i].type="违停" ;     break;	
                    case 4: list[i].type="超速" ;    break;
                    case 5: list[i].type="醉驾" ;     break;	
                    case 6: list[i].type="酒驾" ;     break;	
    				default:
    					break;
    				}
        			switch (list[i].state) {
    				case 0:  list[i].state="未缴清";    break;
    				case 1:  list[i].state="已缴清";   break;
    				default:
    					break;
    				}
				var str="<tr>"+"<td>"+list[i].recordno+"</td>"+"</td>"+"<td>"+list[i].drivername+"</td>"+"<td>"+list[i].carno+"</td>"+"<td>"+list[i].score+"</td>"+"<td>"+list[i].type+"</td>"+"<td>"+list[i].date+"</td>"+"<td>"+list[i].state+"</td>"
				var str2='<td><a class="label label-warning edit" href="record/driverjiaofei.jsp?recordno='+list[i].recordno+'&decreasescore='+list[i].score+'">缴费</a>'; 
				var str3='<a class="label label-success" href="${pageContext.request.contextPath}/'+list[i].src+'">查看凭证</a><a class="label label-success" href="${pageContext.request.contextPath }/message/driveraddmessage.jsp?recordno='+list[i].recordno+'">申诉</a></td></tr>';
				$("#table").append(str+str2+str3);
    		   }
    			 var jiaofeis=document.getElementsByTagName("label"); 	
    			 for(var i=0;i<jiaofeis.length;i++)
    				 {
    			      	var label=jiaofeis[i];
    			      	label.setAttribute("no",i+1);
    			      	label.onclick=function()
    			      	{
    			      		var n=this.getAttribute("no");
    			      		alert(n);
    			      		var recordno=document.getElementById("table").rows[n-1].cells[0].innerHTML;
    			      		alert(recordno);
    			      		var data={};
    			      		data.recordno=recordno;
    			      		$.ajax({
    			      			url:'search/driverjiaofei',
    			      			type:'post',
    			      			data:data,
    			      			success:function()
    			      			{
    			      				alert("成功缴费!");
    			      			},
    			      			error:function()
    			      			{
    			      				alert("error!");
    			      			}	
    			      		});
    			      	}       			 
    				 }
    		},
    		error:function()
    		{	
    			alert("查询失败!");
    		}
    	});
    }
   function search()
   {    var recordno=$("#driverlicenseno").val();
        alert(recordno);
        var  data={};
        data.recordno=recordno;
        $.ajax({
        	url:'search/searchrecordbyrecordno',
        	type:'post',
        	data:data,
        	async:false,
        	cache:false,
            success:function(Record)
            {    var t=fmtDate(Record.date)
   			    var str2='<td><a class="label label-warning edit" href="record/driverjiaofei.jsp?recordno='+Record.recordno+'&decreasescore='+Record.score+'">缴费</a><a class="label label-warning edit" href="${pageContext.request.contextPath }/'+Record.src+'" >查看凭证</a><a class="label label-success" href="${pageContext.request.contextPath }/message/driveraddmessage.jsp?recordno='+Record.recordno+'">申诉</a></td></tr>'; 
            	$("#table").html("");
            	var str="<tr>"+"<td>"+Record.recordno+"</td>"+/*"<td>" +Record.policename +"</td>"+*/"</td>"+"<td>"+Record.drivername+"</td>"+"<td>"+Record.carno+"</td>"+"<td>"+Record.score+"</td>"+"<td>"+Record.type+"</td>"+"<td>"+t+"</td>"+"<td>"+Record.state+"</td>"
            	
            	$("#table").append(str+str2);
            },
            error:function()
            {
            	
            	alert("error!");
            }
        });
   }

</script>
<input type="button" class="label label-warning edit" value="test" />
<body class="navbar-top" onload="init()">
	<div class="modal-shiftfix">
		<jsp:include page="/menu2.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="panel panel-default">
				<div class="panel-body">
					<strong>违章记录：</strong>|
					<button onclick="searchweek()">七天内</button>
					|
					<button onclick="searchmonth()">一个月内</button>
					|
					<button onclick="searchyear()">一年内</button>
					|
				</div>
			</div>
			<div class="widget-container fluid-height clearfix">
				<div class="heading clearfix">
					<i class="icon-table"></i> 违章记录查询
				</div>
				<div class="btn-group">
					<input type="text" class="form-control input-sm"
						id="driverlicenseno" name="name" placeholder="请输入违章号号">
				</div>
				<div class="btn-group">
					<button class="btn btn-success btn-sm" onclick="search()">搜索
					</button>
				</div>
				<div class="btn-group"></div>

				<div class="widget-content padded clearfix">
					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover" id="recordtable">
								<thead>
									<tr>
										<th nowrap>违章号</th>
										<th nowrap>驾驶人姓名</th>
										<th nowrap>车牌号</th>
										<th nowrap>扣分情况</th>
										<th nowrap>违章类型</th>
										<th nowrap>违章时间</th>
										<th nowrap>是否缴清</th>
										<th class="action-column">操作</th>
									</tr>
								</thead>
								<tbody id="table">

								</tbody>
							</table>
							<div>一共 n条违章处理</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
