package service;

import model.Driver;
import model.Driverlicense;

public interface Driverlicenseservice {
	public Driverlicense  selectdriverlicensebycarlicense(String driverlicense);
	 public  void adddriverlicense(Driverlicense driverlicense);
	 public  void koufen(String driverlicense,int  decreasescore );
	 public  void setdriverlicensebydriverlicense(String driverlicnese);
}
