package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Admininfo;
import model.Driverinfo;
import model.Login;
import service.Admininfoservice;
import service.Driverinfoservice;

@Controller
@RequestMapping("/login")
public class LoginControl {
	
	@Resource
	private Loginservice loginservice;
	@Resource
	private Admininfoservice admininfoservice;
	@Resource
	private Driverinfoservice driverinfoservice;
	
	/**
	 * @param login
	 * @return
	 */
	@RequestMapping( "/logincheck")
	@ResponseBody
	public CrmResult login(Login login ,HttpSession session)
	{   CrmResult result=new CrmResult();
		System.out.println(login.getAccount());
		System.out.println(login.getPassword());
		System.out.println(login.getType());
		session.setAttribute("useraccount", login.getAccount());//用户登录后将账号存入session
		login=loginservice.checklogin(login.getAccount(), login.getPassword());
		System.out.println(login.toString());
		if(login==null)
		{  result.setMsg("用户名或密码不正确");
		   result.setData(0);
		   System.out.println("null");
			//model.addAttribute(login);
		}
		else 
		{ if(login.getType()==1)
		{result.setData(1);
		
		}
	
		 if(login.getType()==2)
		{	result.setData(2);
		
		}
		 if(login.getType()==3)
			{result.setData(3);
			
			}
		}
		return result;
	}
	@RequestMapping("/logintoadminhome")
	 public String logintoadminhome()
	 {
		return "redirect:/control/showadminhomepage";
	 }
	
	@RequestMapping("/logintodriverhome")
	 public String logintodriverhome()
	 {  System.out.println("logintodriverhome");
		return "redirect:/control/showdriverhomepage";
	 }
	
     @RequestMapping("/logintopolicehome")
     public  String logintopolicehome()
     {
    	 return  "redirect:/control/showpolicehomepage";
     }
     
     @RequestMapping("/config")
    	 public String config(Login login)
    {   
    	 loginservice.config(login.getAccount(),login.getPassword(),login.getType());
    	 
    	 return "redirect:/login.jsp";
    	 
    }
    	@RequestMapping("/logout")
    	public String logout(HttpSession session)
    	{
    		session.removeAttribute("useraccount");
    		
    		return "redirect:/login.jsp";
    	}
     @RequestMapping("/getadmininfo")
     @ResponseBody
     public Admininfo getadmininfo(HttpSession session)
     {String adminaccount =(String) session.getAttribute("useraccount");
     System.out.println(adminaccount);
    	  Admininfo admininfo=admininfoservice.selectadmininfobyadminaccount(adminaccount);
            System.out.println(admininfo.toString());
            return admininfo;
     }
    	
     @RequestMapping("/getdriverinfo")
     @ResponseBody
     public Driverinfo getdriverinfo(HttpSession session)
     {   String driveraccount=(String) session.getAttribute("useraccount");
         Driverinfo driverinfo=	driverinfoservice.selectdriverinfobydriveraccount(driveraccount); 
         System.out.println(driverinfo.toString());
         return driverinfo;
     }
     
     @RequestMapping("/admingetdriverinfo")
     @ResponseBody
     public Driverinfo admingetdriverinfo(String driveraccount)
     {
    	 
    	 System.out.println(driveraccount);
         Driverinfo driverinfo=driverinfoservice.selectdriverinfobydriveraccount(driveraccount); 
         System.out.println(driverinfo.toString());
         return driverinfo;
     }
     
     
}
