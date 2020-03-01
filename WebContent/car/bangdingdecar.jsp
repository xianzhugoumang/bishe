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
		      url:'car/getallcarbangdings',
		      type:'post',
		      async:false,
		      cache:false,
		      success:function(list)
		      {
		    	  alert("success!");
		    	  alert(list.length);
		    	  $("#table").html("");
		    	  for (var i=0;i<list.length;i++)
		    		  {
		    		     switch (list[i].cartype) 
		    		    {
						case 1:list[i].cartype="微型轿车";break;
						case 2:list[i].cartype="中型轿车";break;
						case 3:list[i].cartype="重型轿车";break;
						case 4:list[i].cartype="豪华轿车";break;
						default:break;
						}
		    		  var str="<tr>"+"<td>"+list[i].carno+"</td>"+"<td>"+list[i].driverlicense+"</td>"+"<td>"+list[i].cardescrible+"</td>"+"<td>"+list[i].cartype+"</td>"+"<td>"+list[i].drivername+"</td>"+"<td>"+list[i].driveridentity+"</td>"+"<td>"+list[i].driveraccount+"</td>"+'<td><a class="btn btn-primary btn-xs weiBoxs-dialog" href=""> 解除绑定</a></td></tr>';
		    		  $("#table").append(str);  
		    		  }	  	   
		      },
		      error:function()
		      {
		    	  alert("读取数据失败！");
		      }  
	   }
			   );
   }

</script>
<body class="navbar-top"  onload="init()">
<div class="modal-shiftfix">
    <jsp:include page="/menu.jsp"></jsp:include>
    <div class="container-fluid main-content">
        <div class="widget-container fluid-height clearfix">
            <div class="heading clearfix">
                <i class="icon-table"></i> 车辆绑定信息
                <a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
            <!--     <a class="weiBoxs-dialog btn btn-sm btn-primary-outline pull-right" href="product-category/create.html"
                   dialog-title="添加分类"><i class="icon-plus"></i> 添加分类</a> --></div>
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
