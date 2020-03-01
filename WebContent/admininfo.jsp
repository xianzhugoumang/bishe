<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common.jsp"></jsp:include>
</head>
<script>
function modify()
     {   alert("test");
    	 document.getElementById("useraccount").removeAttribute("readonly");
    	 document.getElementById("emplyeeid").removeAttribute("readonly");
    	 document.getElementById("employeeyear").removeAttribute("readonly");
    	 document.getElementById("belongs").removeAttribute("readonly");
    	 document.getElementById("adminidentity").removeAttribute("readonly");
    	 document.getElementById("adminname").removeAttribute("readonly");
    	 document.getElementById("adminphone").removeAttribute("readonly");
    	 document.getElementById("adminaddress").removeAttribute("readonly");
    	 document.getElementById("adminage").removeAttribute("readonly");
    	 document.getElementById("memo").removeAttribute("readonly");
    	 document.getElementById("adminemail").removeAttribute("readonly");
    	 document.getElementById("sex").removeAttribute("disabled");
     }
function init()
   {
	   $.ajax({
		  url:'login/getadmininfo',
		  type:'post',
		  async:false,
		  cache:false,
		  success:function(data)
		  {  alert(data.adminname);
		     $("#adminname").val(data.adminname);//设置管理员字段可以更改
		     $("#adminphone").val(data.adminphone);
		     $("#adminaddress").val(data.adminaddress);
		     $("#adminage").val(data.adminage);
		     $("#memo").val(data.memo);
		     $("#adminemail").val(data.adminemail);
		     $("#adminidentity").val(data.adminidentity);
		     $("#belongs").val(data.belongs);
		     $("#employeeyear").val(data.employeeyear);
		     $("#emplyeeid").val(data.employeeid);
		     $("#useraccount").val(data.useraccount);
		     if(data.adminsex==0)
		    	$("#sex").val("女");
		     if(data.adminsex==1)
		    	$("#sex").val("男");
			    alert("success!"); 
		  },
		  error:function()
		  {
			  alert("error!");
		  }
	   });
   }
   function save()
   {
	  var adminname=document.getElementById("adminname").value;
	  var adminsex=document.getElementById("sex").value;
	  var adminage=document.getElementById("adminage").value;
	  var adminidentity=document.getElementById("adminidentity").value;
	  var adminaddress=document.getElementById("adminaddress").value;
	  var adminphone=document.getElementById("adminphone").value;
	  var adminemployeeid=document.getElementById("emplyeeid").value;
	  var adminemployeeyear=document.getElementById("employeeyear").value;
	  var adminbelongs=document.getElementById("belongs").value;
	  var adminemail=document.getElementById("adminemail").value;
	  var useraccount=document.getElementById("useraccount").value;	
	  alert(adminname);
	  alert(adminsex);
	  alert(adminage);
	  alert(adminidentity);
	  alert(adminaddress);
	  alert(adminphone);
	  alert(adminemployeeid);
	  alert(adminemployeeyear);
	  alert(adminbelongs);
	  alert(adminemail);
	  alert(useraccount);
	  var data={};
	  data.belongs=adminbelongs;  
	  data.adminname=adminname;
	  data.adminsex=adminsex;
	  data.adminage=adminage;
	  data.adminidentity=adminidentity;
      data.adminphone=adminphone; 
      data.belongs=adminbelongs;  
	  data.adminaddress=adminaddress; 
	  data.adminemail=adminemail;
	  data.employeeid=adminemployeeid;
	  data.employeeyear=adminemployeeyear; 
	   $.ajax({
		  url:'control/adminupdateinfo',
		  type:'post',
		  data:data,
		  cache:false,
      	  async:false,
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
</script>
<style>
.inputstyle{
    border-radius: 4px;
    background-color: #fff;
    color:#000;
    border: 0px;
    width: 100%;
    height: inherit;  
}
.divstyle1{
background-color: #ddd;
    float: right;
    width: 80%;
    height: -webkit-fill-available;
}
.divstyle2{
 background-color:#095969;
 float:left;
 width:20%;
 height: -webkit-fill-available;
}
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
</style>
<body  class="navbar-top"   onload="init()">
<jsp:include page="/menu.jsp"></jsp:include>
               <div class="form-body">
                        <div class="row-fluid">
                            <div class="span12">
                                <table class="table table-bordered" id="no-input-border" width="95%" border="0" cellspacing="1" cellpadding="0">
                                    <tbody id="table1">
                                    <tr>
                                        <th colspan="12" valign="center">个人信息</th>
                                        <th style="border: none;color:#000;float: right;"> </th>
                                    </tr>
                                    <tr style="background-color:#E0E8FF;text-align:center;">                                      
                                        <td >管理员账号</td>
                                        <td colspan="1">员工号</td>
                                        <td colspan="1">工龄(年)</td>
                                        <td colspan="1">管理员所属局</td>
                                        <td colspan="1">性别</td> 
                                        <td colspan="3" rowspan="1">个人相册</td>
                                    </tr>  
                                    <tr >
                                        <td>
                                            <input type="text" id="useraccount" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="emplyeeid" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="employeeyear" class="form-control" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" id="belongs" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                        <select id="sex" class="form-control" disabled="disabled">
                                        <option value=0>女</option>
                                        <option value=1>男</option>
                                        </select>
                                        </td>
                                        <td colspan=""  rowspan="3">
                                            <img src="images/adminphoto.jpg" id="adminphoto" alt=""> 
                                        </td>
                                    </tr>
                                    <tr style="background-color:#E0E8FF">
                                        <td>身份证号</td>
                                        <td>姓名</td>
                                        <td>手机号</td>  
                                        <td>年龄(岁)</td>
                                        <td>邮箱</td>
                                    </tr>
                                    <tr style="background-color:#e8e8e8">
                                        <td>
                                            <input type="text" id="adminidentity" class="form-control"  readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="adminname" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="adminphone" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="adminage" class="form-control" readonly="readonly">                                          
                                        </td>
                                        <td>
                                            <input type="text" id="adminemail" class="form-control" readonly="readonly">                                          
                                        </td> 
                                    </tr>     
                                    <tr>
                                        <td style="background-color:#E0E8FF;">家庭地址</td>
                                        <td colspan="12">
                                            <input type="text" class="normal_input form-control" name="address" id="adminaddress" readonly="readonly"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#E0E8FF;">备注</td>
                                        <td colspan="12">
                                            <textarea style="min-height:50px;" name="description"
                                                      class="form-control" id="memo" readonly="readonly"></textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td style="text-align:center;" colspan="13">
                                            <input id="createcarpai" class="btn btn-success"  onclick="modify()" type="button" value="点击修改" >&nbsp;
                                            <input id="createcarpai" class="btn btn-danger"  onclick="save()" type="button" value="保存" >&nbsp;                    
                                            <input class="btn btn-default" type="button"  onclick="javascript:history.go(-1)" value="返回">&nbsp;  
                                    </tr>
                                    </tfoot>
                         </table>
                   </div>
             </div>
       </div>
</body>
</html>