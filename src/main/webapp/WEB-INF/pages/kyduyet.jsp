<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/09/2020
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute(Consts.Session_Euser) != null){
        Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if(role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("kyduyet")){
        }else{
            response.sendRedirect("404");
        }
    } else{
        response.sendRedirect("login");

    }
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="general/_head.jsp" />
<body class="hold-transition light-skin sidebar-mini theme-primary">
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
                                    <div id="thismonth">
                                        <canvas width="60" height="35"
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
                                    <div id="lastyear">
                                        <canvas width="60" height="35"
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
                                    <div class="font-size-60">${countAll}</div>
                                    <span>Tổng số lượt yêu cầu trong ngày</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12 ">
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
                                    <div class="font-size-60">${countWait}</div>
                                    <span>Yêu cầu chờ thẩm định</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12 ">
                    <div class="box box-inverse box-primary">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5> Chờ ký duyệt</h5>
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
                                    <div class="font-size-60">${countWFS}</div>
                                    <span>Yêu cầu chờ ký duyệt</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xl-3 col-md-6 col-12 ">
                    <div class="box box-inverse " style="background-color: hotpink">
                            <div class="box-body">
                                <div class="flexbox">
                                    <h5> Đã giải ngân</h5>
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
                                    <div class="font-size-60">${countDone}</div>
                                    <span>Yêu cầu tất toán thành công</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
<%--                    <div class="col-xs-4 col-md-2 col-10 ">--%>
<%--                        <div class="box box-inverse box-danger">--%>
<%--                            <div class="box-body">--%>
<%--                                <div class="flexbox">--%>
<%--                                    <h5>Đã hủy</h5>--%>
<%--                                    <div class="dropdown">--%>
<%--											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i--%>
<%--                                                    class="ion-android-more-vertical rotate-90"></i></span>--%>
<%--                                        <div class="dropdown-menu dropdown-menu-right">--%>
<%--                                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>--%>
<%--                                                Details</a>--%>
<%--                                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add--%>
<%--                                                new</a>--%>
<%--                                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>--%>
<%--                                                Refresh</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="text-center my-2">--%>
<%--                                    <div class="font-size-60">${countDeni}</div>--%>
<%--                                    <span>Yêu cầu bị từ chối</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
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
                                            <th>Ngày thẩm định</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Trạng thái</th>
                                            <th>Thời gian còn lại</th>
                                            <th>Thời gian ứng</th>
                                            <th>Số tiền ứng</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td><b> <a data-toggle="modal" href="#"
                                                           onclick="viewInfoOrder('${lst.saRequest.id}')">${lst.saRequest.id}9999</a></b></td>
                                                <td class="text-left">${lst.saRequest.employeeThamdinh}</td>
                                                <td>${lst.saRequest.employeeThamdinhDate}</td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <b> <a data-toggle="modal" href="#" onclick="viewInfoCustomer('${lst.customer.customerPhone}')">${lst.customer.customerName}</a></b>
                                                        <span class="d-block text-muted">Company ID :<b><a data-toggle="modal" href="#" onclick="viewInfoCompany('${lst.company.companyCode}')">${lst.company.companyCode}</a></b></span>
                                                        <span class="d-block text-muted">Account number: ${lst.customer.customerBankAcc}</span>
                                                        <span class="d-block text-muted">Owner : ${lst.customer.customerBankName}</span>
                                                        <span class="d-block text-muted">Phone number : ${lst.customer.customerPhone}</span>
                                                    </h6>
                                                </td>
                                                <td class="text-center">
                                                    <h6 class="mb-0 font-weight-bold">chờ ký</h6>
                                                </td>
                                                <td class="text-center">
                                                    <span class="badge badge-pill badge-primary">2 ngày</span>
                                                </td>
                                                <td>
                                                        ${lst.saRequest.timeBorrow} tháng
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 font-weight-bold"> <fmt:formatNumber value="${lst.saRequest.borrow + (lst.saRequest.borrow * 0.2)}" type = "number"/> đ
                                                        <span class="d-block text-muted font-weight-normal">Phí 2 % </span>
                                                    </h6>
                                                </td>
                                                <td>
                                                    <button class="btn btn-rounded btn-info btn-accept">Accept</button>
                                                    <button class="btn btn-rounded btn-dark btn-refuse">Refuse</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
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


    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>

    <!-- /.control-sidebar -->
    <jsp:include page="general/modal.jsp"/>
    <!-- Modal show info customer -->
    <div class="modal modal-right fade" id="modal-left" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thông tin chi tiết đơn hàng</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                    <h3><p>Mã yêu cầu: <span id="id"></span></p></h3>
                    <p>Số điện thoại : <span id="customerPhone"></span></p>
                    <p>Số tiền ứng : <span id="borrow"></span></p>
                    <p>Thuế : <span id="interestRate"></span>%</p>
                    <p>Phí : <span id="feeBorrow"></span></p>
                    <p>Số lần ứng : <span id="timeBorrow"></span></p>
                    <p>Trạng thái : <span id="status" style="color: #0b2c89"></span></p>
                    <p>Người thẩm định : <span id="employeeThamdinh"></span></p>
                </div>
                <div class="modal-footer modal-footer-uniform">
                    <button type="button" class="btn btn-rounded btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->
    <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- Vendor JS -->
<script src="js/vendors.min.js"></script>

<script src="assets/vendor_components/datatable/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script src="js/pages/data-table.js"></script>
<script type="text/javascript" src="js/funckyduyet.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();

    });
    <%
              List<MergeDataOrder> list = (List<MergeDataOrder>) request.getAttribute("views");
              Gson g = new Gson();
              String json = g.toJson(list);
              %>
    var result = <%=json%>;
    function viewInfoCompany(params) {
        result.forEach((company) => {
            if (company.company.companyCode == params) {
                let c = company.company;
                Object.keys(c).forEach((key, _) => {
                    let id = key;
                    $('#' + id).text(c[key]);
                })
            }
        })
        console.log(result);
        // var index =
        $('#modal-center').modal('show');
    }

    function viewInfoOrder(id) {
        list = result.find(el => el.saRequest.id == id);
        console.log(list)
        const saRequest = list.saRequest;
        const date = saRequest.employeeThamdinhDate.date;
        debugger;
        Object.keys(saRequest).forEach((key) => {
           if(key == "borrow" ){
                let value1 = saRequest[key];
                $('#' + key).text(value1.toLocaleString("vi-VN") + " đ");
            }
            else {
                $('#' + key).text(saRequest[key]);
            }
        });
        // var index =
        $('#modal-left').modal('show');
    }

    function viewInfoCustomer(params) {
        result.forEach((customer) => {
            if (customer.customer.customerPhone == params) {
                let c = customer.customer;
                const date = c.customerBirthday;
                Object.keys(c).forEach((key) => {
                    if (key == "customerSalary" ){
                        value = c[key]
                        $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
                        Object.keys(date).forEach((key) => {
                                $('#' + key).text(date[key]);
                        })
                    }
                    else{
                        $('#' + key).text(c[key]);
                    }
                })
            }
        })
        console.log(result);
        $('#modal-right').modal('show');
    }
</script>

</body>

</html>
