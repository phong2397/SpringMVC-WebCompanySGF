<%@ page import="com.sgfintech.handler.MergeDataWithdraw" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
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
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="dd-MM-yyyy"/>
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
                        <h3 class="page-title">Đơn đã xử lý</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Thu hồi nợ</li>
                                    <li class="breadcrumb-item active" aria-current="page">Đơn đã xử lý</li>
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
                                <h4 class="box-title">Danh sách đã xử lý</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn vay</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Mã công ty</th>
                                            <th>Số tài khoản</th>
                                            <th>Tên ngân hàng</th>
                                            <th>Số điện thoại</th>
                                            <th class="text-left">Số tiền còn nợ</th>
                                            <th class="text-left">Số tiền đã đóng</th>
                                            <th class="text-left">Hạn thanh toán</th>
                                            <th class="text-left">Kỳ thanh toán</th>
                                            <th class="text-left">Nhân viên nhắc nợ</th>
                                            <th class="text-left">Ngày thanh toán</th>
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
                                                    <a href="#"
                                                       onclick="viewInfoCustomer('${lst.customer.customerPhone}')"><b>${lst.customer.customerName}</b></a>
                                                    <span class="d-block text-muted">Company ID :<b><a
                                                            data-toggle="modal" href="#"
                                                            onclick="viewInfoCompany('${lst.companies.companyCode}')"> ${lst.companies.companyCode}</a></b></span>
                                                    <span class="d-block text-muted">Account number: ${lst.customer.customerBankAcc}</span>
                                                    <span class="d-block text-muted">Owner : ${lst.customer.customerBankName}</span>
                                                    <span class="d-block text-muted">Phone number : ${lst.customer.customerPhone}</span>
                                                </h6>
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
                                                <b> ${lst.customer.customerPhone}</b>
                                            </td>
                                            <td class="text-left"><fmt:formatNumber
                                                    value="${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow*2/100)}"
                                                    type="number"/> đ
                                            </td>
                                            <td class="text-left">0 đ</td>
                                            <td class="text-left">
                                                <fmt:parseDate value=" ${lst.contract.dateRepayment}"
                                                               pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob"
                                                               type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                value="${patientDob}"/></td>
                                            <td class="text-left">1</td>
                                            <td class="text-left">ROOT</td>
                                            <td class="text-left"><fmt:parseDate value="${year}" pattern="dd-MM-yyyy"
                                                                                 var="patientDob" type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy " value="${patientDob}"/></td>
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
    <!-- Modal show info contract -->
    <div class="modal modal-right fade" id="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thông tin chi tiết hợp đồng </h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                    <h3><p>Mã hợp đồng : <span id="idContract"></span>9999</p></h3>
                    <p>System Trace : <span id="systemTrace"></span></p>
                    <p>Số điện thoại khách hàng : <span id="customerPhone"></span></p>
                    <p>Số lần mượn : <span id="timeBorrow"></span></p>
                    <p>Số tiền mượn : <span id="borrow"></span></p>
                    <p>Phí mượn : <span id="feeBorrow"></span></p>
                    <p>Mã giao dịch : <span id="transactionId"></span></p>
                    <p>Trạng thái : <b style="color: #0b2c89"><span id="status"></span></b></p>
                    <p>Người ký duyệt : <span id="acceptedBy"></span></p>
                    <p>Ngày ký duyệt : <span id="day1"></span>/<span id="month1"></span>/<span id="year1"></span>&nbsp;&nbsp;<span
                            id="hour"></span>:<span id="minute"></span>:<span id="second"></span></p>

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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="js/pages/data-table.js"></script>
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="js/funcdaxuly.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        $('#example').DataTable({
            dom: 'Bfrtip',
            pageLength: 10,
            columnDefs: [
                {
                    visible: false,
                    targets: [2, 3, 4, 5, 6]
                },
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

                    }
                },
            ]
        })
    });
    <%
             List<MergeDataWithdraw> list = (List<MergeDataWithdraw>) request.getAttribute("views");
             Gson g = new Gson();
             String json = g.toJson(list);
         %>
    var result = <%=json%>;

</script>
</body>
</html>
