package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Carpaiinfo {
	
            public String getCarpaino() {
		return carpaino;
	}
	public void setCarpaino(String carpaino) {
		this.carpaino = carpaino;
	}
           	private String carpaino;
	        private int   carusetype;
            private int   carpaigrant;
            private int   cartype;
			private String   carpairesponsername;
            private String   carpairesponseridentity;
            private String   carpairesponserphone;
            private String   carpaiownername;
            private String   carpaiowneridentity;
            private int   carpaiownersex;
            private String   carpaiowneraddress;
            private String   carpaimemo;
            private Date   carnextyearcheck;
            private Date   carlastyearcheck;
            private String   carengineno;
            private String   carbrandtype;
            private int   carpaiuselimit;
            private String   cartons;
            private int   caremissions;
            private String   driverno;
            private Date   carproductdate;
            private Date grantdate;
         
			public Date getGrantdate() {
				return grantdate;
			}
			public void setGrantdate(String grantdate) throws ParseException {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				this.grantdate = sdf.parse(grantdate);	
			}
			public int getCarusetype() {
				return carusetype;
			}
			public void setCarusetype(int carusetype) {
				this.carusetype = carusetype;
			}
			public int getCarpaigrant() {
				return carpaigrant;
			}
			public void setCarpaigrant(int carpaigrant) {
				this.carpaigrant = carpaigrant;
			}
			public String getCarpairesponsername() {
				return carpairesponsername;
			}
			public void setCarpairesponsername(String carpairesponsername) {
				this.carpairesponsername = carpairesponsername;
			}
			public String getCarpairesponseridentity() {
				return carpairesponseridentity;
			}
			public void setCarpairesponseridentity(String carpairesponseridentity) {
				this.carpairesponseridentity = carpairesponseridentity;
			}
			public String getCarpairesponserphone() {
				return carpairesponserphone;
			}
			public void setCarpairesponserphone(String carpairesponserphone) {
				this.carpairesponserphone = carpairesponserphone;
			}
			public String getCarpaiownername() {
				return carpaiownername;
			}
			public void setCarpaiownername(String carpaiownername) {
				this.carpaiownername = carpaiownername;
			}
			public String getCarpaiowneridentity() {
				return carpaiowneridentity;
			}
			public void setCarpaiowneridentity(String carpaiowneridentity) {
				this.carpaiowneridentity = carpaiowneridentity;
			}
			public int getCarpaiownersex() {
				return carpaiownersex;
			}
			public void setCarpaiownersex(int carpaiownersex) {
				this.carpaiownersex = carpaiownersex;
			}
			public String getCarpaiowneraddress() {
				return carpaiowneraddress;
			}
			public void setCarpaiowneraddress(String carpaiowneraddress) {
				this.carpaiowneraddress = carpaiowneraddress;
			}
			public String getCarpaimemo() {
				return carpaimemo;
			}
			public void setCarpaimemo(String carpaimemo) {
				this.carpaimemo = carpaimemo;
			}
			public Date getCarnextyearcheck() {
				return carnextyearcheck;
			}
			public void setCarnextyearcheck(String carnextyearcheck) throws ParseException {

				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				this.carnextyearcheck = sdf.parse(carnextyearcheck);	
			}
			public Date getCarlastyearcheck() {
				return carlastyearcheck;
			}
			public void setCarlastyearcheck(String carlastyearcheck) throws ParseException {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				this.carlastyearcheck = sdf.parse(carlastyearcheck);	
			}
			public String getCarengineno() {
				return carengineno;
			}
			public void setCarengineno(String carengineno) {
				this.carengineno = carengineno;
			}
			public String getCarbrandtype() {
				return carbrandtype;
			}
			public void setCarbrandtype(String  carbrandtype) {
				this.carbrandtype = carbrandtype;
			}
			public int getCarpaiuselimit() {
				return carpaiuselimit;
			}
			public void setCarpaiuselimit(int carpaiuselimit) {
				this.carpaiuselimit = carpaiuselimit;
			}
			public String  getCartons() {
				return cartons;
			}
			public void setCartons(String cartons) {
				this.cartons = cartons;
			}
			public int getCaremissions() {
				return caremissions;
			}
			public void setCaremissions(int caremissions) {
				this.caremissions = caremissions;
			}
			public String getDriverno() {
				return driverno;
			}
			public void setDriverno(String driverno) {
				this.driverno = driverno;
			}
			public Date getCarproductdate() {
				return carproductdate;
			}
			public void setCarproductdate(String carproductdate) throws ParseException {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				this.carproductdate = sdf.parse(carproductdate);	
			}
			@Override
			public String toString() {
				return "Carpaiinfo [carpaino=" + carpaino + ", carusetype=" + carusetype + ", carpaigrant="
						+ carpaigrant + ", cartype=" + cartype + ", carpairesponsername=" + carpairesponsername
						+ ", carpairesponseridentity=" + carpairesponseridentity + ", carpairesponserphone="
						+ carpairesponserphone + ", carpaiownername=" + carpaiownername + ", carpaiowneridentity="
						+ carpaiowneridentity + ", carpaiownersex=" + carpaiownersex + ", carpaiowneraddress="
						+ carpaiowneraddress + ", carpaimemo=" + carpaimemo + ", carnextyearcheck=" + carnextyearcheck
						+ ", carlastyearcheck=" + carlastyearcheck + ", carengineno=" + carengineno + ", carbrandtype="
						+ carbrandtype + ", carpaiuselimit=" + carpaiuselimit + ", cartons=" + cartons
						+ ", caremissions=" + caremissions + ", driverno=" + driverno + ", carproductdate="
						+ carproductdate + ", grantdate=" + grantdate + "]";
			}
			  public int getCartype() {
					return cartype;
				}
				public void setCartype(int cartype) {
					this.cartype = cartype;
				}
			
			
}
