<%@ page import="com.sgfintech.handler.MergeDataWithdraw" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.Contract" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="dd-MM-yyyy"/>
<jsp:include page="general/_head.jsp"/>
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
<body class="hold-transition light-skin sidebar-mini theme-primary">
<!-- Site wrapper -->
<div class="wrapper">
    <style type="text/css">
        input[type="checkbox"] {
            left: inherit !important;
            /*position: absolute !important;*/
            display: block !important;
            opacity: 100 !important;
        }

        .multiselect-container > li > a > label {
            padding: 4px 20px 3px 20px;
        }
    </style>
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
                                    <li class="breadcrumb-item" aria-current="page">Repayment</li>
                                    <li class="breadcrumb-item active" aria-current="page">Tổng danh sách khách hàng
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
                    <div class="col-lg-12 col-12">
                        <div class="box">
                            <!-- /.box-header -->
                            <form class="form-control">
                                <div class="box-body">
                                    <h4 class="box-title text-info"><i class="ti-save mr-15"></i> Thông tin khách hàng
                                    </h4>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Họ và tên khách hàng</label>
                                                <input type="text" class="form-control" name="customerPhone"
                                                       id="customerName"
                                                       placeholder="Số điện thoại">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Ngày trễ hạn</label>
                                                <input type="text" class="form-control" name="customerId"
                                                       id="ngaytrehan"
                                                       placeholder="Số CMND">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Giai đoạn trễ hạn</label>
                                                <input type="text" class="form-control" name="customerName"
                                                       id="gdtrehan"
                                                       placeholder="Họ và tên">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Ngày gọi cuối cùng</label>
                                                <input type="text" class="form-control" name="customerName"
                                                       id="lastcallday"
                                                       placeholder="Họ và tên">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Ngày hứa thanh toán</label>
                                                <input type="text" class="form-control" name="customerName"
                                                       id="promiseday"
                                                       placeholder="Họ và tên">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Số điện thoại</label>
                                                <input type="text" class="form-control" name="customerName"
                                                       id="phone"
                                                       placeholder="Họ và tên">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Số hợp đồng</label>
                                                <input type="text" class="form-control" name="customerName"
                                                       id="idContract"
                                                       placeholder="Họ và tên">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Tình trạng</label>
                                                <input type="text" class="form-control" name="customerName"
                                                       id="status"
                                                       placeholder="Họ và tên">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Số CMND</label>
                                                <input type="text" class="form-control" name="customerId"
                                                       id="customerId"
                                                       placeholder="Số CMND">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Số lần tạm ứng</label>
                                                <input type="text" class="form-control" name="customerId"
                                                       id=""
                                                       placeholder="Số CMND">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-rounded btn-primary btn-outline">
                                        <i class="ti-save-alt"></i> Tìm kiếm
                                    </button>
                                    <button type="button" class="btn btn-rounded btn-warning btn-outline btn-reset">
                                        <i class="ti-back-right"></i> Đặt lại
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- /.box -->
                    </div>
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách khách hàng</h4><br>
                                <button class="btn btn-primary" data-toggle="modal" href="#modalnhacphi">Chia đơn
                                </button>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th><input type="checkbox"
                                                       id="rootcheckbox"></th>
                                            <th class="text-center">Mã đơn</th>
                                            <th>Giai đoạn trễ hạn</th>
                                            <th>Ngày trễ hạn</th>
                                            <th>Số hợp đồng</th>
                                            <th>Họ tên khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Số lần tạm ứng</th>
                                            <th class="text-left">Tình trạng</th>
                                            <th class="text-left">Thời gian yêu cầu tạm ứng</th>
                                            <th class="text-left">Tổng số tiền phải trả</th>
                                            <th class="text-left">Tổng số tiền phải trả</th>
                                            <th class="text-left">Thời gian phân bổ gần đây</th>
                                            <th class="text-left">Điện thoại cuối cùng</th>
                                            <th class="text-left">Ngày thanh toán</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td><input type="checkbox" class="checkEmployee"
                                                           value="${lst.contract.idContract}"/></td>
                                                <td class="text-left"><a data-toggle="modal" href="#"
                                                                         onclick="viewInfoCustomer('${lst.customer.customerPhone}','${lst.companies.id}','${lst.contract.idContract}')"
                                                ><b>${lst.contract.idContract}</b></a>
                                                </td>
                                                <td>
                                                    S0 -2 0
                                                </td>
                                                <td>
                                                    -2
                                                </td>
                                                <td>
                                                        ${lst.customer.customerContract}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerName}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerPhone}
                                                </td>
                                                <td> ${lst.contract.timeBorrow}
                                                </td>
                                                <td> Hứa thanh toán
                                                </td>
                                                <td>
                                                    <fmt:parseDate value=" ${lst.contract.createdDate}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>

                                                </td>
                                                <td><fmt:formatNumber
                                                        value="${lst.contract.borrow  * 0.02}"
                                                        type="number"/> đ
                                                </td>
                                                <td> ${lst.contract.borrow  * 0.02}
                                                </td>
                                                <td>
                                                    <fmt:parseDate value=" ${lst.contract.createdDate}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>

                                                </td>
                                                <td>
                                                    <fmt:parseDate value=" ${lst.contract.createdDate}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${day}"/>

                                                </td>
                                                <td> 05/02/2021
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
                </div>
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
    <div class="modal modal-fill fade" id="modalnhacphi" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="color: #0b0b0b">Chỉ định nhắc phí</h4>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                    <div class="form-group">
                        <label style="color:black">Chọn nhân viên nhắc phí</label><br>
                        <select id="userLogin" class="form-control">
                            <option selected disabled hidden>
                                -- Vui lòng chọn --
                            </option>
                            <c:forEach items="${admin}" var="lst" varStatus="loop">
                                <c:choose>
                                    <c:when test="${lst.role eq 'nvnhacphi'}">
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
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>

rel="stylesheet"/>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript" src="js/funcThuhoino.js"></script>
<script type="text/javascript">
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
                    targets: 11
                },
            ],
            buttons: [
                {
                    title: 'Danh sách chờ thu hồi ',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14]

                    }
                },
            ]
        })

    });
    <%
         List<MergeDataWithdraw> list = (List<MergeDataWithdraw>) request.getAttribute("views");
         Gson g = new Gson();
         String json = g.toJson(list);
         List<Contract> list1 = (List<Contract>) request.getAttribute("con");
         Gson gs= new Gson();
         String json1 = gs.toJson(list1);
     %>
    var result = <%=json%>;
    var list = <%=json1%>;

</script>
</body>
</html>
