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
	Useradmin u= (Useradmin)session.getAttribute(Consts.Session_Euser);
	String role = u.getRole();
	if(role.equals("root") || role.equals("ketoan") || role.equals("ketoantruong")){
		response.sendRedirect("tongdanhsach");
	}else{
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
						<div class="col-lg-3 col-6">
							<a class="box box-link-shadow text-center" href="javascript:void(0)">
								<div class="box-body">
									<div class="font-size-24">+264</div>
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
						<div class="col-xl-3 col-lg-4 col-12">
							<div class="row">
								<div class="col-12">
									<div class="box">
										<div class="box-header with-border">
											<h5 class="box-title">Hình thức thanh toán nợ</h5>
											<div class="box-tools pull-right">
												<ul class="card-controls">
													<li class="dropdown">
														<a data-toggle="dropdown" href="#"><i
																class="ion-android-more-vertical"></i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item active" href="#">Today</a>
															<a class="dropdown-item" href="#">Yesterday</a>
															<a class="dropdown-item" href="#">Last week</a>
															<a class="dropdown-item" href="#">Last month</a>
														</div>
													</li>
													<li><a href="" class="link card-btn-reload" data-toggle="tooltip"
															title="" data-original-title="Refresh"><i
																class="fa fa-circle-thin"></i></a></li>
												</ul>
											</div>
										</div>

										<div class="box-body">
											<div class="text-center pb-25">
												<div class="donut"
													data-peity='{ "fill": ["#fc4b6c", "#ffb22b", "#398bf7"], "radius": 70, "innerRadius": 28  }'>
													9,6,5</div>
											</div>

											<ul class="list-inline">
												<li class="flexbox mb-5">
													<div>
														<span class="badge badge-dot badge-lg mr-1"
															style="background-color: #fc4b6c"></span>
														<span>Chuyển khoản</span>
													</div>
													<div>8952</div>
												</li>

												<li class="flexbox mb-5">
													<div>
														<span class="badge badge-dot badge-lg mr-1"
															style="background-color: #ffb22b"></span>
														<span>Trung gian thanh toán</span>
													</div>
													<div>7458</div>
												</li>

												<li class="flexbox">
													<div>
														<span class="badge badge-dot badge-lg mr-1"
															style="background-color: #398bf7"></span>
														<span>Trực tiếp</span>
													</div>
													<div>3254</div>
												</li>
												<li class="flexbox">
													<div>
														<span class="badge badge-dot badge-lg mr-1"
															style="background-color: #ce389c"></span>
														<span>Other</span>
													</div>
													<div>3254</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-9 col-lg-8 col-12">
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
													<th>Tên khách hàng</th>
													<th>Số tiền thanh toán</th>
													<th>Mã hệ thống (System Trace)</th>
													<th>Status</th>
													<th>Mã giao dịch (Transaction ID)</th>
													<th>Ngày</th>
													<th>Số tiền còn nợ</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${views}" var="lst" varStatus="loop">
													<tr>
														<td><a href="#"
															   onclick="viewInfoContract('${lst.contract.idContract}')"><b>${lst.contract.idContract}9999</b></a>
														</td>
														<td>
															<h6 class="mb-0">
																<a  href="#"
																	onclick="viewInfoCustomer('${lst.customer.customerPhone}')"	><b>${lst.customer.customerName}</b></a>
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
														<td>${lst.contract.remainAmountBorrow} đ</td>
														<td>${lst.contract.systemTrace} đ</td>
														<td ><h6 class="mb-0" style="color:red"><b> Gạch nợ </b></h6></td>
														<td>${lst.contract.transactionId}</td>
														<td>${lst.contract.dateRepayment} đ</td>
														<td>${lst.contract.borrow} đ</td>

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
						<p>Số tiền mượn : <span id="borrow"></span></p>
						<p>Phí mượn : <span id="feeBorrow"></span></p>
						<p>Mã giao dịch : <span id="transactionId"></span></p>
						<p>Trạng thái : <b style="color: #0b2c89"><span id="status"></span></b></p>
						<p>Người ký duyệt :  <span id="acceptedBy"></span></p>
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
	<script src="js/pages/data-table.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- Crypto Tokenizer Admin App -->
	<script src="js/template.js"></script>
	<script src="js/demo.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#loading").css("display", "none");
		});
  				<%
                    List<MergeDataWithdraw> list = (List<MergeDataWithdraw>) request.getAttribute("views");
                    Gson g = new Gson();
                    String json = g.toJson(list);
                %>
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
			$('#modal').modal('show');
		}
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
                $('#modal-right').modal('show');
            }
	</script>
</body>

</html>