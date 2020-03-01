package service;

import java.util.List;

import model.Message;

public interface Messageservice {
	public List<Message> selectmessagebyreceiveuseraccount(String useraccount);
	public List<Message> selectmessagebysendaccount(String useraccount);
	public void sendmessage(Message message);
	public  List<Message> selectmessagesbyreceiverunread(String useraccount);
	public void setmessageread(Message message);
}
