<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.Useradmin" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u.getStatus().equals("0")) {
        } else {
            response.sendRedirect("login");
            session.setAttribute("errorStatus", "Tài khoản đã bị khóa");
        }
    } else {
        response.sendRedirect("login");

    }
%>
<jsp:include page="general/_head.jsp"/>

<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

<div class="wrapper">

    <jsp:include page="general/_header.jsp"/>

    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="general/_menu.jsp"/>

    <!-- Content Wrapper. Contains page content main content -->
    <!-- Handler this -->
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xl-12 col-12">
                        <div class="row" style="display: none;">
                            <div class="col-lg-4 col-12">
                                <div class="box pull-up">
                                    <div class="box-body">
                                        <h5 class="mb-0">
												<span class="text-uppercase font-size-18"><i class="cc BTC"
                                                                                             title="BTC"></i>Bitcoin</span>
                                            <span class="float-right badge badge-light">24h</span>
                                        </h5>
                                        <br>
                                        <div class="d-flex justify-content-between">
                                            <p class="font-size-24">$513,64256</p>
                                            <div><i class="ion-arrow-graph-up-right mr-1 text-success"></i> +1.75%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body p-0">
                                        <div id="spark1"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="box pull-up">
                                    <div class="box-body">
                                        <h5 class="mb-0">
												<span class="text-uppercase font-size-18"><i class="cc ETH"
                                                                                             title="ETH"></i>Ethereum</span>
                                            <span class="float-right badge badge-light">24h</span>
                                        </h5>
                                        <br>
                                        <div class="d-flex justify-content-between">
                                            <p class="font-size-26">$12,178.99</p>
                                            <div><i class="ion-arrow-graph-up-right mr-1 text-success"></i> +1.89%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body p-0">
                                        <div id="spark2"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="box pull-up">
                                    <div class="box-body">
                                        <h5 class="mb-0">
												<span class="text-uppercase font-size-18"><i class="cc LTC"
                                                                                             title="LTC"></i>Litecoin</span>
                                            <span class="float-right badge badge-light">24h</span>
                                        </h5>
                                        <br>
                                        <div class="d-flex justify-content-between">
                                            <p class="font-size-26">$5,724.33</p>
                                            <div><i class="ion-arrow-graph-up-right mr-1 text-success"></i> +1.85%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body p-0">
                                        <div id="spark3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header">
                                <h4 class="box-title">Số lượng hợp đồng</h4>
                            </div>
                            <div class="box-body">
                                <div id="bitcoin-timeline" class="h-300"></div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Các giao dịch mới</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table class="table no-bordered no-margin table-striped">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn yêu cầu</th>
                                            <th>Thời điểm yêu cầu</th>
                                            <th>Trạng thái</th>
                                            <th>Mã công ty</th>
                                            <th>Số tiền vay</th>
                                            <th>Số tháng vay</th>
                                            <th>Nhân viên tiếp nhận</th>
                                            <th>Thông tin khách hàng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th>#12457</th>
                                            <td>11.00AM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td></i> SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Văn A (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>#12586</th>
                                            <td>10.11AM 1/12/2020</td>
                                            <td><span class="label label-danger">Pending</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>Nguyễn Văn B (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>#13258</th>
                                            <td>09.12AM 1/12/2020</td>
                                            <td><span class="label label-danger">Pending</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>Nguyễn Văn C (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>#13586</th>
                                            <td>08.22AM 1/12/2020</td>
                                            <td><span class="label label-warning">Cancelled</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>Nguyễn Văn D (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>#14578</th>
                                            <td>07.48AM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị A (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>#15623</th>
                                            <td>06.45AM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị B (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>#15685</th>
                                            <td>05.11PM 1/12/2020</td>
                                            <td><span class="label label-warning">Cancelled</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị AA (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <!-- Repeat -->
                                        <tr>
                                            <th>#16585</th>
                                            <td>23.18PM 1/12/2020</td>
                                            <td><span class="label label-danger">Pending</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị E (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>#16785</th>
                                            <td>19.27PM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị G (SGF - NHÂN VIÊN - 0989 999 999)</td>
                                            <td>
                                                <button type="button" class="btn btn-info">Info</button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-12" style="display: none;">
                        <div class="box">
                            <div class="box-header">
                                <h4 class="box-title">User Flow</h4>
                            </div>
                            <div class="box-body">
                                <div id="userflow" class="h-250"></div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header">
                                <h4 class="box-title">Cryptocurrency prices</h4>
                            </div>
                            <div class="box-body">
                                <div>
                                    <div class="toolbar">
                                        <button id="one_month"
                                                class="btn btn-rounded btn-sm btn-primary">1M
                                        </button>
                                        <button id="six_months" class="btn btn-rounded btn-sm btn-info">6M</button>
                                        <button id="one_year"
                                                class="btn btn-rounded btn-sm active btn-success">1Y
                                        </button>
                                        <button id="ytd" class="btn btn-rounded btn-sm btn-danger">YTD</button>
                                        <button id="all" class="btn btn-rounded btn-sm btn-warning">ALL</button>
                                    </div>
                                    <div id="timeline-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header">
                                <ul class="nav nav-pills">
                                    <li class=" nav-item"><a href="#navpills2-1" class="nav-link active"
                                                             data-toggle="tab" aria-expanded="false">Buy BTC</a></li>
                                    <li class="nav-item"><a href="#navpills2-2" class="nav-link" data-toggle="tab"
                                                            aria-expanded="false">Sell BTC</a></li>
                                </ul>
                            </div>
                            <div class="box-body">
                                <div class="tab-content">
                                    <div id="navpills2-1" class="tab-pane active">
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon br-0">Order Type</span>
                                            <select class="form-control bl-0">
                                                <option>Limit</option>
                                                <option>Market</option>
                                                <option>Stop Limit</option>
                                                <option>Trail</option>
                                            </select>
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Price (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="≈$8,630.00">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Amount (BTC)</span>
                                            <input type="text" class="form-control bl-0"
                                                   placeholder="Minimum amount is 0.001BTC">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Total (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="">
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <span>Max Buy BTC: </span>
                                                <span>0.00000000</span>
                                            </div>
                                            <div>
                                                <span>USDT Balance: </span>
                                                <span>0.00</span>
                                            </div>
                                        </div>
                                        <button type="button"
                                                class="waves-effect waves-light btn btn-success mt-10 d-block w-p100">
                                            Buy
                                            ETH
                                        </button>
                                    </div>
                                    <div id="navpills2-2" class="tab-pane">
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon br-0">Order Type</span>
                                            <select class="form-control bl-0">
                                                <option>Limit</option>
                                                <option>Market</option>
                                                <option>Stop Limit</option>
                                                <option>Trail</option>
                                            </select>
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Price (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="≈$8,630.00">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Amount (BTC)</span>
                                            <input type="text" class="form-control bl-0"
                                                   placeholder="Minimum amount is 0.001BTC">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Total (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="">
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <span>Max Sell: </span>
                                                <span>0.00000000</span>
                                            </div>
                                            <div>
                                                <span>BTC Balance: </span>
                                                <span>0.00</span>
                                            </div>
                                        </div>
                                        <button type="button"
                                                class="waves-effect waves-light btn btn-danger mt-10 d-block w-p100">
                                            Sell
                                            ETH
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->
<script src="js/vendors.min.js"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/pages/dashboard9.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
    });
</script>
<script src="assets/vendor_components/apexcharts-bundle/data.js"></script>
<script src="assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
</body>
</html>
