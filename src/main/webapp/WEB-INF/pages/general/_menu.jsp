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
    if (session.getAttribute(Consts.Session_Euser) != null) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        String userLogin = u.getUserLogin();
%>

<aside class="main-sidebar">
    <!-- Menu Choice 1 -->
    <section class="sidebar">
        <!-- sidebar menu-->
        <ul class="sidebar-menu" data-widget="tree">
            <% if (role.equals("root")) { %>

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
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Quản lý đơn hàng</li>
            <li>
                <a href="tongtiepnhan.html">
                    <img src="images/svg-icon/chart.svg" class="svg-icon" alt="">
                    <span>Tìm hiểu đơn hàng</span>
                </a>
            </li>
            <li>
                <a href="thamdinh.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Quản lý xét duyệt</span>
                </a>
            </li>
            <li>
                <a href="kyduyet.html">
                    <img src="images/svg-icon/sidebar-menu/charts3.svg" class="svg-icon" alt="">
                    <span>Duyệt giải ngân</span>
                </a>
            </li>
            <li>
                <a href="tuchoi.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Từ chối</span>
                </a>
            </li>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">NHẮC THU PHÍ</li>
            <li class="treeview">
                <a href="#">
                    <img src="images/svg-icon/advanced.svg" class="svg-icon" alt="">
                    <span>Khách hàng</span>
                    <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="tongtiepnhan.htmll"><i class="ti-more"></i>Tìm hiểu đơn hàng</a></li>
                    <li><a href="thamdinh.html"><i class="ti-more"></i>Quản lý xét duyệt</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <img src="images/svg-icon/sidebar-menu/advancedui.svg" class="svg-icon" alt="">
                    <span>Bộ sưu tập</span>
                    <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="nhacphi.html"><i class="ti-more"></i>Team Nhắc phí</a></li>
                    <li><a href="khachhangthanhtoan.html"><i class="ti-more"></i> Tổng khách hàng thanh toán</a></li>
                    <li><a href="thuphi.html"><i class="ti-more"></i>Team Thu phí</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <img src="images/svg-icon/settings.svg" class="svg-icon" alt="">
                    <span>Hệ thống cấu hình tổ chức</span>
                    <span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="giaidoantrehan.html"><i class="ti-more"></i>Giai đoạn trễ hạn</a></li>
                    <li><a href="cauhinhtochuc.html"><i class="ti-more"></i>Cấu hình tổ chức</a></li>
                    <li><a href="cauhinhbophan.html"><i class="ti-more"></i>Cấu hình bộ phận</a></li>
                </ul>
            </li>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Phòng kế toán</li>
            <li>
                <a href="giaingan.html">
                    <img src="images/svg-icon/sidebar-menu/transactions.svg" class="svg-icon" alt="">
                    <span>Giải ngân</span>
                </a>
            </li>
            <li>
                <a href="gachno.html">
                    <img src="images/svg-icon/sidebar-menu/transactions.svg" class="svg-icon" alt="">
                    <span>Gạch nợ</span>
                </a>
            </li>
            <li>
                <a href="khachhangtattoan.html">
                    <img src="images/svg-icon/sidebar-menu/tickers.svg" class="svg-icon" alt="">
                    <span>Khách hàng thanh toán</span>
                </a>
            </li>
            <%--            <li>--%>
            <%--                <a href="theodoikhoantamung.html">--%>
            <%--                    <img src="images/svg-icon/ecommerce.svg" class="svg-icon" alt="">--%>
            <%--                    <span>Tổng danh sách các đơn</span>--%>
            <%--                </a>--%>
            <%--            </li>--%>
            <li>
                <a href="trasoatthongtin.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Tra soát thông tin</span>
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
                <a href="taoquyenuser.html">
                    <img src="images/svg-icon/apps.svg" class="svg-icon" alt="">
                    <span>Tạo người dùng phân quyền</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>
            <% } else if (role.equals("ketoan") || role.equals("ketoantruong")) { %>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Phòng kế toán</li>
            <li>
                <a href="giaingan.html">
                    <img src="images/svg-icon/sidebar-menu/transactions.svg" class="svg-icon" alt="">
                    <span>Giải ngân</span>
                </a>
            </li>
            <li>
                <a href="gachno.html">
                    <img src="images/svg-icon/sidebar-menu/transactions.svg" class="svg-icon" alt="">
                    <span>Gạch nợ</span>
                </a>
            </li>
            <li>
                <a href="khachhangtattoan.html">
                    <img src="images/svg-icon/sidebar-menu/tickers.svg" class="svg-icon" alt="">
                    <span>Khách hàng thanh toán</span>
                </a>
            </li>
            <li>
                <a href="trasoatthongtin.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Tra soát thông tin</span>
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
                <a href="taoquyenuser.html">
                    <img src="images/svg-icon/apps.svg" class="svg-icon" alt="">
                    <span>Tạo người dùng phân quyền</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>
            <% } else if (role.equals("upload")) { %>
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
                <a href="thaydoimatkhau.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Thay đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>
            <% } else if (role.equals("nvthamdinh")) {
            %>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Quản lý đơn hàng</li>
            <li>
                <a href="thamdinhRole.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Quản lý xét duyệt</span>
                </a>
            </li>
            <li>
                <a href="kyduyet.html">
                    <img src="images/svg-icon/sidebar-menu/charts3.svg" class="svg-icon" alt="">
                    <span>Duyệt giải ngân</span>
                </a>
            </li>
            <li>
                <a href="tuchoi.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Từ chối</span>
                </a>
            </li>
            <li>
                <a href="thaydoimatkhau.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Thay đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>
            <% } else if (role.equals("nvkyduyet")) {
            %>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Quản lý đơn hàng</li>
            <li>
                <a href="thamdinh.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Quản lý xét duyệt</span>
                </a>
            </li>
            <li>
                <a href="kyduyetRole.html">
                    <img src="images/svg-icon/sidebar-menu/charts3.svg" class="svg-icon" alt="">
                    <span>Duyệt giải ngân</span>
                </a>
            </li>
            <li>
                <a href="tuchoi.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Từ chối</span>
                </a>
            </li>
            <li>
                <a href="thaydoimatkhau.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Thay đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>
            <% } else if (role.equals("tnthamdinh")) {
            %>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Quản lý đơn hàng</li>
            <li>
                <a href="tongtiepnhan.html">
                    <img src="images/svg-icon/chart.svg" class="svg-icon" alt="">
                    <span>Tìm hiểu đơn hàng</span>
                </a>
            </li>
            <li>
                <a href="thamdinh.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Quản lý xét duyệt</span>
                </a>
            </li>
            <li>
                <a href="kyduyet.html">
                    <img src="images/svg-icon/sidebar-menu/charts3.svg" class="svg-icon" alt="">
                    <span>Duyệt giải ngân</span>
                </a>
            </li>
            <li>
                <a href="tuchoi.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Từ chối</span>
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
                <a href="taoquyenuser.html">
                    <img src="images/svg-icon/apps.svg" class="svg-icon" alt="">
                    <span>Tạo người dùng phân quyền</span>
                </a>
            </li>
            <li>
                <a href="thaydoimatkhau.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Thay đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>

            <% } else if (role.equals("nvthuphi")) {
            %>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">Quản lý đơn hàng</li>
            <li>
                <a href="thamdinhnoaction.html">
                    <img src="images/svg-icon/sidebar-menu/charts2.svg" class="svg-icon" alt="">
                    <span>Quản lý xét duyệt</span>
                </a>
            </li>
            <li>
                <a href="kyduyetlogin.html">
                    <img src="images/svg-icon/sidebar-menu/charts3.svg" class="svg-icon" alt="">
                    <span>Duyệt giải ngân</span>
                </a>
            </li>
            <li>
                <a href="tuchoikyduyet.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Từ chối</span>
                </a>
            </li>
            <li>
                <a href="thaydoimatkhau.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Thay đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>
            <% } else if (role.equals("nvthuphi")) {
            %>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">THU HỒI NỢ</li>

            <li>
                <a href="chothuhoi.html">
                    <img src="images/svg-icon/sidebar-menu/reports.svg" class="svg-icon" alt="">
                    <span>Nhắc phí</span>
                </a>
            </li>
            <li>
                <a href="daxuly.html">
                    <img src="images/svg-icon/sidebar-menu/ico.svg" class="svg-icon" alt="">
                    <span>Khách hàng đã thanh toán</span>
                </a>
            </li>
            <li>
                <a href="noquahan.html">
                    <img src="images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                    <span>Thu phí</span>
                </a>
            </li>
            <li>
                <a href="thaydoimatkhau.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Thay đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>

                </a>
            </li>
            <% } else if (role.equals("tncollection")) {
            %>
            <li class="header" style="background-color: rgba(63, 231, 91, 0.253);">THU HỒI NỢ</li>
            <li>
                <a href="chothuhoi.html">
                    <img src="images/svg-icon/sidebar-menu/reports.svg" class="svg-icon" alt="">
                    <span>Nhắc phí</span>
                </a>
            </li>
            <li>
                <a href="daxuly.html">
                    <img src="images/svg-icon/sidebar-menu/ico.svg" class="svg-icon" alt="">
                    <span>Khách hàng đã thanh toán</span>
                </a>
            </li>
            <li>
                <a href="noquahan.html">
                    <img src="images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                    <span>Thu phí</span>
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
                <a href="taoquyenuser.html">
                    <img src="images/svg-icon/apps.svg" class="svg-icon" alt="">
                    <span>Tạo người dùng phân quyền</span>
                </a>
            </li>
            <li>
                <a href="thaydoimatkhau.html">
                    <img src="images/svg-icon/basic.svg" class="svg-icon" alt="">
                    <span>Thay đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="images/svg-icon/sidebar-menu/logout.svg" class="svg-icon" alt="">
                    <span>Đăng xuất</span>
                </a>
            </li>
            <% }
            %>
        </ul>
    </section>
</aside>
<!-- sidebar
<%

    } else {
        response.sendRedirect("login");

    }
%>