package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Message;
import service.Messageservice;
import service.SearchDao;

@Controller
@RequestMapping("/message")
public class messagecontrol {

	@Resource
	private Messageservice messageservice;
	
	@RequestMapping("/searchreceivemessage")
	@ResponseBody
	public List<Message> receivemessage(HttpSession session)
	{    String useraccount=(String) session.getAttribute("useraccount");
	     System.out.println("/searchreceivemessage");
		 List<Message> list=messageservice.selectmessagebyreceiveuseraccount(useraccount);
		 return list;
	}
	
	@RequestMapping("/receiveallmessage")
	@ResponseBody
	public List<Message> receiveallmessage(HttpSession session) throws ParseException
	{   
		String useraccount=(String) session.getAttribute("useraccount");
		System.out.println("/receiveallmessage");
		List<Message>list=messageservice.selectmessagebyreceiveuseraccount(useraccount);
		List<Message> list2=messageservice.selectmessagebysendaccount(useraccount);
		
		list.addAll(list2);
		for(int i=0;i<list.size();i++)
		{   String s=list.get(i).getDate();
		SimpleDateFormat sdf1= new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);//转化日期格式

		SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		list.get(i).setDate(sdf2.format(sdf1.parse(s)));
		}
		session.setAttribute("messagelist", list);
		for(int i=0;i<list.size();i++)
			System.out.println(list.get(i).toString());
		return list;
	}
	@RequestMapping("/searchsendmessage")
	@ResponseBody
	public List<Message> searchsendmessage(HttpSession session)
	{    String useraccount=(String) session.getAttribute("useraccount");
        System.out.println("/searchsendmessage");
	    List<Message> list=messageservice.selectmessagebysendaccount(useraccount);
	   
		return list;
	}
	@RequestMapping("/sendmessage")
	@ResponseBody
	public String sendmessage(Message message,HttpSession session) throws ParseException
	{   
	
		message.setSenduseraccount((String)session.getAttribute("useraccount"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		//得到long类型当前时间
		long l = System.currentTimeMillis();
		//new日期对象
		Date date = new Date(l);
		//转换提日期输出格式
		String messagedate=df.format(date);
		java.util.Date d = df.parse(messagedate); //将字符串转换成日期类型的  
		  java.sql.Date e = new java.sql.Date(d.getTime());//转换成sql类型的日期格式以方便存储到数据库中
		 message.date=e;
		  System.out.println(message.toString());
		messageservice.sendmessage(message);
		return "";
	}
	
	@RequestMapping("/driversendmessage")
	@ResponseBody
	public void driversendmessage(String recordno,String message ,HttpSession session,String type,String messagedate) throws ParseException
	{     String driveraccount=(String) session.getAttribute("useraccount");
		  System.out.println(recordno);
		  System.out.println(message);
		  System.out.println(messagedate);
		  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		  java.util.Date d = df.parse(messagedate); //将字符串转换成日期类型的  
		  java.sql.Date e = new java.sql.Date(d.getTime());//转换成sql类型的日期格式以方便存储到数据库中
		  Message driversendmessage=new Message();
		  driversendmessage.date=e;
		  driversendmessage.setMessage(message);
		  driversendmessage.setReceiveuseraccount("15850682301");
		  driversendmessage.setSenduseraccount(driveraccount);
		  driversendmessage.setState(0);
		  System.out.println(type);
		  driversendmessage.setTheme(type);
		  driversendmessage.setRecordno(recordno);
		  System.out.println(driversendmessage.toString());
		  messageservice.sendmessage(driversendmessage); 
	}
	
	@RequestMapping("/setmessageread")
	@ResponseBody
	public void setmessageread(Message message)
	{     System.out.println(message.toString());
	   
		messageservice.setmessageread(message);	
	}
	
	@RequestMapping("/drivergetreceivedmessage")
	@ResponseBody
	public List<Message>drivergetreceivedmessage(HttpSession session)
	{
		String driveraccount=(String) session.getAttribute("useraccount");
		List<Message>drivermessages=messageservice.selectmessagesbyreceiverunread(driveraccount);
	    return drivermessages;
	}
	
}
