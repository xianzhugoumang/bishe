package service;

import model.Admininfo;

public interface Admininfoservice
{
	public Admininfo selectadmininfobyadminaccount(String useraccount);
	public  void updateadmininfobyadminaccount(Admininfo adminfo);
}
