package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Driver;
@Service
public class DriverserviceImpl implements Driverservice {
 
	@Resource
	private DriverDao driverdao;
	
	
	
	public List<Driver> selectalldrivers() {
		// TODO Auto-generated method stub
		return driverdao.selectalldriver();
	}



	@Override
	public Driver selectdriverbyuseraccount(String useraccount) {
		// TODO Auto-generated method stub
		return driverdao.selectdriverbyuseraccount(useraccount);
	}

}
