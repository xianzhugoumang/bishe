package service;

import java.util.List;

import model.Driverlicense;
import model.Driverlicensebangding;

public interface Driverlicensebangdingservice {
	public List<Driverlicensebangding> selectalllicensebangdings(String driveraccount);
    public void jiechudriverlicensebangding(String driverlicense);
    public List<Driverlicensebangding> selectalllicensebangdings2();
    public void adddriverlicensebangding(Driverlicensebangding driverlicensebangding);
}
