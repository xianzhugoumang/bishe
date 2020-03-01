package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Driver;
import model.Driverlicense;


@Service
public class Driverlicenseserviceimpl implements Driverlicenseservice {
   
	
	@Resource 
	private DriverlicenseDao driverlicensedao;
	
	@Override
	public Driverlicense selectdriverlicensebycarlicense(String driverlicense) {
		// TODO Auto-generated method stub
		return driverlicensedao.selectdriverlicensebycarlicense(driverlicense);
	}

	@Override
	public void adddriverlicense(Driverlicense driverlicense) {
		// TODO Auto-generated method stub
		driverlicensedao.adddriverlicense(driverlicense);
	}

	@Override
	public void koufen(String driverlicense, int decreasescore) {
		// TODO Auto-generated method stub
		driverlicensedao.koufen(driverlicense, decreasescore);
	}

	@Override
	public void setdriverlicensebydriverlicense(String driverlicnese) {
		// TODO Auto-generated method stub
		driverlicensedao.setdriverlicensebydriverlicense(driverlicnese);
	}

}
