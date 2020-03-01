package controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Car;
import model.Carbangding;
import model.Carpaiinfo;
import model.Driver;
import service.Carbangdingservice;
import service.Carpaiinfoservice;
import service.Carservice;
import service.Driverservice;

@Controller
@RequestMapping("/car")
public class Carcontrol {
     
	@Resource
	private Carservice carservice;
	@Resource
	private Carbangdingservice carbangdingservice;
	@Resource
	private Driverservice driverservice;
	@Resource
	private Carpaiinfoservice carpaiinfoservice;
	
	@RequestMapping("/bangding")//管理员绑定车辆与用户
	@ResponseBody
	public String bangdingdriverno(Carbangding carbangding,HttpSession session)
	{
		System.out.println(carbangding.getDriveraccount());
	    String driveraccount=carbangding.getDriveraccount();
		Car car=carservice.selectcarinfosbydriverno(carbangding.getDriverno());//取出该条车辆记录
		System.out.println(car.toString());
		Driver driver=driverservice.selectdriverbyuseraccount(driveraccount);//取出该驾驶员信息记录
		System.out.println(driver.toString());
		Carbangding Carbangding=new Carbangding();
		Carbangding.setCardescrible(car.getCardescribe());
		Carbangding.setDriveridentity(driver.getDriveridentity());
		Carbangding.setCarno(car.getCarno());
		Carbangding.setCartype(car.getType());
		Carbangding.setDriverlicense(driver.getDriverlicense());
		Carbangding.setDrivername(driver.getDrivername());
		Carbangding.setDriverno(car.getDriverno());
		Carbangding.setCardescrible(car.getCardescribe());
		Carbangding.setDriveraccount(carbangding.getDriveraccount());
		System.out.println(Carbangding.toString());	
		carbangdingservice.addallcarbangding(Carbangding);
		return "";
	}
	@RequestMapping("/bangdingcar")//驾驶员自己绑定信息
	@ResponseBody
	public void driverbangdingcar(String driverno ,HttpSession session)
	{   String driveraccount=(String) session.getAttribute("useraccount");
	    Car car=carservice.selectcarinfosbydriverno(driverno);
	    Driver driver=driverservice.selectdriverbyuseraccount(driveraccount);//取出该驾驶员信息记录
	  	System.out.println(car.toString());
	  	Carbangding Carbangding=new Carbangding();//新建一个新的绑定信息
	  	Carbangding.setCardescrible(car.getCardescribe());
		Carbangding.setDriveridentity(driver.getDriveridentity());
		Carbangding.setCarno(car.getCarno());
		Carbangding.setCartype(car.getType());
		Carbangding.setDriverlicense(driver.getDriverlicense());
		Carbangding.setDrivername(driver.getDrivername());
		Carbangding.setDriverno(car.getDriverno());
		Carbangding.setDriveraccount(driveraccount);
		System.out.println(Carbangding.toString());	
		carbangdingservice.addallcarbangding(Carbangding);
	}
	
	@RequestMapping("/getallcars")//查询所有车辆信息
	@ResponseBody
	public List<Car> getalldrivers(HttpSession session,HttpServletRequest request)
	{
		List<Driver> driverlists=driverservice.selectalldrivers();
		List<Car> carlists=carservice.selectallcars();
		session.setAttribute("driverlists", driverlists);
		session.setAttribute("carlists", carlists);
		Object t[]=driverlists.toArray();
		for(int i=0;i<driverlists.size();i++)
			System.out.println(t[i].toString());
		Object t1[]=carlists.toArray();
		for(int i=0;i<carlists.size();i++)
			System.out.println(t1[i].toString());
		List<Carbangding> list=carbangdingservice.selectallcarbangdinginfos();
		Object t2[]=list.toArray();
		for(int i=0;i<list.size();i++)
			System.out.println(t2[i].toString());
		for(int j=0;j<carlists.size();j++)//若carlist集合的车辆信息已经被绑定，删除该条信息
		{
			for(int i=0;i<list.size();i++)
			if(carlists.get(j).getDriverno().equals(list.get(i).getDriverno()))
				{carlists.remove(j);
				 break;
				}
				
		}
		Object t3[]=carlists.toArray();
		for(int i=0;i<carlists.size();i++)
			System.out.println(t3[i].toString());
		session.setAttribute("carlistlength", carlists.size());
	
		return carlists;
		}
		
