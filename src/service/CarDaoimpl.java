package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.CarMapper;
import model.Car;
@Service
public class CarDaoimpl implements CarDao {

	@Resource CarMapper CarMapper;
	
	@Override
	public List<Car> selectallcars() {
		// TODO Auto-generated method stub
		return CarMapper.selectallcars();
	}

	@Override
	public Car selectcarinfosbydriverno(String driverno) {
		// TODO Auto-generated method stub
		return CarMapper.selectcarinfosbydriverno(driverno);
	}

	@Override
	public Car selectcarinfobycarno(String carno) {
		// TODO Auto-generated method stub
		return CarMapper.selectcarinfobycarno(carno);
	}

	@Override
	public void addcar(Car car) {
		// TODO Auto-generated method stub
		CarMapper.addcar(car);
	}

}
