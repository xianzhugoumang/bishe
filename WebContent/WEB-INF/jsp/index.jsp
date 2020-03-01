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
    <jsp:include page="/menu.jsp"></jsp:include>

    <div class="container-fluid main-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="widget-container stats-container">
                    <div class="col-md-3">
                        <div class="number">
                            <div class="icon visitors"></div>
                            <span id="customerCount">1</span>
                            <small>个</small>
                        </div>
                        <div class="text">近七日违章记录</div>
                    </div>
                    <div class="col-md-3">
                        <div class="number">
                            <div class="icon globe"></div>
                            <span id="businessCount">3</span>
                            <small>个</small>
                        </div>
                        <div class="text">近一月违章记录</div>
                    </div>
                    <div class="col-md-3">
                        <div class="number">
                            <div class="icon money"></div>
                            <span id="salesCount">6</span>
                            <small>单</small>
                        </div>
                        <div class="text">待缴费记录</div>
                    </div>
                    <div class="col-md-3">
                        <div class="number">
                            <div class="icon chat-bubbles"></div>
                            <span id="customerTotal">6</span>
                            
                        </div>
                        <div class="text">留言记录</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="widget-container fluid-height">
                    <div class="heading">
                        <i class="icon-bar-chart"></i>最近留言
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                     <th nowrap>留言人</th>
                                     <th nowrap>留言时间</th>
                                     <th nowrap>留言主题</th>
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
                        <i class="icon-table"></i>最近缴费记录清单
                    </div>
                    <div class="widget-content padded clearfix">
                        <table class="table" style="color: #007aff;">
                            <thead>
                             <th>违章记录号</th>
											<th>违章人姓名</th>
											<th>违章人身份证</th>
											<th>违章记录状态</th>
											<th>是否完成缴费</th>
										<th>日期</th>
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
