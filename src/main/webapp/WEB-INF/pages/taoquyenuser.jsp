<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
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
                        <h3 class="page-title">Tạo mới người dùng</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Cấu hình sản phẩm</li>
                                    <li class="breadcrumb-item active" aria-current="page">Phân quyền
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
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Tạo mới người dùng</h4>
                            </div>
                            <div class="box-body">
                                <div class="container">
                                    <form id="demoForm">
                                        <div class="form-group">
                                            <label>Tên đăng nhập</label>
                                            <input type="text" id="user_login" name="login" class="form-control"
                                                   placeholder="Tên đăng nhập"
                                                   name="email">
                                            <span style="color: red">${check}</span>
                                            <%
                                                session.removeAttribute("check");
                                            %>
                                        </div>
                                        <div class="form-group">
                                            <label>Mật khẩu</label>
                                            <input type="password" name="pass" id="user_pass" class="form-control"
                                                   placeholder="Enter password">
                                        </div>
                                        <div class="form-group">
                                            <label>Role:</label>
                                            <select id="user_role" class="form-control">
                                                <option selected disabled hidden>
                                                    -- Vui lòng chọn --
                                                </option>
                                                <%
                                                    Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
                                                    if (u.getRole().equals("tnthamdinh")) {
                                                %>
                                                <option value="nvthamdinh">
                                                    <span>Nhân viên thẩm định</span>
                                                </option>
                                                <option value="nvkyduyet">
                                                    <span>Nhân viên ký duyệt</span>
                                                </option>
                                                <% } else if (u.getRole().equals("root")) {
                                                %>
                                                <option value="upload">
                                                    <span>upload</span>
                                                </option>
                                                <option value="tnthamdinh">
                                                    <span>Trưởng nhóm thẩm định</span>
                                                </option>
                                                <option value="ketoan">
                                                    <span>Kế toán</span>
                                                </option>
                                                <option value="ketoantruong">
                                                    <span>Kế toán trưởng</span>
                                                </option>
                                                <option value="tncollection">
                                                    <span> Trưởng nhóm collection</span>
                                                </option>
                                                <option value="nvthamdinh">
                                                    <span>Nhân viên thẩm định</span>
                                                </option>
                                                <option value="nvkyduyet">
                                                    <span>Nhân viên ký duyệt</span>
                                                </option>
                                                <% } else if (u.getRole().equals("tncollection")) {
                                                %>
                                                <option value="nvnhacphi">
                                                    <span> Nhân viên nhắc phí</span>
                                                </option>
                                                <option value="nvthuphi">
                                                    <span>Nhân viên thu phí</span>
                                                </option>
                                                <% }%>

                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-default" onclick="createUser()">Đăng ký
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách người sử dụng</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered no-margin"
                                           width="100%">
                                        <thead>
                                        <tr>
                                            <th class="text-center">No.</th>
                                            <th class="text-center">Tên đăng nhập</th>
                                            <th class="text-left">Quyền sử dụng</th>
                                            <th class="text-left">Trạng thái</th>
                                            <th class="text-left">Ngày tạo</th>
                                            <th class="text-left">Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                        <c:choose>
                                        <c:when test="${lst.userLogin ne 'root'}">
                                        <tr>
                                            <td class="text-center">${lst.id}</td>
                                            <td class="text-center" id="${lst.id}">
                                                <input type="text" class="form-control " value="${lst.userLogin}"
                                                >
                                            </td>
                                            <td class="text-left">${lst.role}
                                            </td>

                                            <td class="text-left" id="td-${lst.id}">
                                                <c:choose>
                                                    <c:when test="${lst.status eq 0 }">
                                                        <b style="color: forestgreen">Đang hoạt động</b>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <b style="color: red">Đã khóa tài khoản</b>
                                                    </c:otherwise>

                                                </c:choose>
                                            </td>
                                            <td class="text-left">
                                                <fmt:parseDate value=" ${lst.createdDate}"
                                                               pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                               type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                value="${day}"/>
                                            </td>
                                            <td class="text-left">
                                                <button class="btn btn-info"
                                                        onclick="showResetModal('${lst.id}','${lst.userLogin}')">
                                                    Đặt lại mật khẩu
                                                </button>
                                                <button class="btn btn-warning"
                                                        onclick="lockUser('${lst.id}')">
                                                    Khóa tài khoản
                                                </button>
                                                <button class="btn btn-default"
                                                        onclick="unlockUser('${lst.id}')">
                                                    Mở khóa tài khoản
                                                </button>
                                                <button class="btn btn-facebook updateUser">
                                                    Cập nhật
                                                </button>
                                            </td>
                                        </tr>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>

                                        </c:choose>

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
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script src="js/roleUserAdmin.js" type="text/javascript"></script>
<script type="text/javascript">

    <%
              List<Useradmin> list = (List<Useradmin>) request.getAttribute("views");
              Gson g = new Gson();
              String json = g.toJson(list);
              %>
    var result = <%=json%>;
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
        });
    });


</script>
</body>

</html>