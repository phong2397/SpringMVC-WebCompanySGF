<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.SaRequest" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
<jsp:useBean id="count" class="com.sgfintech.util.StringUtil"/>

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
                        <h3 class="page-title">Tổng danh sách khách hàng</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Quản lý đơn hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main content -->
            <section class="content">
                <jsp:include page="general/countSarequest.jsp"/>
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Tổng danh sách khách hàng</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn</th>
                                            <th>Họ và tên</th>
                                            <th>Số CMND</th>
                                            <th>Số lần tạm ứng</th>
                                            <th>Điện thoại</th>
                                            <th>Nhân viên thẩm định</th>
                                            <th>Số tiền tạm ứng</th>
                                            <th>Số tiền tạm ứng</th>
                                            <th>Phí dịch vụ</th>
                                            <th>Mức phí</th>
                                            <th>Mức phí</th>
                                            <th>Thời gian yêu cầu tạm ứng</th>
                                            <th>Trạng thái</th>
                                            <th>Nhân viên xét duyệt</th>
                                            <th>Ngày thanh toán</th>
                                            <th>Số tiền thanh toán</th>
                                            <th>Số tiền thanh toán</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td><a data-toggle="modal" href="#" class="as"
                                                       onclick="viewInfoNoaction('${lst.customer.customerPhone}','${lst.saRequest.id}','${lst.company.id}')"><b>${lst.saRequest.id}</b></a>
                                                </td>
                                                <td>
                                                        ${lst.customer.customerName}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerId}
                                                </td>
                                                <td>
                                                        ${count.countBorrow(views, lst.customer.customerPhone)}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerPhone}
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${empty lst.saRequest.employeeThamdinh}">-</c:when>
                                                        <c:otherwise>
                                                            ${lst.saRequest.employeeThamdinh}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                        ${lst.saRequest.borrow}
                                                </td>
                                                <td>
                                                    <fmt:formatNumber
                                                            value="${lst.saRequest.borrow }"
                                                            type="number"/> đ
                                                </td>
                                                <td>
                                                    2 %
                                                </td>
                                                <td>
                                                        ${lst.saRequest.borrow * 0.02}
                                                </td>
                                                <td>
                                                    <fmt:formatNumber
                                                            value="${lst.saRequest.borrow  * 0.02}"
                                                            type="number"/> đ
                                                </td>
                                                <td>
                                                    <fmt:parseDate value=" ${lst.saRequest.createdDate}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${lst.saRequest.status eq 'wait' }"><h6
                                                                class="mb-0 font-weight-bold"
                                                                style="color: orange"> chờ xử lý
                                                        </h6></c:when>
                                                        <c:when test="${lst.saRequest.status eq 'wfs' }"><h6
                                                                class="mb-0 font-weight-bold"
                                                                style="color: royalblue"> chờ xét duyệt
                                                        </h6></c:when>
                                                        <c:when test="${lst.saRequest.status eq 'act' }"><h6
                                                                class="mb-0 font-weight-bold"
                                                                style="color: green"> đã giải ngân
                                                        </h6></c:when>
                                                        <c:when test="${lst.saRequest.status eq 'done' }"><h6
                                                                class="mb-0 font-weight-bold"
                                                                style="color: hotpink"> đã hoàn thành
                                                        </h6></c:when>
                                                        <c:when test="${lst.saRequest.status eq 'deni' }"><h6
                                                                class="mb-0 font-weight-bold"
                                                                style="color: red"> từ chối
                                                        </h6></c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${empty lst.saRequest.employeeDuyet}">-
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${lst.saRequest.employeeDuyet}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <fmt:parseDate value=" ${lst.saRequest.createdDate}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>
                                                </td>
                                                <td>
                                                    <fmt:formatNumber
                                                            value="${lst.saRequest.borrow  * 0.02}"
                                                            type="number"/> đ
                                                </td>
                                                <td>
                                                        ${lst.saRequest.borrow}
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
            </section>
        </div>
    </div>

    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
    <!-- /.control-sidebar -->
    <jsp:include page="general/modal.jsp"/>
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script src="js/generalManageSaRequest.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
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
            columnDefs: [
                {
                    visible: false,
                    targets: [6, 9, 16]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách thẩm định',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 13, 14, 16]

                    }
                },
            ]
        })
    });
    <%
                  List<MergeDataOrder> list = (List<MergeDataOrder>) request.getAttribute("views");
                  Gson g = new Gson();
                  String json = g.toJson(list);
                    List<SaRequest> listSa = (List<SaRequest>) request.getAttribute("sa");
                    Gson gs= new Gson();
                    String json1 = gs.toJson(listSa);
                  %>
    var result = <%=json%>;
    var list = <%=json1%>;
    console.log('RESULT: ', result);

</script>

</body>

</html>
