package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {
   private String senduseraccount;
   private String receiveuseraccount;
   private String message;
   public Date date;
   private int state;
   private String theme;
   private String recordno;
public String getRecordno() {
	return recordno;
}
public void setRecordno(String recordno) {
	this.recordno = recordno;
}
public String getSenduseraccount() {
	return senduseraccount;
}
public void setSenduseraccount(String senduseraccount) {
	this.senduseraccount = senduseraccount;
}
@Override
public String toString() {
	return "Message [senduseraccount=" + senduseraccount + ", receiveuseraccount=" + receiveuseraccount + ", message="
			+ message + ", date=" + date + ", state=" + state + ", theme=" + theme + ", recordno=" + recordno + "]";
}
public String getReceiveuseraccount() {
	return receiveuseraccount;
}
public void setReceiveuseraccount(String receiveuseraccount) {
	this.receiveuseraccount = receiveuseraccount;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getDate() {
	return date.toString();
}
public void setDate(String  date) throws ParseException {
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	this.date = sdf.parse(date);
}

public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public String getTheme() {
	return theme;
}
public void setTheme(String theme) {
	this.theme = theme;
}

}
