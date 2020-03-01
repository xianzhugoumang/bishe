package model;

import java.util.Date;

public class Carbangding {
	         private String driverno;
	         private String carno;
	         private int cartype;
	         private String drivername;
	         private String driverlicense;
		     private String cardescrible;
		   /*  public Carbangding(String driverno, String carno, int cartype, String drivername, String driverlicense,
					String cardescrible, String driveridentity, String driveraccount) {
				super();
				this.driverno = driverno;
				this.carno = carno;
				this.cartype = cartype;
				this.drivername = drivername;
				this.driverlicense = driverlicense;
				this.cardescrible = cardescrible;
				this.driveridentity = driveridentity;
				this.driveraccount = driveraccount;
			}
		    */
			private String driveridentity;
		     public Carbangding() {
				
				this.driverno=null;
				this.carno=null;
				this.cartype=0;
				this.drivername=null;
				this.cardescrible=null;
				this.driverlicense=null;
				this.driveridentity=null;
			}
			private String driveraccount;
	         public String getDriveraccount() {
				return driveraccount;
			}
			public void setDriveraccount(String driveraccount) {
				this.driveraccount = driveraccount;
			}
			public  String getDrivername() {
				return drivername;
			}
			public void setDrivername(String drivername) {
				this.drivername = drivername;
			}
			
	         public String getCardescrible() {
				return cardescrible;
			}
			public void setCardescrible(String cardescrible) {
				this.cardescrible = cardescrible;
			}
			
			public String getDriverno() {
				return driverno;
			}
			public void setDriverno(String driverno) {
				this.driverno = driverno;
			}
			public String getCarno() {
				return carno;
			}
			public void setCarno(String carno) {
				this.carno = carno;
			}
			public int getCartype() {
				return cartype;
			}
			public void setCartype(int cartype) {
				this.cartype = cartype;
			}
		
			public String getDriverlicense() {
				return driverlicense;
			}
			public void setDriverlicense(String driverlicense) {
				this.driverlicense = driverlicense;
			}
		
		
			public String getDriveridentity() {
				return driveridentity;
			}
			public void setDriveridentity(String driveridentity) {
				this.driveridentity = driveridentity;
			}
			@Override
			public String toString() {
				return "Carbangding [driverno=" + driverno + ", carno=" + carno + ", cartype=" + cartype
						+ ", drivername=" + drivername + ", driverlicense=" + driverlicense + ", cardescrible="
						+ cardescrible + ", driveridentity=" + driveridentity + ", driveraccount=" + driveraccount
						+ "]";
			}
			
		
             
             
}
