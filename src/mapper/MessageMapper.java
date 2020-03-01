package mapper;

import java.util.List;

import model.Message;

public interface MessageMapper {
  public  List<Message>  selectmessagebyreceiveuseraccount(String  useraccount);//取出所有接收方为useraccount的留言
  public List<Message>  selectmessagebysendaccount(String useraccount);//取出所有发送方为useraccount的留言
  public void sendmessage(Message sendmessage);//插入一条留言
  public  List<Message> selectmessagesbyreceiverandunread(String useraccount);//取出所有接受方为useeraccount且为未读的留言
  public  void addmessage(Message message);
  public  void  setmessageread(Message message);
}
