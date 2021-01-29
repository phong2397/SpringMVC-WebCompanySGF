<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 1/28/2021
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <h3 class="page-title">Tra soát thông tin chứng từ hóa đơn</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Phòng kế toán</li>
                                    <li class="breadcrumb-item active" aria-current="page">Tra soát thông tin chứng từ
                                        hóa đơn
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

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="box">
                                                    <div class="box-body p-0">
                                                        <div class="col-12">
                                                            <div class="row ico-filter" data-ref="ico-filter">
                                                                <div class="col-12 col-md-6 col-lg-4 mix realestate sponsored">
                                                                    <div class="box box-body pull-up">
                                                                        <div class="d-flex justify-content-between">
                                                                            <div class="media align-items-center p-0">
                                                                                <h4>
                                                                                    <p class="no-margin font-weight-600"><span
                                                                                            class="text-warning">15.000.000 đ</span>
                                                                                    </p>
                                                                                    <p> Tổng số dư đã ký
                                                                                    </p></h4>

                                                                            </div>
                                                                            <div class="media align-items-center p-0">
                                                                                <div class="text-center">
                                                                                    <a href="#"><i
                                                                                            class="cc XRP mr-5"
                                                                                            title="XRP"></i></a>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-md-6 col-lg-4 mix finance sponsored">
                                                                    <div class="box box-body pull-up">
                                                                        <div class="d-flex justify-content-between">
                                                                            <div class="media align-items-center p-0">
                                                                                <h4>
                                                                                    <p class="no-margin font-weight-600"><span
                                                                                            class="text-warning">500.000 đ</span>
                                                                                    </p>
                                                                                    <p> Tổng số tiền đã trả
                                                                                    </p></h4>

                                                                            </div>
                                                                            <div class="media align-items-center p-0">
                                                                                <div class="text-center">
                                                                                    <a href="#"><i
                                                                                            class="cc STEEM mr-5"
                                                                                            title="STEEM"></i></a>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box">
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
                                                            <th class="text-center">Tổng phí</th>
                                                            <th class="text-center">Tổng phí</th>
                                                            <th class="text-center">TG yêu cầu</th>
                                                            <th class="text-center">Người chuyển tiền</th>
                                                            <th class="text-center">TG chuyển tiền</th>
                                                            <th class="text-center">Chứng từ chuyển tiền</th>
                                                            <th class="text-center">Người thu tiền</th>
                                                            <th class="text-center">TG thu tiền</th>
                                                            <th class="text-center">Trạng thái</th>
                                                            <th class="text-center">Chứng từ thu tiền</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody
                                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                                            <tr id="tr-${lst.id}">
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
                                                                        ${lst.payDate}

                                                                </td>
                                                                <td class="text-center">
                                                                    <img src="/${lst.payImages}"
                                                                         alt="" width="100%">
                                                                </td>
                                                                <td class="text-center">
                                                                        ${lst.collector}
                                                                </td>
                                                                <td class="text-center">
                                                                        ${lst.collectDate}
                                                                </td>
                                                                <td class="text-center">
                                                                    <c:choose>
                                                                        <c:when test="${lst.status eq 'active'}"><b
                                                                                style="color: green">Chờ chuyển
                                                                            tiền</b></c:when>
                                                                        <c:when test="${lst.status eq 'success'}"><b
                                                                                style="color: green">Gạch nợ thành
                                                                            công</b></c:when>
                                                                        <c:when test="${lst.status eq 'done'}"><b
                                                                                style="color: green">Chuyển tiền thành
                                                                            công</b></c:when>

                                                                    </c:choose>
                                                                </td>

                                                                <td class="text-center">
                                                                    <img src="/${lst.collectionImages}" alt=""
                                                                         width="100%">
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!-- /.box-body -->
                                        </div>

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
                    // targets: [8, 11]
                }
            ],
            buttons: [
                {
                    title: 'Danh sách thanh toán',
                    extend: 'excelHtml5',
                    exportOptions: {
                        format: {
                            customizeData: function (header, footer, body) {
                                return body;
                            }
                        },
                        columns: [0, 1, 2, 3, 4, 6, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19]

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

