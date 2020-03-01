package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.MessageMapper;
import model.Message;
@Service
public class MessageDaoimpl implements MessageDao{
    
	@Resource
	private MessageMapper messagemapper;
	
	
	@Override
	public  List<Message>  selectmessagebyreceiveuseraccount(String useraccount) {
		// TODO Auto-generated method stub
		return messagemapper.selectmessagebyreceiveuseraccount(useraccount);
	}

	@Override
	public List<Message>  selectmessagebysendaccount(String useraccount) {
		// TODO Auto-generated method stub
		return messagemapper.selectmessagebysendaccount(useraccount);
	}

	@Override
	public void sendmessage(Message message) {
		// TODO Auto-generated method stub
		messagemapper.sendmessage(message);
	}

	@Override
	public List<Message> selectmessagesbyreceiverunread(String useraccount) {
		// TODO Auto-generated method stub
		return messagemapper.selectmessagebyreceiveuseraccount(useraccount);
	}

	@Override
	public void setmessageread(Message message) {
		// TODO Auto-generated method stub
		 messagemapper.setmessageread(message);
	}

}
