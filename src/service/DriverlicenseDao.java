package service;

import model.Driver;
import model.Driverlicense;

public interface DriverlicenseDao {
	 public Driverlicense  selectdriverlicensebycarlicense(String driverlicense);
	 public  void adddriverlicense(Driverlicense driverlicense);
	   public  void koufen(String driverlicense,int  decreasescore );
	   public void adddriverlicensebangding(Driverlicense driverlicense);
	   public  void setdriverlicensebydriverlicense(String driverlicnese);
}
