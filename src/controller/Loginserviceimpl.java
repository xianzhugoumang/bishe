package controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import model.Login;

@Service("loginservice")
public class Loginserviceimpl implements Loginservice{
    @Resource
    private LoginDao logindao;
	@Override
	public Login checklogin(String account, String password) {
		// TODO Auto-generated method stub
		Login login=logindao.findloginByaccount(account);
		
		if(login!=null&&login.getPassword().equals(password))
		{
			return login;
		}
		
		return null;
	}
	@Override
	public void config(String account, String password,int type) {
		// TODO Auto-generated method stub
		
		logindao.configloginaccount(account, password,type);
	  
		
	}

}
