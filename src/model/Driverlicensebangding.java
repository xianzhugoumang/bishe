package model;

public class Driverlicensebangding {
	private String driverlicense;//驾照号
    private String driveraccount;//驾驶员账号
	public String getDriverlicense() {
		return driverlicense;
	}
	public void setDriverlicense(String driverlicense) {
		this.driverlicense = driverlicense;
	}
	public String getDriveraccount() {
		return driveraccount;
	}
	public void setDriveraccount(String driveraccount) {
		this.driveraccount = driveraccount;
	}
	@Override
	public String toString() {
		return "Driverlicensebangding [driverlicense=" + driverlicense + ", driveraccount=" + driveraccount + "]";
	}
    
}
