<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="loading">
    <div id="nest5"></div>
</div>
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
                        <%--                        <form>--%>
                        <%--                            <div class="input-group">--%>
                        <%--                                <input type="search" class="form-control" placeholder="Search"--%>
                        <%--                                       aria-label="Search" aria-describedby="button-addon2">--%>
                        <%--                                <div class="input-group-append">--%>
                        <%--                                    <button class="btn" type="submit" id="button-addon2"><img--%>
                        <%--                                            src="images/svg-icon/search.svg" class="img-fluid"--%>
                        <%--                                            alt="search"></button>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </form>--%>
                    </div>
                </li>
            </ul>
        </div>
        <div class="navbar-custom-menu r-side">
            <h4 style="color: #0b0b0b">Xin chào : <b> <span style="color: #0D8BBD">${euser.userLogin}</span></b></h4>
        </div>
    </nav>
</header>