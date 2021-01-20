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


<body>

<div class="container-fluid">
    <div>
        <h2 style="max-width: 420px; margin: 0 auto;">Quên mật khẩu</h2>
    </div>

    <div>
        <p class="text-danger"></p>
    </div>
    <div>
        <p class="text-warning"></p>
    </div>

    <form th:action="@{/forgot_password}" method="post" style="max-width: 420px; margin: 0 auto;">
        <div class="border border-secondary rounded p-3">
            <div>
                <p>Chúng tôi sẽ gửi yêu cầu tới email của bạn.</p>
            </div>
            <div>
                <p>
                    <input type="email" name="email" class="form-control" placeholder="Enter your e-mail" required
                           autofocus/>
                </p>
                <p class="text-center">
                    <input type="submit" value="Send" class="btn btn-primary"/>
                </p>
            </div>
        </div>
    </form>
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