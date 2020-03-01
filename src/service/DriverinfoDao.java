package service;

import model.Driverinfo;

public interface DriverinfoDao 
{
	 public  Driverinfo selectdriverinfobydriveraccount(String  driveraccount);
}
