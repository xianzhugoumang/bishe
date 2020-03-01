package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.Admininfo;
import model.Carbangding;
import model.Driver;
import model.Login;
import model.Message;
import model.Record;
import service.Admininfoservice;
import service.Carbangdingservice;
import service.Driverservice;
import service.Messageservice;
import service.Searchrecordservice;
@Controller
@RequestMapping("/control")
public class ALLcontrol {
	
	@Resource  
	private Searchrecordservice searchrecordservice;
	@Resource
	private Driverservice driverservice;
	@Resource
	private Messageservice messaageservice;
	@Resource
	private Carbangdingservice carbangdingservice;
	@Resource
	private Admininfoservice admininfoservice;
	
	
   @RequestMapping("/showadminhomepage")
	public String logintoadminhome(Login login)
	{   System.out.println("control/adminhomepage");
	    System.out.println(login.getAccount());
	    System.out.println(login.getPassword());
	    System.out.println(login.getType());
		return "admininfo";	
	}
	@RequestMapping("/showpolicehomepage")
	
		public String logintopolicehome()
		{
		return "policehomepage";
		}
	@RequestMapping("/showdriverhomepage")//驾驶员登录
	public String logintodriverhome(HttpSession session)
	{
		String driveraccount=(String)session.getAttribute("useraccount");
		Driver driver=driverservice.selectdriverbyuseraccount(driveraccount);
		String driveridentity=driver.getDriveridentity();//拿到driver的identity;
		System.out.println(driveridentity);
		List<Record> drivervolientrecords=searchrecordservice.selectrecordsbydriveridentity(driveridentity);//该驾驶员所有的违章记录(之后要修改为近一个月内)
		session.setAttribute("alldriverrecordnums", drivervolientrecords.size());
		session.setAttribute("driverrecords", drivervolientrecords);
		List<Record> driverdaijiaofeirecords=searchrecordservice.selectrecordsbydriveridentityandstate(driveridentity);//该驾驶员所有未交费的违章记录
		session.setAttribute("daijiaofeirecordsnum",driverdaijiaofeirecords.size());
		List<Message> driverunreadmessages=messaageservice.selectmessagesbyreceiverunread(driveraccount);//该驾驶员所有未读的留言
		session.setAttribute("unreadmessagesnums", driverunreadmessages.size());
		List<Message> driverreceivedmessages=messaageservice.selectmessagebyreceiveuseraccount(driveraccount);//该驾驶员收到的所有留言
		session.setAttribute("driverreceivedmessages", driverreceivedmessages);
		List<Carbangding> bangdingdecars=carbangdingservice.selectcarbangdingsbyuseraccount(driveraccount);//查询该驾驶员已经绑定的车辆信息
		if(bangdingdecars.size()==0)
		{
			session.setAttribute("havebangdinged", false);
			System.out.println(bangdingdecars.size());
		}
		else
		{
			session.setAttribute("havebangdinged", true);
			System.out.println(bangdingdecars.size());
		}
		System.out.println(driverunreadmessages.size());
		System.out.println(drivervolientrecords.size());
        System.out.println(driverdaijiaofeirecords.size());
	return "driverhomepage";
	}
	
  
	@RequestMapping("/addphoto")
	
	public String  fileUpload(MultipartFile file,HttpServletRequest request, ModelMap map) throws IOException 
	{
        //图片上传成功后，将图片的地址写到数据库
		String s=request.getParameter("record_no");
		System.out.println(s);
        String filePath = "H:\\eclipse项目\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\bishe\\images";//保存图片的路径    
        //获取原始图片的拓展名
        String originalFilename = file.getOriginalFilename();
        //新的文件名字
        String newFileName = UUID.randomUUID()+originalFilename;
        //封装上传文件位置的全路径
        File targetFile = new File(filePath,newFileName);
        System.out.println(newFileName);
        searchrecordservice.updaterecordbysrc("images/"+newFileName);
        //把本地文件上传到封装上传文件位置的全路径
        file.transferTo(targetFile);
        return "adminaddrecord";
    }
	
	@RequestMapping(value="/myProductPage",method=RequestMethod.GET)

	public String myProductPage(HttpServletRequest request,HttpSession session,Model model)
	{
		this.searchrecordservice.showProductsByPage(request,session, model);
		return "adminrecord";
	}
	
	
	@RequestMapping("/test")
	@ResponseBody
	public void  showMyProduct(HttpServletRequest request, HttpSession session,Model model) {  
	    //此处的productService是注入的IProductService接口的对象  
	    this.searchrecordservice.showProductsByPage(request,session, model);  
	     System.out.println("test");
	   
	} 
	
	@RequestMapping("/adminupdateinfo")
	@ResponseBody
	public void adminupdateinfo(HttpSession session,Admininfo admininfo,String belongs)
	{    System.out.println("test");
		System.out.println(belongs);
		String adminaccount=(String) session.getAttribute("useraccount");
		admininfo.setUseraccount(adminaccount);
		System.out.println(admininfo.toString());
		admininfoservice.updateadmininfobyadminaccount(admininfo);
	}
	
	@RequestMapping("/test1")
	public String test1()
	{
		return "redirect:test?param1=1";
		
	}
	
	
	
}
