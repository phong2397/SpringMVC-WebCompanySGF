<%@ page import="com.sgfintech.util.Consts" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.service.UseradminService" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/favicon.ico">

    <title>SG Fintech Web Admin</title>

    <!-- Vendors Style-->
    <link rel="stylesheet" href="css/vendors_css.css">

    <!-- Style-->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/skin_color.css">
    <!-- jQuery Validate Plugin -->

</head>
<style>
    .error {
        color: red;
    }

    .theme-primary {
        background-image: url("images/backgroun-image.jpeg");
    }
</style>

<body class="hold-transition theme-primary bg-gradient-primary">

<div class="auth-2-outer row align-items-center h-p100 m-0">
    <div class="auth-2 bg-white-10">
        <div class="auth-logo font-size-30">
            <a href="index.html" class="text-white"><b>SGFintech</b> Admin</a>
            <p>
                <img src="images/SGFintech-Logo-r97Y8.png" width="15%" height="105%">
            </p>
        </div>
        <!-- /.login-logo -->
        <div class="auth-body">
            <!-- <p class="auth-msg text-white-50">Sign in to start your session</p> -->

            <form id="demoForm" action="${pageContext.request.contextPath}/login" method="post" class="form-element">
                <div class="form-group has-feedback">
                    <input name="user" id="user" class="form-control text-white plc-white" placeholder="Tên đăng nhập">
                    <span class="ion ion-email form-control-feedback text-white"></span>
                    <span style="color: red">${user}</span>
                    <%
                        session.removeAttribute(Consts.Check_User);
                    %>
                </div>
                <div class="form-group has-feedback">
                    <input name="pass" id="pass" type="password" class="form-control text-white plc-white"
                           placeholder="Mật khẩu">
                    <span class="ion ion-locked form-control-feedback text-white"></span>
                    <span style="color: red">${pass}</span>
                    <%
                        session.removeAttribute(Consts.Check_Pass);
                    %>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="checkbox">
                            <input type="checkbox" id="basic_checkbox_1">
                            <label for="basic_checkbox_1" class="text-white">Remember Me</label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-6">
                        <div class="fog-pwd">
                            <a href="javascript:void(0)" class="text-white"><i class="ion ion-locked"></i> Quên mật
                                khẩu?</a><br>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-rounded mt-10 btn-success">ĐĂNG NHẬP</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

        </div>
    </div>

</div>
<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
    $(document).ready(function () {
        $("#demoForm").validate({
            rules: {
                user: {
                    required: true,
                    maxlength: 15,
                },
                pass: {
                    required: true,
                    maxlength: 15
                },
            },
            messages: {
                user: {
                    required: "Bắt buộc nhập username",
                    maxlength: "Hãy nhập tối đa 15 ký tự"
                },
                pass: {
                    required: "Bắt buộc nhập password",
                    minlength: "Hãy nhập tối nhất 15 ký tự"
                },
            }
        });
    });
</script>
</body>

</html>