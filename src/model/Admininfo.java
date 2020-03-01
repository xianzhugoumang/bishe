package model;

public class Admininfo {

	private  String useraccount;
	private String employeeid;
	private String adminphone;
	private String belongs;
	private String adminidentity;
	private String adminaddress;
	private String adminname;
	private int  adminsex;//管理员性别
    private int employeeyear;//工龄
	private int adminage;//管理员年龄
	private String adminemail;
	private int adminstate;
	public String getAdminemail() {
		return adminemail;
	}
	public void setAdminemail(String adminemail) {
		this.adminemail = adminemail;
	}
	public String getUseraccount() {
		return useraccount;
	}
	public void setUseraccount(String useraccount) {
		this.useraccount = useraccount;
	}
	public String getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}
	public String getAdminphone() {
		return adminphone;
	}
	public void setAdminphone(String adminphone) {
		this.adminphone = adminphone;
	}
	public String getBelongs() {
		return belongs;
	}
	public void setBelongs(String belongs) {
		this.belongs = belongs;
	}
	public String getAdminidentity() {
		return adminidentity;
	}
	public void setAdminidentity(String adminidentity) {
		this.adminidentity = adminidentity;
	}
	public String getAdminaddress() {
		return adminaddress;
	}
	public void setAdminaddress(String adminaddress) {
		this.adminaddress = adminaddress;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public int getAdminsex() {
		return adminsex;
	}
	public void setAdminsex(int adminsex) {
		this.adminsex = adminsex;
	}
	public int getEmployeeyear() {
		return employeeyear;
	}
	public void setEmployeeyear(int employeeyear) {
		this.employeeyear = employeeyear;
	}
	public int getAdminage() {
		return adminage;
	}
	public void setAdminage(int adminage) {
		this.adminage = adminage;
	}
    
	
	public int getAdminstate() {
		return adminstate;
	}
	public void setAdminstate(int adminstate) {
		this.adminstate = adminstate;
	}
	@Override
	public String toString() {
		return "Admininfo [useraccount=" + useraccount + ", employeeid=" + employeeid + ", adminphone=" + adminphone
				+ ", belongs=" + belongs + ", adminidentity=" + adminidentity + ", adminaddress=" + adminaddress
				+ ", adminname=" + adminname + ", adminsex=" + adminsex + ", employeeyear=" + employeeyear
				+ ", adminage=" + adminage + ", adminemail=" + adminemail + ", adminstate=" + adminstate + "]";
	}
}
