package service;

import java.util.List;

import model.Driver;

public interface Driverservice {

	public List<Driver> selectalldrivers();

	public Driver selectdriverbyuseraccount(String useraccount);
	
	
}
