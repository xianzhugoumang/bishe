<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/common.jsp"></jsp:include>
</head>
<body class="navbar-top">
<div class="modal-shiftfix">
    <!-- 菜单 -->
    <jsp:include page="/menu3.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-8">
                <div class="widget-container fluid-height">
                    <div class="heading">
                        <i class="icon-bar-chart"></i>已处理违章记录
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                     <th nowrap>违章号</th>
                                     <th nowrap>驾驶人姓名</th>
                                     <th nowrap>驾驶人身份证号</th>
                                     <th nowrap>违章时间</th>
                                     <th nowrap>扣分情况</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr data-key="8">
                                    <td></td>
                                    <td>个</td>
                                    <td>的</td>
                                    <td>对比</td>
                                    <td>根本</td>
                                </tr>
                                 </tbody>
                            </table>
                    </div>
                    <div class="widget-content" id="main" style="height: 280px;"></div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="widget-container fluid-height clearfix">
                    <div class="heading">
                        <i class="icon-table"></i>最近留言
                    </div>
                    <div class="widget-content padded clearfix">
                        <table class="table" style="color: #007aff;">
                            <thead>
                             <th>留言者</th>
									<th>留言主题</th>
									<th>留言时间</th>	
                            </thead>
                            <tbody>
		                            <tr>
		                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
