package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.AdmininfoMapper;
import model.Admininfo;

@Service
public class Admininfoimpl   implements AdmininfoDao {
    
	@Resource
	private AdmininfoMapper admininfomapper;
	
	@Override
	public Admininfo selectadmininfobyadminaccount(String  adminaccount) {
		// TODO Auto-generated method stub
		return admininfomapper.selectadmininfobyadminaccount(adminaccount);
	}

	@Override
	public void updateadmininfobyadminaccount(Admininfo adminfo) {
		// TODO Auto-generated method stub
		admininfomapper.updateadmininfobyadminaccount(adminfo);
	}

}
