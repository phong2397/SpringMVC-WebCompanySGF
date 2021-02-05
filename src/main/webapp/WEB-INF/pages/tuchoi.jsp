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
                        <h3 class="page-title">Danh sách đơn bị từ chối</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Tiếp nhận yêu cầu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Đơn bị từ chối</li>
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
                                    <h5>Tổng số yêu cầu</h5>
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
                        <div class="box box-inverse " style="background-color: red">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5> Đã xử lý</h5>
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
                                    <div class="font-size-60">${countDeni}</div>
                                    <span>Yêu cầu bị từ chối</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách bị từ chối</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn</th>
                                            <th class="text-center">Họ và tên</th>
                                            <th class="text-center">Số CMND</th>
                                            <th class="text-center">Số lần tạm ứng</th>
                                            <th class="text-center">Điện thoại</th>
                                            <th class="text-center">Nhân viên thẩm định</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th class="text-center">Số tiền tạm ứng</th>
                                            <th class="text-center">Phí dịch vụ</th>
                                            <th class="text-center">Mức phí</th>
                                            <th class="text-center">Mức phí</th>
                                            <th class="text-center">Thời gian yêu cầu tạm ứng</th>
                                            <th class="text-center">Trạng thái</th>
                                            <th class="text-center">Nhân viên xét duyệt</th>
                                            <th class="text-center">Lý do từ chối</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${lst.saRequest.status eq 'deni'}">
                                                    <tr id="tr-${lst.saRequest.id}">
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
                                                                ${count.countBorrow(views, lst.customer.customerPhone)}
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.customer.customerPhone}
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.saRequest.employeeThamdinh}
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.saRequest.borrow}
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatNumber
                                                                    value="${lst.saRequest.borrow }"
                                                                    type="number"/> đ
                                                        </td>
                                                        <td class="text-center">
                                                            2 %
                                                        </td>
                                                        <td class="text-center">
                                                                ${lst.saRequest.borrow * 0.02}
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatNumber
                                                                    value="${lst.saRequest.borrow  * 0.02}"
                                                                    type="number"/> đ
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:parseDate value=" ${lst.saRequest.createdDate}"
                                                                           pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                           type="date"/>
                                                            <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                            value="${day}"/>
                                                        </td>
                                                        <td class="text-center">
                                                            <b style="color: red">Từ chối</b>
                                                        </td>

                                                        <td class="text-center">
                                                            <c:choose>
                                                                <c:when test="${empty lst.saRequest.employeeDuyet}">-</c:when>
                                                                <c:otherwise>
                                                                    ${lst.saRequest.employeeDuyet}
                                                                </c:otherwise>

                                                            </c:choose>
                                                        </td>
                                                        <td class="text-center">
                                                            <c:choose>
                                                                <c:when test="${empty lst.saRequest.description}"><b>Chưa
                                                                    có lý
                                                                    do</b></c:when>
                                                                <c:otherwise>
                                                                    <b>${lst.saRequest.description}</b>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
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
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery.elevateZoom-3.0.8.min.js"></script>
<script src="js/generalManageSaRequest.js" type="text/javascript"></script>
<script src="js/approve.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        $("body").on("click", ".btn-primary", function () {
            $('#modal-right').modal('show');
        })
        let example = $('#example').DataTable({
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
                    targets: [6, 9]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách từ chối ',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 13, 14]
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
    let result = <%=json%>;
    let list = <%=json1%>;


</script>

</body>

</html>
