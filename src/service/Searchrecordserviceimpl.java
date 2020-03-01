package service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.github.pagehelper.Page;

import model.Record;

import java.io.Serializable;  
@Service
public class Searchrecordserviceimpl implements Searchrecordservice{
	@Resource
	private SearchDao searchdao;
	@Override
	public List<Record>selectallrecord(String account) {
		
		List<Record> list=searchdao.selectallrecord(account);
		return list;
	}
	@Override
	public List<Record> selectadmindeleterecord(String account) {
		// TODO Auto-generated method stub
		List<Record> list=searchdao.selectadmindeleterecord(account);
		return list;
	}
	@Override
	public List<Record> selectadminmodifyrecord(String account) {
		// TODO Auto-generated method stub
		List<Record> list=searchdao.selectadminmodifyrecordbyadmin(account);
		return list;
	}
	@Override
	public void delerecordbyadminaccount(String recordno) {
	          
		searchdao.deleterecordbyadminaccount(recordno);
	}
	@Override
	public void addreacordbyadminaccount(Record record) {
		searchdao.addreacordbyadminaccount(record);
		
	}
	@Override
	public Record selectrecordByrecordno(String record) {
		// TODO Auto-generated method stub
		return searchdao.selectrecordbyrecordno(record);
	}
	@Override
	public List<Record> selectrecordsbydriveridentity(String driveridentity) {
		// TODO Auto-generated method stub
		return searchdao.selectrecordsbydriveridentity(driveridentity);
	}
	@Override
	public List<Record> selectrecordsbydriveridentityandstate(String driveridentity) {
		// TODO Auto-generated method stub
		return searchdao.selectrecordsbydriveridentityandstate(driveridentity);
	}
	@Override
	public void updaterecordbysrc(String src) {
		// TODO Auto-generated method stub
		searchdao.updaterecordbysrc(src);
	}
	@Override
	public List<Record> adminselectmonthrecord() {
		// TODO Auto-generated method stub
		return searchdao.adminselectmonthrecord();
	}
	@Override
	public List<Record> selectrecordsbycarno(String carno) {
		// TODO Auto-generated method stub
		return searchdao.selectrecordsbycarno(carno);
	}
	@Override
	public void setrecordstatebyrecordno(String recordno) {
		// TODO Auto-generated method stub
		searchdao.setrecordstatebyrecordno(recordno);
	}
	@Override
	public List<Record> selectrecordsbycarnoinmonth(String carno) {
		// TODO Auto-generated method stub
		return searchdao.selectrecordsbycarnoinmonth(carno);
	}
	@Override
	public List<Record> selectrecordsbycarnoinweek(String carno) {
		// TODO Auto-generated method stub
		return searchdao.selectrecordsbycarnoinweek(carno);
	}
	@Override
	public List<Record> selectrecordsbycarnoinyear(String carno) {
		// TODO Auto-generated method stub
		return searchdao.selectrecordsbycarnoinyear(carno);
	}
	@Override
	public void showProductsByPage(HttpServletRequest request, HttpSession sesssion,Model model) {
		 String pageNow = request.getParameter("pageNow");  
		    
		   service.Page page = null; 
		
		  
		    List<Record> allrecordnos = new ArrayList<Record>();  
		  
		    int totalCount = (int) searchdao.getrecords();  
		    System.out.println(totalCount);
		    if (pageNow != null) {  
		    	page= new service.Page(totalCount,Integer.parseInt(pageNow));
		        
		          allrecordnos = this.searchdao.selectProductsByPage(page.getStartPos(), page.getPageSize());
		         System.out.println(allrecordnos.size());
		    } else {  
		    	page= new service.Page(totalCount,1);
		       allrecordnos = this.searchdao.selectProductsByPage(page.getStartPos(), page.getPageSize());  
		      System.out.println(allrecordnos.size()); 
		    }  
		  
		    model.addAttribute("recordslist", allrecordnos); 
		    for(int i=0;i<allrecordnos.size();i++)
		    {
		    	
		    	
		    	System.out.println(allrecordnos.get(i).toString());
		    
		    }
		   
		    model.addAttribute("page", page);  
		
		
		
		
		
	}
	
}
