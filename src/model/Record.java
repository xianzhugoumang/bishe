package model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import Util.Datechange;

public class Record {

	 private String recordno;
	 private String drivername;
	 private String policename;
	 private Date date;
	 private int state;
	 private String  adminaccount;
	 private int type;
	 private int  score;
	 private String carno;
	 private int adminaction;
	 private String src;
	 private String driveridentity;
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public int getAdminaction() {
		return adminaction;
	}
	public void setAdminaction(int adminaction) {
		this.adminaction = adminaction;
	}
	public int getScore() {
		return score;
	}
	@Override
	public String toString() {
		return "Record [recordno=" + recordno + ", drivername=" + drivername + ", policename=" + policename + ", date="
				+ date + ", state=" + state + ", adminaccount=" + adminaccount + ", type=" + type + ", score=" + score
				+ ", carno=" + carno + ", adminaction=" + adminaction + ", src=" + src + ", driveridentity="
				+ driveridentity + "]";
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getCarno() {
		return carno;
	}
	public void setCarno(String carno) {
		this.carno = carno;
	}
	public String getRecordno() {
		return recordno;
	}
	public void setRecordno(String recordno) {
		this.recordno = recordno;
	}
	public String getDrivername() {
		return drivername;
	}
	public void setDrivername(String drivername) {
		this.drivername = drivername;
	}
	public String getPolicename() {
		return policename;
	}
	public void setPolicename(String policename) {
		this.policename = policename;
	}
	public Date getDate() {
	
		
		return date;
	}
	public String getDriveridentity() {
		return driveridentity;
	}
	public void setDriveridentity(String driveridentity) {
		this.driveridentity = driveridentity;
	}
	public void setDate(String date) throws ParseException  {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		this.date = sdf.parse(date);	
		}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getAdminaccount() {
		return adminaccount;
	}
	public void setAdminaccount(String adminaccount) {
		this.adminaccount = adminaccount;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
