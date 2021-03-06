<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.SaRequest" %>
<%@ page import="com.sgfintech.entity.DetailTransaction" %>
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
<jsp:useBean id="rp" class="com.sgfintech.util.StringUtil"/>
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
                <jsp:include page="general/countSarequest.jsp"/>
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
                                            <th class="text-left">Mã đơn</th>
                                            <th class="text-left">Mã công ty</th>
                                            <th class="text-left">Tên khách hàng</th>
                                            <th class="text-left">Số điện thoại</th>
                                            <th class="text-left">Số CMND</th>
                                            <th class="text-left">Chủ tài khoản</th>
                                            <th class="text-left">Số tài khoản</th>
                                            <th class="text-left">Tên ngân hàng</th>
                                            <th class="text-left">Số tiền tạm ứng</th>
                                            <th class="text-left">Số tiền tạm ứng</th>
                                            <th class="text-left">Phí dịch vụ</th>
                                            <th class="text-left">Mức phí</th>
                                            <th class="text-left">Mức phí</th>
                                            <th class="text-left">TG yêu cầu</th>
                                            <th class="text-left">Trạng thái</th>
                                            <th class="text-left">Người giải ngân</th>
                                            <th class="text-left">TG giải ngân</th>
                                            <th class="text-left">Chứng từ giải ngân</th>
                                            <th class="text-left">Nội dung chuyển khoản</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr id="tr-${lst.id}">
                                                <td class="text-left">
                                                    <%
                                                        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
                                                        String role = u.getRole();
                                                        if (role.equals("ketoan")) { %>
                                                    <a href="#" data-toggle="modal"
                                                       onclick="viewInfoCustomer('${lst.id}')"><b>${lst.id}</b></a>
                                                    <% } else {%>
                                                    <b>${lst.id}</b>
                                                    <% }%>

                                                </td>
                                                <td class="text-left">
                                                        ${lst.companyCode}
                                                </td>
                                                <td class="text-left">
                                                        ${lst.customerName}
                                                </td>
                                                <td class="text-left">
                                                        ${lst.customerPhone}
                                                </td>
                                                <td class="text-left">
                                                        ${lst.customerId}
                                                </td>
                                                <td class="text-left">
                                                        ${lst.bankOwner}
                                                </td>
                                                <td class="text-left">
                                                        ${lst.bankAccount}
                                                </td>
                                                <td class="text-left">
                                                        ${lst.bankName}
                                                </td>
                                                <td class="text-left">
                                                    <fmt:formatNumber
                                                            value="${lst.amount}"
                                                            type="number"/> đ

                                                </td>
                                                <td class="text-left">
                                                        ${lst.amount}
                                                </td>
                                                <td class="text-left">
                                                    2 %
                                                </td>
                                                <td class="text-left">
                                                    <fmt:formatNumber
                                                            value="${lst.amount * 0.02}"
                                                            type="number"/> đ
                                                </td>
                                                <td class="text-left">
                                                        ${lst.amount * 0.02}
                                                </td>
                                                <td class="text-left">
                                                    <fmt:parseDate value="  ${lst.dateRequest}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm"
                                                                   var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>
                                                </td>
                                                <td class="text-left">
                                                    <c:choose>
                                                        <c:when test="${lst.status eq 'active'}"><b
                                                                style="color: orange">Chờ chuyển tiền</b></c:when>

                                                    </c:choose>
                                                </td>
                                                <td class="text-left">
                                                        ${lst.payer}
                                                </td>
                                                <td class="text-left">
                                                        ${lst.payDate}

                                                </td>
                                                <td class="text-left">
                                                    <a href="/${lst.payImages}" target="_blank">
                                                        <img
                                                                src="/${lst.payImages}" alt=""
                                                                width="100%"></a>
                                                </td>

                                                <td class="text-left">
                                                    Smart Cash - ${rp.replaceName(lst.customerName)}
                                                    - ${lst.customerPhone} - ${lst.id}
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
                    <div class="modal-footer modal-footer-uniform">
                        <form action="giaingan.html" method="post" id="from_upload"
                              enctype="multipart/form-data">
                            <div class="form-group">
                                <h5 style="color: black ">Giải ngân : Thông tin nhận tiền đầy đủ</h5>
                                <label><b style="color:black; margin-bottom: 20px; ">Chọn hình ảnh:</b><br>
                                    <input type="file" id="importFile"
                                           name="file"/>
                                </label><br>
                                <span id="id_donhang" style="display: none"></span>
                                <img id="imgUpload" class="img" src=""/>
                            </div>
                            <button type="button" class=" btn btn-rounded btn-info btn-accept" onclick="disburse()">
                                Hoàn thành chuyển tiền
                            </button>
                            <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">Đóng
                                trang
                            </button>
                        </form>
                    </div>
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
<script type="text/javascript" src="js/disburse.js">
</script>
<script type="text/javascript">

    <%
                 List<DetailTransaction> list = ( List<DetailTransaction>) request.getAttribute("views");
                Gson g = new Gson();
                String json = g.toJson(list);

                  List<SaRequest> listSa = (List<SaRequest>) request.getAttribute("sa");
                  Gson gSa= new Gson();
                  String jsonSa = gSa.toJson(listSa);
                %>
    let result = <%=json%>;
    let saList = <%=jsonSa%>;

    $(document).ready(function () {

        $("#loading").hide();
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
                    targets: [9, 12]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách chờ chuyển tiền',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 9, 12, 14, 15, 16, 17, 18]

                    }
                },
            ]
        })
    });


</script>

</body>

</html>
