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
                        <h3 class="page-title">Danh sách chờ chuyển tiền</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Phòng kế toán</li>
                                    <li class="breadcrumb-item active" aria-current="page">Số lượng đơn chờ chuyển
                                        tiền
                                    </li>
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
                                    <span>Yêu cầu chờ giải ngân</span>
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
                                <h4 class="box-title">Danh sách chờ chuyển tiền</h4><br>
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
                                            <th>Thời gian yêu cầu giải ngân</th>
                                            <th>Trạng thái</th>
                                            <th>Nhân viên xét duyệt</th>
                                            <th>Hạn thanh toán</th>
                                            <th>Số tiền thanh toán</th>
                                            <th>Số tiền thanh toán</th>
                                            <th>Chủ tài khoản</th>
                                            <th>Số tài khoản</th>
                                            <th>Tên ngân hàng</th>
                                        </tr>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr id="tr-${lst.saRequest.id}">
                                                <td>
                                                    <a data-toggle="modal" href="#" class="as"
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
                                                    <fmt:parseDate value=" ${lst.saRequest.employeeDuyetDate}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>
                                                </td>
                                                <td style="color: #0aa5df">
                                                    <b> Chờ chuyển tiền</b>
                                                </td>
                                                <td id="employeeDuyet-${lst.saRequest.id}">
                                                        ${lst.saRequest.employeeDuyet}
                                                </td>
                                                <td>
                                                    05/02/2021
                                                </td>
                                                <td>
                                                    <fmt:formatNumber
                                                            value="${lst.saRequest.borrow  + (0.02 * lst.saRequest.borrow ) }"
                                                            type="number"/> đ
                                                </td>
                                                <td>
                                                        ${lst.saRequest.borrow  + (0.02 * lst.saRequest.borrow ) }
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
    <div tabindex="-1" class="modal modal-right fade" id="modal-giaingan" role="dialog" aria-hidden="true"
         aria-labelledby="exampleModalLabel">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="tabbable">
                        <!-- Nav Tabs, Modal Nav Bar -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item active">
                                <a class="nav-link active" href="#aDepartments" data-toggle="tab">
                                    Thông tin chi tiết
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="#historyInfo" data-toggle="tab">
                                    Lịch sử đơn hàng
                                </a>
                            </li>

                        </ul>

                    </div>
                    <!-- Close Button -->
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- Panes -->

                <div class="modal-body">
                    <div class="tab-content">
                        <div class="tab-pane" id="historyInfo">
                            <table class="table table-lg invoice-archive" width="100%">
                                <thead>
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Thời gian yêu cầu</th>
                                    <th>Số tiền ứng</th>
                                    <th>Trạng thái đơn</th>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane active" id="aDepartments">
                            <div class="row" id="saId">
                            </div>
                            <div class="row">
                                <div class="col-3 ">
                                    <h4><b>*</b>&nbsp;&nbsp;Thông tin cá nhân</h4>
                                    <p>Họ và tên : <span id="customerName" style="color:grey;"></span></p>
                                    <p>Giới tính : <span id="customerGender" style="color:grey;"></span></p>
                                    <p>Ngày sinh : <span id="day" style="color:grey;"></span>/<span id="month"
                                                                                                    style="color:grey;"></span>/<span
                                            id="year" style="color:grey;"></span></p>
                                    <p>Địa chỉ thường trú : <span id="customerAddress" style="color:grey;"></span></p>
                                    <p>Địa chỉ tạm trú : <span id="customerAddressTemp" style="color:grey;"></span></p>
                                </div>
                                <div class="col-3 ">
                                    <h4><b>*</b>&nbsp;&nbsp;Liên lạc</h4>
                                    <p>Số điện thoại : <span id="customerPhone" style="color:grey;"></span></p>
                                    <p>Email : <span id="customerEmail" style="color:grey;"></span></p>
                                </div>
                                <div class="col-3 " id="job"></div>
                                <div class="col-3 "><h4><b>*</b>&nbsp;&nbsp;Tài khoản nhận</h4>
                                    <p> Chủ tài khoản : <span id="customerBank" style="color:grey;"></span></p>
                                    <p>Số tài khoản : <span id="customerBankAcc" style="color:grey;"></span></p>
                                    <p> Tên ngân hàng : <span id="customerBankName" style="color:grey;"></span></p>
                                </div>
                                <div class="col-3 " id="relativeInfo">
                                </div>
                                <div class="col-3 " id="saInfo">
                                </div>
                            </div>
                            <hr>
                            <h4 id="labelDanhgia"></h4>
                            <div class="row" id="danhgia">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="modal-footer modal-footer-uniform">
                    <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Đóng trang
                    </button>
                </div>

            </div>
        </div>
    </div>
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
<script type="text/javascript" src="js/funcGiaingan.js">
</script>
<script type="text/javascript">
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
    console.log(saList)
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
            pageLength: 10,
            columnDefs: [
                {
                    visible: false,
                    targets: [6, 9, 16]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách đã ký duyệt',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 13, 14, 16, 17, 18, 19]

                    }
                },
            ]
        })
    });


</script>

</body>

</html>
