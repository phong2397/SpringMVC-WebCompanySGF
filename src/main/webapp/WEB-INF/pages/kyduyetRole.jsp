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
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("nvthamdinh") || role.equals("nvkyduyet") || role.equals("nvnhacphi") || role.equals("nvthuphi") || role.equals("tnthamdinh") || role.equals("tncollection")) {
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
                                            <th></th>
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
                                                <td>
                                                </td>
                                                <td><a data-toggle="modal" href="#" class="as"
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
                                                        ${lst.saRequest.timeBorrow}
                                                </td>
                                                <td>
                                                        ${lst.saRequest.employeeThamdinh}
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
                                                    Thông qua
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${empty  lst.saRequest.employeeDuyet}">-</c:when>
                                                        <c:otherwise>
                                                            ${lst.saRequest.employeeDuyet}
                                                        </c:otherwise>

                                                    </c:choose>
                                                </td>
                                                <td>
                                                    05/02/2021
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
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="js/generalFuncTiepnhanYeucau.js" type="text/javascript"></script>
<script type="text/javascript" src="js/funcKyduyet.js">
</script>
<script type="text/javascript">
    var selectedsaId;
    $(document).ready(function () {
        $("#loading").hide();
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
            select: {
                style: 'multi',
                selector: 'td:first-child'
            },
            pageLength: 10,
            columnDefs: [
                {
                    orderable: false,
                    className: 'select-checkbox',
                    targets: 0
                },
                {
                    visible: false,
                    targets: [7, 10, 17]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách chờ duyệt',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 13, 14, 15, 17]
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
                  Gson gSa= new Gson();
                  String jsonSa = gSa.toJson(listSa);
                  %>
    var result = <%=json%>;
    var saList = <%=jsonSa%>;

</script>

</body>

</html>