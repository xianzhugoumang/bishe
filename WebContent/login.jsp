<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>交通违章管理系统</title>
      <link rel="stylesheet" href="css/style2.css">
</head>
<style>
 .class{
 background-image:url("images/background.jpg");
 background-repeat:no-repeat;
 background-position:center;
 }
</style>
<body  class="class">
   <div class="form_logo ">
   	<h1>交通违章管理系统</h1>
   </div>
   
  <div class="form">
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      <div class="tab-content">
        <div id="signup">   
            <div class="field-wrap">
              <label>
                           账号为手机号或者邮箱<span class="req">*</span>
              </label>
              <input type="text"  id="accunt_number"required autocomplete="off" />
            </div> 
          <div class="field-wrap">
            <label>
                    密码<span class="req">*</span>
            </label>
            <input type="password"  id="account_password"required autocomplete="off"/>
          </div>
            <div class="field-wrap">
            <label>
                   确认密码<span class="req">*</span>
            </label>
            <input type="password" id="account_password2"required autocomplete="off"/>
          </div>
          
          <div   class="field-wrap">
            <select id="config_type" class="form2" name="priority">
                                    <option value="0">  请选择注册类型</option>
									<option value=1> 驾驶员</option>
									<option value=2> 警员</option>
									<option value=3> 管理员</option>
								</select>
	       </div>		
        <button onclick="config()"  class="button button-block" >确认注册</button>
        </div>
        <div id="login">   
          <form action="" method="post" name="formlogin" id="formlogin" >
            <div class="field-wrap">
            <label>
              请输入用户名<span class="req">*</span>
            </label>
            <input type="text"  name="account" id="account" required autocomplete="off"/>
          </div>  
          <div class="field-wrap">
            <label>
              请输入密码<span class="req">*</span>
            </label>
            <input type="password" name="password" id="password" required autocomplete="off"/>
          </div>
    <div>
      </div>
     <div   class="field-wrap">
            <select id="type" class="form2" name="priority">
                                    <option value="0">  请选择用户类型</option>
									<option value=1> 驾驶员</option>
									<option value=2> 警员</option>
									<option value=3> 管理员</option>
								</select>
	  </div>
      <p class="forgot"><a href="#">Forgot Password?</a></p> 
      </form>
        <button  onclick="login()" class="button button-block">登录</button>
      </div>
      </div><!-- tab-content -->  
      </div> 
      <button  onclick="test1()">test</button>
   </body>      
  <script  type="text/javascript">
     function test1()
     {
    	$.ajax({
    		 url:'control/test',
    		   cache:false,
    		   async:false,
    	        type:'get',
    	        success:function()
    	        {
    	        	alert("success!");
    	        },
    	        error:function()
    	        {
    	        	alert("error!");
    	        }		
    	}) ;
     }
     function config()
    {    
    	var config_type=document.getElementById("config_type").value;
    	alert(config_type);
    	var reg=/^(1\d{10})$/;
    	var re=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
    	var account=document.getElementById("accunt_number").value;
    	var p1=document.getElementById("account_password").value;
    	var password=document.getElementById("account_password2").value;
    	var flag=true;      
    	 if(!(reg.test(account)||re.test(account)))
    		{
    		 flag=false;
    		alert("请输入正确的手机号或者邮箱");
    		document.getElementById("accunt_number").value="";	
    		} 
    	 if(p1!=password)
 		{
    		 flag=false;
    		 alert("两次密码输入不一致！");
 		 document.getElementById("account_password").value="";
 		 document.getElementById("account_password2").value="";
 		}
    	 if(config_type=="0")
    	{	
    		 alert("请选择注册类型！");
    	     flag=false;
    	}
    	 if(flag)
    		 {
    		 var data={};
    		  data.account=account;
    		  data.password=password;
    		  data.type=config_type;
    		  $.ajax({
    			  type:'post',
    			  url:'login/config',
    		      data:data,
    		      cache:false,
    		      sync:true,
    		      success:function ()
    		      {
    		    	  alert("success!");	  
    		      },
    		      error:function()
    		      {
    		    	  alert("error！");
    		      }
    		  }
    				 );
    		 }
      } 
       function login()
       { var user_type=document.getElementById("type").value;
         var a=0;
         if(user_type!="0")
         { 
         var account=document.getElementById("account").value;
       	 var password=document.getElementById("password").value;
       	 var data={};
       	 data.account=account;
       	 data.password=password;
       	 data.type=user_type;
       	 $.ajax({
       		 type:'post',
       		 url:'login/logincheck',
       		 data:data,
       		 async:false,
       		  success:function(result) {    
       			  alert(result.data);
       			  alert(result.msg)
       			  if(result.status==200)
       				  { 
       				   if(result.data=="1")
       					   {
       					 alert("登录成功！");
       					// $("#formlogin1").submit(); 
       					document.formlogin.action="login/logintodriverhome";
       					   }
       				   else if(result.data=="2")
       					   {
       					    alert("登录成功！");
       					 	
       					  document.formlogin.action="login/logintopolicehome";
       					   }
       				   else if(result.data=="3")
       					   {
       					   alert("登陆成功！");
       					  document.formlogin.action="control/showadminhomepage";
       					  /*  $("#formlogin3").submit();  */				   
       					   }
       				   else if(result.data=="0")
       					   {
       					    alert("用户名或密码不正确！");
       					    return;
       					   }	
       				  $("#formlogin").submit();
       				  }     			  				
       		 },
       	     error:function()
       	     {
       	    	 alert("请求失败!"); 
       	     }  
       	 });
         }
         else
        	 alert("请选择用户类型！");
       }
  </script>        
    <script  src='js/remote.js'></script> 
    <script  src="js/index.js"></script>
</html>