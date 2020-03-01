package model;

public class Driver {
                 private String drivername;
                 private String driveridentity;
                 public String getDriveridentity() {
					return driveridentity;
				}
				public void setDriveridentity(String driveridentity) {
					this.driveridentity = driveridentity;
				}
				private int sex;
                 private String useraccount;
                 private String driverlicense;
				public String getDriverlicense() {
					return driverlicense;
				}
				public void setDriverlicense(String driverlicense) {
					this.driverlicense = driverlicense;
				}
				public String getDrivername() {
					return drivername;
				}
				public void setDrivername(String drivername) {
					this.drivername = drivername;
				}
			
				public int getSex() {
					return sex;
				}
				public void setSex(int sex) {
					this.sex = sex;
				}
				public String getUseraccount() {
					return useraccount;
				}
				public void setUseraccount(String useraccount) {
					this.useraccount = useraccount;
				}
				@Override
				public String toString() {
					return "Driver [drivername=" + drivername + ", driveridentity=" + driveridentity + ", sex=" + sex
							+ ", useraccount=" + useraccount + ", driverlicense=" + driverlicense + "]";
				}			
}
