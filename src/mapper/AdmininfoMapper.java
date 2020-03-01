package mapper;

import model.Admininfo;

public interface AdmininfoMapper
{
	public Admininfo selectadmininfobyadminaccount(String useraccount);
	public  void updateadmininfobyadminaccount(Admininfo adminfo);
}
