<%@ page import="com.sgfintech.handler.MergeDataWithdraw" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.Contract" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("thuhoi") || role.equals("truongthuhoi")) {
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
                        <h3 class="page-title">Nợ quá hạn</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Thu hồi nợ</li>
                                    <li class="breadcrumb-item active" aria-current="page">Nợ quá hạn</li>
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
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách nợ quá hạn</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-bordered no-margin" width="100%">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn vay</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Tên khách hàng</th>
                                            <th>Mã công ty</th>
                                            <th>Số tài khoản</th>
                                            <th>Tên ngân hàng</th>
                                            <th>Thông tin công ty</th>
                                            <th>Mã công ty</th>
                                            <th>Tên công ty</th>
                                            <th>Số tiền còn nợ</th>
                                            <th>Số tiền còn nợ</th>
                                            <th>Ngày cần tất toán</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                        <tr>
                                            <td><a href="#"
                                                   onclick="viewInfoContract('${lst.contract.idContract}')"><b>${lst.contract.idContract}</b></a>
                                            </td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <b> <a data-toggle="modal" href="#" id="cPhone" class="as"
                                                           onclick="viewInfoCustomer('${lst.customer.customerPhone}')"> ${lst.customer.customerPhone}</a></b>
                                                    <span class="d-block text-muted">Tên khách hàng :<b>${lst.customer.customerName}</b></span>
                                                    <span class="d-block text-muted">Mã công ty :<b><a
                                                            data-toggle="modal" href="#"
                                                            onclick="viewInfoCompany('${lst.companies.companyCode}')"> ${lst.companies.companyCode}</a></b></span>
                                                    <span class="d-block text-muted">Số tài khoản: ${lst.customer.customerBankAcc}</span>
                                                    <span class="d-block text-muted">Tên ngân hàng : ${lst.customer.customerBankName}</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerPhone}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerName}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.companyCode}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerBankAcc}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerBankName}</b>
                                            </td>
                                            <td>
                                                <span class="d-block text-muted">Mã công ty : ${lst.companies.companyCode}</span>
                                                <span class="d-block text-muted">Tên công ty: ${lst.companies.companyName}</span>
                                            </td>
                                            <td>
                                                <span class="d-block text-muted"> ${lst.companies.companyCode}</span>
                                            </td>
                                            <td>
                                                <span class="d-block text-muted"> ${lst.companies.companyName}</span>
                                            </td>
                                            <td><fmt:formatNumber
                                                    value="${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow*0.02)}"
                                                    type="number"/> đ
                                            </td>
                                            <td>${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow*0.02)}
                                            </td>
                                            <td><fmt:parseDate value=" ${lst.contract.dateRepayment}"
                                                               pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob"
                                                               type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                value="${patientDob}"/></td>
                                        </tr>
                                        </c:forEach>
                                        <tbody>

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

    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
    <!-- /.control-sidebar -->
    <jsp:include page="general/modal.jsp"/>
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="js/pages/data-table.js"></script>
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<script type="text/javascript" src="js/funcThuhoino.js"></script>
<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        // function sử dụng framework datatable của Jquery
        $('#example').DataTable({
            dom: 'Bfrtip',
            language: {
                search: "Tìm kiếm:",
                paginate: {
                    previous: "Trang trước",
                    next: "Trang sau",
                }
            },
            order: [[0, "desc"]],
            pageLength: 10,// phân 10 kết quả cho mỗi trang
            columnDefs: [
                {
                    visible: false,
                    targets: [2, 3, 4, 5, 6, 8, 9, 11, 14] // ẩn đi các column đã chọn
                },
            ],
            buttons: [
                {
                    title: 'Danh sách đã xử lý',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 2, 3, 4, 5, 6, 8, 9, 11, 12] // chỉ export excel các cột đã chọn

                    }
                },
            ]
        });
    });
    <%
             List<MergeDataWithdraw> list = (List<MergeDataWithdraw>) request.getAttribute("views");
             Gson g = new Gson();
             String json = g.toJson(list);
             List<Contract> list1 = (List<Contract>) request.getAttribute("con");
             Gson gs= new Gson();
             String json1 = gs.toJson(list1);
         %>
    var result = <%=json%>;
    var list = <%=json1%>;

</script>
</body>
</html>
