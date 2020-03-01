<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>交通违章管理系统</title>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<script>
 function init()
 {
	 $.ajax({
		 url:'login/getdriverinfo',
		 type:'post',
		 success:function(Driverinfo)
		 {    document.getElementById("drivername").value=Driverinfo.drivername;
		      document.getElementById("driveraccount").value=Driverinfo.driveraccount;
		      var driversex=document.getElementById("driversex").value=Driverinfo.driversex;
		     if(driversex==0)
		    	 driversex="女";
		     else
		    	 driversex="男";
		      document.getElementById("driversex").value=driversex;
		      document.getElementById("driveridentity").value=Driverinfo.driveridentity;
		      document.getElementById("driveraddress").value=Driverinfo.driveraddress;
		      document.getElementById("driverphone").value=Driverinfo.driverphone;
		      /*  document.removeChild(document.getElementById(drivercofigdate)); */
		      document.getElementById("drivercofigdate").value=Driverinfo.drivercofigdate; 
		      document.getElementById("drivercarno1").value=Driverinfo.drivercarno1;
		      document.getElementById("driverdriverlicense1").value=Driverinfo.driverdriverlicense1;
		      document.getElementById("drivercarno2").value=Driverinfo.drivercarno2;
		      document.getElementById("driverdriverlicense2").value=Driverinfo.driverdriverlicense2;
		      document.getElementById("driverdriverlicense3").value=Driverinfo.driverdriverlicense3;
		      document.getElementById("driverage").value=Driverinfo.driverage;
		      document.getElementById("driveremail").value=Driverinfo.driveremail;
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
	 document.getElementById("driversex").removeAttribute("readonly");
	 document.getElementById("driveridentity").removeAttribute("readonly");
	 document.getElementById("drivername").removeAttribute("readonly");
	 document.getElementById("drivercofigdate").removeAttribute("readonly");
	 document.getElementById("driveraddress").removeAttribute("readonly");
	 document.getElementById("memo").removeAttribute("readonly");
	 document.getElementById("drivercarno1").removeAttribute("readonly");
	 document.getElementById("drivercarno2").removeAttribute("readonly");
	 document.getElementById("driverdriverlicense1").removeAttribute("readonly");
	 document.getElementById("driverdriverlicense2").removeAttribute("readonly");
	 document.getElementById("driverdriverlicense3").removeAttribute("readonly");
	 document.getElementById("driversex").removeAttribute("disabled");
 }
 
</script>
<style>
.buttonstyle1{
margin-left:250px;
border-radius:4px; 
border:0px;
background-color:#2bd220;
color:#000;
width:100px;
height:40px;
}
.buttonstyle2{
margin-left:250px;
border-radius:4px; 
border:0px;
background-color:#d2ac20;
color:#000;
width:100px;
height:40px;
}
.buttonstyle3{
border-radius:4px; 
border:0px;
background-color:#d22020;
color:#000;
width:100px;
height:40px;
}

.style1{
  width:150px;
  height:150px;
  background-color:#fff;
}
.style2{
  float:left;
  width:60%;
  height:120px;
}
.style3{
 float:right;
 width:40%;
 height:240px;
 background-color:#E0E8FF;
}
</style>
<body class="navbar-top" onload="init()">
<div>
<jsp:include page="/menu2.jsp"></jsp:include>
</div> 
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
                                    <td>绑定的驾照1</td>
                                    <td>绑定的驾照2</td>
                                    <td>绑定的驾照3</td>
                                    </tr>
                                    <tr style="background-color:#e8e8e8" >
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
                                    <tr>
                                        <td style="text-align:center;" colspan="13">
                                            <input id="createcarpai" class="btn btn-success"  onclick="modify()" type="button" value="点击修改" >&nbsp;
                                            <input id="createcarpai" class="btn btn-danger"  onclick="save()" type="button" value="保存" >&nbsp;                    
                                            <input class="btn btn-default" type="button"  onclick="javascript:history.go(-1)" value="返回">&nbsp;  
                                        </td>
                                    </tr>
                              </tfoot>
                         </table>
</body>
</html>