	@RequestMapping("/test")
	@ResponseBody
	public List<Driver> test(Model model,HttpSession session,HttpServletRequest request)
	{   List<Driver> driverlists=driverservice.selectalldrivers();
	    model.addAttribute("driverlist1",driverlists);
	    session.setAttribute("driverlists2", driverlists);
	    request.setAttribute("driverlists3", driverlists);
	    for(int i=0;i<driverlists.size();i++)
	    {
	    	System.out.println(driverlists.get(i).toString());
	    }
		return driverlists;
	}
	
	@RequestMapping("/getallcarbangdings")//获取所有车辆绑定信息
	@ResponseBody
	public List<Carbangding> getallcarbangdings(HttpSession session)
	{
		
		List<Carbangding>allcarbangdings=carbangdingservice.selectallcarbangdinginfos();
		session.setAttribute("allcarbangdings", allcarbangdings);
		return allcarbangdings;
	}
	
	
	@RequestMapping("/getdrivercarbangdings")//获取该驾驶员绑定的车辆信息
	@ResponseBody
	public List<Carbangding> getdrivercarbangdings(HttpSession session)
	{   String driveraccount=(String) session.getAttribute("useraccount");
	System.out.println(driveraccount);
		List<Carbangding> driverbangdings=carbangdingservice.selectcarbangdingsbyuseraccount(driveraccount);
		session.setAttribute("drivercarbangdings",driverbangdings );
		return driverbangdings;
	}
	

	
	@RequestMapping("/getcarinfosbydriverno")//根据驾驶证号查询车辆信息
	@ResponseBody
	public Car getcarsbydriverno(String driverno)
	{   
		Car car=carservice.selectcarinfosbydriverno(driverno);
		System.out.println(car.toString());
		return car;

	}
	@RequestMapping("/getcarinfosbycarno")//根据车牌号查询车辆信息
	@ResponseBody
	public Car getcarsbycarno(String carno)
	{    
		System.out.println(carno);
		Car car=carservice.selectcarinfobycarno(carno.trim());
		System.out.println(car.toString());
		return car;
	}
	
	
	@RequestMapping("/jiechubangding")
	@ResponseBody
	public void jiechubangding(String driverno)
	{
		System.out.println(driverno);
		carbangdingservice.deletecarbangdingbydriverlicense(driverno);
	}
	
	@RequestMapping("/addcarpai")
	@ResponseBody
	public void addcarpai(HttpServletRequest request,Carpaiinfo carpaiinfo)
	{
		Car car=new Car();
		car.setBrandmodel(carpaiinfo.getCarbrandtype());
		car.setCardescribe(carpaiinfo.getCarpaimemo());
		car.setCarno(carpaiinfo.getCarpaino());
		car.setDriverno(carpaiinfo.getDriverno());
		car.setEmissions(carpaiinfo.getCaremissions());
		car.setEnginemodel(carpaiinfo.getCarengineno());
		car.setLicensedate(carpaiinfo.getGrantdate());
	    car.setNextyearcheck(carpaiinfo.getCarnextyearcheck());
	    car.setProductdate(carpaiinfo.getCarproductdate());
	    car.setType(carpaiinfo.getCartype());
	    System.out.println(carpaiinfo.toString());
	    System.out.println(car.toString());
	    carservice.addcar(car);
		carpaiinfoservice.addcarpaiinfo(carpaiinfo);
        System.out.println("test");
		System.out.println(carpaiinfo.toString());
		
	}
	
	
}
