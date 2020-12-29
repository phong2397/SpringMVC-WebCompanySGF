<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
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
<%
    if (session.getAttribute(Consts.Session_Euser) != null){
        Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if(role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong")){
        }else{
            response.sendRedirect("404");
        }
    } else{
        response.sendRedirect("login");

    }
%>
<jsp:include page="general/_head.jsp" />
<body class="hold-transition light-skin sidebar-mini theme-primary">
<!-- Site wrapper -->
<div class="wrapper">

    <jsp:include page="general/_header.jsp" />

    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="general/_menu.jsp" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="page-title">Danh sách cấu hình sản phẩm</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Cấu hình sản phẩm</li>
                                    <li class="breadcrumb-item active" aria-current="page">Tham số sản phẩm</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="right-title">
                        <div class="d-flex mt-10 justify-content-end">
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$12,125</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="thismonth"><canvas width="60" height="35"
                                                                style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-danger">$22,754</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastyear"><canvas width="60" height="35"
                                                               style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách cấu hình sản phẩm</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th class="text-left">Phí</th>
                                            <th class="text-left">TIền lãi</th>
                                            <th class="text-left">Số tiền nhỏ nhất</th>
                                            <th class="text-left">Số tiền lớn nhất</th>
                                            <th class="text-left">Trạng thái</th>
                                            <th class="text-left">Chi tiết sản phẩm</th>
                                            <th class="text-left">Mục tiêu</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                        <tr>
                                            <td><a href="#"
                                                   ><b>${lst.productCode}</b></a>
                                            </td>
                                            <td><b>${lst.productName}</b></td>
                                            <td class="text-left">0 đ</td>
                                            <td class="text-left">1.4%</td>
                                            <td class="text-left"><fmt:formatNumber value="1000000" type = "number"/> đ</td>
                                            <td class="text-left"><fmt:formatNumber value="2000000" type = "number"/> đ</td>
                                            <td class="text-left"><b style="color: #00E466">${lst.status}</b></td>
                                            <td class="text-left">${lst.productDetail}</td>
                                            <td class="text-left"><span class="d-block text-muted">Khách hang có thu nhập từ 6tr-8tr</span></td>
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

    <jsp:include page="general/_footer.jsp" />
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp" />
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="js/pages/data-table.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
    });

    <%--var result = <%=json%>;--%>
    <%--function viewInfoCompany(params) {--%>
    <%--    result.forEach((company) => {--%>
    <%--        if (company.companies.companyCode == params) {--%>
    <%--            let c = company.companies;--%>
    <%--            Object.keys(c).forEach((key, _) => {--%>
    <%--                let id = key;--%>
    <%--                $('#' + id).text(c[key]);--%>
    <%--            })--%>
    <%--        }--%>
    <%--    })--%>
    <%--    console.log(result);--%>
    <%--    // var index =--%>
    <%--    $('#modal-center').modal('show');--%>
    <%--}--%>
    <%--function viewInfoContract(params) {--%>
    <%--    result.forEach((contract) => {--%>
    <%--        if (contract.contract.idContract == params) {--%>
    <%--            let c = contract.contract;--%>
    <%--            Object.keys(c).forEach((key) => {--%>
    <%--                if (key == "remainAmountBorrow" ){--%>
    <%--                    value = c[key]--%>
    <%--                    $('#' + key).text(value.toLocaleString("vi-VN") + " đ");--%>
    <%--                }--%>
    <%--                else{--%>
    <%--                    $('#' + key).text(c[key]);--%>
    <%--                }--%>
    <%--            })--%>
    <%--        }--%>
    <%--    })--%>
    <%--    $('#modal').modal('show');--%>
    <%--}--%>
    <%--function viewInfoCustomer(params) {--%>
    <%--    result.forEach((customer) => {--%>
    <%--        if (customer.customer.customerPhone == params) {--%>
    <%--            let c = customer.customer;--%>
    <%--            const date = c.customerBirthday;--%>
    <%--            Object.keys(c).forEach((key) => {--%>
    <%--                if (key == "customerSalary" ){--%>
    <%--                    value = c[key]--%>
    <%--                    $('#' + key).text(value.toLocaleString("vi-VN") + " đ");--%>
    <%--                    Object.keys(date).forEach((key) => {--%>
    <%--                        $('#' + key).text(date[key]);--%>
    <%--                    })--%>
    <%--                }--%>
    <%--                else{--%>
    <%--                    $('#' + key).text(c[key]);--%>
    <%--                }--%>
    <%--            })--%>
    <%--        }--%>
    <%--    })--%>
    <%--    console.log(result);--%>
    <%--    $('#modal-right').modal('show');--%>
    <%--}--%>
</script>
</body>

</html>