<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute(Consts.Session_Euser) != null){
        Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
%>
<aside class="main-sidebar">
    <!-- Menu Choice 1 -->
    <section class="sidebar">
        <!-- sidebar menu-->
        <ul class="sidebar-menu" data-widget="tree">
            <% if (role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong")) {  %>
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
            <li>
                <a href="manage-customer.html">
                    <img src="images/svg-icon/form_elements.svg" class="svg-icon" alt="">
                    <span>Quản lý danh sách</span>
                </a>
            </li>
            <li>
                <a href="list-customer.html">
                    <img src="images/svg-icon/user.svg" class="svg-icon" alt="">
                    <span>Thông tin khách hàng</span>
                </a>
            </li>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Tiếp nhận yêu cầu</li>

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
                <a href="gachno.html">
                    <img src="images/svg-icon/sidebar-menu/transactions.svg" class="svg-icon" alt="">
                    <span>Gạch nợ</span>
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
                <a href="tuchoi.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Từ chối</span>
                </a>
            </li>
            <li>
                <a href="tongdanhsach.html">
                    <img src="images/svg-icon/sidebar-menu/tickers.svg" class="svg-icon" alt="">
                    <span>Tổng danh sách</span>
                </a>
            </li>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Cấu hình sản phẩm</li>
            <li>
                <a href="cauhinh.html">
                    <img src="images/svg-icon/widgets.svg" class="svg-icon" alt="">
                    <span>Tham số sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Log Out</span>
                </a>
            </li>
            <% }
            else if (role.equals("upload")) { %>
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
            <li>
                <a href="manage-customer.html">
                    <img src="images/svg-icon/form_elements.svg" class="svg-icon" alt="">
                    <span>Quản lý danh sách</span>
                </a>
            </li>
            <li>
                <a href="list-customer.html">
                    <img src="images/svg-icon/user.svg" class="svg-icon" alt="">
                    <span>Thông tin khách hàng</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Log Out</span>
                </a>
            </li>
            <% }  else if (role.equals("thamdinh")) {
            %>
            <li>
                <a href="index.html">
                    <img src="images/svg-icon/sidebar-menu/dashboard.svg" class="svg-icon" alt="">
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Tiếp nhận yêu cầu</li>
            <li>
                <a href="thamdinh.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Thẩm định</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Log Out</span>
                </a>
            </li>
            <% }  else if (role.equals("kyduyet")) {
            %>
            <li>
                <a href="index.html">
                    <img src="images/svg-icon/sidebar-menu/dashboard.svg" class="svg-icon" alt="">
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Tiếp nhận yêu cầu</li>
            <li>
                <a href="kyduyet.html">
                    <img src="images/svg-icon/sidebar-menu/charts3.svg" class="svg-icon" alt="">
                    <span>Ký duyệt</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Log Out</span>
                </a>
            </li>
            <% }  else if (role.equals("thuhoi")) {
            %>
            <li>
                <a href="index.html">
                    <img src="images/svg-icon/sidebar-menu/dashboard.svg" class="svg-icon" alt="">
                    <span>Dashboard</span>
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
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Log Out</span>
                </a>
            </li>
            <% }  else if (role.equals("truongthuhoi")) {
            %>
            <li>
                <a href="index.html">
                    <img src="images/svg-icon/sidebar-menu/dashboard.svg" class="svg-icon" alt="">
                    <span>Dashboard</span>
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
                <a href="gachno.html">
                    <img src="images/svg-icon/sidebar-menu/transactions.svg" class="svg-icon" alt="">
                    <span>Gạch nợ</span>
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
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Log Out</span>
                </a>
            </li>
            <% }
            %>
        </ul>
    </section>
</aside>
<!-- sidebar
<%

    } else{
        response.sendRedirect("login");

    }
%>