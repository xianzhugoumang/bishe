package service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import mapper.RecordMapper;
import model.Record;
@Service
public class SearchDaoimpl implements SearchDao {

	/*@Resource 
	private RecordMapper recordmapper;*/
    @Resource
    private RecordMapper recordmapper;
	
	@Override
	public List<Record> selectallrecord(String account) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordbyadmin(account);
	}

	@Override
	public List<Record> selectadmindeleterecord(String account) {
		// TODO Auto-generated method stub
		return recordmapper.selectadmineleterecordbyadmin(account);
	}

	@Override
	public List<Record> selectadminmodifyrecordbyadmin(String account) {
		// TODO Auto-generated method stub
		return recordmapper.selectadminmodifyrecordbyadmin(account);
	}

	@Override
	public void deleterecordbyadminaccount(String recordno) {
		// TODO Auto-generated method stub
		recordmapper.deleterecordbyadminaccount(recordno);
	}

	@Override
	public void addreacordbyadminaccount(Record record) {
		// TODO Auto-generated method stub
		   recordmapper.addreacordbyadminaccount(record);
	}

	public Record selectrecordbyrecordno(String recordno) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordbyrecordno(recordno);
	}

	@Override
	public List<Record> selectrecordsbydriveridentity(String driveridentity) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordsbydriveridentity(driveridentity);
	}

	@Override
	public List<Record> selectrecordsbydriveridentityandstate(String driveridentity) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordsbydriveridentityandstate(driveridentity);
	}

	@Override
	public void updaterecordbysrc(String src) {
		// TODO Auto-generated method stub
		recordmapper.updaterecordbysrc(src);
	}

	@Override
	public List<Record> adminselectmonthrecord() {
		// TODO Auto-generated method stub
		return recordmapper.adminselectmonthrecord();
	}

	@Override
	public List<Record> selectrecordsbycarno(String carno) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordsbycarno(carno);
	}

	@Override
	public void setrecordstatebyrecordno(String recordno) {
		// TODO Auto-generated method stub
		recordmapper.setrecordstatebyrecordno(recordno);
	}

	@Override
	public List<Record> selectrecordsbycarnoinmonth(String carno) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordsbycarnoinmonth(carno);
	}

	@Override
	public List<Record> selectrecordsbycarnoinweek(String carno) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordsbycarnoinweek(carno);
	}

	@Override
	public List<Record> selectrecordsbycarnoinyear(String carno) {
		// TODO Auto-generated method stub
		return recordmapper.selectrecordsbycarnoinyear(carno);
	}

	@Override
	public List<Record> selectProductsByPage(Integer startPos, Integer pageSize) {
		// TODO Auto-generated method stub
		return recordmapper.selectProductsByPage(startPos,pageSize);
	}

	@Override
	public long getrecords() {
		// TODO Auto-generated method stub
		return recordmapper.getrecords();
	}



}
