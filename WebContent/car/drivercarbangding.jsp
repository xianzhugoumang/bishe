
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<script>

function fmtDate(obj)
{   //将时间戳转化为正常时间显示
    var date =  new Date(obj);
    var y = 1900+date.getYear();
    var m = "0"+(date.getMonth()+1);
    var d = "0"+date.getDate();
    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
}
   


    function bangdingcar()
    {   var send=search();//取出收到的car记录
        alert(send);
    
        var data={};
        data.driverno=send.driverno;
        
    alert(data.driverno);
    	$.ajax({
    	    url:'car/bangdingcar',
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
    	});
    }
	function search() {
		var t=$("#choosesearchstyle").val();
		if(t==1)//按行驶证进行查找
			{
			var driverno=$("#glyphicon-search").val(); 
			var data={};
			data.driverno=driverno;
			var sendcar=null;
			
			$.ajax({
				url:'car/getcarinfosbydriverno',
				type:'post',
				async:false,
				data:data,
				success:function(Car)
				{   
					switch (Car.emissions) {
					case 1: Car.emissions="1.0L以下";  break;
					case 2:Car.emissions="1.0~1.6L之间" ;  break;	
					case 3:Car.emissions="1.6L~2L之间"  ; break;	
					case 4:car.emissions="2L以上"  ; break;
					default:
						break;
					}
					
					switch (Car.type) {
					case 1: Car.type="微型轿车";  break;
					case 2:Car.type="小型轿车" ;  break;	
					case 3:Car.type="中型轿车"  ; break;	
					case 4:car.type="重型轿车"  ; break;
					default:
						break;
					}
					
					
					var l1=fmtDate(Car.productdate);
					
					var l2=fmtDate(Car.nextyearcheck);
					var str2='<td><label class="label label-warning edit" onclick="bangdingcar()"   >绑定</label></td><td><label class="label label-success"    >查看车辆</label></td> </tr>'; 
					$("#table").html("");
					
					var str="<tr>"+"<td>"+Car.driverno+"</td>"+"<td>"+Car.carno+"</td>"+"<td>"+Car.enginemodel+"</td>"+"<td>"+Car.brandmodel+"</td>"+"<td>"+Car.type+"</td>"+"<td>"+Car.emissions+"</td>"+"<td>"+l1+"</td>"+"<td>"+l2+"</td>"+
					"<td>"+Car.licensedate+"</td>" ;
					 $("#table").append(str+str2);
					sendcar=Car;
				},
				error:function()
				{
					alert("查询失败，请输入正确的行驶证号！");
				}
				
			}
					);
			}
		else//按车牌号进行查找
			{
			
			var carno=$("#glyphicon-search").val(); 
			var data={};
			data.carno=carno;
			$.ajax({
				url:'car/getcarinfosbycarno',
				type:'post',
				async:false,
				data:data,
				success:function(Car)
				{   
					switch (Car.emissions) {
					case 1: Car.emissions="1.0L以下";  break;
					case 2:Car.emissions="1.0~1.6L之间" ;  break;	
					case 3:Car.emissions="1.6L~2L之间"  ; break;	
					case 4:car.emissions="2L以上"  ; break;
					default:
						break;
					}
					
					switch (Car.type) {
					case 1: Car.type="微型轿车";  break;
					case 2:Car.type="小型轿车" ;  break;	
					case 3:Car.type="中型轿车"  ; break;	
					case 4:car.type="重型轿车"  ; break;
					default:
						break;
					}
					
                     var l1=fmtDate(Car.productdate);
					var l2=fmtDate(Car.nextyearcheck);
					var l3=fmtDate(Car.licensedate);
					
					var str2='<td><label class="label label-warning edit"   onclick="bangdingcar()" >绑定</label></td><td><label class="label label-success"    >查看车辆</label></td> </tr>'; 
					$("#table").html("");
					
					var str="<tr>"+"<td>"+Car.driverno+"</td>"+"<td>"+Car.carno+"</td>"+"<td>"+Car.enginemodel+"</td>"+"<td>"+Car.brandmodel+"</td>"+"<td>"+Car.type+"</td>"+"<td>"+Car.emissions+"</td>"+"<td>"+l1+"</td>"+"<td>"+l2+"</td>"+
					"<td>"+l3+"</td>" ;
					 $("#table").append(str+str2);
				},
				error:function()
				{
					alert("查询失败，请输入正确的车牌号！");
				}
			}
					);
			}
	/* 	$.ajax({
			url : 'car/getallcars',
			type : 'post',
		  async:false,
			success : function(list)
			{    	
			        var str2='<td><label class="label label-warning edit"    >绑定</label></td>'
			        $("#table").html("");
			        for(var i=0;i<list.length;i++)
			    	 {
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
			           
			    	 str = "<tr>" + "<td>" + list[i].driverno
						+ "</td>" + "<td>" +list[i].carno + "</td>"
						 + "<td>" + list[i].type
						+ "</td>" + "<td>" + list[i].emissions
						+ "</td>" + "<td>" + list[i].productdate + "</td>"+ "<td>" + list[i].nextyearcheck + "</td>"+ "<td>" + list[i].licensedate + "</td>";
			    	 $("#table").append(str+str2);
			    	 }
			        
			        var labels=document.getElementsByTagName("label");
			        alert(labels.length);
			       for(var i=0;i<labels.length;i++)
			          {
			        	var label=labels[i];
			        	label.setAttribute("no",i);
			        	label.onclick=function()
			        	{var t=this.getAttribute("no");
			        	
		        		var driverno=/document.getElementById("table").rows[t].cells[0].innerHTML;
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
			error : function() {
				alert("读取数据异常！");
			}

		}); */
	return sendcar;
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
<body class="navbar-top" >
	<div>
		<jsp:include page="/menu2.jsp"></jsp:include>
	</div>





	<div class="container-fluid main-content">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="widget-container fluid-height clearfix">
					<div class="heading clearfix">
						<i class="icon-table"></i> 车辆绑定 <a
							class="btn btn-sm btn-primary-outline pull-right"
							href="car/driverbangdingdecar.jsp"><i class="icon-plus"></i>
							查看已绑定的车辆信息</a>
					</div>
					<div class="widget-content padded clearfix">
						<div class="dataTables_filter">
							<div class="row">
								<div class="col-md-8 col-sm-8">
									<!-- <form class="form-inline"
										action="http://demo1.weiboxs.com/product/index.html"> -->
										<div class="btn-group"></div>
										<input type="hidden" value="" name="category_id" />

										<div class="btn-group">
											<input type="text" class="form-control input-sm"
												id="glyphicon-search" name="name"  placeholder="请输入行驶证号或者车牌号">
										<select id="choosesearchstyle" class="form-control input-sm">
										<option value=1>按行驶证号查询</option>
										<option value=2>按车牌号号查询</option>   
										</select>
										</div>
										<div class="btn-group">
										
											<button class="btn btn-success btn-sm"  onclick="search()">
										         搜索
											</button>
										</div>
									
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
											<th>发动机号</th>
											<th>品牌型号</th>
											<th nowrap>车辆类型</th>
											<th nowrap>排量</th>
											<th nowrap>生产日期</th>
											<th nowrap>下次年检日期</th>
											<th nowrap>上牌照日期</th>
											<th nowrap>操作</th>
										</tr>
									</thead>
									<tbody id="table">
										
									</tbody>
								</table>
							</div>
							<div class="datatable-footer">
								<div class="dataTables_info">
									
								</div>
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