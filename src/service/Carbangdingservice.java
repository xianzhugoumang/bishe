package service;

import java.util.List;

import model.Carbangding;

public interface Carbangdingservice {
  public void addallcarbangding(Carbangding carbangding);
  public List<Carbangding> selectcarbangdingsbyuseraccount(String useraccount);
  public List<Carbangding> selectallcarbangdinginfos();
  public void deletecarbangdingbydriverlicense(String driverno);
}
