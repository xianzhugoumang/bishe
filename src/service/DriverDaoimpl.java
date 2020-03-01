package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.DriverMapper;
import model.Driver;
@Service
public class DriverDaoimpl implements DriverDao {
    @Resource
    private DriverMapper
    drivermapper;
	
	@Override
	public List<Driver> selectalldriver() {
		// TODO Auto-generated method stub
		return drivermapper.selectalldriver();
	}

	@Override
	public Driver selectdriverbyuseraccount(String useraccount) {
		// TODO Auto-generated method stub
		return drivermapper.selectdriverbyuseraccount(useraccount);
	}

}
