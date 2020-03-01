package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.DriverlicenseMapper;
import model.Driver;
import model.Driverlicense;

@Service
public class DriverlicenseDaoimpl implements DriverlicenseDao {

	
	@Resource
	private DriverlicenseMapper driverlicensemapper;
	@Override
	public Driverlicense selectdriverlicensebycarlicense(String driverlicense) {
		// TODO Auto-generated method stub
		return driverlicensemapper.selectdriverlicensebycarlicense(driverlicense);
	}
	@Override
	public void adddriverlicense(Driverlicense driverlicense) {
		// TODO Auto-generated method stub
		driverlicensemapper.adddriverlicense(driverlicense);
	}
	@Override
	public void koufen(String driverlicense, int decreasescore) {
		// TODO Auto-generated method stub
		driverlicensemapper.koufen(driverlicense, decreasescore);
	}
	@Override
	public void adddriverlicensebangding(Driverlicense driverlicense) {
		// TODO Auto-generated method stub
		driverlicensemapper.adddriverlicense(driverlicense);
	}
	@Override
	public void setdriverlicensebydriverlicense(String driverlicnese) {
		// TODO Auto-generated method stub
		driverlicensemapper.setdriverlicensebydriverlicense(driverlicnese);
	}
	
	
	
	
}
