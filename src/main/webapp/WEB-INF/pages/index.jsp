<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/SGFintech-Logo-r97Y8.png">

    <title>SG Fintech Web Admin</title>

    <!-- Vendors Style-->
    <link rel="stylesheet" href="css/vendors_css.css">

    <!-- Style-->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/skin_color.css">
    <style>
        .header {
            color: black !important;
            font-weight: bold !important;
        }
    </style>
</head>

<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

<div class="wrapper">

    <header class="main-header">
        <div class="d-flex align-items-center logo-box pl-40">
            <a href="#" class="waves-effect waves-light nav-link rounded d-none d-md-inline-block push-btn"
               data-toggle="push-menu" role="button">
                <img src="images/svg-icon/collapse.svg" width="100%" class="img-fluid svg-icon" alt="">
            </a>
            <!-- Logo -->
            <a href="index.html" class="logo">
                <!-- logo-->
                <div class="logo-lg">
                    <span class="light-logo"><img src="images/171518logo-transparent.png" alt="logo"></span>
                    <span class="dark-logo"><img src="images/171518logo-transparent.png" alt="logo"></span>
                </div>
            </a>
        </div>
        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top pl-10">
            <!-- Sidebar toggle button-->
            <div class="app-menu">
                <ul class="header-megamenu nav">
                    <li class="btn-group nav-item d-md-none">
                        <a href="#" class="waves-effect waves-light nav-link rounded push-btn"
                           data-toggle="push-menu" role="button">
                            <img src="images/svg-icon/collapse.svg" class="img-fluid svg-icon" alt="">
                        </a>
                    </li>
                    <li class="btn-group nav-item">
                        <a href="#" data-provide="fullscreen"
                           class="waves-effect waves-light nav-link rounded full-screen" title="Full Screen">
                            <img src="images/svg-icon/fullscreen.svg" class="img-fluid svg-icon" alt="">
                        </a>
                    </li>
                    <li class="btn-group d-md-inline-flex d-none">
                        <div class="search-bx ml-10">
                            <form>
                                <div class="input-group">
                                    <input type="search" class="form-control" placeholder="Search"
                                           aria-label="Search" aria-describedby="button-addon2">
                                    <div class="input-group-append">
                                        <button class="btn" type="submit" id="button-addon2"><img
                                                src="images/svg-icon/search.svg" class="img-fluid"
                                                alt="search"></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="navbar-custom-menu r-side">
                <ul class="nav navbar-nav">
                    <!-- Notifications -->
                    <li class="dropdown notifications-menu">
                        <a href="#" class="waves-effect waves-light dropdown-toggle" data-toggle="dropdown"
                           title="Notifications">
                            <img src="images/svg-icon/notifications.svg" class="img-fluid svg-icon" alt="">
                        </a>
                        <ul class="dropdown-menu animated bounceIn">

                            <li class="header">
                                <div class="p-20">
                                    <div class="flexbox">
                                        <div>
                                            <h4 class="mb-0 mt-0">Notifications</h4>
                                        </div>
                                        <div>
                                            <a href="#" class="text-danger">Clear All</a>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu sm-scrol">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-info"></i> Curabitur id eros quis nunc
                                            suscipit blandit.
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-warning text-warning"></i> Duis malesuada justo eu
                                            sapien elementum, in semper diam posuere.
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-danger"></i> Donec at nisi sit amet tortor
                                            commodo porttitor pretium a erat.
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-shopping-cart text-success"></i> In gravida mauris et
                                            nisi
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-user text-danger"></i> Praesent eu lacus in libero
                                            dictum fermentum.
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-user text-primary"></i> Nunc fringilla lorem
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-user text-success"></i> Nullam euismod dolor ut quam
                                            interdum, at scelerisque ipsum imperdiet.
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all</a>
                            </li>
                        </ul>
                    </li>

                    <!-- User Account-->
                    <li class="dropdown user user-menu">
                        <a href="#" class="waves-effect waves-light dropdown-toggle" data-toggle="dropdown"
                           title="User">
                            <img src="images/svg-icon/user.svg" class="rounded svg-icon" alt="" />
                        </a>
                        <ul class="dropdown-menu animated flipInX">
                            <!-- User image -->
                            <li class="user-header bg-img" style="background-image: url(images/user-info.jpg)"
                                data-overlay="3">
                                <div class="flexbox align-self-center">
                                    <img src="images/avatar/7.jpg" class="float-left rounded-circle"
                                         alt="User Image">
                                    <h4 class="user-name align-self-center">
                                        <span>Samuel Brus</span>
                                        <small>samuel@gmail.com</small>
                                    </h4>
                                </div>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ion ion-person"></i> My
                                    Profile</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ion ion-bag"></i> My
                                    Balance</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i
                                        class="ion ion-email-unread"></i> Inbox</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ion ion-settings"></i>
                                    Account Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ion-log-out"></i>
                                    Logout</a>
                                <div class="dropdown-divider"></div>
                                <div class="p-10"><a href="javascript:void(0)"
                                                     class="btn btn-sm btn-rounded btn-success">View Profile</a></div>
                            </li>
                        </ul>
                    </li>

                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a href="#" data-toggle="control-sidebar" title="Setting" class="waves-effect waves-light">
                            <img src="images/svg-icon/settings.svg" class="img-fluid svg-icon" alt="">
                        </a>
                    </li>

                </ul>
            </div>
        </nav>
    </header>

    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar-->
        <section class="sidebar">
            <!-- sidebar menu-->
            <ul class="sidebar-menu" data-widget="tree">

                <li>
                    <a href="index.html">
                        <img src="images/svg-icon/sidebar-menu/dashboard.svg" class="svg-icon" alt="">
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Upload Tài liệu</li>

                <li>
                    <a href="import.html">
                        <img src="images/svg-icon/sidebar-menu/exchange.svg" class="svg-icon" alt="">
                        <span>Nhập danh sách mới</span>
                    </a>
                </li>

                <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Tiếp nhận yêu cầu</li>

                <li>
                    <a href="xetduyet.html">
                        <img src="images/svg-icon/sidebar-menu/charts.svg" class="svg-icon" alt="">
                        <span>Xét duyệt</span>
                    </a>
                </li>
                <li>
                    <a href="thamdinh.html">
                        <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                        <span>Thẩm định</span>
                    </a>
                </li>
                <li>
                    <a href="kyduyet.html">
                        <img src="images/svg-icon/sidebar-menu/charts3.svg" class="svg-icon" alt="">
                        <span>Ký duyệt</span>
                    </a>
                </li>

                <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">THU HỒI NỢ</li>

                <li>
                    <a href="chothuhoi.html">
                        <img src="images/svg-icon/sidebar-menu/reports.svg" class="svg-icon" alt="">
                        <span>Chờ thu hồi</span>
                    </a>
                </li>

                <li>
                    <a href="daxuly.html">
                        <img src="images/svg-icon/sidebar-menu/ico.svg" class="svg-icon" alt="">
                        <span>Đã xử lý</span>
                    </a>
                </li>
                <li>
                    <a href="noquahan.html">
                        <img src="images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                        <span>Nợ quá hạn</span>
                    </a>
                </li>

                <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Kế toán kiểm toán</li>

                <li>
                    <a href="tongdanhsach.html">
                        <img src="images/svg-icon/sidebar-menu/tickers.svg" class="svg-icon" alt="">
                        <span>Tổng danh sách</span>
                    </a>
                </li>
                <li >
                    <a href="gachno.html">
                        <img src="images/svg-icon/sidebar-menu/transactions.svg" class="svg-icon" alt="">
                        <span>Gạch nợ</span>
                    </a>
                </li>

                <li>
                    <a href="hoadon.html">
                        <img src="images/svg-icon/sidebar-menu/invoice.svg" class="svg-icon" alt="">
                        <span>Invoice</span>
                    </a>
                </li>

                <li class="header">Cấu hình hệ thống </li>

                <li>
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/mailbox.svg" class="svg-icon" alt="">
                        <span>Mailbox</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/apps.svg" class="svg-icon" alt="">
                        <span>Quản lý danh sách</span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/uielements.svg" class="svg-icon" alt="">
                        <span>UI Elements</span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="ui_typography.html"><i class="ti-more"></i>Typography</a></li>
                        <li><a href="ui_grid.html"><i class="ti-more"></i>Grid</a></li>
                        <li><a href="ui_tab.html"><i class="ti-more"></i>Tabs</a></li>
                        <li><a href="ui_timeline.html"><i class="ti-more"></i>Timeline</a></li>
                        <li><a href="ui_timeline_horizontal.html"><i class="ti-more"></i>Horizontal Timeline</a>
                        </li>
                        <li><a href="component_bootstrap_switch.html"><i class="ti-more"></i>Bootstrap Switch</a>
                        </li>
                        <li><a href="component_date_paginator.html"><i class="ti-more"></i>Date Paginator</a></li>
                        <li><a href="component_media_advanced.html"><i class="ti-more"></i>Advanced Medias</a></li>
                        <li><a href="component_modals.html"><i class="ti-more"></i>Modals</a></li>
                        <li><a href="component_rangeslider.html"><i class="ti-more"></i>Range Slider</a></li>
                        <li><a href="component_rating.html"><i class="ti-more"></i>Ratings</a></li>
                        <li><a href="component_animations.html"><i class="ti-more"></i>Animations</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/advancedui.svg" class="svg-icon" alt="">
                        <span>Advanced UI</span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="ui_badges.html"><i class="ti-more"></i>Badges</a></li>
                        <li><a href="ui_border_utilities.html"><i class="ti-more"></i>Border</a></li>
                        <li><a href="ui_buttons.html"><i class="ti-more"></i>Buttons</a></li>
                        <li><a href="ui_dropdown.html"><i class="ti-more"></i>Dropdown</a></li>
                        <li><a href="ui_dropdown_grid.html"><i class="ti-more"></i>Dropdown Grid</a></li>
                        <li><a href="ui_progress_bars.html"><i class="ti-more"></i>Progress Bars</a></li>
                        <li><a href="ui_ribbons.html"><i class="ti-more"></i>Ribbons</a></li>
                        <li><a href="ui_sliders.html"><i class="ti-more"></i>Sliders</a></li>
                    </ul>
                </li>

                <li>
                    <a href="ui_color_utilities.html">
                        <img src="images/svg-icon/sidebar-menu/color.svg" class="svg-icon" alt="">
                        <span>Color</span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/icons.svg" class="svg-icon" alt="">
                        <span>Icons</span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="icons_fontawesome.html"><i class="ti-more"></i>Font Awesome</a></li>
                        <li><a href="icons_glyphicons.html"><i class="ti-more"></i>Glyphicons</a></li>
                        <li><a href="icons_material.html"><i class="ti-more"></i>Material Icons</a></li>
                        <li><a href="icons_themify.html"><i class="ti-more"></i>Themify Icons</a></li>
                        <li><a href="icons_simpleline.html"><i class="ti-more"></i>Simple Line Icons</a></li>
                        <li><a href="icons_cryptocoins.html"><i class="ti-more"></i>Cryptocoins Icons</a></li>
                        <li><a href="icons_flag.html"><i class="ti-more"></i>Flag Icons</a></li>
                        <li><a href="icons_weather.html"><i class="ti-more"></i>Weather Icons</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/cards.svg" class="svg-icon" alt="">
                        <span>Cards</span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="box_advanced.html"><i class="ti-more"></i>Advanced Card</a></li>
                        <li><a href="box_basic.html"><i class="ti-more"></i>Basic Card</a></li>
                        <li><a href="box_color.html"><i class="ti-more"></i>Card Color</a></li>
                    </ul>
                </li>

                <li class="header">Cấu hình sản phẩm</li>

                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/authentication.svg" class="svg-icon" alt="">
                        <span>Authentication</span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="auth_login.html"><i class="ti-more"></i>Login</a></li>
                        <li><a href="auth_login2.html"><i class="ti-more"></i>Login 2</a></li>
                        <li><a href="auth_register.html"><i class="ti-more"></i>Register</a></li>
                        <li><a href="auth_register2.html"><i class="ti-more"></i>Register 2</a></li>
                        <li><a href="auth_lockscreen.html"><i class="ti-more"></i>Lockscreen</a></li>
                        <li><a href="auth_user_pass.html"><i class="ti-more"></i>Recover password</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/miscellaneous.svg" class="svg-icon" alt="">
                        <span>Miscellaneous</span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="error_400.html"><i class="ti-more"></i>Error 400</a></li>
                        <li><a href="error_403.html"><i class="ti-more"></i>Error 403</a></li>
                        <li><a href="error_404.html"><i class="ti-more"></i>Error 404</a></li>
                        <li><a href="error_500.html"><i class="ti-more"></i>Error 500</a></li>
                        <li><a href="error_503.html"><i class="ti-more"></i>Error 503</a></li>
                        <li><a href="error_maintenance.html"><i class="ti-more"></i>Maintenance</a></li>
                    </ul>
                </li>

                <li>
                    <a href="email_index.html">
                        <img src="images/svg-icon/sidebar-menu/emails.svg" class="svg-icon" alt="">
                        <span>Thông báo</span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/pages.svg" class="svg-icon" alt="">
                        <span>Tham số sản phẩm<menu></menu></span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="sample_blank.html"><i class="ti-more"></i>Blank</a></li>
                        <li><a href="sample_coming_soon.html"><i class="ti-more"></i>Coming Soon</a></li>
                        <li><a href="sample_faq.html"><i class="ti-more"></i>FAQ</a></li>
                    </ul>
                </li>


                <li class="treeview">
                    <a href="#">
                        <img src="images/svg-icon/sidebar-menu/multilevel.svg" class="svg-icon" alt="">
                        <span>Hình thức thu hồi</span>
                        <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#">Level One</a></li>
                        <li class="treeview">
                            <a href="#">Level One
                                <span class="pull-right-container">
										<i class="fa fa-angle-right pull-right"></i>
									</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#">Level Two</a></li>
                                <li class="treeview">
                                    <a href="#">Level Two
                                        <span class="pull-right-container">
												<i class="fa fa-angle-right pull-right"></i>
											</span>
                                    </a>
                                    <ul class="treeview-menu">
                                        <li><a href="#">Level Three</a></li>
                                        <li><a href="#">Level Three</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#">Level One</a></li>
                    </ul>
                </li>

                <li>
                    <a href="auth_login.html">
                        <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                        <span>Log Out</span>
                    </a>
                </li>

            </ul>
        </section>
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xl-12 col-12">
                        <div class="row" style="display: none;">
                            <div class="col-lg-4 col-12">
                                <div class="box pull-up">
                                    <div class="box-body">
                                        <h5 class="mb-0">
												<span class="text-uppercase font-size-18"><i class="cc BTC"
                                                                                             title="BTC"></i>Bitcoin</span>
                                            <span class="float-right badge badge-light">24h</span>
                                        </h5>
                                        <br>
                                        <div class="d-flex justify-content-between">
                                            <p class="font-size-24">$513,64256</p>
                                            <div><i class="ion-arrow-graph-up-right mr-1 text-success"></i> +1.75%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body p-0">
                                        <div id="spark1"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="box pull-up">
                                    <div class="box-body">
                                        <h5 class="mb-0">
												<span class="text-uppercase font-size-18"><i class="cc ETH"
                                                                                             title="ETH"></i>Ethereum</span>
                                            <span class="float-right badge badge-light">24h</span>
                                        </h5>
                                        <br>
                                        <div class="d-flex justify-content-between">
                                            <p class="font-size-26">$12,178.99</p>
                                            <div><i class="ion-arrow-graph-up-right mr-1 text-success"></i> +1.89%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body p-0">
                                        <div id="spark2"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="box pull-up">
                                    <div class="box-body">
                                        <h5 class="mb-0">
												<span class="text-uppercase font-size-18"><i class="cc LTC"
                                                                                             title="LTC"></i>Litecoin</span>
                                            <span class="float-right badge badge-light">24h</span>
                                        </h5>
                                        <br>
                                        <div class="d-flex justify-content-between">
                                            <p class="font-size-26">$5,724.33</p>
                                            <div><i class="ion-arrow-graph-up-right mr-1 text-success"></i> +1.85%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body p-0">
                                        <div id="spark3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header">
                                <h4 class="box-title">Số lượng hợp đồng</h4>
                            </div>
                            <div class="box-body">
                                <div id="bitcoin-timeline" class="h-300"></div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Các giao dịch mới</h4>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table class="table no-bordered no-margin table-striped">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn yêu cầu</th>
                                            <th>Thời điểm yêu cầu</th>
                                            <th>Trạng thái</th>
                                            <th>Mã công ty</th>
                                            <th>Số tiền vay</th>
                                            <th>Số tháng vay</th>
                                            <th>Nhân viên tiếp nhận</th>
                                            <th>Thông tin khách hàng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th>#12457</th>
                                            <td>11.00AM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td></i> SGF </td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Văn A (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <tr>
                                            <th>#12586</th>
                                            <td>10.11AM 1/12/2020</td>
                                            <td><span class="label label-danger">Pending</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>Nguyễn Văn B (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <tr>
                                            <th>#13258</th>
                                            <td>09.12AM 1/12/2020</td>
                                            <td><span class="label label-danger">Pending</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>Nguyễn Văn C (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <tr>
                                            <th>#13586</th>
                                            <td>08.22AM 1/12/2020</td>
                                            <td><span class="label label-warning">Cancelled</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>Nguyễn Văn D (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <tr>
                                            <th>#14578</th>
                                            <td>07.48AM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị A (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <tr>
                                            <th>#15623</th>
                                            <td>06.45AM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị B (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <tr>
                                            <th>#15685</th>
                                            <td>05.11PM 1/12/2020</td>
                                            <td><span class="label label-warning">Cancelled</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị AA (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <!-- Repeat -->
                                        <tr>
                                            <th>#16585</th>
                                            <td>23.18PM 1/12/2020</td>
                                            <td><span class="label label-danger">Pending</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị E (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        <tr>
                                            <th>#16785</th>
                                            <td>19.27PM 1/12/2020</td>
                                            <td><span class="label label-success">Complete</span></td>
                                            <td>SGF</td>
                                            <td>1.000.000 VNĐ</td>
                                            <td>1</td>
                                            <td>ANHNGACTS</td>
                                            <td>Nguyễn Thị G (SGF - NHÂN VIÊN - 0989 999 999) </td>
                                            <td><button type="button" class="btn btn-info">Info</button></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-12" style="display: none;">
                        <div class="box">
                            <div class="box-header">
                                <h4 class="box-title">User Flow</h4>
                            </div>
                            <div class="box-body">
                                <div id="userflow" class="h-250"></div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header">
                                <h4 class="box-title">Cryptocurrency prices</h4>
                            </div>
                            <div class="box-body">
                                <div>
                                    <div class="toolbar">
                                        <button id="one_month"
                                                class="btn btn-rounded btn-sm btn-primary">1M</button>
                                        <button id="six_months" class="btn btn-rounded btn-sm btn-info">6M</button>
                                        <button id="one_year"
                                                class="btn btn-rounded btn-sm active btn-success">1Y</button>
                                        <button id="ytd" class="btn btn-rounded btn-sm btn-danger">YTD</button>
                                        <button id="all" class="btn btn-rounded btn-sm btn-warning">ALL</button>
                                    </div>
                                    <div id="timeline-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-header">
                                <ul class="nav nav-pills">
                                    <li class=" nav-item"> <a href="#navpills2-1" class="nav-link active"
                                                              data-toggle="tab" aria-expanded="false">Buy BTC</a> </li>
                                    <li class="nav-item"> <a href="#navpills2-2" class="nav-link" data-toggle="tab"
                                                             aria-expanded="false">Sell BTC</a> </li>
                                </ul>
                            </div>
                            <div class="box-body">
                                <div class="tab-content">
                                    <div id="navpills2-1" class="tab-pane active">
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon br-0">Order Type</span>
                                            <select class="form-control bl-0">
                                                <option>Limit</option>
                                                <option>Market</option>
                                                <option>Stop Limit</option>
                                                <option>Trail</option>
                                            </select>
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Price (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="≈$8,630.00">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Amount (BTC)</span>
                                            <input type="text" class="form-control bl-0"
                                                   placeholder="Minimum amount is 0.001BTC">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Total (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="">
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <span>Max Buy BTC: </span>
                                                <span>0.00000000</span>
                                            </div>
                                            <div>
                                                <span>USDT Balance: </span>
                                                <span>0.00</span>
                                            </div>
                                        </div>
                                        <button type="button"
                                                class="waves-effect waves-light btn btn-success mt-10 d-block w-p100">Buy
                                            ETH</button>
                                    </div>
                                    <div id="navpills2-2" class="tab-pane">
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon br-0">Order Type</span>
                                            <select class="form-control bl-0">
                                                <option>Limit</option>
                                                <option>Market</option>
                                                <option>Stop Limit</option>
                                                <option>Trail</option>
                                            </select>
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Price (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="≈$8,630.00">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Amount (BTC)</span>
                                            <input type="text" class="form-control bl-0"
                                                   placeholder="Minimum amount is 0.001BTC">
                                        </div>
                                        <div class="input-group my-15">
                                            <span class="input-group-addon br-0">Total (USDT)</span>
                                            <input type="text" class="form-control bl-0" placeholder="">
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <span>Max Sell: </span>
                                                <span>0.00000000</span>
                                            </div>
                                            <div>
                                                <span>BTC Balance: </span>
                                                <span>0.00</span>
                                            </div>
                                        </div>
                                        <button type="button"
                                                class="waves-effect waves-light btn btn-danger mt-10 d-block w-p100">Sell
                                            ETH</button>
                                    </div>
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
    <footer class="main-footer">
        <div class="pull-right d-none d-sm-inline-block">
            <ul class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">FAQ</a>
                </li>
            </ul>
        </div>
        &copy; 2020 <a href="https://www.multipurposethemes.com/">SG FINTECH</a>. All Rights Reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar">

        <div class="rpanel-title">
				<span class="pull-right btn btn-circle p-10">
					<img src="images/svg-icon/close.svg" data-toggle="control-sidebar" class="img-fluid svg-icon"
                         alt="">
				</span>
        </div> <!-- Create the tabs -->
        <ul class="nav nav-tabs control-sidebar-tabs">
            <li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab"><img
                    src="images/svg-icon/apps.svg" class="img-fluid svg-icon" alt=""></a></li>
            <li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab"><img
                    src="images/svg-icon/advanced.svg" class="img-fluid svg-icon" alt=""></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <div class="flexbox">
                    <a href="javascript:void(0)" class="text-grey">
                        <i class="ti-more"></i>
                    </a>
                    <p>Users</p>
                    <a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
                </div>
                <div class="lookup lookup-sm lookup-right d-none d-lg-block">
                    <input type="text" name="s" placeholder="Search" class="w-p100">
                </div>
                <div class="media-list media-list-hover mt-20">
                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-success" href="#">
                            <img src="images/avatar/1.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Tyler</strong></a>
                            </p>
                            <p>Praesent tristique diam...</p>
                            <span>Just now</span>
                        </div>
                    </div>

                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-danger" href="#">
                            <img src="images/avatar/2.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Luke</strong></a>
                            </p>
                            <p>Cras tempor diam ...</p>
                            <span>33 min ago</span>
                        </div>
                    </div>

                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-warning" href="#">
                            <img src="images/avatar/3.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Evan</strong></a>
                            </p>
                            <p>In posuere tortor vel...</p>
                            <span>42 min ago</span>
                        </div>
                    </div>

                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-primary" href="#">
                            <img src="images/avatar/4.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Evan</strong></a>
                            </p>
                            <p>In posuere tortor vel...</p>
                            <span>42 min ago</span>
                        </div>
                    </div>

                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-success" href="#">
                            <img src="images/avatar/1.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Tyler</strong></a>
                            </p>
                            <p>Praesent tristique diam...</p>
                            <span>Just now</span>
                        </div>
                    </div>

                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-danger" href="#">
                            <img src="images/avatar/2.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Luke</strong></a>
                            </p>
                            <p>Cras tempor diam ...</p>
                            <span>33 min ago</span>
                        </div>
                    </div>

                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-warning" href="#">
                            <img src="images/avatar/3.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Evan</strong></a>
                            </p>
                            <p>In posuere tortor vel...</p>
                            <span>42 min ago</span>
                        </div>
                    </div>

                    <div class="media py-10 px-0">
                        <a class="avatar avatar-lg status-primary" href="#">
                            <img src="images/avatar/4.jpg" alt="...">
                        </a>
                        <div class="media-body">
                            <p class="font-size-16">
                                <a class="hover-primary" href="#"><strong>Evan</strong></a>
                            </p>
                            <p>In posuere tortor vel...</p>
                            <span>42 min ago</span>
                        </div>
                    </div>

                </div>

            </div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <div class="flexbox">
                    <a href="javascript:void(0)" class="text-grey">
                        <i class="ti-more"></i>
                    </a>
                    <p>Todo List</p>
                    <a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
                </div>
                <ul class="todo-list mt-20">
                    <li class="py-15 px-5 by-1">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_1" class="filled-in">
                        <label for="basic_checkbox_1" class="mb-0 h-15"></label>
                        <!-- todo text -->
                        <span class="text-line">Nulla vitae purus</span>
                        <!-- Emphasis label -->
                        <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
                        <!-- General tools such as edit or delete-->
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_2" class="filled-in">
                        <label for="basic_checkbox_2" class="mb-0 h-15"></label>
                        <span class="text-line">Phasellus interdum</span>
                        <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5 by-1">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_3" class="filled-in">
                        <label for="basic_checkbox_3" class="mb-0 h-15"></label>
                        <span class="text-line">Quisque sodales</span>
                        <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_4" class="filled-in">
                        <label for="basic_checkbox_4" class="mb-0 h-15"></label>
                        <span class="text-line">Proin nec mi porta</span>
                        <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5 by-1">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_5" class="filled-in">
                        <label for="basic_checkbox_5" class="mb-0 h-15"></label>
                        <span class="text-line">Maecenas scelerisque</span>
                        <small class="badge bg-primary"><i class="fa fa-clock-o"></i> 1 week</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_6" class="filled-in">
                        <label for="basic_checkbox_6" class="mb-0 h-15"></label>
                        <span class="text-line">Vivamus nec orci</span>
                        <small class="badge bg-info"><i class="fa fa-clock-o"></i> 1 month</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5 by-1">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_7" class="filled-in">
                        <label for="basic_checkbox_7" class="mb-0 h-15"></label>
                        <!-- todo text -->
                        <span class="text-line">Nulla vitae purus</span>
                        <!-- Emphasis label -->
                        <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
                        <!-- General tools such as edit or delete-->
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_8" class="filled-in">
                        <label for="basic_checkbox_8" class="mb-0 h-15"></label>
                        <span class="text-line">Phasellus interdum</span>
                        <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5 by-1">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_9" class="filled-in">
                        <label for="basic_checkbox_9" class="mb-0 h-15"></label>
                        <span class="text-line">Quisque sodales</span>
                        <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                    <li class="py-15 px-5">
                        <!-- checkbox -->
                        <input type="checkbox" id="basic_checkbox_10" class="filled-in">
                        <label for="basic_checkbox_10" class="mb-0 h-15"></label>
                        <span class="text-line">Proin nec mi porta</span>
                        <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
                        <div class="tools">
                            <i class="fa fa-edit"></i>
                            <i class="fa fa-trash-o"></i>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->

    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/apexcharts-bundle/data.js"></script>
<script src="assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/pages/dashboard9.js"></script>
<script src="js/demo.js"></script>


</body>

</html>
