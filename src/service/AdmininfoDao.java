package service;

import model.Admininfo;

public interface AdmininfoDao 
{
	public Admininfo selectadmininfobyadminaccount(String useraccount);
	public  void updateadmininfobyadminaccount(Admininfo adminfo);
}
