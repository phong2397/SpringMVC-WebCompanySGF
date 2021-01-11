<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
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
                        <h3 class="page-title">Danh sách xét duyệt</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Tiếp nhận yêu cầu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Xét duyệt</li>
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
                                <h4 class="box-title">Danh sách chờ xét duyệt</h4>
                                <h6 class="box-subtitle">Export Invoice List to Copy, CSV, Excel, PDF & Print</h6>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table id="example" class="table table-lg invoice-archive">
                                        <thead>
                                        <tr>
                                            <th>Mã yêu cầu</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Mã công ty</th>
                                            <th>Trạng thái</th>
                                            <th>Thời gian còn lại</th>
                                            <th>Thời gian ứng</th>
                                            <th>Tổng số tiền ứng</th>
                                            <th>Số tiền ứng</th>
                                            <th>Tiền phí</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td><a data-toggle="modal" href="#" id="saRequestID"
                                                       onclick="viewInfoOrder('${lst.saRequest.id}')"><b>${lst.saRequest.id}</b></a>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <b> <a data-toggle="modal" href="#"
                                                               onclick="viewInfoCustomer('${lst.customer.customerPhone}')">${lst.customer.customerName}</a></b>
                                                        <span class="d-block text-muted">Company ID :<b><a
                                                                data-toggle="modal" href="#"
                                                                onclick="viewInfoCompany('${lst.company.companyCode}')">${lst.company.companyCode}</a></b></span>
                                                    </h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <b> <a data-toggle="modal" href="#"
                                                               onclick="viewInfoCustomer('${lst.customer.customerPhone}')">${lst.customer.customerName}</a></b>
                                                    </h6>
                                                </td>
                                                <td>
                                                  <span
                                                          class="d-block text-muted"><b><a
                                                          data-toggle="modal" href="#"
                                                          onclick="viewInfoCompany('${lst.company.companyCode}')">${lst.company.companyCode}</a></b></span>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 font-weight-bold">chờ ký</h6>
                                                </td>
                                                <td>
                                                    <span class="badge badge-pill badge-primary">2 ngày</span>
                                                </td>
                                                <td>
                                                        ${lst.saRequest.timeBorrow} tháng
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 font-weight-bold"><fmt:formatNumber
                                                            value="${lst.saRequest.borrow + (lst.saRequest.borrow * 0.02)}"
                                                            type="number"/> đ
                                                        <span class="d-block text-muted font-weight-normal">Phí : <fmt:formatNumber
                                                                value="${lst.saRequest.feeBorrow }"
                                                                type="number"/> đ </span>
                                                    </h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 font-weight-bold"><fmt:formatNumber
                                                            value="${lst.saRequest.borrow + (lst.saRequest.borrow * 0.02)}"
                                                            type="number"/> đ
                                                    </h6>
                                                </td>
                                                <td>
                                                    <span class="d-block text-muted font-weight-normal"> <fmt:formatNumber
                                                            value="${lst.saRequest.feeBorrow }"
                                                            type="number"/> đ </span>

                                                </td>
                                                <td>
                                                    <button class="btn btn-rounded btn-info btn-accept">Accept</button>
                                                    <button class="btn btn-rounded btn-dark btn-refuse">Refuse</button>
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
    <!-- Modal show info customer -->
    <div class="modal modal-right fade" id="modal-left" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thông tin chi tiết đơn hàng</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                    <h3><p>Mã yêu cầu: <span id="id"></span></p></h3>
                    <p>Số điện thoại : <span id="customerPhone"></span></p>
                    <p>Số tiền ứng : <span id="borrow"></span></p>
                    <p>Phí : <span id="interestRate"></span>%</p>
                    <p>Số lần ứng : <span id="timeBorrow"></span></p>
                    <p>Trạng thái : <span id="status" style="color: #0b2c89"></span></p>
                    <p>Người xác nhận : <span id="employeeThamdinh"></span></p>
                    <p>Ngày thẩm định :<span id="day1"></span>/<span id="month1"></span>/<span id="year1"></span>&nbsp;&nbsp;<span
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

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript" src="js/funckyduyet.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        $('#example').DataTable({
            dom: 'Bfrtip',
            pageLength: 10,
            columnDefs: [
                {
                    visible: false,
                    targets: [2, 3, 8, 9]
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
                        columns: [0, 2, 3, 4, 5, 6, 8, 9]

                    }
                },
            ]
        })
    });
    <%
              List<MergeDataOrder> list = (List<MergeDataOrder>) request.getAttribute("views");
              Gson g = new Gson();
              String json = g.toJson(list);
              %>
    var result = <%=json%>;

</script>

</body>

</html>
