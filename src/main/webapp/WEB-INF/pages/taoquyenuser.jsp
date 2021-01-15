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
        if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong")) {
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
                                                    -- Please Choose --
                                                </option>
                                                <option value="upload">
                                                    <span> upload</span>
                                                </option>
                                                <option value="thamdinh">
                                                    <span> thamdinh</span>
                                                </option>
                                                <option value="kyduyet">
                                                    <span> kyduyet</span>
                                                </option>
                                                <option value="thuhoi">
                                                    <span> thuhoi</span>
                                                </option>
                                                <option value="ketoan">
                                                    <span> ketoan</span>
                                                </option>
                                                <option value="ketoantruong">
                                                    <span> ketoantruong</span>
                                                </option>
                                                <option value="truongthuhoi">
                                                    <span> truongthuhoi</span>
                                                </option>
                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-default">Đăng ký</button>
                                    </form>
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
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();
        $("#demoForm").validate({
            rules: {
                login: {
                    minlength: 3,
                    maxlength: 15,
                },
                pass: {
                    minlength: 3,
                    maxlength: 15
                },
            },
            messages: {
                login: {
                    minlength: "Hãy nhập ít nhất 3 ký tự",
                    maxlength: "Hãy nhập tối đa 15 ký tự"
                },
                pass: {
                    minlength: "Hãy nhập ít nhất 3 ký tự",
                    minlength: "Hãy nhập tối nhất 15 ký tự"
                },
            }
        });
    });
    //function xảy ra khi nhấn vào accept gọi đến data ajax , thực hiện thành công hiển thị popup alert thông báo success và cập nhật vào talbe product
    $("body").on("click", ".btn-default", function () {
        var userLogin = $("#user_login").val();
        console.log(userLogin)
        var userPass = $("#user_pass").val();
        console.log(userPass)
        var userRole = $("#user_role").val();
        console.log(userRole)
        let data = {
            userLogin: userLogin,
            userPass: userPass,
            userRole: userRole
        };
        var result = submitUser(data);
        if (result === "success") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Dữ liệu được cập nhật thành công.',
                showConfirmButton: false,
                timer: 100000
            });
        } else if (result === "errorRoot") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Không thể tạo role root',
                showConfirmButton: false,
                timer: 100000
            });
        } else {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Không được để trống',
                showConfirmButton: false,
                timer: 100000
            });
        }
    });

    //function ajax gọi đến value trong ProductController thực hiện caapj nhật thông số sản phẩm
    function submitUser(data) {
        try {
            // This async call may fail.
            let text = $.ajax({
                type: "POST",
                timeout: 100000,
                url: "changeUserAdmin",
                data: data,
                dataType: 'text',
                async: false
            }).responseText;
            return text;
            console.log(text);
        } catch (error) {
            return "Không thể kết nối tới server";
        }
    }
</script>
</body>

</html>