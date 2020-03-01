package controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Repository;
import mapper.LoginMapper;
import model.Login;

@Repository 
public class LoginDaoimpl implements LoginDao{
    
	@Resource
	 private LoginMapper loginmapper;
	@Override
	public Login findloginByaccount(String account) {
		// TODO Auto-generated method stub
		return loginmapper.selectByaccount(account);
	}
	@Override
	public void  configloginaccount(String account, String password ,int type) {
		// TODO Auto-generated method stub
		 loginmapper.configlogin(account, password,type);
	}
     
}
