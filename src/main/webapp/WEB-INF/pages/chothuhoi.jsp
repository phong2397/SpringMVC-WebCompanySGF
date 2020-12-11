<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="general/_head.jsp" />

<body class="hold-transition light-skin sidebar-mini theme-primary">
<!-- Site wrapper -->
<div class="wrapper">

    <jsp:include page="general/_header.jsp" />

    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="general/_menu.jsp" />


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="page-title">Chờ thu hồi</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Thu hồi nợ</li>
                                    <li class="breadcrumb-item active" aria-current="page">Chờ thu hồi</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="right-title">
                        <div class="d-flex mt-10 justify-content-end">
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$12,125</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="thismonth">
                                        <canvas width="60" height="35"
                                                style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-danger">$22,754</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastyear">
                                        <canvas width="60" height="35"
                                                style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách nhắc nợ</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered no-margin">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn vay</th>
                                            <th>Thông tin khách hàng</th>
                                            <th class="text-right">Số tiền tối thiểu</th>
                                            <th class="text-right">Số tiền còn nợ</th>
                                            <th class="text-right">Số tiền đã đóng</th>
                                            <th class="text-right">Hạn thanh toán</th>
                                            <th class="text-right">Kỳ thanh toán</th>
                                            <th class="text-right">Nhân viên nhắc nợ</th>
                                            <th class="text-right">Ngày nhắc nợ</th>
                                            <th class="text-right">Trạng thái nhắc nợ</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td>#${lst.id_contract}9999</td>
                                                <td>${lst.customer_phone}</td>
                                                <td>${lst.borrow}</td>
                                                <td>0</td>
                                                <td>${lst.date_repayment}</td>
                                                <td>1</td>
                                                <td>ROOT</td>
                                                <td>ROOT</td>
                                                <td>ROOT</td>
                                                <td>${lst.accepted_by}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <div class="col-lg-12 col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách nợ quá hạn</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered no-margin">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn vay</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Thông tin công ty</th>
                                            <th class="text-right">Số tiền</th>
                                            <th>Ngày cần tất toán</th>
                                            <th class="text-right">Phí phạt</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="text-center">#0009</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        </tbody>
                                        <tbody>
                                        <tr>
                                            <td class="text-center">#0010</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">#0011</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">#0012</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">#0013</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">#0014</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">#0015</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">#0016</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">#0018</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>Công ty TNHH ABC123</td>
                                            <td class="text-right">1,000,000đ</td>
                                            <td>31-12-2020</td>
                                            <td class="text-right"><span class="label label-danger">13.54
															%</span></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </section>
            <!-- /.content -->

        </div>
    </div>
    <!-- /.content-wrapper -->

    <jsp:include page="general/_footer.jsp" />
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp" />
    <!-- /.control-sidebar -->

    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<jsp:include page="general/_script.jsp" />

</body>

</html>
