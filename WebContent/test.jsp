<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <jsp:include page="/common.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<script> 
</script>
<body>
        <div>
            <div class="heading clearfix">
                             新增车牌号 <a href="javascript:;" class="pull-right" onclick="history.go(-1);"><i class="icon-reply"></i></a>
            </div>
            <div >
                    <div class="form-body">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:10px;">
                           
                        </table>
                        <div class="row-fluid">
                            <div class="span12">
                                <table class="table table-bordered" id="no-input-border" width="95%" border="0" cellspacing="1" cellpadding="0">
                                    <thead>
                                    <tr>
                                        <th colspan="12" valign="center">车牌信息</th>
                                        <th style="border: none;color:#000;float: right;"> </th>
                                    </tr>
                                    <tr style="background-color:#E0E8FF;text-align:center;">                                      
                                        <td>车牌号</td>
                                        <td>车型</td>
                                        <td>排量</td>
                                        <td>吨位</td>
                                        <td>使用年限</td>                  
                                        <td>车辆生产日期</td>
                                        <td>品牌型号</td>
                                    </tr>
                                    </thead>
                                    <tbody id="table1">
                                    <tr >
                                        <td>
                                            <input type="text" id="carno" class="form-control">                                          
                                        </td>
                                        <td>
                                        <select  id="cartype"  class="form-control" >
                                        <option value=1>微型轿车</option>
                                          <option value=2>小型轿车</option>
                                            <option value=3>中型轿车</option>
                                              <option value=4>豪华轿车</option>
                                        </select>
                                        </td>
                                        <td>
                                           <select  id="caremissions"  class="form-control" >
                                           <option value=1>1.0L以下</option>
                                           <option value=2>1.0~1.6L以下</option>
                                           <option value=3>1.6~2.0L之间</option>
                                           <option value=4>2.0L以上</option>
                                           </select>
                                        </td>
                                        <td>
                                            <input type="text"  class=" form-control" id="cartons" >
                                        </td>
                                        <td>
                                        <select id="useyearlimits"  class=" form-control" >
                                        <option value=1>8年 </option>
                                        <option value=2>12年 </option>
                                         <option value=3>15年 </option>
                                        </select>
                                        </td>
                                        <td>
                                            <input type="date" class=" form-control"   id="carproductdate" >
                                        </td>
                                        <td>
                                            <input type="text" id="carbrandtype"
                                                   class=" form-control" >
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tbody>
                                    <tr style="background-color:#FFFFF3">
                                        <td>发动机号</td>
                                        <td>行驶证号</td>
                                        <td>发证日期</td>
                                        <td>上次年检日期</td>
                                        <td>下次年检日期</td>
                                        <td>使用性质</td>
                                        <td>颁发单位</td>
                                    </tr>
                                    <tr style="background-color:#FFFFF1">
                                        <td> <input type="text" id="carengineno"
                                                   class="product_discount form-control" ></td>
                                        <td> <input type="text" id="cardriverlicenseno"
                                                   class="product_discount form-control" ></td>
                                        <td>
                                        <input type="date"  class=" form-control" id="grantdate" >
                                        </td>
                                        <td>
                                        <input type="date" class=" form-control" id="lastyearcheckdate">
                                        </td>
                                        <td>
                                        <input type="date" class=" form-control" id="nextyearcheckdate">
                                        </td>                                      
                                        <td>  
                                        <select  class=" form-control" id="usetype">
                                        <option value=1>营利性</option>
                                         <option value=2>非营利性</option>
                                        </select>                  
                                       </td>
                                       <td>
                                       <select  class=" form-control" id="grantunit">
                                        <option value=1>江苏省交通管理局</option>
                                        <option value=2>南京市交通管理局</option>
                                        <option value=3>江宁区交通管理局</option>
                                        </select>
                                       </td>      
                                    </tr>
                                    <tr>                                  
                                     <td>责任人姓名</td> 
                                     <td>责任人身份证</td>
                                     <td>责任人电话</td>
                                     <td>持有人姓名</td>
                                     <td>持有人性别</td>
                                     <td>持有人身份证号</td>
                                    </tr>
                                    <tr>                 
                                    <td>
                                    <input type="text" class="form-control" id="responsername">
                                    </td>
                                    <td>
                                    <input type="text"  class="form-control" id="responseridentity">
                                    </td>
                                    <td>
                                    <input type="text" class="form-control" id="responserphone">
                                    </td>
                                     <td>
                                    <input type="text" class="form-control"id="ownername">
                                    </td>
                                     <td>
                                    <select class="form-control" id="ownersex">
                                    <option  value=0>男</option>
                                    <option value=1>女</option>
                                    </select>
                                    </td>
                                    <td>
                                    <input type="text"  class="form-control" id="owneridentity">
                                    </td>
                                    </tr>     
                                    <tr>
                                        <td>车主地址</td>
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
                                            <input id="createcarpai" class="btn btn-success"  onclick="createcarpai() " type="button" value="创建" >&nbsp;
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
</body>
</html>