<%@ page import="com.sgfintech.handler.MergeDataWithdraw" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2020
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	if (session.getAttribute(Consts.Session_Euser) != null){
		Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
		String role = u.getRole();
		if(role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong")){
		}else{
			response.sendRedirect("404");
		}
	} else{
		response.sendRedirect("login");

	}
%>
<jsp:include page="general/_head.jsp" />
<body class="hold-transition light-skin sidebar-mini theme-primary">
	<!-- Site wrapper -->
	<div class="wrapper">

		<jsp:include page="general/_header.jsp" />

		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="general/_menu.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<div class="container-full">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="d-flex align-items-center">
						<div class="mr-auto">
							<h3 class="page-title">Tổng danh sách thu hồi nợ</h3>
							<div class="d-inline-block align-items-center">
								<nav>
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
										</li>
										<li class="breadcrumb-item" aria-current="page">Kế toán kiểm toán</li>
										<li class="breadcrumb-item active" aria-current="page">Tổng danh sách</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>

				<!-- Main content -->
				<section class="content">

					<div class="row">
						<div class="col-lg-3 col-6">
							<a class="box box-link-shadow text-center" href="javascript:void(0)">
								<div class="box-body">
									<div class="font-size-24">+${countDone}</div>
									<span>Tổng số lượng gạch nợ</span>
								</div>
								<div class="box-body bg-info">
									<p>
										<span class="mdi mdi-ticket-confirmation font-size-30"></span>
									</p>
								</div>
							</a>
						</div>
						<div class="col-lg-3 col-6">
							<a class="box box-link-shadow text-center" href="javascript:void(0)">
								<div class="box-body">
									<div class="font-size-24">175</div>
									<span>Nợ quá hạn</span>
								</div>
								<div class="box-body bg-warning">
									<p>
										<span class="mdi mdi-message-reply-text font-size-30"></span>
									</p>
								</div>
							</a>
						</div>
						<div class="col-lg-3 col-6">
							<a class="box box-link-shadow text-center" href="javascript:void(0)">
								<div class="box-body">
									<div class="font-size-24">110</div>
									<span>Được giải quyết</span>
								</div>
								<div class="box-body bg-success">
									<p>
										<span class="mdi mdi-thumb-up-outline font-size-30"></span>
									</p>
								</div>
							</a>
						</div>
						<div class="col-lg-3 col-6">
							<a class="box box-link-shadow text-center" href="javascript:void(0)">
								<div class="box-body">
									<div class="font-size-24">59</div>
									<span>Pending</span>
								</div>
								<div class="box-body bg-danger">
									<p>
										<span class="mdi mdi-ticket font-size-30"></span>
									</p>
								</div>
							</a>
						</div>
						<div class="col-12">
							<div class="box">
								<div class="box-header with-border">
									<h4 class="box-title">Danh sách gạch nợ</h4>
									<h6 class="box-subtitle">Danh sách khách hàng được gạch nợ tự động và xác nhận gạch
										nợ bởi kế toán trưởng</h6>
								</div>
								<div class="box-body p-15">
									<div class="table-responsive">
										<table id="example" class="table table-lg invoice-archive"
											data-page-size="10">
											<thead>
												<tr>
													<th>Mã đơn vay</th>
													<th>Mã công ty</th>
													<th>Tên khách hàng</th>
													<th>Mã hệ thống (System Trace)</th>
													<th>Status</th>
													<th>Mã giao dịch (Transaction ID)</th>
													<th>Ngày thanh toán</th>
													<th>Số tiền còn nợ</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${views}" var="lst" varStatus="loop">
													<tr>
														<td><a href="#"
															   onclick="viewInfoContract('${lst.contract.idContract}')"><b>${lst.contract.idContract}</b></a>
														</td>
														<td><h6 class="mb-0">
															<b><a data-toggle="modal" href="#" onclick="viewInfoCompany('${lst.companies.companyCode}')"> ${lst.companies.companyCode}</a></b>
														</h6>
														</td>
														<td>
															<h6 class="mb-0">
																<a  href="#"
																	onclick="viewInfoCustomer('${lst.customer.customerPhone}')"	><b>${lst.customer.customerName}</b></a>
															</h6>
														</td>
														</td>
														<td>${lst.contract.systemTrace} đ</td>
														<td ><h6 class="mb-0" style="color:red"><b> Gạch nợ </b></h6></td>
														<td>${lst.contract.transactionId}</td>
														<td><fmt:parseDate value=" ${lst.contract.dateRepayment}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="patientDob" type="date"/>
															<fmt:formatDate pattern="dd/MM/yyyy - hh:mm a" value="${patientDob}"/></td>
														<td> <fmt:formatNumber value="${lst.contract.remainAmountBorrow + (lst.contract.remainAmountBorrow * 2/100) }" type = "number"/> đ</td>
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

		<jsp:include page="general/_footer.jsp" />
		<!-- Control Sidebar -->
		<jsp:include page="general/_controlSidebar.jsp" />
		<!-- /.control-sidebar -->
		<jsp:include page="general/modal.jsp"/>
		<!-- Modal show info contract -->
		<div class="modal modal-right fade" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thông tin chi tiết hợp đồng </h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="font-weight: bold; color: #0b0b0b">
						<h3><p>Mã hợp đồng : <span id="idContract"></span>9999</p></h3>
						<p>System Trace : <span id="systemTrace"></span></p>
						<p>Số điện thoại khách hàng : <span id="customerPhone"></span></p>
						<p>Số lần mượn : <span id="timeBorrow"></span></p>
						<p>Số tiền mượn : <span id="remainAmountBorrow"></span></p>
						<p>Phí mượn : <span id="feeBorrow"></span></p>
						<p>Mã giao dịch : <span id="transactionId"></span></p>
						<p>Trạng thái : <b style="color: #0b2c89"><span id="status"></span></b></p>
						<p>Người ký duyệt :  <span id="acceptedBy"></span></p>
						<p>Ngày ký duyệt :  <span id="day1"></span>/<span id="month1"></span>/<span id="year1"></span>&nbsp;&nbsp;<span id="hour"></span>:<span id="minute"></span>:<span id="second"></span></p>
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
	<!-- Vendor JS -->
	<script src="js/vendors.min.js"></script>

	<script src="assets/vendor_components/datatable/datatables.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- Crypto Tokenizer Admin App -->
	<script src="js/template.js"></script>
	<script src="js/demo.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#loading").hide()
			$('#example').DataTable({
				dom: 'BLfrtip',
				pageLength: 50,
				buttons: [{
					extend: 'excel',
					exportOptions: {
						columns: ':visible'
					},
					Text: 'Export To Excel',
					filename: 'Transaction Report',
					customizeData: function (data) {
						for (var i = 0; i < data.body.length; i++) {
							for (var j = 0; j < data.body[i].length; j++) {
								if (data.header[j] == "Column Name") {
									data.body[i][j] = '\u200C' + data.body[i][j];
								}
							}
						}
					}}]})
		});
  				<%
                    List<MergeDataWithdraw> list = (List<MergeDataWithdraw>) request.getAttribute("views");
                    Gson g = new Gson();
                    String json = g.toJson(list);
                %>
		var result = <%=json%>;
		function viewInfoCompany(params) {
			result.forEach((company) => {
				if (company.companies.companyCode == params) {
					let c = company.companies;
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
		function viewInfoContract(params) {
			result.forEach((contract) => {
				if (contract.contract.idContract == params) {
					let c = contract.contract;
					let time = c.createdDate.date;
					let second = c.createdDate.time;
					console.log(second)
					Object.keys(c).forEach((key) => {
						if (key == "borrow" ){
							value = c[key]
							$('#' + key).text(value.toLocaleString("vi-VN") + " đ");
							Object.keys(time).forEach((key) => {
								console.log(time[key])
								$('#' + key+'1').text(time[key]);
							})
							Object.keys(second).forEach((key) => {
								console.log(second[key])
								$('#' + key).text(second[key]);
							})
						}
						else{
							$('#' + key).text(c[key]);
						}
					})
				}
			})
			$('#modal').modal('show');
		}
		function viewInfoCustomer(params) 	{
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
								if (imgCMND[key] == 'http://dev.sgft.info:8080/upload/'+params+'@' ){
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
						if (key == "customerSalary" ){
							value = c[key]
							$('#' + key).text(value.toLocaleString("vi-VN") + " đ");
							Object.keys(date).forEach((key) => {
								$('#' + key).text(date[key]);
							})
						}
						else
						{
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