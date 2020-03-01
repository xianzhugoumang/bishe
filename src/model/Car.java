package model;

import java.util.Date;

public class Car {

	
	
	private String driverno;
	private String carno;
	private String enginemodel;
	private String brandmodel;
	public String getBrandmodel() {
		return brandmodel;
	}
	public void setBrandmodel(String brandmodel) {
		this.brandmodel = brandmodel;
	}
	public String getEnginemodel() {
		return enginemodel;
	}
	public void setEnginemodel(String enginemodel) {
		this.enginemodel = enginemodel;
	}
	private int type;
	private int emissions;
	private Date productdate;
	private Date nextyearcheck;
	private Date licensedate;
	private String cardescribe;
	public String getCardescribe() {
		return cardescribe;
	}
	public void setCardescribe(String cardescribe) {
		this.cardescribe = cardescribe;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getEmissions() {
		return emissions;
	}
	public void setEmissions(int emissions) {
		this.emissions = emissions;
	}
	public Date getProductdate() {
		return productdate;
	}
	public void setProductdate(Date productdate) {
		this.productdate = productdate;
	}
	public Date getNextyearcheck() {
		return nextyearcheck;
	}
	public void setNextyearcheck(Date nextyearcheck) {
		this.nextyearcheck = nextyearcheck;
	}
	public Date getLicensedate() {
		return licensedate;
	}
	public void setLicensedate(Date licensedate) {
		this.licensedate = licensedate;
	}
	@Override
	public String toString() {
		return "Car [driverno=" + driverno + ", carno=" + carno + ", enginemodel=" + enginemodel + ", brandmodel="
				+ brandmodel + ", type=" + type + ", emissions=" + emissions + ", productdate=" + productdate
				+ ", nextyearcheck=" + nextyearcheck + ", licensedate=" + licensedate + ", cardescribe=" + cardescribe
				+ "]";
	}
	
	
	
	
	
	
}
