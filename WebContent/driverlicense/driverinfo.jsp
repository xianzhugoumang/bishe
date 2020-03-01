<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

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


  function init()
  {    
	  $.ajax({
		 url:'driverlicense/getalldriverlicensebangdings',
		 type:'post',
		 success:function(Driverlicense)
		 {   alert("success!");
		 alert(Driverlicense.length)
			 var str2='<td><label class="btn btn-primary btn-xs weiBoxs-dialog" >解除绑定</label></td></tr>'; 
			 $("#table").html("");	
			for(var i=0;i<Driverlicense.length;i++)	
			{ 
				var t=fmtDate(Driverlicense[i].grantdate);
				switch (Driverlicense[i].licensetype)//筛选驾照类别
				{
			case 1:
				Driverlicense[i].licensetype='A1';
				break;
			case 2:
				Driverlicense[i].licensetype='A2';
				break;
			case 3:
				Driverlicense[i].licensetype='A3';
				break;
			case 4:
				Driverlicense[i].licensetype='B1';
				break;
			case 5:
				Driverlicense[i].licensetype='B2';
				break;
			case 6:
				Driverlicense[i].licensetype='B3';
				break;
			case 7:
				Driverlicense[i].licensetype='C1';
				break;
			case 8:
				Driverlicense[i].licensetype='C2';
				break;
			case 8:
				Driverlicense[i].licensetype='C3';
				break;
			default:
				break;
			}
				
			switch (Driverlicense[i].state) {
			case 0:
				Driverlicense[i].state="未吊销";
				break;
            case 1:
            	Driverlicense[i].state="已吊销";
				break;
			default:
				break;
			}

				var str="<tr>"+"<td>"+Driverlicense[i].driverlicense+"</td>"+"<td>"+Driverlicense[i].licensetype+"</td>"+"<td>"+Driverlicense[i].grantorganization+"</td>"+"<td>"+Driverlicense[i].legaltime+"年"+"</td>"+"<td>"+t+"</td>"+"<td>"+Driverlicense[i].drivername+"</td>"+"<td>"+Driverlicense[i].driveridentity+"</td>"+"<td>"+Driverlicense[i].state+"</td>"+"<td>"+Driverlicense[i].restscore+"</td>";
				 $("#table").append(str+str2);
			}
			 
			  var jiechubangding=document.getElementsByTagName("label");
			   alert(jiechubangding.length); 
			   for( var i=0;i<jiechubangding.length;i++)
				  {
				    var label=jiechubangding[i];
				    label.setAttribute("no",i+1);
				    label.onclick=function()
				    {
				    	var n=this.getAttribute("no");
				    	alert(n);
				    	var driverlicense=document.getElementById("table").rows[n-1].cells[0].innerHTML;
				        alert(driverlicense);
				        var data={};
				        data.driverlicense=driverlicense;
				        $.ajax({
				        	url:'driverlicense/jiechudriverlicensebangding',
				            type:'post',
				            data:data,
				            success:function()
				            {alert("success!");
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
</script>


<body class="navbar-top"  onload="init()">
<div class="modal-shiftfix">
    <jsp:include page="/menu2.jsp"></jsp:include>
    <div class="container-fluid main-content">
        <div class="widget-container fluid-height clearfix">
            <div class="heading clearfix">
                <i class="icon-table"></i> 驾照绑定信息
                <a href="javascript:;"
						class="pull-right" onclick="history.go(-1);"><i
						class="icon-reply"></i> </a>
           </div>
            <div class="widget-content padded clearfix">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>驾照号</th>
                        <th>准驾车限</th>
                        <th>颁发单位</th>
                        <th>有效期限</th>
                        <th>初次领证日期</th>
                        <th>驾驶员姓名</th>
                        <th>驾驶员身份证号</th>     
                        <th>是否吊销</th>
                        <th>剩余分数</th>
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
