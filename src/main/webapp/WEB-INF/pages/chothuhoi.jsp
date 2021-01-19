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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="dd-MM-yyyy"/>
<jsp:include page="general/_head.jsp"/>
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
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn vay</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Tên khách hàng</th>
                                            <th>Mã công ty</th>
                                            <th>Số tài khoản</th>
                                            <th>Tên ngân hàng</th>
                                            <th class="text-left">Số tiền tối thiểu</th>
                                            <th class="text-left">Số tiền còn nợ</th>
                                            <th class="text-left">Số tiền tối thiểu</th>
                                            <th class="text-left">Số tiền còn nợ</th>
                                            <th class="text-left">Số tiền đã đóng</th>
                                            <th class="text-left">Hạn thanh toán</th>
                                            <th class="text-left">Kỳ thanh toán</th>
                                            <th class="text-left">Nhân viên nhắc nợ</th>
                                            <th class="text-left">Ngày nhắc nợ</th>
                                            <th class="text-center">Trạng thái nhắc nợ</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td class="text-left"><a data-toggle="modal" href="#"
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
                                                <td><fmt:formatNumber value="${lst.contract.borrow}" type="number"/> đ
                                                </td>
                                                <td><fmt:formatNumber value="${lst.contract.borrow}" type="number"/> đ
                                                </td>
                                                <td>${lst.contract.borrow}
                                                </td>
                                                <td>${lst.contract.borrow}
                                                </td>
                                                <td>0</td>
                                                <td><fmt:parseDate value=" ${lst.contract.dateRepayment}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${patientDob}"/>
                                                </td>
                                                <td>1</td>
                                                <td>ROOT</td>
                                                <td><fmt:parseDate value="${year}" pattern="dd-MM-yyyy" var="patientDob"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy " value="${patientDob}"/></td>
                                                <td>
                                                    <select name="status" class="form-control"
                                                            data-placeholder="Select status">
                                                        <option value="overdue">Qúa hạn</option>
                                                        <option value="pending" selected>Đang chờ</option>
                                                        <option value="paid">Đã trả tiền</option>
                                                        <option value="invalid">Không hợp lệ</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </c:forEach>
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
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript" src="js/funcThuhoino.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        // function sử dụng framework datatable của Jquery
        $('#example').DataTable({
            dom: 'Bfrtip',
            order: [[0, "desc"]],
            language: {
                emptyTable: "Không có dữ liệu",
                search: "Tìm kiếm:",
                paginate: {
                    previous: "Trang trước",
                    next: "Trang sau",
                }
            },
            pageLength: 20, //Phân 20 kết quả cho mỗi trang
            columnDefs: [
                {
                    visible: false,
                    targets: [2, 3, 4, 5, 6, 9, 10] // ẩn đi các column đã chọn
                },
            ],
            buttons: [
                {
                    title: 'Danh sách chờ thu hồi ',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15] // export excel các column đã chọn

                    }
                },
            ]
        })

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
