package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Car;
import model.Carbangding;
import model.Driverlicense;
import model.Driverlicensebangding;
import model.Login;
import model.Record;
import service.Carbangdingservice;
import service.Driverlicensebangdingservice;
import service.Driverlicenseservice;
import service.Searchrecordservice;

@Controller
@RequestMapping("/search")
public class Searchcontrol {

	@Resource
	private Searchrecordservice searchrecordservice;
	@Resource
	private Carbangdingservice carbangdingservice;
	@Resource 
	private Driverlicensebangdingservice driverlicensebangdingservicel;
	@Resource
	private Driverlicenseservice driverlicenseservice;
	
	@RequestMapping("/adminsearchadd")
	@ResponseBody
	public List<Record> search1(HttpSession session ,HttpServletRequest request) throws UnsupportedEncodingException
	{  
	    
		String useraccount=(String) session.getAttribute("useraccount");
	    System.out.println("flag");
		System.out.println(useraccount);
		List<Record> list=searchrecordservice.selectallrecord(useraccount);
        session.setAttribute("list", list);
        Object[] r= list.toArray();
        System.out.println(r[0].toString());
		System.out.println(list.size());
		
		return list;
	}
	@RequestMapping("/adminsearchdelete")
	@ResponseBody
	public  List<Record> search2(HttpSession session)
	{   
		String useraccount=(String) session.getAttribute("useraccount");
		List<Record> list1=searchrecordservice.selectadmindeleterecord(useraccount);
	    session.removeAttribute("list");
		session.setAttribute("list", list1);
		System.out.println(list1.size());
		return list1;
		
	}
	@RequestMapping("/adminsearchmodify")
	@ResponseBody
	public List<Record>search3(HttpSession session)
	{    System.out.println("adminsearchmodify");
		session.removeAttribute("list");
		String useraccount=(String) session.getAttribute("useraccount");
		List<Record> list2=searchrecordservice.selectadminmodifyrecord(useraccount);
		session.setAttribute("list", list2);
		return list2 ;
		
	}
	@RequestMapping("/deleterecord")
	@ResponseBody
	public List<Record> delete(HttpServletRequest request,HttpSession session,String recordno,Model model)
	{   String useraccount=(String) session.getAttribute("useraccount"); 
		searchrecordservice.delerecordbyadminaccount(recordno.trim());
		List<Record> list=searchrecordservice.selectallrecord(useraccount);
		session.removeAttribute("list");
		session.setAttribute("list", list);
		System.out.println(list.size());
		return list;	
	}
	 
	@RequestMapping("/addrecord")
	@ResponseBody
	public  void addrecord(Record r ,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	 System.out.println("添加过！");
	 System.out.println((String)session.getAttribute("useraccount"));
	 r.setAdminaccount((String)session.getAttribute("useraccount"));
	 System.out.println(r.toString());
	 searchrecordservice.addreacordbyadminaccount(r);
	}

	@RequestMapping("/modifyrecord")
	@ResponseBody
	public Record modify(String recordno)
	{    System.out.println("modify");
	     
		System.out.println(recordno.trim());
		Record r=searchrecordservice.selectrecordByrecordno(recordno.trim());
		System.out.println(r.getCarno());
		System.out.println(r.toString());
		return r;
	}
	@RequestMapping("/searchrecordbyrecordno")
	@ResponseBody
	public Record searchrecordbyrecordno(String recordno)
	{
		 System.out.println(recordno);
		Record record=searchrecordservice.selectrecordByrecordno(recordno);
		return record;
	}
	@RequestMapping("/adminselectmonthrecord")//管理员查询一个月内记录
	@ResponseBody
	public List<Record> adminselectmonthrecord()
	{
		
		return searchrecordservice.adminselectmonthrecord();
	}
	
	
	@RequestMapping("/driversearchrecords")//驾驶员查询与自己相关的所有记录
	@ResponseBody
	public List<Record> driversearchrecords(HttpSession session)
	{
		String driveraccount=(String) session.getAttribute("useraccount");
		
		List<Carbangding> carbangdings=carbangdingservice.selectcarbangdingsbyuseraccount(driveraccount);
		List<String> carnos=new ArrayList<String>();
		for(int i=0;i<carbangdings.size();i++)
			carnos.add(carbangdings.get(i).getCarno());//获取该用户绑定的所有车牌照
		List<Record> records=new ArrayList();
		
		for(int i=0;i<carnos.size();i++)
		{
			List<Record> linshi=searchrecordservice.selectrecordsbycarno(carnos.get(i));
			records.addAll(linshi);
		}
		return records;
		
	}
	
