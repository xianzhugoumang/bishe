package mapper;

import java.util.List;

import model.Driverlicense;
import model.Driverlicensebangding;

public interface DriverlicensebangdingMapper {
	    
    public List<Driverlicensebangding> selectalllicensebangdings(String driveraccount);//查询所有驾照绑定信息
    public void jiechudriverlicensebangding(String driverlicense);//根据驾照号解除绑定信息
    public List<Driverlicensebangding> selectalllicensebangdings2();//查询所有绑定信息
    public void adddriverlicensebangding(Driverlicensebangding driverlicensebangding);
}
