<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
    String role = u.getRole();
    if(role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("upload")){
    }else{
        response.sendRedirect("404");
    }
%>
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
                    <div class="right-title">
                        <div class="d-flex mt-10 justify-content-end">
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>Số lượng upload trong tháng</small></h6>
                                    <h4 class="mt-0 text-primary">12,125</h4>
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
                                    <h6 class="mb-0"><small>Tổng upload</small></h6>
                                    <h4 class="mt-0 text-danger">22,754</h4>
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
                <!-- /.box-header -->
                <form method="post" enctype="multipart/form-data" class="form">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title">Dropzone</h4>
                            <h6 class="box-subtitle">For multiple file upload put class <code>.dropzone</code> to form.
                            </h6>
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
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tên công ty</label>
                                                <input id="tencongty" type="text" class="form-control"
                                                       placeholder="Tên công ty">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mã Công ty</label>
                                                <input id="macongty" type="text" class="form-control"
                                                       placeholder="Mã công ty">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-rounded btn-warning btn-outline mr-1">
                                        <i class="ti-trash"></i> Cancel
                                    </button>
                                    <button type="button" onclick="submitform();"
                                            class="btn btn-rounded btn-primary btn-outline">
                                        <i class="ti-save-alt"></i> Save
                                    </button>
                                </div>

                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                </form>
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
        $("#loading").css("display", "none");
    });

    function submitform() {
        var formData = new FormData();
        formData.append('file', $('#importFile')[0].files[0]);
        var tenconty = $("#tencongty").val();
        var macongty = $("#macongty").val();
        var filePath = $("#importFile").val();
        console.log(filePath);
        $.ajax({
            url: 'import?tencong=' + tenconty + '&macongty=' + macongty,
            type: 'POST',
            data: formData,
            processData: false,  // tell jQuery not to process the data
            contentType: false,  // tell jQuery not to set contentType
            async: false,
            success: function (data) {
                console.log(data);
                alert(data);
            }
        });

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