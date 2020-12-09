<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:40
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

<body class="hold-transition light-skin sidebar-mini theme-primary">
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
                <li>
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
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="page-title">Nhập danh sách nhân sự đơn vị</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Upload tài liệu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Nhập danh sách mới
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="right-title">
                        <div class="d-flex mt-10 justify-content-end">
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>Số lượng upload trong tháng</small></h6>
                                    <h4 class="mt-0 text-primary">12,125</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="thismonth"><canvas width="60" height="35"
                                                                style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>Tổng upload</small></h6>
                                    <h4 class="mt-0 text-danger">22,754</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastyear"><canvas width="60" height="35"
                                                               style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main content -->
            <section class="content">

                <div class="box">
                    <div class="box-header">
                        <h4 class="box-title">Dropzone</h4>
                        <h6 class="box-subtitle">For multiple file upload put class <code>.dropzone</code> to form.
                        </h6>
                    </div>
                    <div class="box-body">
                        <form action="#" class="dropzone">
                            <div class="fallback">
                                <input name="file" id="importFile" type="file" multiple />
                            </div>
                        </form>
                    </div>
                </div>

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
                                                <label>Tên công ty</label>
                                                <input id="tencongty" type="text" class="form-control"
                                                       placeholder="Tên công ty">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mã Công ty</label>
                                                <input id="macongty" type="text" class="form-control"
                                                       placeholder="Mã công ty">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-rounded btn-warning btn-outline mr-1">
                                        <i class="ti-trash"></i> Cancel
                                    </button>
                                    <button type="button" onclick="submitform();"
                                            class="btn btn-rounded btn-primary btn-outline">
                                        <i class="ti-save-alt"></i> Save
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- /.box -->
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
                <li class="nav-item">
                    <a class="nav-link" href="#">Purchase Now</a>
                </li>
            </ul>
        </div>
        &copy; 2020 <a href="https://www.multipurposethemes.com/">Multipurpose Themes</a>. All Rights Reserved.
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

<script src="assets/vendor_components/dropzone/dropzone.js"></script>
<script src="assets/vendor_components/sweetalert/sweetalert.min.js"></script>
<script src="assets/vendor_components/sweetalert/jquery.sweet-alert.custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>

<script type="text/javascript">
    function submitform() {
        var tenconty = $("#tencongty").val();
        var macongty = $("#macongty").val();
        var filePath = $("#importFile").val();
        console.log(filePath);
        if (macongty == "sgfintech") {
            Swal.fire(
                'Successful',
                'Dữ liệu của hệ thống đã được cập nhật',
                'success'
            )
        } else if (macongty == "sgf") {
            Swal.fire({
                title: 'Mã công ty đã tồn tại!',
                text: "Bạn có muốn cập nhật dữ liệu hiện có?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, update it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Deleted!',
                        'Dữ liệu của hệ thống đã được cập nhật',
                        'success'
                    )
                } else if (
                    /* Read more about handling dismissals below */
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    swalWithBootstrapButtons.fire(
                        'Cancelled',
                        'Thay đổi đã bị hủy',
                        'error'
                    )
                }
            })
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Lỗi trong quá trình thực thi',
                footer: '<a href>Why do I have this issue?</a>'
            })
        }
        console.log(tenconty);
    }
</script>


</body>

</html>