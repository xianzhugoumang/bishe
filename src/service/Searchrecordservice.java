package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import model.Record;
public interface Searchrecordservice {
           public List<Record> selectallrecord(String account);
           public List<Record> selectadmindeleterecord(String account);
           public List<Record> selectadminmodifyrecord(String account);
           public void delerecordbyadminaccount(String recordno);
           public void addreacordbyadminaccount(Record record);
           public Record selectrecordByrecordno(String record);
           public List<Record> selectrecordsbydriveridentity(String driveridentity);
           public List<Record> selectrecordsbydriveridentityandstate(String driveridentity);
           public void updaterecordbysrc(String src);
           public  List<Record> adminselectmonthrecord(); 
           public  List<Record> selectrecordsbycarno(String carno);
           public void   setrecordstatebyrecordno(String recordno);
           public List<Record>  selectrecordsbycarnoinmonth(String carno);
           public  List<Record>  selectrecordsbycarnoinweek(String carno);
           public List<Record>  selectrecordsbycarnoinyear(String carno);
           void showProductsByPage(HttpServletRequest request,HttpSession sesssion,Model model);  
           
}
