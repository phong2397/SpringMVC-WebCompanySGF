<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="general/_head.jsp"/>

<body class="hold-transition light-skin sidebar-mini theme-primary">
<div class="wrapper">

    <jsp:include page="general/_header.jsp"/>

    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="general/_menu.jsp"/>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="page-title">Danh sách xét duyệt</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Tiếp nhận yêu cầu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Xét duyệt</li>
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
                    <div class="col-xl-3 col-md-6 col-12 ">
                        <div class="box box-inverse box-success">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Tổng số yêu cầu</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">2,064</div>
                                    <span>Tổng số lượt yêu cầu trong ngày</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12 ">
                        <div class="box box-inverse box-primary">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Đã giải quyết</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">1,738</div>
                                    <span>Yêu cầu tất toán thành công</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->

                    <div class="col-xl-3 col-md-6 col-12">
                        <div class="box box-inverse box-danger">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Đã hủy</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">1,100</div>
                                    <span>Yêu cầu bị từ chối</span>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12">
                        <div class="box box-inverse box-warning">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Chờ giải quyết</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center my-2">
                                    <div class="font-size-60">964</div>
                                    <span>Yêu cầu cần xác nhận</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->

                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách chờ xét duyệt</h4>
                                <h6 class="box-subtitle">Export Invoice List to Copy, CSV, Excel, PDF & Print</h6>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table id="example" class="table table-lg invoice-archive">
                                        <thead>
                                        <tr>
                                            <th>Mã yêu cầu</th>
                                            <th>Nhân viên xác nhận</th>
                                            <th>Ngày yêu cầu</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Trạng thái</th>
                                            <th>Thời gian còn lại</th>
                                            <th>Thời gian vay</th>
                                            <th>Số tiền vay</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td>#${lst.saRequest.id}9999</td>
                                                <td>${fn:toUpperCase(lst.saRequest.employeeSua)}</td>
                                                <td>${lst.saRequest.createdDate}</td>
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
                                                <td class="text-center">
                                                    <h6 class="mb-0 font-weight-bold"> ${lst.saRequest.status}ing</h6>
                                                </td>
                                                <td class="text-center">
                                                    <span class="badge badge-pill badge-primary">2 ngày</span>
                                                </td>
                                                <td>
                                                        ${lst.saRequest.timeBorrow} month
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 font-weight-bold"> ${lst.saRequest.borrow} đ
                                                        <span class="d-block text-muted font-weight-normal">Thuế ${lst.saRequest.interestRate} % </span>
                                                        <span class="d-block text-muted font-weight-normal">Phí ${lst.saRequest.feeBorrow} đ </span>
                                                    </h6>
                                                </td>
                                                <td>
                                                    <button class="btn btn-rounded btn-info btn-accept">Accept</button>
                                                    <button class="btn btn-rounded btn-dark btn-refuse">Refuse</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
    <!-- /.control-sidebar -->
    <!-- Modal -->
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
    <!-- /.modal -->
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script src="js/pages/data-table.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").css("display", "none");
    });
    $("body").on("click", ".btn-accept", function () {
        var dataRequest = $(this).parents("tr").find("td:eq(0)").text().replaceAll("#", "");
        dataRequest = dataRequest.substring(0, dataRequest.length - 4);
        console.log(dataRequest);
        let data = {datarequest: dataRequest, status: 'wfs', step: '2'};
        var result = sendOrder(data);
        if (result === "success") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Dữ liệu được cập nhật thành công.',
                showConfirmButton: false,
                timer: 3000
            });
            $(this).parents("tr").remove();
        } else {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
                showConfirmButton: false,
                timer: 3000
            });
        }
    });

    function sendOrder(data) {
        try {
            // This async call may fail.
            let text = $.ajax({
                type: "POST",
                timeout: 100000,
                url: "${pageContext.request.contextPath}/changes",
                data: data,
                dataType: 'text',
                async: false
            }).responseText;
            return text;
            console.log(text);
        } catch (error) {
            return "Không thể kết nối tới server";
        }
    }

    $("body").on("click", ".btn-refuse", function () {
        var dataRequest = $(this).parents("tr").find("td:eq(0)").text().replaceAll("#", "");
        dataRequest = dataRequest.substring(0, dataRequest.length - 4);
        console.log(dataRequest);
        let data = {datarequest: dataRequest, status: 'deni', step: '2'};
        var result = sendOrder(data);
        if (result === "success") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Dữ liệu được cập nhật thành công.',
                showConfirmButton: false,
                timer: 3000
            });
            $(this).parents("tr").remove();
        } else {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
                showConfirmButton: false,
                timer: 3000
            });
        }
    });


    function viewInfoCustomer(params) {
        console.log('0' + params);

        <%
            List<MergeDataOrder> list = (List<MergeDataOrder>) request.getAttribute("views");
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
        console.log(result);
        // var index =
        $('#modal-right').modal('show');
    }
</script>
</body>

</html>
