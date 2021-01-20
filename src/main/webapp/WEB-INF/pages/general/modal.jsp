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
                <h5 class="modal-title">Thông tin chi tiết</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                <div class="row" id="saId">

                </div>
                <div class="row">
                    <div class="col-3 ">
                        <h4><b>*</b>&nbsp;&nbsp;Thông tin cá nhân</h4>
                        <p>Họ và tên : <span id="customerName" style="color:grey;"></span></p>
                        <p>Giới tính : <span id="customerGender" style="color:grey;"></span></p>
                        <p>Ngày sinh : <span id="day" style="color:grey;"></span>/<span id="month"
                                                                                        style="color:grey;"></span>/<span
                                id="year" style="color:grey;"></span></p>
                        <p>Địa chỉ thường trú : <span id="customerAddress" style="color:grey;"></span></p>
                        <p>Địa chỉ tạm trú : <span id="customerAddressTemp" style="color:grey;"></span></p>
                    </div>
                    <div class="col-3 ">
                        <h4><b>*</b>&nbsp;&nbsp;Liên lạc</h4>
                        <p>Số điện thoại : <span id="customerPhone" style="color:grey;"></span></p>
                        <p>Email : <span id="customerEmail" style="color:grey;"></span></p>
                    </div>
                    <div class="col-3 " id="job"></div>
                    <div class="col-3 "><h4><b>*</b>&nbsp;&nbsp;Tài khoản nhận</h4>
                        <p> Chủ tài khoản : <span id="customerBank" style="color:grey;"></span></p>
                        <p>Số tài khoản : <span id="customerBankAcc" style="color:grey;"></span></p>
                        <p> Tên ngân hàng : <span id="customerBankName" style="color:grey;"></span></p></div>
                    <div class="col-3 "><h4><b>*</b>&nbsp;&nbsp;Thông tin người thân</h4>
                        <p>Mối quan hệ : <span id="customerRelative" style="color:grey;"></span></p>
                        <p>Số điện thoại người thân : <span id="customerRelativePhone" style="color:grey;"></span></p>
                    </div>
                    <div class="col-3 " id="saInfo"></p>
                    </div>
                </div>
                <hr>
                <h4><b>*</b>&nbsp;&nbsp;Chứng từ : Hình ảnh </h4>
                <div class="row">
                    <div class="col-3 ">CMND <br>(Hình ảnh 2 mặt)</div>
                    <div class="col-3 ">BHYT <br>(Hình ảnh 1 mặt)</div>
                    <div class="col-3 ">Phiếu lương <br>(Hình ảnh 1 mặt của 3 phiếu lương gần nhất)</div>
                    <div class="col-3 ">Chứng từ bổ sung</div>
                </div>
                <div class="row">
                    <div class="col-3 ">
                        <p id="imgCMND"></p><br>
                        <p>- Số CMND : <span id="customerId" style="color:grey;"></span></p>
                        <p>- Ngày cấp : <span id="dayid" style="color:grey;"></span>/<span id="monthid"
                                                                                           style="color:grey;"></span>/<span
                                id="yearid" style="color:grey;"></span></p>
                        <p>- Nơi cấp : <span id="customerIdLocation" style="color:grey;"></span></p></div>
                    <div class="col-3 "><p id="imgHealth"></p><br>
                        <p>- Số bảo hiểm y tế : <span id="customerHealthInsurance" style="color:grey;"></span></p></div>
                    <div class="col-3 "><p id="imgPayslip"></p></div>
                    <div class="col-3 ">
                        <p>Hình ảnh phụ lục :</p>
                        <p id="imgAppendix"></p><br>
                        <p>Hình ảnh bảo hiểm xã hội :</p>
                        <p id="imgSocial"></p><br>
                        <p>Hình ảnh hợp đồng lao động :</p>
                        <p id="imgContract"></p></div>
                </div>
                <hr>
                <h4 id="labelDanhgia"></h4>
                <div class="row" id="danhgia">
                </div>
                <div class="modal-footer modal-footer-uniform">
                    <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Đóng trang</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal show info order -->
<div class="modal modal-right fade" id="modal-left" tabindex="100">
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
<!-- Modal show info order not show customer -->
<div class="modal modal-right fade" id="modalOrder" tabindex="100">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin chi tiết đơn hàng</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b" id="listView2">
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-info " data-dismiss="modal">Close</button>
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
<!-- Modal change password -->
<div class="modal modal-fill fade" id="modalChangePass" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 style="color: #0b0b0b">Thay đổi mật khẩu mới </h4>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b" id="changePass">
                <form id="pass">
                    <span id="id" style="display: none"></span>
                    <label for="oldpassword">Mật khẩu cũ</label>
                    <input type="password" id="oldpassword" name="oldpassword" required class="form-control"><br>
                    <label for="repassword">Mật khẩu mới</label>
                    <input type="password" id="password" name="password" required class="form-control">
                    <label for="repassword">Nhập lại mật khẩu mới</label>
                    <input type="password" id="repassword" name="repassword" required class="form-control">
                </form>
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-warning btn-update-change-password"
                        data-dismiss="modal">Cập nhật
                </button>
                <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Đóng trang</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal reset password -->
<div class="modal modal-fill fade" id="modalresetPass" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 style="color: #0b0b0b">Đặt lại mật khẩu </h4>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                <label>Bạn có chắc chắn đặt lại mật khẩu của "<b id="userName"></b>"?</label>
                <span id="idReset" style="display: none"></span>
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-warning" data-dismiss="modal" onclick="resetPass()">
                    Đồng ý
                </button>
                <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Đóng trang</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->