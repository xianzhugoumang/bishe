<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <jsp:include page="/common.jsp"></jsp:include>
<title>Insert title here</title>
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
	   var str=location.href;
	   var num=str.indexOf("=");
	   str=str.substr(num+1);
	  
	   alert(str);
       var data={};
       data.driveraccount=str;
 	   $.ajax({
 		  url:'login/admingetdriverinfo',
 		  type:'post',
 		  data:data,
 		  success:function(Driverinfo)
 		  {   var t=fmtDate(Driverinfo.drivercofigdate);
 			  document.getElementById("driveremail").value=Driverinfo.driveremail;
 			  document.getElementById("driveraccount").value=Driverinfo.driveraccount;
 			  document.getElementById("driverphone").value=Driverinfo.driverphone;
 			  document.getElementById("driverage").value=Driverinfo.driverage;
 			  document.getElementById("driversex").value=Driverinfo.driversex;
 			  document.getElementById("driveridentity").value=Driverinfo.driveridentity;
 			  document.getElementById("drivername").value=Driverinfo.drivername;
 			  document.getElementById("drivercofigdate").value=t;
 			  document.getElementById("drivercarno1").value=Driverinfo.drivercarno1;
 			  document.getElementById("drivercarno2").value=Driverinfo.drivercarno2;
 			  document.getElementById("drivercarno3").value=Driverinfo.drivercarno3;
 			  document.getElementById("driverdriverlicense1").value=Driverinfo.driverdriverlicense1;
 			  document.getElementById("driverdriverlicense2").value=Driverinfo.driverdriverlicense2;
 			  document.getElementById("driverdriverlicense3").value=Driverinfo.driverdriverlicense3;
 			  document.getElementById("driveraddress").value=Driverinfo.driveraddress;
 			  alert("success!");
 		  },
 		  error:function() 
 		   {
 			alert("error!");  
 		   }
 	   });
   }
   
   function modify()
   {
	   document.getElementById("driveraccount").removeAttribute("readonly");
	   document.getElementById("driverphone").removeAttribute("readonly");
	   document.getElementById("driveremail").removeAttribute("readonly");
	   document.getElementById("driverage").removeAttribute("readonly");
	   document.getElementById("driversex").removeAttribute("disabled");
	   document.getElementById("driveridentity").removeAttribute("readonly");
	   document.getElementById("drivername").removeAttribute("readonly");
	   document.getElementById("drivercofigdate").removeAttribute("readonly");
	   document.getElementById("drivercarno1").removeAttribute("readonly");
	   document.getElementById("drivercarno2").removeAttribute("readonly");
	   document.getElementById("drivercarno3").removeAttribute("readonly");
	   document.getElementById("driverdriverlicense1").removeAttribute("readonly");
	   document.getElementById("driverdriverlicense2").removeAttribute("readonly");
	   document.getElementById("driverdriverlicense3").removeAttribute("readonly");
	   document.getElementById("driveraddress").removeAttribute("readonly");
	   document.getElementById("memo").removeAttribute("readonly");


   }
</script>
<body onload="init()">
<jsp:include page="menu.jsp"></jsp:include> 
<table class="table table-bordered" id="no-input-border" width="95%" border="0" cellspacing="1" cellpadding="0">
               <tbody id="table1">
               <tr>
               <th colspan="12" valign="center">个人信息</th>
               <th style="border: none;color:#000;float: right;"> </th>
               </tr>
               <tr style="background-color:#E0E8FF;text-align:center;">                                      
               <td >驾驶员账号</td>
               <td colspan="1">电话号码</td>
               <td colspan="1">电子邮箱</td>
               <td colspan="1">年龄</td>
               <td colspan="1">性别</td> 
               <td colspan="3" rowspan="1">个人形象</td>
               </tr>  
               <tr >
               <td>
               <input type="text" id="driveraccount" class="form-control" readonly="readonly">                                          
               </td>
               <td>
               <input type="text" id="driverphone" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="driveremail" class="form-control" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" id="driverage" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                        <select id="driversex" class="form-control" disabled="disabled">
                                        <option value=0>女</option>
                                        <option value=1>男</option>
                                        </select>
                                        </td>
                                        <td colspan=""  rowspan="3">
                                            <img src="images/adminphoto.jpg" id="driverphoto" alt=""> 
                                        </td>
                                    </tr>
                                    <tr style="background-color:#E0E8FF">
                                        <td>身份证号</td>
                                        <td>姓名</td>
                                        <td>注册日期</td>  
                                        <td>绑定的车牌1</td>
                                        <td>绑定的车牌2</td>
                                    </tr>
                                    <tr style="background-color:#e8e8e8">
                                        <td>
                                            <input type="text" id="driveridentity" class="form-control"  readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="drivername" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="drivercofigdate" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="drivercarno1" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="drivercarno2" class="form-control" readonly="readonly">                                          
                                        </td> 
                                    </tr>
                                    <tr style="background-color:#E0E8FF">
                                    <td>绑定的车牌3</td>
                                    <td>绑定的驾照1</td>
                                    <td>绑定的驾照2</td>
                                    <td>绑定的驾照3</td>
                                    </tr>
                                    <tr style="background-color:#e8e8e8" >
                                    <td><input class="form-control" id="drivercarno3" readonly="readonly"></td>
                                    <td><input class="form-control" id="driverdriverlicense1" readonly="readonly"></td>
                                    <td><input class="form-control" id="driverdriverlicense2" readonly="readonly"></td>
                                    <td><input class="form-control" id="driverdriverlicense3" readonly="readonly"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#E0E8FF;">家庭地址</td>
                                        <td colspan="12">
                                            <input type="text" class="normal_input form-control" name="driveraddress" id="driveraddress" readonly="readonly"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#E0E8FF;">备注</td>
                                        <td colspan="12">
                                            <textarea style="min-height:50px;" name="description"
                                                      class="form-control" id="memo" readonly="readonly">
                                            </textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                               <tfoot>
                                  <!--   <tr>
                                        <td style="text-align:center;" colspan="13">
                                            <input id="createcarpai" class="btn btn-success"  onclick="modify()" type="button" value="点击修改" >&nbsp;
                                            <input id="createcarpai" class="btn btn-danger"  onclick="save()" type="button" value="保存" >&nbsp;                    
                                            <input class="btn btn-default" type="button"  onclick="javascript:history.go(-1)" value="返回">&nbsp;  
                                        </td>
                                    </tr> -->
                              </tfoot>
                         </table>
</body>
</html>