package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Message;
import model.Record;

public interface RecordMapper {
   List<Record> selectrecordbyadmin(String account);
   List<Record> selectadmineleterecordbyadmin(String account);
   List<Record> selectadminmodifyrecordbyadmin(String account);
   List<Record> selectrecordsbydriveridentity(String driveridentity);
   List<Record> selectrecordsbydriveridentityandstate(String driveridentity);
   void deleterecordbyadminaccount(String recordno);
   void addreacordbyadminaccount(Record record);
   Record selectrecordbyrecordno(String recordno);
   void updaterecordbysrc(String src);
   List<Record> adminselectmonthrecord();
   List<Record> selectrecordsbycarno(String carno);
   void  setrecordstatebyrecordno(String recordno);
   List<Record>  selectrecordsbycarnoinmonth(String carno);
   List<Record>  selectrecordsbycarnoinweek(String carno);
   List<Record>  selectrecordsbycarnoinyear(String carno);
   List<Record> selectProductsByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);  
   long getrecords();  
  
                
} 
