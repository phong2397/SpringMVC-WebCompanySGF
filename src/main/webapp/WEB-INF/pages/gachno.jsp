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
<%
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("truongthuhoi")) {
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
                        <h3 class="page-title">Gạch nợ cho khách hàng</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Kế toán kiểm toán</li>
                                    <li class="breadcrumb-item active" aria-current="page">Gạch nợ</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="px-30 my-15 no-print">
                <div class="callout callout-warning" style="margin-bottom: 0!important;">
                    <h4><i class="fa fa-info"></i> Note:</h4>
                    Có thể hóa đơn gạch nợ bằng tay. Vui lòng bấm vào nút In Hóa Đơn để lưu giữ chứng từ
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Danh sách nợ</h4>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <table id="example" class="table table-striped table-bordered no-margin" width="100%">
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${views}" var="lst" varStatus="loop">
                                    <tr id="tr-${lst.contract.idContract}">
                                        <td><a href="#"
                                               onclick="viewInfo('${lst.contract.idContract}','${lst.customer.customerPhone}')"><b>${lst.contract.idContract}</b></a>
                                        </td>
                                        <td>
                                            <h6 class="mb-0">
                                                <b> <a data-toggle="modal" href="#" id="cPhone" class="as"
                                                       onclick="viewInfoCustomer('${lst.customer.customerPhone}')">${lst.customer.customerPhone}</a></b>
                                                <span class="d-block text-muted">Tên khách hàng :<b>${lst.customer.customerName}</b></span>
                                                <span class="d-block text-muted">Mã công ty :<b><a
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
                                                           pattern="yyyy-MM-dd'T'HH:mm" var="patientDob"
                                                           type="date"/>
                                            <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                            value="${patientDob}"/>
                                        </td>
                                        <td>1</td>
                                        <td>-</td>
                                        <td><fmt:parseDate value="${year}" pattern="dd-MM-yyyy" var="patientDob"
                                                           type="date"/>
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
                <div class="col-12">
                    <div class="bb-1 clearFix">
                        <div class="text-right pb-15">
                            <button onclick="printDiv('main')" class="btn btn-rounded btn-warning"
                                    type="button"> <span><i
                                    class="fa fa-print"></i>&nbsp;In hóa đơn</span></button>
                        </div>
                    </div>
                </div>

                <!-- /.col -->
            </div>
            <!-- Main content -->
            <section class="invoice printableArea" id="main" style="display: none">
                <div class="col-12">
                    <!-- title row -->
                    <div class="col-12">
                        <div class="page-header">
                            <h2 class="d-inline"><span class="font-size-30">Thông tin hóa đơn</span></h2>
                            <div class="pull-right text-right">
                                <h3><fmt:parseDate value="${year}" pattern="dd-MM-yyyy" var="patientDob" type="date"/>
                                    <fmt:formatDate pattern="dd/MM/yyyy " value="${patientDob}"/></h3>
                            </div>
                        </div>
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="col-md-6 invoice-col">
                            <strong>FROM</strong>
                            <address>
                                <strong class="text-blue font-size-24">SG Fintech</strong><br>
                                <strong class="d-inline">66 Phó Đức Chính Quận 1</strong><br>
                                <strong>Phone: (00) 123-456-7890 &nbsp;&nbsp;&nbsp;&nbsp; Email:
                                    admin@sgfintech.com.vn</strong>
                            </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6 invoice-col text-right">
                            <strong>To</strong>
                            <address>
                                <strong class="text-blue font-size-24"><span id="customerName"></span></strong><br>
                                <strong class="d-inline"><span id="customerAddress"></span></strong><br>
                                <strong>Phone: <span id="customerPhone"></span> &nbsp;&nbsp;&nbsp;&nbsp; Email:
                                    <span id="customerEmail"></span></strong>
                            </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-12 invoice-col mb-15">
                            <div class="invoice-details row no-margin">
                                <div class="col-md-6 col-lg-3"><b>Mã đơn vay:</b><span id="idContract"></span>
                                </div>
                                <div class="col-md-6 col-lg-3"><b>Thông tin giao dịch:</b>
                                    <span id="transactionId"></span></div>
                                <div class="col-md-6 col-lg-3"><b>Ngày thanh toán:</b><fmt:parseDate value="${year}"
                                                                                                     pattern="dd-MM-yyyy"
                                                                                                     var="patientDob"
                                                                                                     type="date"/>
                                    <fmt:formatDate pattern="dd/MM/yyyy " value="${patientDob}"/></div>
                                <div class="col-md-6 col-lg-3"><b>Tài khoản báo có :</b>
                                    <span id="customerBankAcc"></span></div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                    <!-- Table row -->
                    <div class="row">
                        <div class="col-12 table-responsive">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <th>Mô tả</th>
                                    <th>Serial #</th>
                                    <th class="text-right">Phí</th>
                                    <th class="text-right">Số tiền thanh toán</th>
                                </tr>
                                <tr>
                                    <td>Thanh toán dư nợ cuối kì</td>
                                    <td><span id="systemTrace"></span></td>
                                    <td class="text-right">2 %</td>
                                    <td class="text-right"><span id="borrow"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-12 text-right">
                            <p class="lead"><b>Ngày thanh toán:</b><span class="text-danger"><fmt:parseDate
                                    value="${year}" pattern="dd-MM-yyyy" var="patientDob" type="date"/>
														<fmt:formatDate pattern="dd/MM/yyyy "
                                                                        value="${patientDob}"/></span></p>
                            <div class="total-payment">
                                <h3><b>Total :</b>
                                    <td class="text-right"><span id="remainAmountBorrow"></span></td>
                                </h3>
                            </div>
                        </div>

                    </div>
                    <!-- /.col -->
                    <!-- /.row -->

                    <!-- this row will not appear when printing -->
                    <div class="row no-print">
                        <div class="col-12">
                            <button type="button" class="btn btn-rounded btn-success pull-right"><i
                                    class="fa fa-credit-card"></i> Gạch nợ
                            </button>
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
    <jsp:include page="general/modal.jsp"/>

    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
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
        $('#example').DataTable({
            dom: 'Bfrtip',
            pageLength: 10,
            language: {
                emptyTable: "Không có dữ liệu",
                search: "Tìm kiếm:",
                paginate: {
                    previous: "Trang trước",
                    next: "Trang sau",
                }
            },
            order: [[0, "desc"]],
            columnDefs: [
                {
                    visible: false,
                    targets: [2, 3, 4, 5, 6, 9, 10]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách nợ ',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15]

                    }
                },
            ]
        })
    });

    var selectedContractId;
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