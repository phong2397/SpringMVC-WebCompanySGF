<%@ page import="com.sgfintech.handler.CustomerHandler" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>\
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute(Consts.Session_Euser) != null){
        Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if(role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("upload")){
        }else{
            response.sendRedirect("404");
        }
    } else{
        response.sendRedirect("login");

    }
%>
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

                </div>
            </div>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-lg-12 col-12">
                        <div class="box">
                            <!-- /.box-header -->
                            <form class="form-control" >
                                <div class="box-body">
                                    <h4 class="box-title text-info"><i class="ti-save mr-15"></i> Thông tin khách hàng
                                    </h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Số điện thoại</label>
                                                <input  type="text" class="form-control" name="customerPhone" id="customerPhone"
                                                       placeholder="Tên công ty">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Số CMND</label>
                                                <input type="text" class="form-control" name="customerId" id="customerId"
                                                       placeholder="Số CMND">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Họ và tên</label>
                                                <input type="text" class="form-control" name="customerName" id="customerName"
                                                       placeholder="Họ và tên">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-rounded btn-primary btn-outline" >
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
                                            <th>Thông tin khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th>Chức vụ</th>
                                            <th>Thông tin CMND</th>
                                            <th>Thông tin ngân hàng</th>
                                            <th>Thông tin nhân thân</th>
                                            <th>Tài liệu</th>
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
                    <p>Họ Tên : <img src="" id="customerImageFront" alt=""></p>
                    <p>Email :  <img src="" id="customerImageBack" alt=""></p>

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

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/pages/dashboard9.js"></script>
<script src="js/pages/data-table.js"></script>
<script src="assets/vendor_components/dropzone/dropzone.js"></script>
<script src="assets/vendor_components/sweetalert/sweetalert.min.js"></script>
<script src="assets/vendor_components/sweetalert/jquery.sweet-alert.custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript" src="js/funcListCustomer.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();

    });
    <%
         List<CustomerHandler> list = (List<CustomerHandler>) request.getAttribute("views");
         Gson g = new Gson();
         String json = g.toJson(list);
     %>
    function viewInfoCustomer(params) {
        result.forEach((customer) => {
            if (customer.customer.customerPhone == params) {
                let c = customer.customer;
                Object.keys(c).forEach((key) => {
                    if (key == "customerSalary" ){
                        value = c[key]
                        $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
                    }
                    else{
                        $('#' + key).text(c[key]);
                    }
                })
            }
        })
        $('#modal-right').modal('show');
    }
</script>
</body>

</html>