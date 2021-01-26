<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<%
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("upload")) {
        } else {
            response.sendRedirect("404");
        }
    } else {
        response.sendRedirect("login");
    }
%>
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
                        <h3 class="page-title">Nhập danh sách nhân sự đơn vị</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Upload tài liệu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Nhập danh sách mới
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main content -->
            <section class="content">
                <!-- /.box-header -->
                <form method="post" enctype="multipart/form-data" class="form">
                    <div class="box">
                        <div class="box-header">
                            <h5>Nhấn vào nút chọn file vào khoảng trống bên dưới để nhập cho nhân sự.
                            </h5>
                        </div>
                        <div class="box-body">
                            <div class="dropzone">
                                <div class="fallback">
                                    <input name="file" id="importFile" type="file" multiple/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-12">
                            <div class="box">
                                <div class="box-body">
                                    <h4 class="box-title text-info"><i class="ti-save mr-15"></i> Thông tin công ty
                                    </h4>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Tên công ty</label>
                                                <input id="tencongty" type="text" class="form-control"
                                                       placeholder="Tên công ty">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Mã Công ty</label>
                                                <input id="macongty" type="text" class="form-control"
                                                       placeholder="Số điện thoại công ty">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Số điện thoại công ty</label>
                                                <input id="sodienthoai" type="text" class="form-control"
                                                       placeholder="Số điện thoại công ty">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-rounded btn-warning btn-outline mr-1">
                                        <i class="ti-trash"></i> Hủy
                                    </button>
                                    <button type="button" onclick="submitform();"
                                            class="btn btn-rounded btn-primary btn-outline">
                                        <i class="ti-save-alt"></i> Lưu
                                    </button>
                                </div>

                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                </form>

                <div class="row" style="display: none" id="resultTable">

                    <div class="col-lg-12 col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Kết quả import</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-lg invoice-archive" width="100%">
                                        <thead>
                                        <tr>
                                            <th>Họ Tên</th>
                                            <th>Số CMND/CCCD/Hộ Chiếu</th>
                                            <th>Ngày sinh</th>
                                            <th>Số Điện thoại cá nhân</th>
                                            <th>Thời hạn HĐLĐ</th>
                                            <th>Loại HĐLĐ</th>
                                            <th>Trạng thái HĐLĐ</th>
                                            <th>Tài khoản NN nhận lương</th>
                                            <th>NH Nhận lương</th>
                                            <th>Tên Chủ Tài khoản NH nhận lương</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbodytable">
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
    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
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
    $(document).ready(function () {
        $("#loading").hide();
    });

    function submitform() {
        $("#loading").show();
        $("#resultTable").hide();
        var formData = new FormData();
        formData.append('file', $('#importFile')[0].files[0]);
        var tenconty = $("#tencongty").val();
        var macongty = $("#macongty").val();
        var sodienthoaicty = $("#sodienthoai").val();
        var filePath = $("#importFile").val();
        $.ajax({
            url: 'import?tencongty=' + tenconty + '&macongty=' + macongty + '&sodienthoai=' + sodienthoaicty,
            type: 'POST',
            data: formData,
            cache: false,
            processData: false,  // tell jQuery not to process the data
            contentType: false,  // tell jQuery not to set contentType
            async: false,
            success: function (data) {
                try {
                    $("#resultTable").show();
                    var obj = JSON.parse(data + "");
                    var body = $("#tbodytable");
                    body.empty();
                    Object.keys(obj).forEach((key) => {
                        var e = obj[key];
                        var rowElement = $('<tr></tr>');
                        rowElement.append('<td>' + e.customerName + '</td>');
                        rowElement.append('<td>' + e.customerId + '</td>');
                        rowElement.append('<td>' + e.customerBirthday.day + "/" + e.customerBirthday.month + "/" + e.customerBirthday.year + '</td>');
                        rowElement.append('<td>' + e.customerPhone + '</td>');
                        rowElement.append('<td>' + e.customerContractExpired.date.day + "/" + e.customerContractExpired.date.month + "/" + e.customerContractExpired.date.year + '</td>');
                        rowElement.append('<td>' + e.customerContract + '</td>');
                        rowElement.append('<td>' + e.status + '</td>');
                        rowElement.append('<td>' + e.customerBankAcc + '</td>');
                        rowElement.append('<td>' + e.customerBankName + '</td>');
                        rowElement.append('<td>' + e.customerBank + '</td>');
                        body.append(rowElement);
                    })
                    $("#loading").hide();
                    console.log(data);
                    Swal.fire(
                        'Successful',
                        'Dữ liệu của hệ thống đã được cập nhật',
                        'success'
                    )
                } catch (error) {
                    $("#loading").hide();
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Lỗi trong quá trình thực thi',
                    })
                }
            },
            error: function (data) {
                $("#loading").hide();
                alert(data);
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Lỗi trong quá trình thực thi',
                    footer: '<a href>Why do I have this issue?</a>'
                });
            }
        });
    }
</script>
</body>

</html>