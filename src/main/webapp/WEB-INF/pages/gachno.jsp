<%@ page import="com.sgfintech.handler.MergeDataWithdraw" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.Contract" %>
<%@ page import="com.sgfintech.entity.DetailTransaction" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
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
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="dd-MM-yyyy"/>
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
                        <h3 class="page-title">Gạch nợ cho khách hàng</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Kế toán kiểm toán</li>
                                    <li class="breadcrumb-item active" aria-current="page">Gạch nợ</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="px-30 my-15 no-print">
                <div class="callout callout-warning" style="margin-bottom: 0!important;">
                    <h4><i class="fa fa-info"></i> Note:</h4>
                    Có thể hóa đơn gạch nợ bằng tay. Vui lòng bấm vào nút In Hóa Đơn để lưu giữ chứng từ
                </div>
            </div>
            <div class="col-12">
                <div class="bb-1 clearFix">
                    <div class="text-right pb-15">
                        <button onclick="printDiv('main')" class="btn btn-rounded btn-facebook"
                                type="button"> <span><i
                                class="fa fa-print"></i>&nbsp;In hóa đơn</span></button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Danh sách chờ gạch nợ</h4>
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
                                        <th class="text-center">Số tiền tạm ứng</th>
                                        <th class="text-center">Số tiền tạm ứng</th>
                                        <th class="text-center">Phí</th>
                                        <th class="text-center">Mức phí</th>
                                        <th class="text-center">Mức phí</th>
                                        <th class="text-center">TG yêu cầu</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Người chuyển tiền</th>
                                        <th class="text-center">TG chuyển tiền</th>
                                        <th class="text-center">Chứng từ chuyển tiền</th>
                                        <th class="text-center">Người thu tiền</th>
                                        <th class="text-center">TG thu tiền</th>
                                        <th class="text-center">Chứng từ thu tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${views}" var="lst" varStatus="loop">
                                        <tr id="tr-${lst.id}">
                                            <td class="text-center">
                                                <a href="#" data-toggle="modal"
                                                   onclick="viewformUpload('${lst.id}')"><b>${lst.id}</b></a>
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
                                                        value="${lst.amount * 0.02}"
                                                        type="number"/> đ
                                            </td>
                                            <td class="text-center">
                                                    ${lst.amount * 0.02}
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
                                                <c:choose>
                                                    <c:when test="${lst.status eq 'done'}"><b
                                                            style="color: steelblue">Chuyển tiền thành công</b></c:when>
                                                    <c:otherwise>
                                                        Đã chờ chuyển tiền
                                                    </c:otherwise>

                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                    ${lst.payer}
                                            </td>
                                            <td class="text-center">
                                                <fmt:parseDate value="${lst.payDate}"
                                                               pattern="yyyy-MM-dd'T'HH:mm"
                                                               var="day"
                                                               type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                value="${day}"/>


                                            </td>
                                            <td class="text-center">
                                                <a href="/${lst.payImages}" target="_blank"> <img
                                                        src="/${lst.payImages}" alt="" width="100%"></a>
                                            </td>
                                            <td class="text-center">
                                                    ${lst.collector}
                                            </td>
                                            <td class="text-center">
                                                    ${lst.collectDate}
                                            </td>
                                            <td class="text-center">
                                                <a href="/${lst.collectionImages}" target="_blank"><img
                                                        src="/${lst.collectionImages}"
                                                        alt="" width="100%"></a>
                                            </td>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>


                <!-- /.col -->
            </div>
            <!-- Main content -->

            <!-- /.content -->
        </div>
    </div>
    <!-- /.content-wrapper -->

    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
    <!-- /.control-sidebar -->
    <jsp:include page="general/modal.jsp"/>
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
                    <form action="gachno.html" method="post" id="from_upload"
                          enctype="multipart/form-data">
                        <div class="form-group">
                            <h5 style="color: black ">Upload hình ảnh</h5>
                            <label><b style="color:black; margin-bottom: 20px; ">Chọn hình ảnh:</b><br>
                                <input type="file" id="importFile"
                                       name="file"/>
                            </label><br>
                            <span id="ids"><img id="imgUpload" class="img" src=""/></span>
                            <span id="id_donhang" style="display: none"></span>

                        </div>

                        <button type="button" class=" btn btn-rounded btn-info btn-accept" onclick="gachno()">Gạch
                            nợ
                        </button>
                        <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">Đóng trang
                        </button>
                    </form>

                </div>


                <!-- Footer -->


            </div>
        </div>
    </div>
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script src="js/vendors.min.js"></script>
<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript" src="js/funcThuhoino.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        $('#example').DataTable({
            dom: 'Bfrtip',
            pageLength: 10,
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
                    targets: [8, 11]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách chờ gạch nợ ',
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19]

                    }
                },
            ]
        })
    });


    <%
          List<DetailTransaction> list = ( List<DetailTransaction>) request.getAttribute("views");
                Gson g = new Gson();
                String json = g.toJson(list);
        List<Contract> list1 = (List<Contract>) request.getAttribute("con");
        Gson gs= new Gson();
        String json1 = gs.toJson(list1);
    %>
    let result = <%=json%>;
    let list = <%=json1%>;


</script>
</body>

</html>
