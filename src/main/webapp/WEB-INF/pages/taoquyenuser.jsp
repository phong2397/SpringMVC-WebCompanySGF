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
                                            <td class="text-center">
                                                    ${lst.userLogin}
                                            </td>
                                            <td class="text-left">${lst.role}
                                            </td>
                                            <td class="text-left" style="color:#00aa00;">
                                                <b> Đã kích hoạt</b>
                                            </td>
                                            <td class="text-left">
                                                <fmt:parseDate value=" ${lst.createdDate}"
                                                               pattern="yyyy-MM-dd'T'HH:mm" var="day"
                                                               type="date"/>
                                                <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a"
                                                                value="${day}"/>
                                            </td>
                                            <td class="text-left">
                                                    <%--                                                <button class="btn btn-facebook" onclick="viewChangePass('${lst.id}')">--%>
                                                    <%--                                                    Thay đổi mật khẩu--%>
                                                    <%--                                                </button>--%>
                                                <button class="btn btn-danger"
                                                        onclick="showReset('${lst.id}','${lst.userLogin}')">
                                                    Đặt lại mật khẩu
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
    $("#pass").validate({
        rules: {
            oldpassword: {
                required: true,
            },
            password: {
                required: true,
                minlength: 10,
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
                minlength: "Hãy nhập ít nhất 8 ký tự",
            },
            repassword: {
                equalTo: "Mật khẩu không khớp"
            }
        }
    });
    $("#demoForm").validate({
        rules: {
            login: {
                minlength: 4,
                maxlength: 18,
                email: true
            },
            pass: {
                minlength: 8,
                maxlength: 18
            },
        },
        messages: {
            login: {
                minlength: "Hãy nhập ít nhất 4 ký tự",
                maxlength: "Hãy nhập tối đa 18 ký tự",
                email: "Xin vui lòng nhập đúng định dạng email"
            },
            pass: {
                minlength: "Hãy nhập ít nhất 8 ký tự",
                minlength: "Hãy nhập tối nhất 18 ký tự"
            },
        }

    });

    function viewChangePass(params) {
        result.forEach((useradmin) => {
            if (useradmin.id == params) {
                console.log(useradmin.id)
                Object.keys(useradmin).forEach((key) => {
                    $('#' + key).text(useradmin[key]);
                    console.log(useradmin[key])
                })
            }
        })
        $('#modalChangePass').modal('show');
    }

    $("body").on("click", ".btn-update-change-password", function () {
        if ($("#pass").valid()) {
            var id = $("#id").text();
            var userPass = $("#password").val();
            var olduserPass = $("#oldpassword").val();
            console.log(userPass)
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
    });
    $("body").on("click", ".btn-default", function () {
        if ($("#demoForm").valid()) {
            var userLogin = $("#user_login").val();
            console.log(userLogin)
            var userPass = $("#user_pass").val();
            console.log(userPass)
            var userRole = $("#user_role").val();
            console.log(userRole)

            let data = {
                userLogin: userLogin,
                userPass: userPass,
                userRole: userRole,

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
            } else if (result === "errorExist") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Tên đăng nhập đã tồn tại',
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
    });

    function submitUser(data) {
        try {
            // This async call may fail.
            let text = $.ajax({
                type: "POST",
                timeout: 100000,
                url: "changeUserAdmin",
                data: data,
                dataType: 'text',
                async: false,
            }).responseText;
            return text;
            console.log(text);
        } catch (error) {
            return "Không thể kết nối tới server";
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

    function showReset(id, name) {
        console.log(id)
        console.log(name)
        $("#modalresetPass").modal('show');
        $("#userName").text(name);
        $("#idReset").text(id)
    }

    function ajaxresetPass(data) {
        try {
            // This async call may fail.
            let text = $.ajax({
                type: "POST",
                timeout: 100000,
                url: "resetPassAdmin",
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

    function resetPass() {
        var _id = $('#idReset').text();
        console.log('id 1: ', _id)
        let data = {
            idata: _id,
        };
        var result = ajaxresetPass(data);
        console.log(result)
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
                title: 'Không có quyền đặt lại mật khẩu',
                showConfirmButton: false,
                timer: 100000
            });
        } else {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Có lỗi không thể thực thi',
                showConfirmButton: false,
                timer: 100000
            });
        }
    };


</script>
</body>

</html>