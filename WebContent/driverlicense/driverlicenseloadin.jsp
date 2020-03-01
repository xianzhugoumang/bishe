<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/common.jsp"></jsp:include>
</head>
<style>
.class1{
 background-color: #fff;
 color:#7734de;

}
</style>
<script>
function createlicense()
{     
	 var  driverlicense=$("#driverlicense").val();
	 var  drivername=$("#drivername").val();
	 var  grantdate=$("#grantdate").val(); 
	 var  licensetype=$("#licensetype").val();
	 var  driveridentity=$("#driveridetity").val();
	 var  legaltime=$("#legaltime").val();
	 var  grantorganization=$("#grantunit").val();
	 alert(grantorganization);
	 var data={};
      data.driverlicense=driverlicense;
      data.drivername=drivername;
      data.grantdate=grantdate; 
      data.licensetype=licensetype;
      data.driveridentity=driveridentity;
      data.legaltime=legaltime;
      data.grantorganization=grantorganization;
	$.ajax({
		  url:'driverlicense/addriverlicense',
		  type:'post',
		  data:data,
		  success:function()
		  {
			  alert("success!");
		  },
		  error:function()
		  {
			  alert("error！");
		  }
	});
	}
</script>
<body >
<div  class="class1" >
    <jsp:include page="/menu.jsp"></jsp:include>
    <div >
        <div>
            <div class="heading clearfix">
                <i class="icon-reorder"></i> 新增驾照信息 <a href="javascript:;" class="pull-right"
                                                      onclick="history.go(-1);"><i class="icon-reply"></i></a>
            </div>
            <div >
                        <div class="form-body">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:10px;">
                            </tr>
                        </table>
                        <div class="row-fluid">
                            <div class="span12">
                                <table class="table table-bordered" id="no-input-border" width="95%" border="0"
                                       cellspacing="1" cellpadding="0">
                                    <thead>
                                    <tr>
                                        <th colspan="12" valign="center">驾照信息</th>
                                        <th style="border: none;float: right;">
                                          
                                        </th>
                                    </tr>
                                    <tr style="background-color:#E0E8FF;text-align:center;">
                                       
                                        <td>驾照号码</td>
                                        <td>准驾类型</td>
                                        <td>有效期限</td>
                                        <td>授予单位</td>
                                        <td>授予日期</td>  
                                    </tr>
                                    </thead>
                                    <tbody id="table1">
                                    </tbody>
                                    <tbody>
                                    <tr style="background-color:#FFFFF1">
                                        <td> <input type="text" id="driverlicense"
                                                   class="product_discount form-control"> 
                                        </td>
                                        <td>
                                        <select id="licensetype" class="form-control">
                                        <option value=1>A1</option>
                                        <option value=2>A2</option>
                                        <option value=3>A3</option>
                                        <option value=4>B1</option>
                                        <option value=5>B2</option>
                                        <option value=6>B3</option>
                                        <option value=7>C1</option>
                                        <option value=8>C2</option>
                                        <option value=9>C3</option>
                                        </select>
                                        </td>
                                        <td>
                                        <select id="legaltime" class="form-control"  >
                                        <option value=1>6年</option>
                                        <option value=2>10年</option>
                                        <option value=3>长期</option>
                                        </select>
                                        </td>
                                        <td>
                                        <select id="grantunit" class="form-control">
                                        <option value=1>江苏省交通管理局</option>
                                        <option value=2>南京市交通管理局</option>
                                        <option value=2>江宁区交通管理局</option>
                                        </select>
                                        </td>
                                        <td>  
                                       <input type="date" class="form-control" id="grantdate">                 
                                       </td>
                                    </tr>
                                    <tr>
                                     <td>姓名</td> 
                                     <td>身份证</td>
                                     <td>电话</td>
                                     <td>性别</td>
                                     <td>国籍</td>
                                    </tr>
                                    <tr>                                  
                                    <td>
                                    <input type="text" class="form-control" id="drivername">
                                    </td>
                                    <td>
                                    <input type="text"  class="form-control" id="driveridetity">
                                    </td>
                                    <td>
                                    <input type="text" class="form-control" id="driverphone">
                                    </td>
                                     <td>
                                   <select class="form-control" id="driversex">
                                    <option  value=0>男</option>
                                    <option value=1>女</option>
                                    </select>
                                    </td>
                                     <td>
                                    <select class="form-control" id="drivernation">
                                    <option  value=0>中国</option>
                                    <option value=1>美国</option>
                                      <option value=2>日本</option>
                                        <option value=3>俄罗斯</option>
                                          <option value=4>泰国</option>
                                            <option value=5>法国</option>
                                              <option value=6>英国</option>
                                                <option value=7>其他</option>
                                    </select>
                                    </td>
                                    </tr>     
                                    <tr>
                                        <td>地址</td>
                                        <td colspan="12">
                                            <input type="text" class="normal_input form-control" name="address" id="owneraddress"
                                                   placeholder="请输入车主住址">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>备注</td>
                                        <td colspan="12">
                                            <textarea style="min-height:50px;" name="description"
                                                      class="form-control" id="carpaimemo"></textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                   
                                    <tfoot>
                                    <tr>
                                        <td style="text-align:center;" colspan="13">
                                            <input id="createcarpai" class="btn btn-success"  onclick="createlicense()" type="button" value="创建" >&nbsp;
                                            
                                            <input class="btn btn-default" type="button"
                                                   onclick="javascript:history.go(-1)" value="返回">&nbsp;
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
