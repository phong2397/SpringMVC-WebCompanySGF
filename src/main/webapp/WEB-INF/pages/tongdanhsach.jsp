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
<%
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong")) {
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
                        <h3 class="page-title">Tổng danh sách thu hồi nợ</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Kế toán kiểm toán</li>
                                    <li class="breadcrumb-item active" aria-current="page">Tổng danh sách</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main content -->
            <section class="content">

                <div class="row">
                    <div class="col-lg-3 col-6">
                        <a class="box box-link-shadow text-center" href="javascript:void(0)">
                            <div class="box-body">
                                <div class="font-size-24">+${countDone}</div>
                                <span>Tổng số lượng gạch nợ</span>
                            </div>
                            <div class="box-body bg-info">
                                <p>
                                    <span class="mdi mdi-ticket-confirmation font-size-30"></span>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-6">
                        <a class="box box-link-shadow text-center" href="javascript:void(0)">
                            <div class="box-body">
                                <div class="font-size-24">${countAct}</div>
                                <span>Đơn đã ký duyệt thành công</span>
                            </div>
                            <div class="box-body bg-warning">
                                <p>
                                    <span class="mdi mdi-message-reply-text font-size-30"></span>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-6">
                        <a class="box box-link-shadow text-center" href="javascript:void(0)">
                            <div class="box-body">
                                <div class="font-size-24">110</div>
                                <span>Được giải quyết</span>
                            </div>
                            <div class="box-body bg-success">
                                <p>
                                    <span class="mdi mdi-thumb-up-outline font-size-30"></span>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-6">
                        <a class="box box-link-shadow text-center" href="javascript:void(0)">
                            <div class="box-body">
                                <div class="font-size-24">59</div>
                                <span>Pending</span>
                            </div>
                            <div class="box-body bg-danger">
                                <p>
                                    <span class="mdi mdi-ticket font-size-30"></span>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách gạch nợ</h4>
                                <h6 class="box-subtitle">Danh sách khách hàng được gạch nợ tự động và xác nhận gạch
                                    nợ bởi kế toán trưởng</h6>
                            </div>
                            <div class="box-body p-15">
                                <div class="table-responsive">
                                    <table id="example" class="table table-lg invoice-archive"
                                           data-page-size="10">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn vay</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Tên khách hàng</th>
                                            <th>Mã công ty</th>
                                            <th>Số tài khoản</th>
                                            <th>Tên ngân hàng</th>
                                            <th>Mã hệ thống (System Trace)</th>
                                            <th>Status</th>
                                            <th>Mã giao dịch (Transaction ID)</th>
                                            <th>Ngày thanh toán</th>
                                            <th>Số tiền còn nợ</th>
                                            <th>Số tiền còn nợ</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td><a data-toggle="modal" href="#"
                                                       onclick="viewInfoContract('${lst.contract.idContract}')"><b>${lst.contract.idContract}</b></a>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <b> <a data-toggle="modal" href="#" id="cPhone" class="as"
                                                               onclick="viewInfoCustomer('${lst.customer.customerPhone}')"> ${lst.customer.customerPhone}</a></b>
                                                        <span class="d-block text-muted">Tên khách hàng :<b>${lst.customer.customerName}</b></span>
                                                        <span class="d-block text-muted">Company ID :<b><a
                                                                data-toggle="modal" href="#"
                                                                onclick="viewInfoCompany('${lst.companies.companyCode}')"> ${lst.companies.companyCode}</a></b></span>
                                                        <span class="d-block text-muted">Số tài khoản: ${lst.customer.customerBankAcc}</span>
                                                        <span class="d-block text-muted">Chủ tài khoản : ${lst.customer.customerBankName}</span>
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
                                                </td>
                                                <td>${lst.contract.systemTrace}</td>
                                                <td><h6 class="mb-0" style="color:red"><b> Gạch nợ </b></h6></td>
                                                <td>${lst.contract.transactionId}</td>
                                                <td><fmt:parseDate value=" ${lst.contract.dateRepayment}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${patientDob}"/></td>
                                                <td><fmt:formatNumber
                                                        value="${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow * 2/100) }"
                                                        type="number"/> đ
                                                </td>
                                                <td> ${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow * 2/100) }</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
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
<script src="js/functongdanhsach.js" type="text/javascript"></script>
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide()
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