package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Driverinfo;

@Service
public class Driverinfoserviceimpl  implements Driverinfoservice {

	@Resource
	private DriverinfoDao driverinfodao;

	@Override
	public Driverinfo selectdriverinfobydriveraccount(String driveraccount) {
		// TODO Auto-generated method stub
		return driverinfodao.selectdriverinfobydriveraccount(driveraccount);
	}

}
