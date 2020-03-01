package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Carpaiinfo;

@Service
public class Carpaiinfoserviceimpl implements Carpaiinfoservice {

	@Resource
	private CarpaiinfoDao carpaiinfodao;
	
	@Override
	public void addcarpaiinfo(Carpaiinfo carpaiinfo) {
		// TODO Auto-generated method stub
		carpaiinfodao.addcarpaiinfo(carpaiinfo);
	}

}
