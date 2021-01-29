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
                                    <table id="example"
                                           class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn</th>
                                            <th class="text-center">Mã công ty</th>
                                            <th class="text-center">Tên khách hàng</th>
                                            <th class="text-center">Số điện thoại</th>
                                            <th class="text-center">Chủ tài khoản</th>
                                            <th class="text-center">Số tài khoản</th>
                                            <th class="text-center">Tên ngân hàng</th>
                                            <th class="text-center">Số tiền TU</th>
                                            <th class="text-center">Số tiền TU</th>
                                            <th class="text-center">Phí</th>
                                            <th class="text-center">Tổng phí</th>
                                            <th class="text-center">Tổng phí</th>
                                            <th class="text-center">TG yêu cầu</th>
                                            <th class="text-center">Người trả</th>
                                            <th class="text-center">TG trả</th>
                                            <th class="text-center">Người thu tiền</th>
                                            <th class="text-center">TG thu tiền</th>
                                            <th class="text-center">Trạng thái</th>
                                            <th class="text-center">HA trả</th>
                                            <th class="text-center">HA thu</th>

                                        </tr>
                                        </thead>
                                        <tbody
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td class="text-center">
                                                    <a href="#" data-toggle="modal"
                                                       onclick="viewInfoCustomer('${lst.id}')"><b>${lst.id}</b></a>
                                                </td>
                                                <td class="text-center">
                                                        ${lst.companyCode}
                                                </td>
                                                <td class="text-center">
                                                        ${lst.customerName}
                                                </td>
                                                <td class="text-center">
                                                        ${lst.customerPhone}
                                                </td>
                                                <td class="text-center">
                                                        ${lst.bankOwner}
                                                </td>
                                                <td class="text-center">
                                                        ${lst.bankAccount}
                                                </td>
                                                <td class="text-center">
                                                        ${lst.bankName}
                                                </td>
                                                <td class="text-center">
                                                    <fmt:formatNumber
                                                            value="${lst.amount}"
                                                            type="number"/> đ

                                                </td>
                                                <td class="text-center">
                                                        ${lst.amount}
                                                </td>
                                                <td class="text-center">
                                                    2 %
                                                </td>
                                                <td class="text-center">
                                                    <fmt:formatNumber
                                                            value="${lst.total}"
                                                            type="number"/> đ
                                                </td>
                                                <td class="text-center">
                                                        ${lst.total}
                                                </td>
                                                <td class="text-center">
                                                    <fmt:parseDate value="  ${lst.dateRequest}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm"
                                                                   var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>
                                                </td>
                                                <td class="text-center">
                                                        ${lst.payer}
                                                </td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${not empty lst.payDate}"><
                                                            <fmt:parseDate value="  ${lst.payDate}"
                                                                           pattern="yyyy-MM-dd'T'HH:mm"
                                                                           var="day"
                                                                           type="date"/>
                                                            <fmt:formatDate
                                                                    pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/></c:when>
                                                        <c:otherwise>
                                                            -
                                                        </c:otherwise>

                                                    </c:choose>

                                                </td>
                                                <td class="text-center">
                                                        ${lst.collector}
                                                </td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${not empty lst.payDate}"><
                                                            <fmt:parseDate value="  ${lst.collectDate}"
                                                                           pattern="yyyy-MM-dd'T'HH:mm"
                                                                           var="day"
                                                                           type="date"/>
                                                            <fmt:formatDate
                                                                    pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/></c:when>
                                                        <c:otherwise>
                                                            -
                                                        </c:otherwise>

                                                    </c:choose>

                                                </td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${lst.status eq 'active'}"><b
                                                                style="color: green">Đang hoạt
                                                            động</b></c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>

                                                    </c:choose>
                                                </td>
                                                <td class="text-center">
                                                    <img src="${lst.payImages}" alt="" width="100%">
                                                </td>
                                                <td class="text-center">
                                                    <img src="${lst.collectionImages}" alt=""
                                                         width="100%">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tbody>
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
    <div tabindex="-1" class="modal modal-fill fade" id="modal-giaingan" role="dialog" aria-hidden="true"
         aria-labelledby="exampleModalLabel">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="color: #0b0b0b">Thông tin chứng từ</h4>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- Panes -->

                <div class="modal-body">
                    <form action="giaingan.html" method="post" id="from_upload"
                          enctype="multipart/form-data">
                        <label><b style="color:black; margin-bottom: 20px; ">Chọn hình ảnh:</b><br>
                            <input type="file" class="btn btn-rounded btn-facebook "
                                   name="file"/>
                        </label><br>
                        <input type="hidden" id="id_donhang" name="id_donhang"/>
                        <img class="img" src=""/>
                        <div class="modal-footer modal-footer-uniform">
                            <button class=" btn btn-rounded btn-info btn-accept" onclick="giaingan()">Hoàn thành chuyển
                                tiền
                            </button>
                            <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">Đóng trang
                            </button>
                        </div>
                    </form>
                    <h4 id="labelDanhgia"></h4>

                    <b style="color:black">Giải ngân : Thông tin nhận tiền đầy đủ</b>
                </div>


                <!-- Footer -->


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

    function giaingan() {
        var fromData = new FormData("#from_upload");
        try {
            // This async call may fail.
            let text = $.ajax({
                type: "POST",
                timeout: 100000,
                url: "giaingan",
                data: fromData,
                dataType: 'text',
                async: false
            }).responseText;
            debugger
            return text;
        } catch (error) {
            return "Không thể kết nối tới server";
        }
    }

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
                    targets: [8, 11, 18]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách đã ký duyệt',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 8, 11, 13, 14, 15, 16, 18]

                    }
                },
            ]
        })
    });


</script>

</body>

</html>
