package mapper;

import model.Driver;
import model.Driverlicense;

public interface DriverlicenseMapper {
              public Driverlicense  selectdriverlicensebycarlicense(String driverlicense);//根据驾照号查询驾照信息
              public  void adddriverlicense(Driverlicense driverlicense);
              public  void koufen(String driverlicense ,int decreasescore);
              public  void setdriverlicensebydriverlicense(String driverlicnese);
}
