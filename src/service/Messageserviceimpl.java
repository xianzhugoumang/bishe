package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Message;
@Service
public class Messageserviceimpl implements Messageservice{
    @Resource
    private MessageDao messagedao;
	
	@Override
	public List<Message> selectmessagebyreceiveuseraccount(String useraccount) {
		// TODO Auto-generated method stub
		return messagedao.selectmessagebyreceiveuseraccount(useraccount);
	}

	@Override
	public  List<Message>  selectmessagebysendaccount(String useraccount) {
		// TODO Auto-generated method stub
		return messagedao.selectmessagebysendaccount(useraccount);
	}

	@Override
	public void sendmessage(Message message) {
		// TODO Auto-generated method stub
		messagedao.sendmessage(message);
	}

	@Override
	public List<Message> selectmessagesbyreceiverunread(String useraccount) {
		// TODO Auto-generated method stub
		return messagedao.selectmessagebyreceiveuseraccount(useraccount);
	}

	@Override
	public void  setmessageread(Message message) {
		// TODO Auto-generated method stub
		 messagedao.setmessageread(message);
	}

}
