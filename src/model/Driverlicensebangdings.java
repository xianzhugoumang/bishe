package model;

import java.util.Date;

public class Driverlicensebangdings {

	private String driverlicense;//驾照号
    private String driveraccount;//驾驶员账号
	private String drivername;//驾驶人姓名
	private int restscore;//剩余分数
	private Date grantdate;//颁布日期
	private int state;//状态
	private int licensetype;//准驾类型
	private String driveridentity;//驾驶人身份证号
	private int legaltime;//有效年限
	private String grantorganization;//颁发单位
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
	public String getDrivername() {
		return drivername;
	}
	public void setDrivername(String drivername) {
		this.drivername = drivername;
	}
	public int getRestscore() {
		return restscore;
	}
	public void setRestscore(int restscore) {
		this.restscore = restscore;
	}
	public Date getGrantdate() {
		return grantdate;
	}
	public void setGrantdate(Date grantdate) {
		this.grantdate = grantdate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getLicensetype() {
		return licensetype;
	}
	public void setLicensetype(int licensetype) {
		this.licensetype = licensetype;
	}
	public String getDriveridentity() {
		return driveridentity;
	}
	public void setDriveridentity(String driveridentity) {
		this.driveridentity = driveridentity;
	}
	public int getLegaltime() {
		return legaltime;
	}
	public void setLegaltime(int legaltime) {
		this.legaltime = legaltime;
	}
	public String getGrantorganization() {
		return grantorganization;
	}
	public void setGrantorganization(String grantorganization) {
		this.grantorganization = grantorganization;
	}
	@Override
	public String toString() {
		return "Driverlicensebangdings [driverlicense=" + driverlicense + ", driveraccount=" + driveraccount
				+ ", drivername=" + drivername + ", restscore=" + restscore + ", grantdate=" + grantdate + ", state="
				+ state + ", licensetype=" + licensetype + ", driveridentity=" + driveridentity + ", legaltime="
				+ legaltime + ", grantorganization=" + grantorganization + "]";
	}
	
	
	
}
