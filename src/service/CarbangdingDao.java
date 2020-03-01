package service;

import java.util.List;

import model.Carbangding;

public interface CarbangdingDao {
  public List<Carbangding> selectallcarbangdinginfo();
  public void addcarbangding(Carbangding carbangding);
  public List<Carbangding> selectcarbangdingsbyuseraccount(String useraccount);
  public void deletecarbangdingbydriverlicense(String driverno);
}
