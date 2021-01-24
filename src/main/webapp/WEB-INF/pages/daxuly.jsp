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
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong")) {
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
    <style>
        .page-content {
            max-width: 700px;
            margin: 32px auto;
            padding: 32px;
            background: #fff;
        }


        .tabbed {
            overflow-x: hidden; /* so we could easily hide the radio inputs */
            margin: 32px 0;
            padding-bottom: 16px;
            border-bottom: 1px solid #ccc;
        }

        .tabbed [type="radio"] {
            /* hiding the inputs */
            display: none;
        }

        .tabs {
            display: flex;
            align-items: stretch;
            list-style: none;
            padding: 0;
            border-bottom: 1px solid #ccc;
        }

        .tab > label {
            display: block;
            margin-bottom: -1px;
            padding: 12px 15px;
            border: 1px solid #ccc;
            background: #eee;
            color: #666;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .tab:hover label {
            border-top-color: #333;
            color: #333;
        }

        .tab-content {
            display: none;
            color: #777;
        }

        /* As we cannot replace the numbers with variables or calls to element properties, the number of this selector parts is our tab count limit */
        .tabbed [type="radio"]:nth-of-type(1):checked ~ .tabs .tab:nth-of-type(1) label,
        .tabbed [type="radio"]:nth-of-type(2):checked ~ .tabs .tab:nth-of-type(2) label,
        .tabbed [type="radio"]:nth-of-type(3):checked ~ .tabs .tab:nth-of-type(3) label,
        .tabbed [type="radio"]:nth-of-type(4):checked ~ .tabs .tab:nth-of-type(4) label,
        .tabbed [type="radio"]:nth-of-type(5):checked ~ .tabs .tab:nth-of-type(5) label {
            border-bottom-color: #fff;
            background: #fff;
            color: #222;
        }

        .tabbed [type="radio"]:nth-of-type(1):checked ~ .tab-content:nth-of-type(1),
        .tabbed [type="radio"]:nth-of-type(2):checked ~ .tab-content:nth-of-type(2),
        .tabbed [type="radio"]:nth-of-type(3):checked ~ .tab-content:nth-of-type(3),
        .tabbed [type="radio"]:nth-of-type(4):checked ~ .tab-content:nth-of-type(4) {
            display: block;
        }</style>
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
                                    <li class="breadcrumb-item active" aria-current="page">Tổng khách hàng thanh toán
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
                            <div class="container-fluid">
                                <div class="tabbed">
                                    <input type="radio" id="tab1" name="css-tabs" checked>
                                    <input type="radio" id="tab2" name="css-tabs">
                                    <input type="radio" id="tab3" name="css-tabs">
                                    <input type="radio" id="tab4" name="css-tabs">

                                    <ul class="tabs">
                                        <li class="tab"><label for="tab1">Hôm nay</label></li>
                                        <li class="tab"><label for="tab2">7 ngày trước </label></li>
                                        <li class="tab"><label for="tab3">Tháng này</label></li>
                                        <li class="tab"><label for="tab4">Ngày cụ thể</label></li>

                                    </ul>

                                    <div class="tab-content">
                                        <h4>Gangsta lipsum</h4>
                                        <p>Da bomb ipsizzle dolizzle sit amizzle, consectetuer adipiscing fo shizzle.
                                            Nullam
                                            yo velizzle, aliquet volutpizzle, fo shizzle yippiyo, for sure vizzle, arcu.
                                            Black eget fo shizzle. Sizzle erizzle. Rizzle at dolizzle dapibizzle turpis
                                            tempizzle izzle. Maurizzle crackalackin nibh et check out this. Cool check
                                            it
                                            out tortizzle. Break it down bling bling rhoncizzle my shizz. Fo hizzle
                                            rizzle
                                            platea boom shackalack. Gangsta dapibus. Owned tellus urna, pretizzle black,
                                            mattizzle ac, eleifend for sure, nunc. Owned suscipizzle. Integizzle
                                            sempizzle
                                            shiz sed purizzle.</p>
                                    </div>

                                    <div class="tab-content">
                                        <h4>Zombie lipsum</h4>
                                        <p>Zombie ipsum brains reversus ab cerebellum viral inferno, brein nam rick mend
                                            grimes malum cerveau cerebro. De carne cerebro lumbering animata cervello
                                            corpora quaeritis. Summus thalamus brains sit​​, morbo basal ganglia vel
                                            maleficia? De braaaiiiins apocalypsi gorger omero prefrontal cortex undead
                                            survivor fornix dictum mauris. </p>
                                    </div>

                                    <div class="tab-content">
                                        <h4>New age bullshit</h4>
                                        <p>Our conversations with other pilgrims have led to an awakening of
                                            pseudo-astral
                                            consciousness. Who are we? Where on the great myth will we be re-energized?
                                            We
                                            are at a crossroads of complexity and stagnation.</p>
                                        <p>Eons from now, we dreamers will exist like never before as we are aligned by
                                            the
                                            cosmos. We are being called to explore the stratosphere itself as an
                                            interface
                                            between nature and complexity. We must learn how to lead infinite lives in
                                            the
                                            face of bondage.</p>
                                        <p>Generated by the <a href="http://sebpearce.com/bullshit/">New Age Bullshit
                                            Generator</a></p>
                                    </div>
                                    <div class="tab-content">
                                        <h4>New age bullshit</h4>
                                        <p>Eons from now, we dreamers will exist like never before as we are aligned by
                                            the
                                            cosmos. We are being called to explore the stratosphere itself as an
                                            interface
                                            between nature and complexity. We must learn how to lead infinite lives in
                                            the
                                            face of bondage.</p>
                                        <p>Generated by the <a href="http://sebpearce.com/bullshit/">Ndsadadasdaa
                                            Generator</a></p>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.box -->
                    </div>
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách đã xử lý</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn vay</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Tên khách hàng</th>
                                            <th>Mã công ty</th>
                                            <th>Số tài khoản</th>
                                            <th>Tên ngân hàng</th>
                                            <th class="text-left">Số tiền còn nợ</th>
                                            <th class="text-left">Số tiền đã đóng</th>
                                            <th class="text-left">Số tiền còn nợ</th>
                                            <th class="text-left">Số tiền đã đóng</th>
                                            <th class="text-left">Hạn thanh toán</th>
                                            <th class="text-left">Kỳ thanh toán</th>
                                            <th class="text-left">Nhân viên nhắc nợ</th>
                                            <th class="text-left">Ngày thanh toán</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                        <tr>
                                            <td><a href="#"
                                                   onclick="viewInfoContract('${lst.contract.idContract}')"><b>${lst.contract.idContract}</b></a>
                                            </td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <b> <a data-toggle="modal" href="#" id="cPhone" class="as"
                                                           onclick="viewInfoCustomer('${lst.customer.customerPhone}')"> ${lst.customer.customerPhone}</a></b>
                                                    <span class="d-block text-muted">Tên khách hàng :<b>${lst.customer.customerName}</b></span>
                                                    <span class="d-block text-muted">Mã công ty :<b><a
                                                            data-toggle="modal" href="#"
                                                            onclick="viewInfoCompany('${lst.companies.companyCode}')"> ${lst.companies.companyCode}</a></b></span>
                                                    <span class="d-block text-muted">Số tài khoản: ${lst.customer.customerBankAcc}</span>
                                                    <span class="d-block text-muted">Tên ngân hàng : ${lst.customer.customerBankName}</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerPhone}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerName}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.companyCode}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerBankAcc}</b>
                                            </td>
                                            <td>
                                                <b> ${lst.customer.customerBankName}</b>
                                            </td>
                                            <td class="text-left"><fmt:formatNumber
                                                    value="${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow * 0.02)}"
                                                    type="number"/> đ
                                            </td>
                                            <td class="text-left">0 đ</td>
                                            <td class="text-left">${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow * 0.02)}
                                            </td>
                                            <td class="text-left">0</td>
                                            <td class="text-left">
                                                <fmt:parseDate value=" ${lst.contract.dateRepayment}"
                                                               pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob"
                                                               type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                value="${patientDob}"/></td>
                                            <td class="text-left">1</td>
                                            <td class="text-left">-</td>
                                            <td class="text-left"><fmt:parseDate value="${year}" pattern="dd-MM-yyyy"
                                                                                 var="patientDob" type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy " value="${patientDob}"/></td>
                                        </tr>
                                        </c:forEach>
                                        <tbody>
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
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="js/pages/data-table.js"></script>
<!-- Vendor JS -->
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
        // function sử dụng framework datatable của Jquery
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
            pageLength: 20,//Phân 20 kết quả cho mỗi trang
            columnDefs: [
                {
                    visible: false,
                    targets: [2, 3, 4, 5, 6, 9, 10] // ẩn đi các column đã chọn
                },
            ],
            buttons: [
                {
                    title: 'Danh sách khách hàng thanh toán',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14] // chỉ export excel các cột đã chọn

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
    var result = <%=json%>;
    var list = <%=json1%>;

</script>
</body>
</html>
