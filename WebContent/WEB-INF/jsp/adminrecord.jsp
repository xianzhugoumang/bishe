<%@page import="org.springframework.web.context.support.HttpRequestHandlerServlet"%>
<%@page import="org.springframework.http.HttpRequest"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.seestyle{
color:#0a0909fa;
background-color:#35e415; 
border:0px;  
width: 70px;
height: 25px;
}
.deletestyle{
color:#0a0909fa;
background-color:#ff2000; 
border:0px;  
width: 70px;
height: 25px;
}
.modifystyle{
color:#0a0909fa;
background-color:#211ee6; 
border:0px;  
width: 70px;
height: 25px;
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
            {    
            	switch (Record.type) {
				case 1: Record.type="微型汽车" ;break;
				case 2: Record.type="中型汽车" ;break;
				case 3: Record.type="重型汽车" ;break;
				case 4:	Record.type="豪华汽车" ;break;
				default:
					break;
				}
            	var t=fmtDate(Record.date);
            	var str2='<td><a  href="${Record.src}" ><label class="seestyle">查看凭证</label></a> <input  class="deletestyle"  type="button"  name="delete" id="delete" value="删除"/><input  class="modifystyle"  type="button"  name="modify" id="modify" value="修改"/></td>';
            	alert("test111");
            	$("#table").html("");
            	var str="<tr>"+"<td>"+Record.recordno+"</td>"+"<td>"+Record.policename+"</td>"+"</td>"+"<td>"+Record.drivername+"</td>"+"<td>"+Record.carno+"</td>"+"<td>"+Record.score+"</td>"+"<td>"+Record.type+"</td>"+"<td>"+t+"</td>"+"<td>"+Record.state+"</td>"
            	alert("success!");
            	$("#table").append(str+str2);
            	
            },
            error:function()
            {
            	alert("error!");
            }
        });
   }
   var a=false;
   function init()
   {        alert("test");
            $.ajax({
              url:'control/test',
              type:'post',
              success:function()
              {
            	  alert("success!");
              },
              error:function()
              {
            	  alert("error!");
              }
            });
            
	        var deletebutton=document.getElementsByName("delete");//为删除按钮赋值
	        var modifybutton=document.getElementsByName("modify");
		    for(var i=0;i<deletebutton.length;i++)
			{  var b=deletebutton[i];
			   b.setAttribute("no",i+1);
			   b.onclick=function()
			   {  
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
				   {  
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
					    		window.location.href='record/adminmodifyrecord.jsp?recordno='+recordno+'&policename='+policename+'&drivername='+drivername+'&carno='+carno;
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
 function searchdelete()
 {   $("#mydiv").css('display','none');
	 $.ajax(
			 {type:'post',
		      url:'search/adminsearchdelete',		 			 
			  async:false,
			  success:function(list)
			  {   alert(list.length);
				  $("#table").html("");
				  var str2='<td><a  href="${Record.src}" ><label class="seestyle">查看凭证</label></a> <input  class="deletestyle"  type="button"  name="delete" id="delete" value="删除"/><input  class="modifystyle"  type="button"  name="modify" id="modify" value="修改"/></td>';
				  for(var i=0;i<list.length;i++)
					  {
					  var t=fmtDate(list[i].date);
					  var str="<tr>"+"<td>"+list[i].recordno+"</td>"+"<td>"+list[i].policename+"</td>"+"</td>"+"<td>"+list[i].drivername+"</td>"+"<td>"+list[i].carno+"</td>"+"<td>"+list[i].score+"</td>"+"<td>"+list[i].type+"</td>"+"<td>"+t+"</td>"+"<td>"+list[i].state+"</td>";
					  alert("success!");
		            	$("#table").append(str+str2);   
					  }
				  
				  alert("success3!");
			  },
			  error:function()
			  {
				  alert("error!");  
			  } 
			 }	 
	 ); 
 }
</script>
<body class="navbar-top" onload="init()">
	<div class="modal-shiftfix">
		<jsp:include page="/menu.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="panel panel-default">
				<div class="panel-body">
					<strong>违章记录：</strong>| 
					  <!-- <button onclick="searchadd()">我添加的</button>| &nbsp;&nbsp;&nbsp;
					  <button onclick="searchmodify()">我修改的</button> | -->
					  <button onclick="searchdelete()" class="seestyle">我删除的</button> |
					  <!--  <button onclick="searchsevendays()">七天内</button> |
					    <button onclick="searchmonth()">一个月内</button> |
					     <button onclick="searchyear()">一年内</button> | -->
				</div>
			</div>
			<div class="widget-container fluid-height clearfix">
				<div class="heading clearfix">
					<i  class="icon-table"></i> 违章记录管理 <a id="add-row"
						class="btn btn-sm btn-primary-outline pull-right"
						href="${pageContext.request.contextPath }/record/adminaddrecord.jsp"><i
						class="icon-plus"></i> 添违章记录</a>
				</div>
                <div class="btn-group">
                        <input type="text" class="form-control input-sm" id="driverlicenseno"
                                                   name="name"  placeholder="请输入违章号号">
                                        </div>
                                        <div class="btn-group">
                                        <button class="btn btn-success btn-sm" onclick="search()">搜索  </button>
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
										<th class="action-column">操作</th>
									</tr>
								</thead>
				<tbody id="table">
				<c:forEach var="Record"  items="${recordslist}">
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
				<c:if test="${Record.type==1}">闯红灯</c:if>
				<c:if test="${Record.type==2}">超速</c:if>
				<c:if test="${Record.type==3}">压线</c:if>
				<c:if test="${Record.type==4}">酒驾</c:if>
				</td>
				<td>
				<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" 
                 value = "${Record.date}" />
				</td>
				<td>
				<c:if test="${Record.state==0}">未缴清</c:if>
				<c:if test="${Record.state==1}">已缴清</c:if>
				</td> 
				<td>
				<a  href="${Record.src}" ><label class="seestyle">查看凭证</label></a> 
				<input  class="deletestyle"  type="button"  name="delete" id="delete" value="删除"/>
				<input  class="modifystyle"  type="button"  name="modify" id="modify" value="修改"/>
				</td>						
				</tr>
				</c:forEach>
				</tbody>
			    </table>
				<div id="mydiv">
				 一共 n条数据 
				<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="control/myProductPage?pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="control/myProductPage?pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="control/myProductPage?pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="control/myProductPage?pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="control/myProductPage?pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="control/myProductPage?pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="control/myProductPage?pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="control/myProductPage?pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>   
			</div>
			</div>
			</div>
			</div>	
			</div>
		</div>
	</div>
</body>
</html>
