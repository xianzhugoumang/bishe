package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.CarpaiinfoMapper;
import model.Carpaiinfo;
@Service
public class CarpaiinfoDaoimpl implements CarpaiinfoDao {

	
	@Resource 
	private CarpaiinfoMapper carpaiinfoMapper;
	
	@Override
	public void addcarpaiinfo(Carpaiinfo carpaiinfo) {
		// TODO Auto-generated method stub
		carpaiinfoMapper.addcarpaiinfo(carpaiinfo);
	}

}
