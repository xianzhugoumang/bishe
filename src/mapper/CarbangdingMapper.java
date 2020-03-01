package mapper;

import java.util.List;

import model.Carbangding;

public interface CarbangdingMapper {
         public void addcarbangdingmapper(Carbangding carbangding);//绑定用户与车辆
         public List<Carbangding>selectallcarbangdingmapper();//查询所有已绑定信息
         public List<Carbangding>selectcarbangdingsbyuseraccount(String useraccount);
         public void deletecarbangdingbydriverlicense(String driverno);//根据驾驶证号删除绑定信息
}
