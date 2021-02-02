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
                        <h3 class="page-title">Danh sách tham số điều chỉnh được</h3>
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
                </div>
            </div>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách sản phẩm</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered no-margin" width="100%">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th class="text-center">Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th class="text-left">Phí</th>
                                            <th class="text-left">Số tiền nhỏ nhất</th>
                                            <th class="text-left">Số tiền lớn nhất</th>
                                            <th class="text-left">Số lần ứng</th>
                                            <th class="text-left">Chi tiết sản phẩm</th>
                                            <th class="text-left">Trạng thái</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                        <tr>
                                            <td><a data-toggle="modal"><b>${lst.id}</b></a>
                                            </td>
                                            <td class="text-center">
                                                <input type="text" value="${lst.productCode}"
                                                       class="form-control"
                                                >
                                            </td>
                                            <td>
                                                <input type="text" value="${lst.productName}" class="form-control"
                                                       name="productName" id="productName"></td>
                                            <td class="text-left"><input type="text"
                                                                         value="${lst.productRate} %"
                                                                         class="form-control">
                                            </td>
                                            <td class="text-left"><fmt:formatNumber
                                                    value="${lst.productAmountMin}" type="number"
                                                    var="myNum"/><input
                                                    type="text"
                                                    value="${myNum} đ"
                                                    class="form-control">

                                            </td>
                                            <td class="text-left"><fmt:formatNumber
                                                    value="2000000" type="number" var="myNumMax"/><input type="text"
                                                                                                         value="${myNumMax} đ"
                                                                                                         class="form-control"
                                            >
                                            </td>
                                            <td class="text-left"><b><input type="text"
                                                                            value="${lst.limitCount} "
                                                                            class="form-control"></b>
                                            </td>
                                            <td class="text-left"><b><input type="text"
                                                                            value="${lst.productDetail}"
                                                                            class="form-control"
                                            ></b>
                                            </td>
                                            <td class="text-left"><b style="color: #00E466">${lst.status}</b></td>
                                            <td>
                                                <button class="btn btn-rounded btn-info btn-accept">Chỉnh sửa</button>
                                            </td>
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
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script type="text/javascript" src="js/setting.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
    });
</script>
</body>

</html>