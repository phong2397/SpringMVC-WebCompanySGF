<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<%
    if (session.getAttribute(Consts.Session_Euser) != null){
        Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
        String role = u.getRole();
        if(role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong") || role.equals("thamdinh")){
        }else{
            response.sendRedirect("404");
        }
    } else{
        response.sendRedirect("login");

    }
%>
<jsp:include page="general/_head.jsp"/>

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
                        <h3 class="page-title">Danh sách đơn bị từ chối</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Tiếp nhận yêu cầu</li>
                                    <li class="breadcrumb-item active" aria-current="page">Đơn bị từ chối</li>
                                </ol>
                            </nav>
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
                                    <h5>Chờ ký duyệt</h5>
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
                                    <h5> Đã xử lý</h5>
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
                                    <div class="font-size-60">${countDeni}</div>
                                    <span>Yêu cầu bị từ chối</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h4 class="box-title">Danh sách bị từ chối</h4>
                                <h6 class="box-subtitle">Export Invoice List to Copy, CSV, Excel, PDF & Print</h6>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">

                                    <table class="table table-lg invoice-archive">
                                        <thead>
                                        <tr>
                                            <th>Mã yêu cầu</th>
                                            <th>Ngày yêu cầu</th>
                                            <th>Thông tin khách hàng</th>
                                            <th>Trạng thái</th>
                                            <th>Người xác nhận</th>
                                            <th>Ngày thẩm định</th>
                                            <th>Số tiền ứng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${views}" var="lst" varStatus="loop">
                                            <tr>
                                                <td> <a data-toggle="modal" href="#"
                                                        onclick="viewInfoOrder('${lst.saRequest.id}')"><b>${lst.saRequest.id}</b></a></td>
                                                <td><fmt:parseDate value="${lst.saRequest.createdDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob" type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a" value="${patientDob}"/></td>
                                                <td>
                                                    <h6 class="mb-0">
                                                        <b> <a data-toggle="modal" href="#" onclick="viewInfoCustomer('${lst.customer.customerPhone}')">${lst.customer.customerName}</a></b>
                                                        <span class="d-block text-muted">Company ID :<b><a data-toggle="modal" href="#" onclick="viewInfoCompany('${lst.company.companyCode}')"> ${lst.company.companyCode}</a></b></span>
                                                        <span class="d-block text-muted">Account number : ${lst.customer.customerBankAcc}</span>
                                                        <span class="d-block text-muted">Owner : ${lst.customer.customerBankName}</span>
                                                        <span class="d-block text-muted">Phone number : ${lst.customer.customerPhone}</span>
                                                    </h6>
                                                </td>
                                                <td class="text-center">
                                                    <h6 class="mb-0 font-weight-bold" style="color: red">Từ chối</h6>
                                                </td>
                                                <td class="text-center"><b>${lst.saRequest.employeeThamdinh}</b>
                                                </td>
                                                <td class="text-center">
                                                    <fmt:parseDate value="${lst.saRequest.employeeThamdinhDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob" type="date"/>
                                                    <fmt:formatDate pattern="dd/MM/yyyy - hh:mm a" value="${patientDob}"/>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 font-weight-bold"> <fmt:formatNumber value="${lst.saRequest.borrow + (lst.saRequest.borrow * 0.2)}" type = "number"/> đ
                                                        <span class="d-block text-muted font-weight-normal">Phí 2 % </span>
                                                    </h6>
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
            </section>
        </div>
    </div>

    <jsp:include page="general/_footer.jsp"/>
    <!-- Control Sidebar -->
    <jsp:include page="general/_controlSidebar.jsp"/>
    <!-- /.control-sidebar -->
    <jsp:include page="general/modal.jsp"/>
    <!-- Modal show info order -->
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
                    <h3><p>Mã yêu cầu: <span id="id"></span>9999</p></h3>
                    <p>Số điện thoại : <span id="customerPhone"></span></p>
                    <p>Số tiền ứng : <span id="borrow"></span>đ</p>
                    <p>Thuế : <span id="interestRate"></span>%</p>
                    <p>Phí : <span id="feeBorrow"></span></p>
                    <p>Số lần ứng : <span id="timeBorrow"></span></p>
                    <p>Trạng thái : <b style="color: #0b2c89"><span id="status"></span></b></p>
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
<script src="js/pages/data-table.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Crypto Tokenizer Admin App -->
<script src="js/template.js"></script>
<script src="js/demo.js"></script>
<script src="js/functhamdinh.js" type="text/javascript"></script>
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
    function viewInfoOrder(id) {
        list = result.find(el => el.saRequest.id == id);
        console.log(list)
        const saRequest = list.saRequest;
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
        $('#modal-center').modal('show');
    }

    function viewInfoCustomer(params) {
        let username = "sgfintech";
        let password ="k6mzMtPJLPMi5crF";
        result.forEach((customer) => {
            if (customer.customer.customerPhone == params) {
                $.ajax ({
                    url:  'http://dev.sgft.info:8080/customergateway/api/v1/document/' + params,
                    headers: {
                        "Access-Control-Allow-Origin": 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + params,
                        "Access-Control-Allow-Credentials" : true,
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
                    },
                    crossDomain: true,
                    method: 'GET',
                    dataType: 'json',
                    success: function(data){
                        const imgCMND = JSON.parse(data.cmnd);
                        $('#imgCMND').empty();
                        Object.keys(imgCMND).forEach((key)=>{
                            console.log(imgCMND[key])
                            if (imgCMND[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                                $('#imgCMND').append('Bổ sung hình ảnh');
                            }else{
                                $('#imgCMND').append('<img style="width: 100%" src="' + imgCMND[key] +'"/>');
                            }
                        });
                        const payslipObj = JSON.parse(data.payslip);
                        $('#imgPayslip').empty();
                        Object.keys(payslipObj).forEach((key)=>{
                            console.log(payslipObj[key])
                            if (payslipObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                                $('#imgPayslip').append('<div style="color: grey">Không có hình ảnh</div>');
                            }else{
                                $('#imgPayslip').append('<img style="width: 100%" src="' + payslipObj[key] +'"/>');
                            }
                        });
                        const salaryObj = JSON.parse(data.salary);
                        $('#imgSalary').empty();
                        Object.keys(salaryObj).forEach((key)=>{
                            console.log(salaryObj[key]);
                            if (salaryObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                                $('#imgSalary').append('<div style="color: grey">Không có hình ảnh</div>');
                            }else{
                                $('#imgSalary').append('<img style="width: 100%" src="' + salaryObj[key] +'"/>');
                            }
                        });
                        const healthObj = JSON.parse(data.health);
                        $('#imgHealth').empty();
                        Object.keys(healthObj).forEach((key)=>{
                            console.log(healthObj[key]);
                            if (healthObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                                $('#imgHealth').append('<div style="color: grey">Không có hình ảnh</div>');
                            }else{
                                $('#imgHealth').append('<img style="width: 100%"  src="' + healthObj[key] +'"/>');
                            }
                        });
                        const appendixObj = JSON.parse(data.appendix);
                        $('#imgAppendix').empty();
                        Object.keys(appendixObj).forEach((key)=>{
                            console.log(appendixObj[key]);
                            if (appendixObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                                $('#imgAppendix').append('<div style="color: grey">Không có hình ảnh</div>');
                            }else{
                                $('#imgAppendix').append('<img style="width: 100%" src="' + appendixObj[key] +'"/>');
                            }
                        });
                        const socialObj = JSON.parse(data.social);
                        $('#imgSocial').empty();
                        Object.keys(socialObj).forEach((key)=>{
                            console.log(socialObj[key]);
                            if (socialObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                                $('#imgSocial').append('<div style="color: grey">Không có hình ảnh</div>');
                            }else{
                                $('#imgSocial').append('<img style="width: 100%" src="' + socialObj[key] +'"/>');
                            }
                        });
                        const contractObj = JSON.parse(data.contract);
                        $('#imgContract').empty();
                        Object.keys(contractObj).forEach((key)=>{
                            console.log(contractObj[key]);
                            if (contractObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                                $('#imgContract').append('<div style="color: grey">Không có hình ảnh</div>');
                            }else{
                                $('#imgContract').append('<img style="width: 100%" src="' + contractObj[key] +'"/>');
                            }
                        });
                    },
                });
                let c = customer.customer;
                const date = c.customerBirthday;
                Object.keys(c).forEach((key) => {
                    if (key == "customerSalary") {
                        value = c[key]
                        $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
                        Object.keys(date).forEach((key) => {
                            $('#' + key).text(date[key]);
                        })
                    } else {
                        $('#' + key).text(c[key]);
                    }
                })
            }
        })
        $('#modal-right').modal('show');
    }
</script>

</body>

</html>