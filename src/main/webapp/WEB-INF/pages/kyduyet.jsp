<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:42
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
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="page-title">Danh sách xét duyệt</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Tiếp nhận yêu cầu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Xét duyệt</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="right-title">
                        <div class="d-flex mt-10 justify-content-end">
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$12,125</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="thismonth"><canvas width="60" height="35"
                                                                style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="d-lg-flex mr-20 ml-10 d-none">
                                <div class="chart-text mr-10">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-danger">$22,754</h4>
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

                <div class="row">
                    <div class="col-xl-3 col-md-6 col-12 ">
                        <div class="box box-inverse box-success">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Tổng số yêu cầu</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">2,064</div>
                                    <span>Tổng số lượt yêu cầu trong ngày</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12 ">
                        <div class="box box-inverse box-primary">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Đã giải quyết</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">1,738</div>
                                    <span>Yêu cầu tất toán thành công</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->

                    <div class="col-xl-3 col-md-6 col-12">
                        <div class="box box-inverse box-danger">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Đã hủy</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">1100</div>
                                    <span>Yêu cầu bị Refuse</span>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12">
                        <div class="box box-inverse box-warning">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5>Chờ giải quyết</h5>
                                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                                Details</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                                new</a>
                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                                Refresh</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center my-2">
                                    <div class="font-size-60">964</div>
                                    <span>Yêu cầu cần xác nhận</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->

                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách chờ xét duyệt</h4>
                                <h6 class="box-subtitle">Export Invoice List to Copy, CSV, Excel, PDF & Print</h6>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table id="example" class="table table-lg invoice-archive">
                                        <thead>
                                        <tr>
                                            <th>Mã yêu cầu</th>
                                            <th>Nhân viên xác nhận</th>
                                            <th>Ngày yêu cầu</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Trạng thái</th>
                                            <th>Thời gian còn lại</th>
                                            <th>Thời gian vay</th>
                                            <th>Số tiền vay</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>#0025</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>#0024</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm">Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0023</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0022</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0021</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0020</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0019</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0018</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0017</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0016</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0015</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0014</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0013</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0012</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0011</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0010</td>
                                            <td>PTNGOCCHAU</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0025</td>
                                            <td>ANHNGACAT</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0026</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0028</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0029</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0030</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0031</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0032</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0033</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0034</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0035</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0036</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0042</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>#0040</td>
                                            <td>PHAMNGOCSANG</td>
                                            <td>December 02, 2020</td>
                                            <td>
                                                <h6 class="mb-0">
                                                    <a href="#">Nguyễn Văn A</a>
                                                    <span class="d-block text-muted">Account number:
																0000 1234 5678 0112</span>
                                                    <span class="d-block text-muted">Owner :
																Nguyen Van A</span>
                                                    <span class="d-block text-muted">Company ID :
																sgfintech</span>
                                                    <span class="d-block text-muted">Phone number :
																0989 999 999</span>
                                                </h6>
                                            </td>
                                            <td>
                                                <select name="status" class="form-control"
                                                        data-placeholder="Select status">
                                                    <option value="confirm" selected>Confirm</option>
                                                    <option value="hold" >On hold</option>
                                                    <option value="pending" >Pending</option>
                                                    <option value="paid">Paid</option>
                                                    <option value="invalid">Invalid</option>
                                                    <option value="cancel">Canceled</option>
                                                </select>
                                            </td>
                                            <td>
                                                <span class="badge badge-pill badge-primary">2 days</span>
                                            </td>
                                            <td>
                                                1 month
                                            </td>
                                            <td>
                                                <h6 class="mb-0 font-weight-bold">1,000,000đ <span
                                                        class="d-block text-muted font-weight-normal">Thuế và phí
																100,000đ</span></h6>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <a href="#" class="list-icons-item mr-10"><i
                                                            class="fa fa-eye-slash"></i></a>
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                           data-toggle="dropdown"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-download"></i> Download</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-print"></i> Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-pencil"></i> Edit</a>
                                                            <a href="#" class="dropdown-item"><i
                                                                    class="fa fa-remove"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-info mb-1">Accept</button>
                                                <button type="button" class="waves-effect waves-light btn btn-rounded btn-dark mb-1">Refuse</button>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

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

<script src="assets/vendor_components/datatable/datatables.min.js"></script>

<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script src="js/pages/data-table.js"></script>


</body>

</html>
