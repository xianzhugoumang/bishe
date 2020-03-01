package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Car;

@Service
public class Carserviceimpl implements Carservice {

	@Resource 
	private CarDao carDao;

	@Override
	public List<Car> selectallcars() {
		// TODO Auto-generated method stub
		return carDao.selectallcars();
	}

	@Override
	public Car selectcarinfosbydriverno(String driverno) {
		// TODO Auto-generated method stub
		return carDao.selectcarinfosbydriverno(driverno);
	}

	@Override
	public Car selectcarinfobycarno(String carno) {
		// TODO Auto-generated method stub
		return carDao.selectcarinfobycarno(carno);
	}

	@Override
	public void addcar(Car car) {
		// TODO Auto-generated method stub
		carDao.addcar(car);
	}
	
	
	
	 
	
}
