package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.DriverlicensebangdingMapper;
import model.Driverlicensebangding;
@Service
public class DriverlicensebangdingDaoimpl implements DriverlicensebangdingDao{

	
	@Resource
	private DriverlicensebangdingMapper driverlicensebangdingMapper ;
	
	
	public List<Driverlicensebangding> selectalllicensebangdings(String driveraccount) {
		// TODO Auto-generated method stub
		return driverlicensebangdingMapper.selectalllicensebangdings( driveraccount);
	}


	@Override
	public void jiechudriverlicensebangding(String driverlicense) {
		// TODO Auto-generated method stub
		driverlicensebangdingMapper.jiechudriverlicensebangding(driverlicense);
	}


	@Override
	public List<Driverlicensebangding> selectalllicensebangdings() {
		// TODO Auto-generated method stub
		return driverlicensebangdingMapper.selectalllicensebangdings2();
	}


	@Override
	public void adddriverlicensebangding(Driverlicensebangding driverlicensebangding) {
		// TODO Auto-generated method stub
		driverlicensebangdingMapper.adddriverlicensebangding(driverlicensebangding);
	}


	

}
