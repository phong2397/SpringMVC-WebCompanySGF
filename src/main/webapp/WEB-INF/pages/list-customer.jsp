<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="general/_head.jsp" />

<body class="hold-transition light-skin sidebar-mini theme-primary">
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
                        <h3 class="page-title">Danh sách khách hàng </h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Upload tài liệu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Thông tin khách hàng
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="right-title">
                        <div class="d-flex mt-10 justify-content-end">
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>Số lượng upload trong tháng</small></h6>
                                    <h4 class="mt-0 text-primary">12,125</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="thismonth"><canvas width="60" height="35"
                                                                style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>Tổng upload</small></h6>
                                    <h4 class="mt-0 text-danger">22,754</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastyear"><canvas width="60" height="35"
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
                    <div class="col-lg-12 col-12">
                        <div class="box">
                            <!-- /.box-header -->
                            <form class="form">
                                <div class="box-body">
                                    <h4 class="box-title text-info"><i class="ti-save mr-15"></i> Thông tin khách hàng
                                    </h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tên công ty</label>
                                                <input id="tencongty" type="text" class="form-control"
                                                       placeholder="Tên công ty">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Số CMND</label>
                                                <input id="cmnd" type="text" class="form-control"
                                                       placeholder="Mã công ty">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Họ và tên</label>
                                                <input id="hovaten" type="text" class="form-control"
                                                       placeholder="Mã công ty">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" onclick="submitform();"
                                            class="btn btn-rounded btn-primary btn-outline">
                                        <i class="ti-save-alt"></i> Tìm kiếm
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- /.box -->
                    </div>
                    <div class="col-lg-12 col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách khách hàng </h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table id="example" class="table table-lg invoice-archive">
                                        <thead>
                                        <tr>
                                            <th>Mã công ty</th>
                                            <th>Mã số khách hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Lương </th>
                                            <th>Địa chỉ thường trú</th>
                                            <th>Địa chỉ tạm trú</th>
                                            <th>Vị trí</th>
                                            <th>Thông tin CMND</th>
                                            <th>Thông tin ngân hàng</th>
                                            <th>Thông tin nhân thân</th>
                                            <th>HÌnh ảnh</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td>${lst.company.companyCode}</td>
                                                <td>${lst.customer.customerCode}</td>
                                                <td>${lst.customer.customerName}</td>
                                                <td>${lst.customer.customerPhone}</td>
                                                <td>${lst.customer.customerSalary}</td>
                                                <td>${lst.customer.customerAddress}</td>
                                                <td>${lst.customer.customerAddressTemp}</td>
                                                <td>${lst.customer.customerPosition}</td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <span class="d-block text-muted">Số cmnd: ${lst.customer.customerId}</span>
                                                        <span class="d-block text-muted">Nơi cấp: ${lst.customer.customerIdLocation}</span>
                                                        <span class="d-block text-muted">Ngày cấp :${lst.customer.customerIdDate}</span>

                                                    </h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <span class="d-block text-muted">Tên ngân hàng: ${lst.customer.customerBankName}</span>
                                                        <span class="d-block text-muted">Chủ tài khoản: ${lst.customer.customerBank}</span>
                                                        <span class="d-block text-muted">Account number: ${lst.customer.customerBankAcc}</span>
                                                    </h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <span class="d-block text-muted">Người thân: ${lst.customer.customerRelative}</span>
                                                        <span class="d-block text-muted">Số điện thoại người thân: ${lst.customer.customerRelativePhone}</span>
                                                    </h6>
                                                </td>
                                                <td>
                                                    <img src="data:image/png;base64,${lst.customer.customerImageFront}" alt="Mat truoc"  width="100" height="100" />
                                                    <img src="data:image/png;base64,${lst.customer.customerImageBack}" alt="Mat sau"  width="100" height="100"  />
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

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/pages/dashboard9.js"></script>
<script src="js/demo.js"></script>
<script src="assets/vendor_components/dropzone/dropzone.js"></script>
<script src="assets/vendor_components/sweetalert/sweetalert.min.js"></script>
<script src="assets/vendor_components/sweetalert/jquery.sweet-alert.custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
    $( document ).ready(function() {
        $("#loading").css("display", "none");
    });
    function submitform() {
        var tenconty = $("#tencongty").val();
        var macongty = $("#macongty").val();
        var filePath = $("#importFile").val();
        console.log(filePath);
        if (macongty == "sgfintech") {
            Swal.fire(
                'Successful',
                'Dữ liệu của hệ thống đã được cập nhật',
                'success'
            )
        } else if (macongty == "sgf") {
            Swal.fire({
                title: 'Mã công ty đã tồn tại!',
                text: "Bạn có muốn cập nhật dữ liệu hiện có?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, update it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Deleted!',
                        'Dữ liệu của hệ thống đã được cập nhật',
                        'success'
                    )
                } else if (
                    /* Read more about handling dismissals below */
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    swalWithBootstrapButtons.fire(
                        'Cancelled',
                        'Thay đổi đã bị hủy',
                        'error'
                    )
                }
            })
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Lỗi trong quá trình thực thi',
                footer: '<a href>Why do I have this issue?</a>'
            })
        }
        console.log(tenconty);
    }

</script>
</body>

</html>