package mapper;

import model.Login;

public interface LoginMapper {
        Login selectByaccount(String account);
        void  configlogin(String account,String password,int type);
}
