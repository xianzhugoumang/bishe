package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Carbangding;

@Service
public class Carbangdingserviceimpl implements Carbangdingservice {

	
	@Resource CarbangdingDao carbangdingdao;
	

	@Override
	public List<Carbangding> selectallcarbangdinginfos() {
		// TODO Auto-generated method stub
		return carbangdingdao.selectallcarbangdinginfo();
	}


	@Override
	public void addallcarbangding(Carbangding carbangding) {
		// TODO Auto-generated method stub
		carbangdingdao.addcarbangding(carbangding);
	}


	@Override
	public List<Carbangding> selectcarbangdingsbyuseraccount(String useraccount) {
		// TODO Auto-generated method stub
		return carbangdingdao.selectcarbangdingsbyuseraccount(useraccount);
	}


	@Override
	public void deletecarbangdingbydriverlicense(String driverno) {
		// TODO Auto-generated method stub
		carbangdingdao.deletecarbangdingbydriverlicense(driverno);
	}

	
}
