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
<style type="text/css">
    input[type="checkbox"] {
        position: initial !important;
        display: inline-block !important;
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
                        <h3 class="page-title">Thẩm định hồ sơ</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Tiếp nhận yêu cầu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Số lượng đơn chờ xét duyệt
                                    </li>
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
                                <div id='modal'></div>
                                <h4 class="box-title">Số lượng đơn chờ xét duyệt</h4><br>
                                <%
                                    Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
                                    String role = u.getRole();
                                    if (role.equals("root") || role.equals("tnthamdinh")) { %>
                                <button class="btn btn-primary" data-toggle="modal" href="#modalThamdinh">Chia đơn
                                </button>
                                <% } else {
                                }
                                %>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <%
                                        if (role.equals("root") || role.equals("tnthamdinh")) { %>
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th><input type="checkbox"
                                                       id="rootcheckbox"></th>
                                            <th class="text-center">Mã đơn</th>
                                            <th class="text-center">Họ và tên</th>
                                            <th class="text-center">Số CMND</th>
                                            <th class="text-center">Điện thoại</th>
                                            <th class="text-center">Số lần tạm ứng</th>
                                            <th class="text-center">Nhân viên thẩm định</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th class="text-center">Phí dịch vụ</th>
                                            <th class="text-center">Mức phí</th>
                                            <th class="text-center">Mức phí</th>
                                            <th class="text-center">Thời gian yêu cầu tạm ứng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${lst.saRequest.status eq 'wait'}">
                                                    <tr id="tr-${lst.saRequest.id}">

                                                        <td class="text-center"><input type="checkbox"
                                                                                       class="checkEmployee"
                                                                                       value="${lst.saRequest.id}"/>
                                                        </td>
                                                        <td class="text-center">
                                                            <a data-toggle="modal" href="#" class="as"
                                                               onclick="viewInfoCustomer('${lst.customer.customerPhone}','${lst.saRequest.id}','${lst.company.id}')"><b>${lst.saRequest.id}</b></a>
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.customer.customerName}
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.customer.customerId}
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.customer.customerPhone}
                                                        </td>
                                                        <td class="text-center">
                                                                ${count.countBorrow(views, lst.customer.customerPhone)}
                                                        </td>
                                                        <td id="empColumn-${lst.saRequest.id}" class="text-center">
                                                            <c:choose>
                                                                <c:when test="${empty  lst.saRequest.employeeThamdinh}">-</c:when>
                                                                <c:otherwise>
                                                                    ${lst.saRequest.employeeThamdinh}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatNumber
                                                                    value="${lst.saRequest.borrow }"
                                                                    type="number"/> đ
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.saRequest.borrow }
                                                        </td>
                                                        <td class="text-center">
                                                            2 %
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatNumber
                                                                    value="${lst.saRequest.borrow  * 0.02}"
                                                                    type="number"/> đ
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.saRequest.borrow  * 0.02}
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:parseDate value=" ${lst.saRequest.createdDate}"
                                                                           pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                           type="date"/>
                                                            <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                            value="${day}"/>
                                                        </td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <% } else { %>
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn</th>
                                            <th class="text-center">Họ và tên</th>
                                            <th class="text-center">Số CMND</th>
                                            <th class="text-center">Điện thoại</th>
                                            <th class="text-center">Số lần tạm ứng</th>
                                            <th class="text-center">Nhân viên thẩm định</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th class="text-center">Phí dịch vụ</th>
                                            <th class="text-center">Mức phí</th>
                                            <th class="text-center">Mức phí</th>
                                            <th class="text-center">Thời gian yêu cầu tạm ứng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${lst.saRequest.status eq 'wait'}">
                                                    <tr id="tr-${lst.saRequest.id}">
                                                        <td class="text-center">
                                                            <a data-toggle="modal" href="#" class="as"
                                                               onclick="viewInfoNoaction('${lst.customer.customerPhone}','${lst.saRequest.id}','${lst.company.id}')"><b>${lst.saRequest.id}</b></a>
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.customer.customerName}
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.customer.customerId}
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.customer.customerPhone}
                                                        </td>

                                                        <td class="text-center">
                                                                ${count.countBorrow(views, lst.customer.customerPhone)}
                                                        </td>
                                                        <td id="empColumn-${lst.saRequest.id}" class="text-center">
                                                            <c:choose>
                                                                <c:when test="${empty  lst.saRequest.employeeThamdinh}">-</c:when>
                                                                <c:otherwise>
                                                                    ${lst.saRequest.employeeThamdinh}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatNumber
                                                                    value="${lst.saRequest.borrow }"
                                                                    type="number"/> đ
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.saRequest.borrow }
                                                        </td>
                                                        <td class="text-center">
                                                            2 %
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatNumber
                                                                    value="${lst.saRequest.borrow  * 0.02}"
                                                                    type="number"/> đ
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.saRequest.borrow  * 0.02}
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:parseDate value=" ${lst.saRequest.createdDate}"
                                                                           pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                           type="date"/>
                                                            <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                            value="${day}"/>
                                                        </td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <% } %>

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
    <!-- Modal show employee thamdinh -->
    <div class="modal modal-fill fade" id="modalThamdinh" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="color: #0b0b0b">Chỉ định thẩm định</h4>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                    <div class="form-group">
                        <label style="color:black">Chọn nhân viên thẩm định</label><br>
                        <select id="userLogin" class="form-control">
                            <option selected disabled hidden>
                                -- Vui lòng chọn --
                            </option>
                            <c:forEach items="${admin}" var="lst" varStatus="loop">
                                <c:choose>
                                    <c:when test="${lst.role eq 'nvthamdinh' && lst.status eq 0}">
                                        <option value="${lst.userLogin}">
                                            <span> ${lst.userLogin}</span>
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer modal-footer-uniform">
                    <button type="button" onclick="chiadon(this)" class="btn btn-rounded btn-warning btn-update"
                            data-dismiss="modal">Xác nhận
                    </button>
                    <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->
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
<script src="js/approve.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        <% if (role.equals("nvkyduyet")) { %>
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
            pageLength: 10,
            columnDefs: [
                {
                    visible: false,
                    targets: [7, 10]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách chờ xét duyệt',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 7, 8, 10, 11]
                    }
                },
            ]
        });
        <%}else if (role.equals("root")) { %>
        $('#example').DataTable({
            dom: 'Bfrtip',
            ordering: false,
            order: [[1, "desc"]],
            language: {
                emptyTable: "Không có dữ liệu",
                search: "Tìm kiếm:",
                paginate: {
                    previous: "Trang trước",
                    next: "Trang sau",
                }
            },
            pageLength: 10,
            columnDefs: [
                {
                    visible: false,
                    targets: [8, 11]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách chờ xét duyệt',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [1, 2, 3, 4, 5, 6, 8, 9, 11, 12]
                    }
                },
            ]
        })
        <% }%>
    })
    <%
                  List<MergeDataOrder> list = (List<MergeDataOrder>) request.getAttribute("views");
                  Gson g = new Gson();
                  String json = g.toJson(list);
                    List<SaRequest> list1 = (List<SaRequest>) request.getAttribute("sa");
                    Gson gs= new Gson();
                    String json1 = gs.toJson(list1);
                  %>
    let result = <%=json%>;
    let list = <%=json1%>;


</script>

</body>

</html>
