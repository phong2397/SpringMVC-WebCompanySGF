<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.SaRequest" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("kyduyet")) {
        } else {
            response.sendRedirect("404");
        }
    } else {
        response.sendRedirect("login");

    }
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="general/_head.jsp"/>
<style type="text/css">
    input[type="checkbox"] {
        left: inherit !important;
        /*position: absolute !important;*/
        display: block !important;
        opacity: 100 !important;
    }
</style>
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
                        <h3 class="page-title">Danh sách chờ duyệt</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Quản lý đơn hàng</li>
                                    <li class="breadcrumb-item active" aria-current="page">Số lượng đơn chờ duyệt</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main content -->
            <section class="content">

                <div class="row">


                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12">
                        <div class="box box-inverse box-warning">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Chờ giải quyết</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center my-2">
                                    <div class="font-size-60">${countWait}</div>
                                    <span>Yêu cầu chờ thẩm định</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12 ">
                        <div class="box box-inverse box-primary">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Chờ ký duyệt</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">${countWFS}</div>
                                    <span>Yêu cầu chờ ký duyệt</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-12 ">
                        <div class="box box-inverse box-success">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Đã ký duyệt</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center my-2">
                                    <div class="font-size-60">${countAct}</div>
                                    <span>Yêu cầu đã được giải ngân</span>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12 ">
                        <div class="box box-inverse " style="background-color: hotpink">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5> Đã giải ngân</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">${countDone}</div>
                                    <span>Yêu cầu tất toán thành công</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách chờ duyệt</h4><br>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table id="example" class="table table-lg invoice-archive" width="100%">
                                        <thead>
                                        <tr>
                                        <tr>
                                            <th>Mã đơn</th>
                                            <th>Họ và tên</th>
                                            <th>Số CMND</th>
                                            <th>Điện thoại</th>
                                            <th>Số lần tạm ứng</th>
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
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr id="tr-${lst.saRequest.id}">
                                                <td><a data-toggle="modal" href="#"
                                                       onclick="viewInfoCustomer('${lst.customer.customerPhone}','${lst.saRequest.id}','${lst.company.id}')"><b>${lst.saRequest.id}</b></a>
                                                </td>
                                                <td>
                                                        ${lst.customer.customerName}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerId}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerPhone}
                                                </td>

                                                <td>
                                                    <b> ${lst.saRequest.timeBorrow}</b>
                                                </td>
                                                <td>
                                                    <b> ${lst.saRequest.employeeThamdinh}</b>
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
                                                    <b>Thông qua</b>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${empty  lst.saRequest.employeeDuyet}"><b>Chưa có
                                                            người duyệt</b></c:when>
                                                        <c:otherwise>
                                                            <b> ${lst.saRequest.employeeDuyet}</b>
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
    <!-- Modal show employee thamdinh -->
    <div class="modal modal-fill fade" id="modalThamdinh" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="color: #0b0b0b">Chọn người thẩm định</h4>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                    <div class="form-group">
                        <label style="color:black">Tên người thẩm định</label><br>
                        <select id="userLogin" class="form-control">
                            <option selected disabled hidden>
                                -- Vui lòng chọn --
                            </option>
                            <c:forEach items="${admin}" var="lst" varStatus="loop">
                                <option value="${lst.userLogin}">
                                    <span> ${lst.userLogin}</span>
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer modal-footer-uniform">
                    <button type="button" onclick="chiadon(this)" class="btn btn-rounded btn-warning btn-update"
                            data-dismiss="modal">Cập nhật
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
<script type="text/javascript" src="js/funcKyduyet.js">
</script>
<script type="text/javascript">
    var selectedsaId;
    $(document).ready(function () {
        $("#loading").hide();
        $("body").on("click", ".btn-primary", function () {
            $('#modalThamdinh').modal('show');
        })
        $('#example').DataTable({
            dom: 'Bfrtip',
            ordering: false,
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
                    targets: [6, 9, 16]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách từ chối ',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 13, 15]
                    }
                },
            ]
        })
    });
    <%
                  List<MergeDataOrder> list = (List<MergeDataOrder>) request.getAttribute("views");
                  Gson g = new Gson();
                  String json = g.toJson(list);
                    List<SaRequest> list1 = (List<SaRequest>) request.getAttribute("sa");
                    Gson gs= new Gson();
                    String json1 = gs.toJson(list1);
                  %>
    var result = <%=json%>;
    var list = <%=json1%>;

</script>

</body>

</html>