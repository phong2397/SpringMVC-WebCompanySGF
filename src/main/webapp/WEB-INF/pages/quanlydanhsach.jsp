<%@ page import="com.sgfintech.entity.Companies" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:42
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
                        <h3 class="page-title">Quản lý danh sách khách hàng </h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Upload tài liệu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Quản lý danh sách
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
                            <form class="form">
                                <div class="box-body">
                                    <h4 class="box-title text-info"><i class="ti-save mr-15"></i> Thông tin công ty
                                    </h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label style="color:black">Tên công ty</label><br>
                                                <select id="company_name" class="form-control"
                                                        onchange="onCompanyName(event)">
                                                    <option id="companyName">
                                                        -- Vui lòng chọn --
                                                    </option>
                                                    <c:forEach items="${views}" var="lst" varStatus="loop">
                                                        <option id="companyName" value="${lst.companyName}">
                                                            <span> ${lst.companyName}</span>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label style="color: black">Mã công ty </label>
                                                <select id="company_code" class="form-control"
                                                        onchange="onCompanyChanged(event)">
                                                    <option id="companyCode">
                                                        -- Please Choose --
                                                    </option>
                                                    <c:forEach items="${views}" var="lst" varStatus="loop">
                                                        <option id="companyCode" value="${lst.companyCode}">
                                                                ${lst.companyCode}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                    <button type="button"
                                            class="btn btn-rounded btn-primary btn-outline">
                                        <i class="ti-save-alt"></i> Tìm kiếm
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- /.box -->
                    </div>
                    <div class="col-lg-12 col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách khách hàng </h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table class="table table-striped table-bordered no-margin" width="100%">
                                        <thead>
                                        <tr>
                                            <th>Mã công ty</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th>Chức vụ</th>
                                            <th>Thông tin CMND</th>
                                            <th>Thông tin ngân hàng</th>
                                            <th>Tài liệu</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbodytable">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
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
<!-- ./wrapper -->

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/pages/dashboard9.js"></script>
<script src="js/demo.js"></script>
<script src="assets/vendor_components/dropzone/dropzone.js"></script>
<script src="assets/vendor_components/sweetalert/sweetalert.min.js"></script>
<script src="assets/vendor_components/sweetalert/jquery.sweet-alert.custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="js/manageCustomer.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
    });
    <%
        List<Companies> list = (List<Companies>) request.getAttribute("views");
        Gson g = new Gson();
        String json = g.toJson(list);
    %>
    var comList = <%=json%>;

    function onCompanyChanged(e) {
        let value = e.target.value;
        let com = comList.find(e => e.companyCode == value);
        $('#companyName').text(com.companyName);
    }

    function onCompanyName(e) {
        let value1 = e.target.value;
        let com1 = comList.find(e => e.companyName == value1);
        $('#companyCode').text(com1.companyCode);
    }
</script>
</body>

</html>
