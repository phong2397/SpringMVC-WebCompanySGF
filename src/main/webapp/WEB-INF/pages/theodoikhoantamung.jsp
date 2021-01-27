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
                        <h3 class="page-title">Tổng danh sách </h3>
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
                                <div class="font-size-24">${countDone}</div>
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
                                <h4 class="box-title">Danh sách các đơn tạm ứng</h4>

                            </div>
                            <div class="box-body p-15">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           data-page-size="10" width="100%">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn</th>
                                            <th>Họ và tên</th>
                                            <th>Chủ tài khoản</th>
                                            <th>Số tài khoản</th>
                                            <th>Tên ngân hàng</th>
                                            <th>Số CMND</th>
                                            <th>Điện thoại</th>
                                            <th>Số lần tạm ứng</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th>Phí dịch vụ</th>
                                            <th>Mức phí</th>
                                            <th>Mức phí</th>
                                            <th>Mã hệ thống (System Trace)</th>
                                            <th>Status</th>
                                            <th>Mã giao dịch (Transaction ID)</th>
                                            <th class="text-left">Số tiền còn nợ</th>
                                            <th class="text-left">Số tiền còn nợ</th>
                                            <th class="text-left">Số tiền đã đóng</th>
                                            <th class="text-left">Số tiền đã đóng</th>
                                            <th class="text-left">Hạn thanh toán</th>
                                            <th class="text-left">Kỳ thanh toán</th>
                                            <th class="text-left">Ngày giải ngân</th>
                                            <th class="text-left">Ngày thanh toán</th>
                                            <th class="text-left">Uỷ nhiệm chi</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr id="tr-${lst.contract.idContract}">
                                                <td><a href="#" class="as"
                                                       onclick="viewInfoCustomer('${lst.customer.customerPhone}','${lst.companies.id}','${lst.contract.idContract}')"><b>${lst.contract.idContract}</b></a>
                                                </td>
                                                <td>
                                                        ${lst.customer.customerName}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerBank}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerBankAcc}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerBankName}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerId}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerPhone}
                                                </td>
                                                <td> ${lst.contract.timeBorrow}
                                                </td>
                                                <td><fmt:formatNumber
                                                        value="${lst.contract.borrow }"
                                                        type="number"/> đ
                                                </td>
                                                <td>${lst.contract.borrow }
                                                </td>
                                                <td>
                                                    2 %
                                                </td>
                                                <td>
                                                    <fmt:formatNumber
                                                            value=" ${lst.contract.borrow * 0.02}"
                                                            type="number"/> đ
                                                </td>
                                                <td>
                                                        ${lst.contract.borrow * 0.02}
                                                </td>
                                                <td>${lst.contract.systemTrace}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${lst.contract.status eq 'act' }">
                                                            <b style="color:#0D8BBD">Đã giải ngân</b></c:when>
                                                        <c:when test="${lst.contract.status eq 'done' }">
                                                            <b style="color:hotpink">Đã tất toán</b></c:when>
                                                    </c:choose>

                                                </td>
                                                <td>${lst.contract.transactionId}</td>
                                                <td>
                                                    <fmt:formatNumber
                                                            value=" ${lst.contract.borrow + (lst.contract.borrow * 0.02)}"
                                                            type="number"/> đ
                                                </td>
                                                <td>
                                                        ${lst.contract.borrow + (lst.contract.borrow * 0.02)}
                                                </td>
                                                <td>
                                                    <fmt:formatNumber
                                                            value=" ${lst.contract.feeBorrow}"
                                                            type="number"/> đ
                                                </td>
                                                <td>
                                                        ${lst.contract.feeBorrow}
                                                </td>
                                                <td>
                                                    05/02/2021
                                                </td>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                        ${lst.contract.createdDate}
                                                </td>
                                                <td>
                                                        ${lst.contract.dateRepayment}
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-info btn-github"
                                                            data-dismiss="modal">Upload
                                                    </button>
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
<script type="text/javascript" src="js/funcThuhoino.js"></script>
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide()
        // function sử dụng framework datatable của Jquery
        $('#example').DataTable({
            dom: 'Bfrtip',
            language: {
                emptyTable: "Không có dữ liệu",
                search: "Tìm kiếm:",
                paginate: {
                    previous: "Trang trước",
                    next: "Trang sau",
                }
            },
            order: [[0, "desc"]],
            pageLength: 10,
            columnDefs: [
                {
                    visible: false,
                    targets: [9, 12, 17, 19]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách tổng hợp các khoản tạm ứng',
                    extend: 'excel',
                    exportOptions: {
                        customize: function (xlsx) {
                            var sheet = xlsx.xl.worksheets['sheet1.xml'];
                            $('row c[r^="A"]', sheet).attr('s', '50');
                            $('row c[r^="D"]', sheet).attr('s', '50');
                        },
                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 13, 14, 15, 17, 19, 20, 21, 22, 23, 24],

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
    var salist = <%=json1%>;

</script>
</body>

</html>