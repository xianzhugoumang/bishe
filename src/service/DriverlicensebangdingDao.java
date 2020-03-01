package service;

import java.util.List;

import model.Driverlicensebangding;

public interface DriverlicensebangdingDao {
	public List<Driverlicensebangding> selectalllicensebangdings(String driveraccount);
    public void jiechudriverlicensebangding(String driverlicense);
    public List<Driverlicensebangding> selectalllicensebangdings();
    public void adddriverlicensebangding(Driverlicensebangding driverlicensebangding);
}