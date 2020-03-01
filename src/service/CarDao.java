package service;

import java.util.List;

import model.Car;

public interface CarDao {
     public List<Car> selectallcars();
     public Car selectcarinfosbydriverno(String driverno);
     public Car selectcarinfobycarno(String carno);
     public void addcar(Car car);
}
