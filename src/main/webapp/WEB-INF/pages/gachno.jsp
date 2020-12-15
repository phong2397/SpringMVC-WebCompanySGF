<%@ page import="com.sgfintech.handler.MergeDataWithdraw" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %><%--
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
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="dd-MM-yyyy" />
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
							<h3 class="page-title">Gạch nợ cho khách hàng</h3>
							<div class="d-inline-block align-items-center">
								<nav>
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a>
										</li>
										<li class="breadcrumb-item" aria-current="page">Kế toán kiểm toán</li>
										<li class="breadcrumb-item active" aria-current="page">Gạch nợ</li>
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
				<div class="px-30 my-15 no-print">
					<div class="callout callout-success" style="margin-bottom: 0!important;">
						<h4><i class="fa fa-info"></i> Note:</h4>
						Có thể hóa đơn gạch nợ bằng tay. Vui lòng click vào Button PRINT để lưu giữ chứng từ
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="box">
							<div class="box-header with-border">
								<h4 class="box-title">Danh sách nợ</h4>
							</div>
							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered no-margin">
										<thead>
											<tr>
												<th class="text-center">Mã đơn vay</th>
												<th>Thông tin khách hàng</th>
												<th class="text-right">Số tiền tối thiểu</th>
												<th class="text-right">Số tiền còn nợ</th>
												<th class="text-right">Số tiền đã đóng</th>
												<th class="text-right">Hạn thanh toán</th>
												<th class="text-right">Kỳ thanh toán</th>
												<th class="text-right">Ngày nhắc nợ</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${views}" var="lst" varStatus="loop">
												<tr>
													<td><a href="#"
															onclick="viewInfoContract('${lst.contract.idContract}')">#${lst.contract.idContract}9999</a>
													</td>
													<td class="text-left">
														<h6 class="mb-0">
															<a data-toggle="modal" href="#"
																onclick="viewInfoCustomer('${lst.customer.customerPhone}')">${lst.customer.customerName}</a>
															<span class="d-block text-muted">Account number:
																${lst.customer.customerBankAcc}</span>
															<span class="d-block text-muted">Owner :
																${lst.customer.customerBankName}</span>
															<span class="d-block text-muted">Company ID :
																${lst.customer.companyCode}</span>
															<span class="d-block text-muted">Phone number :
																${lst.customer.customerPhone}</span>
														</h6>
													</td>
													<td class="text-right">${lst.contract.borrow} đ</td>
													<td class="text-right">${lst.contract.borrow} đ</td>
													<td class="text-right">0</td>
													<td class="text-right">${lst.contract.dateRepayment}</td>
													<td class="text-right">1</td>
													<td class="text-right">${year}</td>
												</tr>
											</c:forEach>
										<tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<div class="col-12">
						<div class="bb-1 clearFix">
							<div class="text-right pb-15">
								<button class="btn btn-rounded btn-success" type="button"> <span><i
											class="fa fa-print"></i> Save</span> </button>
								<button id="print2" class="btn btn-rounded btn-warning" type="button"> <span><i
											class="fa fa-print"></i> Print</span> </button>
							</div>
						</div>
					</div>

					<!-- /.col -->
				</div>
				<!-- Main content -->
				<section class="invoice printableArea" style="display:none"  id="div">
					<div class="col-12" >
						<!-- title row -->
						<div class="col-12">
							<div class="page-header">
								<h2 class="d-inline"><span class="font-size-30">Thông tin hóa đơn</span></h2>
								<div class="pull-right text-right">
									<h3>${year}</h3>
								</div>
							</div>
						</div>
						<!-- info row -->
						<div class="row invoice-info">
							<div class="col-md-6 invoice-col">
								<strong>FROM</strong>
								<address>
									<strong class="text-blue font-size-24">SG Fintech</strong><br>
									<strong class="d-inline">66 Phó Đức Chính Quận 1</strong><br>
									<strong>Phone: (00) 123-456-7890 &nbsp;&nbsp;&nbsp;&nbsp; Email:
										admin@sgfintech.com.vn</strong>
								</address>
							</div>
							<!-- /.col -->
							<div class="col-md-6 invoice-col text-right">
								<strong>To</strong>
								<address>
									<strong class="text-blue font-size-24"><span id="customerName"></span></strong><br>
									<strong class="d-inline"><span id="customerAddress"></span></strong><br>
									<strong>Phone: <span id="customerPhone"></span> &nbsp;&nbsp;&nbsp;&nbsp; Email:
										<span id="customerEmail"></span></strong>
								</address>
							</div>
							<!-- /.col -->
							<div class="col-sm-12 invoice-col mb-15">
								<div class="invoice-details row no-margin">
									<div class="col-md-6 col-lg-3"><b>Mã đơn vay:</b>#<span id="idContract">9999</span>
									</div>
									<div class="col-md-6 col-lg-3"><b>Thông tin giao dịch:</b>
										<span id="transactionId"></span></div>
									<div class="col-md-6 col-lg-3"><b>Ngày thanh toán:</b>${year}</div>
									<div class="col-md-6 col-lg-3"><b>Tài khoản báo có :</b>
										<span id="customerBankAcc"></span></div>
								</div>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
						<!-- Table row -->
						<div class="row">
							<div class="col-12 table-responsive">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th>Mô tả</th>
											<th>Serial #</th>
											<th class="text-right">Số tiền thanh toán</th>
											<th class="text-right">Thuế</th>
											<th class="text-right">Phí</th>
											<th class="text-right">Tổng</th>
										</tr>
										<tr>
											<td>Thanh toán dư nợ cuối kì</td>
											<td><span id="systemTrace"></span></td>
											<td class="text-right"><span id="borrow"></span></td>
											<td class="text-right">10%</td>
											<td class="text-right"><span id="feeBorrow"></span></td>
											<td class="text-right"><span id="remainAmountBorrow"></span></td>

										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<div class="row">
							<div class="col-12 text-right">
								<p class="lead"><b>Ngày thanh toán:</b><span class="text-danger">${year}</p>
								<p c <div>
								<p>Sub - Total amount :
									<fmt:formatNumber value="${lst.contract.remainAmountBorrow * 10}" type="currency" />
								</p>
								<p>Shipping :
									<fmt:formatNumber value="${30000}" type="currency" />
								</p>
							</div>
							<div class="total-payment">
								<h3><b>Total :</b>
									<fmt:formatNumber value="${17000 * 10 + 30000 }"
										type="currency" />
								</h3>
							</div>
						</div>
						<!-- /.col -->
					<!-- /.row -->

					<!-- this row will not appear when printing -->
					<div class="row no-print">
						<div class="col-12">
							<button type="button" class="btn btn-rounded btn-success pull-right"><i
									class="fa fa-credit-card"></i> Submit Payment
							</button>
						</div>
					</div>
			</div>
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- /.content-wrapper -->

	<jsp:include page="general/_footer.jsp" />
	<!-- Control Sidebar -->
	<jsp:include page="general/_controlSidebar.jsp" />
	<!-- /.control-sidebar -->

	<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="js/pages/data-table.js"></script>
	<!-- Vendor JS -->
	<script src="js/vendors.min.js"></script>
	<!-- Crypto Tokenizer Admin App -->
	<script src="js/template.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/pages/data-table.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#loading").css("display", "none");
		});

		$("body").on("click", ".btn-success", function () {
			var dataRequest = $("#idContract").text();
			let data = { datarequest: dataRequest, status: 'done' };
			var result = submitWithdraw(data);
			if (result === "success") {
				Swal.fire({
					position: 'top-end',
					icon: 'success',
					title: 'Dữ liệu được cập nhật thành công.',
					showConfirmButton: false,
					timer: 3000
				});
				$(this).parents("tr").remove();
			} else {
				Swal.fire({
					position: 'top-end',
					icon: 'error',
					title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
					showConfirmButton: false,
					timer: 3000
				});
			}
		});
		function submitWithdraw(data) {
			try {
				// This async call may fail.
				let text = $.ajax({
					type: "POST",
					timeout: 100000,
					url: "${pageContext.request.contextPath}/gachno",
					data: data,
					dataType: 'text',
					async: false
				}).responseText;
				return text;
			} catch (error) {
				return "Không thể kết nối tới server";
			}
		}
		  <%
			List < MergeDataWithdraw > list = (List<MergeDataWithdraw>) request.getAttribute("views");
		Gson g = new Gson();
		String json = g.toJson(list);
           %>
			function viewInfoCustomer(params) {
				var result = <%=json%>;
				result.forEach((customer) => {
					if (customer.customer.customerPhone == params) {
						let c = customer.customer;
						Object.keys(c).forEach((key, _) => {
							let id = key;
							$('#' + id).text(c[key]);
						})
					}
				})
$("#div").toggle()
			}
		function viewInfoContract(params) {
			var result = <%=json%>;
			result.forEach((contract) => {
				if (contract.contract.idContract == params) {
					let c = contract.contract;
					Object.keys(c).forEach((key, _) => {
						let id = key;
						$('#' + id).text(c[key]);
					})
				}
			})

		}
	</script>
</body>

</html>