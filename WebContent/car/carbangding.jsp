<%@page import="model.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<script>
function test()
{   
	document.getElementById("mydiv").append("<div>test</div>");
} 

function fmtDate(obj)
{   //将时间戳转化为正常时间显示
    var date =  new Date(obj);
    var y = 1900+date.getYear();
    var m = "0"+(date.getMonth()+1);
    var d = "0"+date.getDate();
    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
}
function init() {
		$.ajax({
			url : 'car/getallcars',
			type : 'post',
		    async:false,
			success : function(list)
			{    	alert("success");
			        alert(list.length);
			        $.ajax({
			        	url:'car/test',
			        	type:'post',
			        	success:function(data)
			        	{
			        		alert("success!");
			        		alert(data.length);
			        		 var str2='<td> <select id="record_type" class="form-control" name="priority"><c:forEach var="test" items="${driverlists}"><option value=${test.useraccount}>${test.useraccount}</option></c:forEach> </select> </td><td><label class="label label-warning edit"    >绑定驾驶员</label></td>';
						        $("#table").html("");
						        for(var i=0;i<list.length;i++)
						    	 {var l1=fmtDate(list[i].productdate);
						    	 var l2=fmtDate(list[i].nextyearcheck);
						    	 var l3=fmtDate(list[i].licensedate);
						           switch (list[i].emissions) {
								case 1:
									list[i].emissions="1L及1L以下";
									break;
								case 2:
									list[i].emissions="1L~1.6L";
									break;
								case 3:
									list[i].emissions="1.6L~2.5L";
									break;
								case 4:
									list[i].emissions="2.5L~4.0L";
									break;
								default:
									break;
								}
						           switch (list[i].type) {
								case 1:
									list[i].type="微型轿车";
									break;
			                    case 2:
			                    	list[i].type="普通轿车";
									break;
			                    case 3:
			                    	list[i].type="中级轿车";
									break;
			                    case 4:
			                    	list[i].type="高级轿车";
									break;
								default:
									break;
								}
						          var str = "<tr>" + "<td>" + list[i].driverno
									+ "</td>" + "<td>" +list[i].carno + "</td>"
									 + "<td>" + list[i].type
									+ "</td>" + "<td>" + list[i].emissions
									+ "</td>" + "<td>" + l1 + "</td>"+ "<td>" + l2+ "</td>"+ "<td>" + l3 + "</td>";
									var str2="<td>"+'<select class="form-control">';
									for(var y=0;y<data.length;y++) 
						          { str2+= "<option>"+data[y].useraccount+"</option>";
						    	  }
									var str3="</select>"+"</td>";
						          $("#table").append(str+str2+str3);
						    	 }
						        var string='<c:forEach  var="useraccount" items="${driverlists2}"> 	<li  class="list-group-item "><a href="adminsearchdriverinfo.jsp?driveraccount=${useraccount.useraccount}">${useraccount.useraccount}</a></li> </c:forEach>';
						        $("#mydiv").append(string);
						        var labels=document.getElementsByTagName("label");
						        alert(labels.length);
						       for(var i=0;i<labels.length;i++)
						          {
						        	var label=labels[i];
						        	label.setAttribute("no",i);
						        	label.onclick=function()
						        	{var t=this.getAttribute("no");
					        		var driverno=document.getElementById("table").rows[t].cells[0].innerHTML;
					        		alert(driverno);
					        		var data={};
					        		data.driverno=driverno;
						        	var driveraccount=$("#record_type").val();
						        	data.driveraccount=driveraccount;
						        	$.ajax(	
						        			 {  
						        				 data:data,
						        				 url:'car/bangding',
						        				 type:'post',
						        				 async:true,
						        				 success:function()
						        				 {
						        					alert("绑定成功！"); 
						        				 },
						        				 error:function()
						        				 {   alert(this) 
						        					 this.hidden="hidden";
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
			},
			error : function() {
				alert("读取数据异常！");
			}
		});
	}
</script>
<style>
.style1 {
	width: 280px;
}
.style2 {
	color: #60c560;
	font-size: 20px;
}
.style3 {
}
</style>
<body class="navbar-top" onload="init()">
	<div>
		<jsp:include page="/menu.jsp"></jsp:include>
	</div>
	<div class="container-fluid main-content">
		<div class="row">
			<div class="col-md-9 col-sm-9">
				<div class="widget-container fluid-height clearfix">
					<div class="heading clearfix">
						<i class="icon-table"></i> 车辆绑定 <a
							class="btn btn-sm btn-primary-outline pull-right"
							href="car/bangdingdecar.jsp"><i class="icon-plus"></i>
							查看已绑定的车辆信息</a>
					</div>
					<div class="widget-content padded clearfix">
						<div class="dataTables_filter">
							<div class="row">
								<div class="col-md-8 col-sm-8">
									<form class="form-inline"
										action="http://demo1.weiboxs.com/product/index.html">
										<div class="btn-group"></div>
										<input type="hidden" value="" name="category_id" />

										<div class="btn-group">
											<input type="text" class="form-control input-sm"
												id="glyphicon-search" name="name" value="" placeholder="行驶证号">
										</div>
										<div class="btn-group">
											<button class="btn btn-success btn-sm" type="submit">
												<i class="icon-search" onclick="search()"></i> 搜索
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div id="w0" class="grid-view">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th nowrap>行驶证号</th>
											<th>车牌号</th>
											<th nowrap>车辆类型</th>
											<th nowrap>排量</th>
											<th nowrap>生产日期</th>
											<th nowrap>下次年检日期</th>
											<th nowrap>上牌照日期</th>
											<th class="action-column">用户列表</th>
										</tr>
									</thead>
									<tbody id="table">
									</tbody>
								</table>
							</div>
							<div class="datatable-footer">
								<div class="dataTables_info">
									<div class="pull-left">
										第<b>1-<%=session.getAttribute("carlistlength") %></b>条，共<b><%=session.getAttribute("carlistlength") %></b>辆车
									</div>
								</div>
								<div class="dataTables_paginate paging_full_numbers"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3">
				<div  id="mydiv"class="list-group">
				<a class="list-group-item active">
				<p>查看所有用户信息 </p>
				</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>