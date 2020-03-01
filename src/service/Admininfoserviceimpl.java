package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Admininfo;
@Service
public class Admininfoserviceimpl implements Admininfoservice
{

	@Resource
	private AdmininfoDao admininfodao;
	public Admininfo selectadmininfobyadminaccount(String  adminaccount)
	{
		return admininfodao.selectadmininfobyadminaccount(adminaccount);
	}
	@Override
	public void updateadmininfobyadminaccount(Admininfo adminfo) {
		// TODO Auto-generated method stub
		admininfodao.updateadmininfobyadminaccount(adminfo);
	}

}
