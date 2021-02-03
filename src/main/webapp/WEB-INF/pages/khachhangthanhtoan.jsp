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
                        <h3 class="page-title">Tổng khách hàng thanh toán</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Repayment</li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh sách khách hàng thanh
                                        toán khách hàng thanh toán
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Main content -->
            <div class="col-lg-12 col-12">
                <div class="container-fluid">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách đã thanh toán</h4>
                            </div>
                            <div class="box-body p-15">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           data-page-size="10" width="100%">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Tên công ty</th>
                                            <th>Tên khách hàng</th>
                                            <th>Số điện thoại KH</th>
                                            <th>Số CMND</th>
                                            <th>Trạng thái đơn</th>
                                            <th>Số tiền tạm ứng</th>
                                            <th>Số tiền tạm ứng</th>
                                            <th>Phí</th>
                                            <th>Mức phí</th>
                                            <th>Mức phí</th>
                                            <th>Số tiền đã thanh toán</th>
                                            <th>Số tiền đã thanh toán</th>
                                            <th>Ngày thanh toán</th>
                                            <th>Người gạch nợ</th>
                                            <th>Ngày gạch nợ</th>
                                            <th>Hạn thanh toán</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td><a data-toggle="modal" href="#" class="as"
                                                       onclick="viewInfoCustomer('${lst.customer.customerPhone}','${lst.companies.id}','${lst.contract.idContract}')"><b>${lst.contract.idContract}</b></a>
                                                </td>
                                                <td>
                                                    <h5>Salary Advance</h5>
                                                </td>
                                                <td>
                                                        ${lst.companies.companyName}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerName}
                                                </td>

                                                <td>
                                                        ${lst.customer.customerPhone}
                                                </td>
                                                <td>
                                                        ${lst.customer.customerId}
                                                </td>
                                                </td>

                                                <td><h6 class="mb-0" style="color:hotpink">
                                                    <b>Đã tất toán</b>
                                                </h6>
                                                </td>
                                                <td><fmt:formatNumber
                                                        value="${lst.contract.borrow }"
                                                        type="number"/> đ
                                                </td>
                                                <td> ${lst.contract.borrow }</td>
                                                <td> 2 %</td>
                                                <td><fmt:formatNumber
                                                        value="${lst.contract.feeBorrow }"
                                                        type="number"/> đ
                                                </td>
                                                <td>${lst.contract.feeBorrow }
                                                </td>
                                                <td><fmt:formatNumber
                                                        value="${lst.contract.borrow + (lst.contract.borrow * 2/100) }"
                                                        type="number"/> đ
                                                </td>
                                                <td> ${lst.contract.borrow + (lst.contract.borrow * 2/100) } </td>
                                                <td><fmt:parseDate value=" ${lst.contract.dateRepayment}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm"
                                                                   var="patientDob"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${patientDob}"/></td>
                                                <td>${lst.contract.acceptedBy }
                                                </td>
                                                <td><fmt:parseDate value=" ${lst.contract.dateRepayment}"
                                                                   pattern="yyyy-MM-dd'T'HH:mm"
                                                                   var="patientDob"
                                                                   type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                    value="${patientDob}"/></td>
                                                <td>05/02/2021</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- /.box -->
            </div>

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
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script type="text/javascript" src="js/collection.js"></script>
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
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
            pageLength: 20,
            columnDefs: [
                {
                    visible: false,
                    targets: [8, 11, 13]
                },
            ],
            buttons: [
                {
                    title: 'Danh sách khách hàng đã thanh toán',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 1, 2, 3, 4, 5, 6, 8, 9, 11, 13, 14, 15, 16, 17],

                    }
                },
            ]
        });
    })
    <%
         List<MergeDataWithdraw> list = (List<MergeDataWithdraw>) request.getAttribute("views");
         Gson g = new Gson();
         String json = g.toJson(list);
         List<Contract> list1 = (List<Contract>) request.getAttribute("con");
         Gson gs= new Gson();
         String json1 = gs.toJson(list1);
     %>
    let result = <%=json%>;
    let salist = <%=json1%>;
    $("body").on("click", ".as", function () {
        var datarequest = $(this).closest("tr").find('td:eq(4)').text().trim();
        let data = {dataRequest: datarequest};
        var result = findHistoryModal(data);
        var obj = JSON.parse(result);
        $("#tbodyCon").empty();
        Object.keys(obj).forEach((key) => {
            let con = obj[key]
            console.log(con)
            let time = obj[key].contract.createdDate
            var rowElement = $('<tr></tr>');
            rowElement.append('<td><h5><a  href="#" onclick="viewInfoContract(' + con.contract.idContract + ')">' + con.contract.idContract + '</a></h5></td>');
            rowElement.append('<td><h5>' + ("0" + (time.date.day)).slice(-2) + '/' + ("0" + (time.date.month)).slice(-2) + '/' + ("0" + (time.date.year)).slice(-2) + ' ' + ("0" + (time.time.hour)).slice(-2) + ':' + ("0" + (time.time.minute)).slice(-2) + ':' + ("0" + (time.time.second)).slice(-2) + '</h5></td>');
            rowElement.append('<td><h5>' + con.contract.acceptedBy + ' </td>');

            rowElement.append('<td><h5>' + con.contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</h5></td>');
            rowElement.append('<td><h5>' + con.contract.borrow.toLocaleString("vi-VN") + ' đ</h5></td>');
            if (con.contract.status == 'act') {
                rowElement.append('<td><h5 style="color:#0D8BBD">đã giải ngân</h5></td>');

            } else if (con.contract.status == 'done') {
                rowElement.append('<td><h5 style="color: hotpink">đã tất toán</h5></td>');

            }
            $("#tbodyCon").append(rowElement)
        })
    });
</script>
</body>
</html>
