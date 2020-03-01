package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.CarbangdingMapper;
import model.Carbangding;
@Service
public class CarbangdingDaoimpl implements CarbangdingDao {
   @Resource
   private CarbangdingMapper carbangdingmapper;
	@Override
	public List<Carbangding> selectallcarbangdinginfo() {
		// TODO Auto-generated method stub
		return carbangdingmapper.selectallcarbangdingmapper();
	}
	@Override
	public void addcarbangding(Carbangding carbangding) {
		// TODO Auto-generated method stub
		carbangdingmapper.addcarbangdingmapper(carbangding);
	}
	@Override
	public List<Carbangding> selectcarbangdingsbyuseraccount(String useraccount) {
		// TODO Auto-generated method stub
		return carbangdingmapper.selectcarbangdingsbyuseraccount(useraccount);
	}
	@Override
	public void deletecarbangdingbydriverlicense(String driverno) {
		// TODO Auto-generated method stub
		carbangdingmapper.deletecarbangdingbydriverlicense(driverno);
	}

	

}
