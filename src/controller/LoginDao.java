package controller;

import org.apache.ibatis.annotations.Param;

import model.Login;

public interface LoginDao {
   public Login findloginByaccount(String account);
   public void  configloginaccount(@Param("account")String account,@Param("password")String password ,@Param("type")int type);

}
