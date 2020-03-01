package controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import model.Driverlicense;
import model.Driverlicensebangding;
import model.Driverlicensebangdings;
import service.Driverlicensebangdingservice;
import service.Driverlicenseservice;

@Controller
@RequestMapping("/driverlicense")
public class Driverlicensecontrol {

	@Resource
	private Driverlicenseservice driverlicenseservice;
	@Resource
	private Driverlicensebangdingservice driverlicensebangdingservice;
	@RequestMapping("/getdriverlicensebycarlicenseno")
	@ResponseBody
	public Driverlicense getdriverlicensebycarlicenseno(String carlicense)
	{    Driverlicense driverlicense=driverlicenseservice.selectdriverlicensebycarlicense(carlicense);
		 System.out.println(driverlicense.toString());
	     return  driverlicense;
	}
	
	
	
	@RequestMapping("/getalldriverlicensebangdings")//查询某驾驶员所有驾照绑定信息
	@ResponseBody
	public List<Driverlicense> getalldriverlicensebangdings(HttpSession session)
	{   String driveraccount=(String) session.getAttribute("useraccount");
	    List<Driverlicensebangding> Driverlicensebangdings=driverlicensebangdingservice.selectalllicensebangdings(driveraccount);
		for(int i=0;i<Driverlicensebangdings.size();i++)
		{
			System.out.println(Driverlicensebangdings.get(i).toString());
		}
	    List<Driverlicense> Driverlicenses=new ArrayList<Driverlicense>();
	    for(int i=0;i<Driverlicensebangdings.size();i++)//取出该驾驶员绑定的所有驾照号再找出驾照信息
	    	{String driverlicense=Driverlicensebangdings.get(i).getDriverlicense();
	    	Driverlicense driverlicense_i=driverlicenseservice.selectdriverlicensebycarlicense(driverlicense);	
	    	Driverlicenses.add(driverlicense_i);
	    	}
	    for(int i=0;i<Driverlicenses.size();i++)
	    {
	    System.out.println(Driverlicenses.get(i).toString());
	    }
		return Driverlicenses;
	}
	
	@RequestMapping("/jiechudriverlicensebangding")
	@ResponseBody
	public void jiechudriverlicensebangding(String driverlicense)
	{   
		System.out.println(driverlicense);
		driverlicensebangdingservice.jiechudriverlicensebangding(driverlicense);
	}
	
	@RequestMapping("/addriverlicense")
	@ResponseBody
	public void addriverlicense(Driverlicense driverlicense)
	{
		System.out.println(driverlicense.toString());
		driverlicense.setRestscore(12);
		driverlicense.setState(0);
		driverlicenseservice.adddriverlicense(driverlicense);	
	}
	@RequestMapping("/getalllicensebangdings")
	@ResponseBody
	public List<Driverlicensebangdings> getalllicensebangdings()
	{
		List<Driverlicensebangdings>Driverlicensebangdings=new ArrayList<Driverlicensebangdings>();
	    List<Driverlicensebangding> Driverlicensebangding=driverlicensebangdingservice.selectalllicensebangdings2();
		for(int i=0;i<Driverlicensebangding.size();i++)
		{
			 String driveraccount=Driverlicensebangding.get(i).getDriveraccount();
		     String driverlicenseno=Driverlicensebangding.get(i).getDriverlicense();
		     Driverlicense  driverlicense=driverlicenseservice.selectdriverlicensebycarlicense(driverlicenseno);
		     Driverlicensebangdings driverlicensebangdings=new Driverlicensebangdings();
		     driverlicensebangdings.setDriveraccount(driveraccount);
		     driverlicensebangdings.setDriveridentity(driverlicense.getDriveridentity());
		     driverlicensebangdings.setDriverlicense(driverlicense.getDriverlicense());
		     driverlicensebangdings.setDrivername(driverlicense.getDrivername());
		     driverlicensebangdings.setGrantdate(driverlicense.getGrantdate());
		     driverlicensebangdings.setGrantorganization(driverlicense.getGrantorganization());
		     driverlicensebangdings.setLegaltime(driverlicense.getLegaltime());
		     driverlicensebangdings.setLicensetype(driverlicense.getLicensetype());
		     driverlicensebangdings.setRestscore(driverlicense.getRestscore());
		     driverlicensebangdings.setState(driverlicense.getState());
		     Driverlicensebangdings.add(driverlicensebangdings);
		     System.out.println(Driverlicensebangding.toString());
		}
	    return  null;   
	}

	@RequestMapping("/driverlicensebangding")
	@ResponseBody
	public void driverlicensebangding(String carlicense,HttpSession session)
	{   
		System.out.println(carlicense);
		Driverlicensebangding driverlicensebangding=new Driverlicensebangding();
		String useraccount=(String) session.getAttribute("useraccount");
		driverlicensebangding.setDriveraccount(useraccount);
		driverlicensebangding.setDriverlicense(carlicense);
	    System.out.println(driverlicensebangding.toString());
		driverlicensebangdingservice.adddriverlicensebangding(driverlicensebangding);
	    
	}
	
}
