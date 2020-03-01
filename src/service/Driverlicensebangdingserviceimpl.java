package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Driverlicense;
import model.Driverlicensebangding;
@Service
public class Driverlicensebangdingserviceimpl implements Driverlicensebangdingservice {

	
	
	@Resource
	private DriverlicensebangdingDao    driverlicensebangdingDao;

	@Override
	public List<Driverlicensebangding> selectalllicensebangdings(String driveraccount) {
		// TODO Auto-generated method stub
		return driverlicensebangdingDao.selectalllicensebangdings(driveraccount);
	}

	@Override
	public void jiechudriverlicensebangding(String driverlicense) {
		// TODO Auto-generated method stub
		driverlicensebangdingDao.jiechudriverlicensebangding(driverlicense);
	}

	@Override
	public List<Driverlicensebangding> selectalllicensebangdings2() {
		// TODO Auto-generated method stub
		return driverlicensebangdingDao.selectalllicensebangdings();
	}

	@Override
	public void adddriverlicensebangding(Driverlicensebangding driverlicensebangding) {
		// TODO Auto-generated method stub
		driverlicensebangdingDao.adddriverlicensebangding(driverlicensebangding);
	} 

	

}
