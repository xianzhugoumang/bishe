package mapper;

import java.util.List;

import model.Driver;

public interface DriverMapper {
    public List<Driver> selectalldriver();
    public Driver selectdriverbyuseraccount(String useraccount);
}
