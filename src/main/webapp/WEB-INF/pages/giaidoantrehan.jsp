<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
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
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="dd-MM-yyyy"/>
<%
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("nvthamdinh") || role.equals("nvkyduyet") || role.equals("nvnhacphi") || role.equals("nvthuphi") || role.equals("tnthamdinh") || role.equals("tncollection")) {
        } else {
            response.sendRedirect("404");
        }
    } else {
        response.sendRedirect("login");

    }
%>
<jsp:include page="general/_head.jsp"/>
<body class="hold-transition light-skin sidebar-mini theme-primary">
<!-- Site wrapper -->
<style type="text/css">
    input[type="checkbox"] {
        left: inherit !important;
        /*position: absolute !important;*/
        display: block !important;
        opacity: 100 !important;
    }
</style>
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
                        <h3 class="page-title">Giai đoạn trễ hạn</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Hệ thống cấu hình tổ chức</li>
                                    <li class="breadcrumb-item active" aria-current="page">Giai đoạn trễ hạn</li>
                                </ol>
                            </nav>
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
                                <h4 class="box-title">Giai đoạn trễ hạn</h4>
                                <div class="text-right">
                                    <button class="btn btn-primary" data-toggle="modal" href="#modalThamdinh">Thêm mới
                                    </button>
                                    <button class="btn btn-primary" data-toggle="modal" href="#modalThamdinh">Kiểm tra
                                    </button>
                                    <button class="btn btn-default" data-toggle="modal" href="#modalThamdinh">Reset
                                    </button>
                                </div>

                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered no-margin" width="100%">
                                        <thead>
                                        <tr>
                                            <th class="text-center"><input type="checkbox"
                                                                           id="rootcheckbox"></th>
                                            <th class="text-center">Mã quy tắc</th>
                                            <th class="text-center">Tên nguyên tắc</th>
                                            <th class="text-center">Giai đoạn trễ hạn</th>
                                            <th class="text-center">Cấp ưu tiên</th>
                                            <th class="text-center">Ngày bắt đầu</th>
                                            <th class="text-center">Số ngày quá hạn</th>
                                            <th class="text-center">Ngày kết thúc</th>
                                            <th class="text-center">Trạng thái</th>
                                            <th class="text-center">Người sửa đổi</th>
                                            <th class="text-center">Thời gian sửa đổi</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="text-center"><input type="checkbox" class="checkEmployee"
                                            /></td>
                                            <td class="text-center">
                                                S0
                                            </td>
                                            <td class="text-center">
                                                S0
                                            </td>
                                            <td class="text-center">
                                                S0
                                            </td>
                                            <td class="text-center">
                                                1
                                            </td>
                                            <td class="text-center">
                                                -2
                                            </td>
                                            <td class="text-center">
                                                <=T<
                                            </td>
                                            <td class="text-center">
                                                1
                                            </td>
                                            <td class="text-center">
                                                Hữu hiệu
                                            </td>
                                            <td class="text-center">
                                                Manager
                                            </td>
                                            <td class="text-center">
                                                <fmt:parseDate
                                                        value="${year}" pattern="dd-MM-yyyy" var="patientDob"
                                                        type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy "
                                                                value="${patientDob}"/>
                                            </td>
                                            <td class="text-center">
                                                <button class="btn btn-rounded btn-skype btn-accept" data-toggle="modal"
                                                        href="#modaletGiaidoantrehan" style="margin-bottom: 1%">Chỉnh
                                                    sửa
                                                </button>

                                                <button class="btn btn-rounded btn-info btn-warning">Xóa bỏ</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><input type="checkbox" class="checkEmployee"
                                            /></td>
                                            <td class="text-center">
                                                S1
                                            </td>
                                            <td class="text-center">
                                                S1
                                            </td>
                                            <td class="text-center">
                                                S1
                                            </td>
                                            <td class="text-center">
                                                1
                                            </td>
                                            <td class="text-center">
                                                1
                                            </td>
                                            <td class="text-center">
                                                <=T<
                                            </td>
                                            <td class="text-center">
                                                360
                                            </td>
                                            <td class="text-center">
                                                Hữu hiệu
                                            </td>
                                            <td class="text-center">
                                                Manager
                                            </td>
                                            <td class="text-center">
                                                <fmt:parseDate
                                                        value="${year}" pattern="dd-MM-yyyy" var="patientDob"
                                                        type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy "
                                                                value="${patientDob}"/>
                                            </td>
                                            <td class="text-center">
                                                <button class="btn btn-rounded btn-skype btn-accept" data-toggle="modal"
                                                        href="#modaletGiaidoantrehan" style="margin-bottom: 1%">Chỉnh
                                                    sửa
                                                </button>

                                                <button class="btn btn-rounded btn-info btn-warning">Xóa bỏ</button>
                                            </td>
                                        </tr>
                                        <tbody>
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

    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
    <!-- /.control-sidebar -->
    <jsp:include page="general/modal.jsp"/>

    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript" src="js/funccauhinh.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
    });
    $("#rootcheckbox").click(function () {
        $('input:checkbox').not(this).prop('checked', this.checked);
    });

</script>
</body>

</html>