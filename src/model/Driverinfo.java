package model;

import java.util.Date;

import com.mysql.fabric.xmlrpc.base.Data;

public class Driverinfo
{
   private  String   drivername;
   private  int      driversex;
   private  String   driveridentity;
   private  String   driveraddress;
   private  String   driveremail;
   public String getDriveraccount() {
	return driveraccount;
}
public void setDriveraccount(String driveraccount) {
	this.driveraccount = driveraccount;
}
private  String   driverphone;
   private  String   drivercarno1;
   private  String   drivercarno2;
   private  String   drivercarno3;
   private  String   driverdriverlicense1;
   private  String   driverdriverlicense2;
   private  String   driverdriverlicense3;
   private  Date     drivercofigdate;
   private  String   driveraccount;
   private  int      driverage;
public int getDriverage() {
	return driverage;
}
public void setDriverage(int driverage) {
	this.driverage = driverage;
}
public String getDrivername() {
	return drivername;
}
public void setDrivername(String drivername) {
	this.drivername = drivername;
}
public int getDriversex() {
	return driversex;
}
public void setDriversex(int driversex) {
	this.driversex = driversex;
}
public String getDriveridentity() {
	return driveridentity;
}
public void setDriveridentity(String driveridentity) {
	this.driveridentity = driveridentity;
}
public String getDriveraddress() {
	return driveraddress;
}
public void setDriveraddress(String driveraddress) {
	this.driveraddress = driveraddress;
}
public String getDriverphone() {
	return driverphone;
}
public void setDriverphone(String driverphone) {
	this.driverphone = driverphone;
}
public String getDrivercarno1() {
	return drivercarno1;
}
public void setDrivercarno1(String drivercarno1) {
	this.drivercarno1 = drivercarno1;
}
public String getDrivercarno2() {
	return drivercarno2;
}
public void setDrivercarno2(String drivercarno2) {
	this.drivercarno2 = drivercarno2;
}
public String getDrivercarno3() {
	return drivercarno3;
}
public void setDrivercarno3(String drivercarno3) {
	this.drivercarno3 = drivercarno3;
}
public String getDriverdriverlicense1() {
	return driverdriverlicense1;
}
public void setDriverdriverlicense1(String driverdriverlicense1) {
	this.driverdriverlicense1 = driverdriverlicense1;
}
public String getDriverdriverlicense2() {
	return driverdriverlicense2;
}
public void setDriverdriverlicense2(String driverdriverlicense2) {
	this.driverdriverlicense2 = driverdriverlicense2;
}
public String getDriverdriverlicense3() {
	return driverdriverlicense3;
}
public void setDriverdriverlicense3(String driverdriverlicense3) {
	this.driverdriverlicense3 = driverdriverlicense3;
}
public Date getDrivercofigdate() {
	return drivercofigdate;
}
public void setDrivercofigdate(Date drivercofigdate) {
	this.drivercofigdate = drivercofigdate;
}



public String getDriveremail() {
	return driveremail;
}
public void setDriveremail(String driveremail) {
	this.driveremail = driveremail;
}



@Override
public String toString() {
	return "Driverinfo [drivername=" + drivername + ", driversex=" + driversex + ", driveridentity=" + driveridentity
			+ ", driveraddress=" + driveraddress + ", driveremail=" + driveremail + ", driverphone=" + driverphone
			+ ", drivercarno1=" + drivercarno1 + ", drivercarno2=" + drivercarno2 + ", drivercarno3=" + drivercarno3
			+ ", driverdriverlicense1=" + driverdriverlicense1 + ", driverdriverlicense2=" + driverdriverlicense2
			+ ", driverdriverlicense3=" + driverdriverlicense3 + ", drivercofigdate=" + drivercofigdate
			+ ", driveraccount=" + driveraccount + ", driverage=" + driverage + "]";
}
   
}
