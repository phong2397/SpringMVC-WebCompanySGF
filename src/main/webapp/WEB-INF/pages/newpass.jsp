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


<body class="hold-transition theme-primary bg-gradient-primary">

<div class="auth-2-outer row align-items-center h-p100 m-0">
    <div class="auth-2 bg-white-10">
        <!-- /.login-logo -->
        <div class="auth-body">
            <!-- <p class="auth-msg text-white-50">Sign in to start your session</p> -->
            Enter New Password for ${emailid}
            <form action="#">
                <table>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" id="txtPass"></td>
                    </tr>
                    <tr>
                        <td>Retype-Password</td>
                        <td><input type="password" id="txtPass"></td>
                    </tr>
                    <tr>

                        <td colspan="2">
                            <center><input type="button" value="Save"></center>
                        </td>

                    </tr>

                </table>
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
</script>
</body>

</html>