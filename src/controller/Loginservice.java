package controller;

import model.Login;

public interface Loginservice {
       public Login checklogin(String account,String password);
       public  void  config(String account,String password,int type);  
}
