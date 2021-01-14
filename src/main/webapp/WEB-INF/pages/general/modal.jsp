<%--
  Created by IntelliJ IDEA.
  User: phong
  Date: 12/22/20
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal show info company -->
<div class="modal modal-right fade" id="modal-center" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin công ty</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b" id="companyShow">

            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal show info customer -->
<div class="modal modal-right fade" id="modal-right" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin chi tiết khách hàng</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                <h3><p>Họ Tên : <span id="customerName"></span></p></h3>
                <h4><p>Số điện thoại : <span id="customerPhone"></span></p>
                </h4>
                <p>Mã nhân viên : <span id="customerCode"></span></p>
                <p>Email : <span id="customerEmail"></span></p>
                <p>Mức lương : <span id="customerSalary"></span></p>
                <p>Giới tính : <span id="customerGender"></span></p>
                <p>Ngày sinh : <span id="day"></span>/<span id="month"></span>/<span id="year"></span></p>
                <p>Chủ tài khoản : <span id="customerBank"></span></p>
                <p>Số tài khoản : <span id="customerBankAcc"></span></p>
                <p>Tên ngân hàng : <span id="customerBankName"></span></p>
                <p>Số CMND : <span id="customerId"></span></p>
                <p>Thường trú : <span id="customerIdLocation"></span></p>
                <p>Địa chỉ : <span id="customerAddress"></span></p>
                <p>Tạm trú : <span id="customerAddressTemp"></span></p>
                <p>Số BHXH : <span id="customerSocialInsurance"></span></p>
                <p>Số BHYT : <span id="customerHealthInsurance"></span></p>
                <p>Mã số thuế : <span id="customerTax"></span></p>
                <p>Số hợp đồng : <span id="customerContract"></span></p>
                <p>Thông tin người thân : <span id="customerRelative"></span></p>
                <p>Số điện thoại người thân : <span id="customerRelativePhone"></span></p>
                <p>Hình ảnh chứng minh nhân dân : </p>
                <p id="imgCMND"></p>
                <p>Hình ảnh bảng lương cá nhân : </p>
                <p id="imgPayslip"></p>
                <p>Hình ảnh bảo hiểm y tế : </p>
                <p id="imgHealth"></p>
                <p>Hình ảnh bảng lương : </p>
                <p id="imgSalary"></p>
                <p>Hình ảnh phụ lục : </p>
                <p id="imgAppendix"></p>
                <p>Hình ảnh bảo hiểm xã hội : </p>
                <p id="imgSocial"></p>
                <p>Hình ảnh hợp đồng : </p>
                <p id="imgContract"></p>
            </div>
            <div class="modal-header">
                <h5 class="modal-title">Lịch sử đơn hàng</h5>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                <table class="table table-lg invoice-archive">
                    <thead>
                    <tr>
                        <th>Mã yêu cầu</th>
                        <th>Ngày yêu cầu</th>
                    </tr>
                    </thead>
                    <tbody id="tbodytable">
                    </tbody>
                </table>
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal show info order -->
<div class="modal modal-fill fade" id="modal-left" tabindex="100">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin chi tiết đơn hàng</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b" id="listView">
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal show info contract -->
<div class="modal modal-fill fade" id="modalContract" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin chi tiết hợp đồng </h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b" id="contractView">

            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->