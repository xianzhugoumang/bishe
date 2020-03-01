package service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import mapper.DriverinfoMapper;
import model.Driverinfo;

@Service
public class DriverinfoDaoimpl  implements DriverinfoDao
{

	@Resource
	private DriverinfoMapper driverinfomapper;

	@Override
	public Driverinfo selectdriverinfobydriveraccount(String driveraccount) {
		// TODO Auto-generated method stub
		return driverinfomapper.selectdriverinfobydriveraccount(driveraccount);
	}

}
