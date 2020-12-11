<%@ page import="com.sgfintech.handler.MergeDataWithdraw" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="dd-MM-yyyy" />
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
                                                <td>#${lst.contract.idContract}9999</td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <a data-toggle="modal" href="#"
                                                           onclick="viewInfoCustomer('${lst.customer.customerPhone}')">${lst.customer.customerName}</a>
                                                        <span class="d-block text-muted">Account number: ${lst.customer.customerBankAcc}</span>
                                                        <span class="d-block text-muted">Owner : ${lst.customer.customerBankName}</span>
                                                        <span class="d-block text-muted">Company ID : ${lst.customer.companyCode}</span>
                                                        <span class="d-block text-muted">Phone number : ${lst.customer.customerPhone}</span>
                                                    </h6>
                                                </td>
                                                <td>${lst.contract.borrow} đ</td>
                                                <td>${lst.contract.borrow} đ</td>
                                                <td>0</td>
                                                <td>${lst.contract.dateRepayment}</td>
                                                <td>1</td>
                                                <td>ROOT</td>
                                                <td>${year}</td>
                                                <td>
                                                    <select name="status" class="form-control"
                                                            data-placeholder="Select status">
                                                        <option value="overdue">Overdue</option>
                                                        <option value="hold" >On hold</option>
                                                        <option value="pending" selected >Pending</option>
                                                        <option value="paid">Paid</option>
                                                        <option value="invalid">Invalid</option>
                                                        <option value="cancel">Canceled</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tbody>
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
    <div class="modal modal-right fade" id="modal-right" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thông tin chi tiết khách hàng</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                    <p>Họ Tên : <span id="customerName"></span></p>
                    <p>Email : <span id="customerEmail"></span></p>
                    <p>Lương : <span id="customerSalary"></span></p>
                    <p>Tên ngân hàng : <span id="customerBank"></span></p>
                    <p>Số tài khoản : <span id="customerBankAcc"></span></p>
                    <p>Tên ngân hàng : <span id="customerBankName"></span></p>
                    <p>CMND/Hộ chiếu/CCCD : <span id="customerId"></span></p>
                    <p>Nơi cấp : <span id="customerIdLocation"></span></p>
                    <p>Địa chỉ : <span id="customerAddress"></span></p>
                    <p>Tạm trú : <span id="customerAddressTemp"></span></p>
                    <p>Số BHXH : <span id="customerSocialInsurance"></span></p>
                    <p>Số BHYT : <span id="customerHealthInsurance"></span></p>
                    <p>Mã số thuế : <span id="customerTax"></span></p>
                    <p>Số hợp đồng : <span id="customerContract"></span></p>
                    <p>Thông tin người thân : <span id="customerRelative"></span></p>
                    <p>Số điện thoại người thân : <span id="customerRelativePhone"></span></p>
                </div>
                <div class="modal-footer modal-footer-uniform">
                    <button type="button" class="btn btn-rounded btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="js/pages/data-table.js"></script>
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script src="js/pages/data-table.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").css("display", "none");
    });

    function viewInfoCustomer(params) {
        <%
            List<MergeDataWithdraw> list = (List<MergeDataWithdraw>) request.getAttribute("views");
            Gson g = new Gson();
            String json = g.toJson(list);
        %>
        var result = <%=json%>;
        result.forEach((customer) => {
            if (customer.customer.customerPhone == params) {
                let c = customer.customer;
                Object.keys(c).forEach((key, _) => {
                    let id = key;
                    $('#' + id).text(c[key]);
                })
            }
        })
        $('#modal-right').modal('show');
    }
</script>
</body>
</html>