	@RequestMapping("/driversearchmonthrecords")//驾驶员查询自己一个月内的车辆违章记录
	@ResponseBody
	public List<Record> driversearchmonthrecords(HttpSession session)
	{
		String driveraccount=(String) session.getAttribute("useraccount");
		List<Carbangding>  carbangdinglists=carbangdingservice.selectcarbangdingsbyuseraccount(driveraccount);//取出与该驾驶员账户绑定的所有车辆信息;
		List<String> carnos=new ArrayList<String>();
		List<Record> monthlyreocrds=new ArrayList<Record>();
		for(int i=0;i<carbangdinglists.size();i++)
		{
			carnos.add(carbangdinglists.get(i).getCarno());
		}
		for(int i=0;i<carnos.size();i++)
		{
			System.out.println(carnos);
			monthlyreocrds.addAll(searchrecordservice.selectrecordsbycarnoinmonth(carnos.get(i)));
		}
		
		return monthlyreocrds;
	}
	
	@RequestMapping("/driversearchweekrecords")//驾驶员查询自己一周内的车辆违章记录
	@ResponseBody
	public List<Record> driversearchweekrecords(HttpSession session)
	{
		String driveraccount=(String) session.getAttribute("useraccount");
		List<Carbangding>  carbangdinglists=carbangdingservice.selectcarbangdingsbyuseraccount(driveraccount);//取出与该驾驶员账户绑定的所有车辆信息;
		List<String> carnos=new ArrayList<String>();
		List<Record> monthlyreocrds=new ArrayList<Record>();
		for(int i=0;i<carbangdinglists.size();i++)
		{
			carnos.add(carbangdinglists.get(i).getCarno());
		}
		for(int i=0;i<carnos.size();i++)
		{
			System.out.println(carnos);
			monthlyreocrds.addAll(searchrecordservice.selectrecordsbycarnoinweek(carnos.get(i)));
		}
		
		return monthlyreocrds;
	}
	
	@RequestMapping("/driversearchyearrecords")//驾驶员查询自己一周内的车辆违章记录
	@ResponseBody
	public List<Record> driversearchyearrecords(HttpSession session)
	{
		String driveraccount=(String) session.getAttribute("useraccount");
		List<Carbangding>  carbangdinglists=carbangdingservice.selectcarbangdingsbyuseraccount(driveraccount);//取出与该驾驶员账户绑定的所有车辆信息;
		List<String> carnos=new ArrayList<String>();
		List<Record> monthlyreocrds=new ArrayList<Record>();
		for(int i=0;i<carbangdinglists.size();i++)
		{
			carnos.add(carbangdinglists.get(i).getCarno());
		}
		for(int i=0;i<carnos.size();i++)
		{
			System.out.println(carnos);
			monthlyreocrds.addAll(searchrecordservice.selectrecordsbycarnoinyear(carnos.get(i)));
		}
		
		return monthlyreocrds;
	}
	
	
	@RequestMapping("/driverjiaofei")
	@ResponseBody
	public int    driverjiaofei(HttpServletRequest request,String driverlicense)
	{   
		System.out.println(driverlicense);
		String recordno=request.getParameter("recordno");//获取为账号
		System.out.println(recordno);
		String decreasescore=request.getParameter("decreasescore");//获取违章扣分
		System.out.println(decreasescore);
		int score=Integer.parseInt(decreasescore);
		searchrecordservice.setrecordstatebyrecordno(recordno);//设置该条违章记录已经缴费
		Driverlicense driverlicense1=driverlicenseservice.selectdriverlicensebycarlicense(driverlicense);
		int restscore=driverlicense1.getRestscore();
		System.out.println(driverlicense1.getRestscore());	
		
		if(restscore<0)
			{
			String driverlicenseno=driverlicense1.getDriverlicense();
			driverlicenseservice.setdriverlicensebydriverlicense(driverlicenseno);
			return 0;
			}
		else
		{	driverlicenseservice.koufen(driverlicense, score);//从选中驾照扣去分数
			return 1;
		}
	}
	@RequestMapping("/getalldriverlicenses")
	@ResponseBody
	public List<String > getalldriverlicenses(HttpSession session)
	{
		String driveraccount=(String) session.getAttribute("useraccount");
		System.out.println("test");
		List<Driverlicensebangding> driverlicenses=driverlicensebangdingservicel.selectalllicensebangdings(driveraccount);
		session.setAttribute("relatedlicenses", driverlicenses);
		List<String> licenses=new ArrayList<String>();
		for(int i=0;i<driverlicenses.size();i++)
		{
			licenses.add(driverlicenses.get(i).getDriverlicense());
		}
		
	    return licenses;
	}
	
	
	
	
}
