<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<script>
function bangdingcarlicense()
  {  alert(driverlicense);
     var data={};
    data.carlicense=driverlicense;
    $.ajax({
    	url:'driverlicense/driverlicensebangding',
        type:'post',
        data:data,
        success:function()
        {  
        	alert("success!");
        },
        error:function()
        {
        	alert("error!");
        }
    })  
	}
driverlicense=null;
 function search()
 {    var driverlicenseno=$("#driverlicenseno").val();
	  var data={};
	  data.carlicense=driverlicenseno;
	 
	  var driveridentity=$("#driveridentity").val();
	       
	  $.ajax({
		 url:'driverlicense/getdriverlicensebycarlicenseno',
		 type:'post',
		async:false,
		 data:data,
		 success:function(Driverlicense)
		 {    
			 switch (Driverlicense.licensetype) {
			case 1:
				Driverlicense.licensetype="江苏省交通管理局";
				break;
            case 2:
            	Driverlicense.licensetype="南京市交通管理局";
				break;
            case 3:
            	Driverlicense.licensetype="江宁区交通管理局";
				break;
			default:
				break;
			}
			 
			 if(driveridentity==Driverlicense.driveridentity) //用户输入的身份证和查询的驾照号对应身份证一致
			 {alert("success!");
			 var str2='<td><label class="label label-warning edit" onclick="bangdingcarlicense()"   >绑定</label></td><td><label class="label label-success"    >查看驾照</label></td> </tr>'; 
				$("#table").html("");
				
				var str="<tr>"+"<td>"+Driverlicense.driverlicense+"</td>"+"<td>"+Driverlicense.drivername+"</td>"+"<td>"+Driverlicense.driveridentity+"</td>"+"<td>"+Driverlicense.licensetype+"</td>"+"<td>"+Driverlicense.legaltime+"</td>"+"<td>"+Driverlicense.grantdate+"</td>"+"<td>"+Driverlicense.grantorganization+"</td>";

				 $("#table").append(str+str2);
				 driverlicense=Driverlicense.driverlicense;
			 }
			else alert("输入的身份证号不匹配，查询失败！"); 
				 },
		 error:function()
		 {
			 alert("error!");
		 }
	 }
			 );
	  
 }
</script>
<style>
.style1{
	width:280px;
}
.style2{
    color: #60c560;
    font-size: 20px;
}
.style3{
}
</style>
<body  class="navbar-top">
<div>
  <jsp:include page="/menu2.jsp"></jsp:include>
</div> 

<div class="container-fluid main-content">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="widget-container fluid-height clearfix">
                    <div class="heading clearfix">
                        <i class="icon-table"></i> 驾照绑定
                        <a class="btn btn-sm btn-primary-outline pull-right" href="driverlicense/driverinfo.jsp"><i
                                class="icon-plus"></i> 查看已经绑定的驾照信息</a></div>
                    <div class="widget-content padded clearfix">
                        <div class="dataTables_filter">
                            <div class="row">
                                <div class="col-md-8 col-sm-8">
                                        <div class="btn-group">
                                            <input type="text" class="form-control input-sm" id="driverlicenseno"
                                                   name="name" value="" placeholder="请输入驾照号">
                                        </div>
                                        <br>
                                        <div class="btn-group">
                                            <input type="text" class="form-control input-sm" id="driveridentity"
                                                   name="name" value="" placeholder="请输入该驾照绑定的身份证号">
                                        </div>
                                        <div class="btn-group">
                                            <button class="btn btn-success btn-sm" onclick="search()">点击查询</button>
                                        </div>       
                                </div>
                            </div>
                        </div>
                        <div id="w0" class="grid-view">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th nowrap>驾照号</th>
                                        <th nowrap>驾驶员姓名</th>
                                        <th nowrap>驾驶员身份证号</th>
                                        <th nowrap>准驾车限</th>
                                        <th nowrap>有效期限</th>
                                        <th nowrap>发证日期</th>
                                        <th nowrap>颁发单位</th>
                                        <th nowrap>操作</th>  
                                    </tr>
                                    </thead>
                                    <tbody id="table">                                            
                                    </tbody>
                                </table>
                            </div>
                            <div class="datatable-footer">
                                <div class="dataTables_paginate paging_full_numbers"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>