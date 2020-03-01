<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/common.jsp"></jsp:include>
</head>
<script>
   function init()
   {     
	   $.ajax({
		      url:'car/getdrivercarbangdings',
		      type:'post',
		      async:false,
		      cache:false,
		      success:function(list)
		      {
		    	  alert("success!");
		    	 
		    	  var str2='<td class="text-right" nowrap> <label class="btn btn-success btn-xs weiBoxs-dialog" > 解除绑定</label> </td>';
		    	  $("#table").html("");
		    	  for(var i=0;i<list.length;i++)
		    		  {
		    		   var str="<tr>"+"<td>"+list[i].carno+"</td>"+"<td>"+list[i].driverno+"</td>"+"<td>"+list[i].cardescrible+"</td>"+"<td>"+list[i].cartype+"</td>"+"<td>"+list[i].drivername+"</td>"+"<td>"+list[i].driveridentity+"</td>"+"<td>"+list[i].driveraccount+"</td>";
		    		   $("#table").append(str+str2);
		    		  }
		      },
		      error:function()
		      {
		    	  alert("读取数据失败！");
		      }  
	   }
			   );
	   var as=document.getElementsByTagName("label");
	   for(var i=0;i<as.length;i++)
		   {
            var label=as[i];
            label.setAttribute("no",i+1);
            label.onclick=function()
            {
            	var n=this.getAttribute("no");
            	var driverno=document.getElementById("table").rows[n-1].cells[1].innerHTML;	
            	var data={};
            	data.driverno=driverno;
            	$.ajax({
            		url:'car/jiechubangding',
            		type:'post',
            		cache:false,
            		async:false,
            		data:data,
            		success:function()
            		{
            			alert("success!");
            			
            		},
            		error:function()
            		{
            			alert("error!");
            		}
            	});
            	location.reload();
            }
		   }
	  
   }
</script>
<body class="navbar-top"  onload="init()">
<div class="modal-shiftfix">
    <jsp:include page="/menu2.jsp"></jsp:include>
    <div class="container-fluid main-content">
        <div class="widget-container fluid-height clearfix">
            <div class="heading clearfix">
                <i class="icon-table"></i> 车辆绑定信息
                <a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
           </div>
            <div class="widget-content padded clearfix">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>车牌号</th>
                        <th>行驶证</th>
                        <th>车辆描述</th>
                        <th>类型</th>
                        <th>驾驶员姓名</th>
                        <th>驾驶员身份证号</th>
                        <th>驾驶员账号</th>
                        <th style="width: 15%;">操作</th>
                    </tr>
                    </thead>
                    <tbody id="table">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
