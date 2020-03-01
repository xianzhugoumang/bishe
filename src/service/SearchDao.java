package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Record;

public interface SearchDao {
   public List<Record> selectallrecord(String account);//查询所有违章记录
   public List<Record> selectadmindeleterecord(String account);//查询管理员删除的所有违章记录
   public List<Record> selectadminmodifyrecordbyadmin(String account);//查询管理员修改的所有记录
   public void deleterecordbyadminaccount(String recordno);//管理员删除记录
   public void addreacordbyadminaccount(Record record);//管理员添加记录
   public Record selectrecordbyrecordno(String recordno);//根据违章号查询违章记录
   public List<Record> selectrecordsbydriveridentity(String driveridentity);//根据驾驶员身份证号查询违章记录
   public List<Record> selectrecordsbydriveridentityandstate(String driveridentity);//根据驾驶员身份证号查询未缴清的违章记录
   public void updaterecordbysrc(String src);
   public  List<Record> adminselectmonthrecord(); 
   public  List<Record> selectrecordsbycarno(String carno);
   public void  setrecordstatebyrecordno(String recordno);
   public List<Record>  selectrecordsbycarnoinmonth(String carno);
   public  List<Record>  selectrecordsbycarnoinweek(String carno);
   public List<Record>  selectrecordsbycarnoinyear(String carno);
   public List<Record> selectProductsByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);  
   public long getrecords();  
}
