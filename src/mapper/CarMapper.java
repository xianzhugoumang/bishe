package mapper;

import java.util.List;

import model.Car;

public interface CarMapper {
            public List<Car> selectallcars();//查询所有车辆信息
            public Car selectcarinfosbydriverno(String driverno);//按行驶证查询车辆信息
            public Car selectcarinfobycarno(String carno);//按车牌号查询车辆信息
            public void addcar(Car car);
            
}
