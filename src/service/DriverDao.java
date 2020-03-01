package service;

import java.util.List;

import model.Driver;

public interface DriverDao {
        public  List<Driver> selectalldriver();
        public Driver selectdriverbyuseraccount(String useraccount);
}
