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
                                <h4 class="box-title">Thay đổi mật khẩu</h4>
                                <h4 id="idUser" style="display: none">${views.id}</h4>
                            </div>
                            <div class="box-body">
                                <div class="container">
                                    <form id="pass">
                                        <label for="oldpassword">Mật khẩu cũ</label>
                                        <input type="password" id="oldpassword" name="oldpassword"
                                               class="form-control"><br>
                                        <label for="password">Mật khẩu mới</label>
                                        <input type="password" id="password" name="password"
                                               class="form-control"><br>
                                        <label for="repassword">Nhập lại mật khẩu mới</label>
                                        <input type="password" id="repassword" name="repassword"
                                               class="form-control"><br>
                                        <button type="button"
                                                class="btn btn-rounded btn-warning btn-update-change-password"
                                                data-dismiss="modal" style="margin-top: 2%"
                                                onclick="ChangePassword('${views.id}')">Cập nhật
                                        </button>
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
<script type="text/javascript">

    $(document).ready(function () {
        $("#loading").hide();
    });
    $("#pass").validate({
        rules: {
            oldpassword: {
                required: true,
            },
            password: {
                required: true,
                minlength: 5,
            },
            repassword: {
                equalTo: "#password"
            }
        },
        messages: {
            oldpassword: {
                required: "Yêu cầu nhập mật khẩu hiện tại",
            },
            password: {
                required: "Yêu cầu nhập mật khẩu mới",
                minlength: "Hãy nhập ít nhất 5 ký tự",
            },
            repassword: {
                equalTo: "Mật khẩu không khớp"
            }
        }
    });

    function ChangePassword(id) {
        if ($("#pass").valid()) {
            var userPass = $("#password").val();
            var olduserPass = $("#oldpassword").val();
            console.log(id)
            let data = {
                id: id,
                password: userPass,
                oldpassword: olduserPass
            };
            var result = changePass(data);
            if (result === "success") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Dữ liệu được cập nhật thành công.',
                    showConfirmButton: false,
                    timer: 100000
                });
            } else if (result === "errorNoExist") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Password nhập sai',
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
        }
    }


    function changePass(data) {
        try {
            // This async call may fail.
            let text = $.ajax({
                type: "POST",
                timeout: 100000,
                url: "changePassAdmin",
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