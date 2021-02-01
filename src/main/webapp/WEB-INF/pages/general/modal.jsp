<%@ page import="com.sgfintech.entity.Useradmin" %>
<%@ page import="com.sgfintech.util.Consts" %><%--
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
<!-- Modal show info customer -->
<div tabindex="-1" class="modal modal-right fade" id="modal-right" role="dialog" aria-hidden="true"
     aria-labelledby="exampleModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <div class="tabbable">
                    <!-- Nav Tabs, Modal Nav Bar -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item active">
                            <a class="nav-link active" href="#aDepartments" data-toggle="tab">
                                Thông tin chi tiết
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#historyInfo" data-toggle="tab">
                                Lịch sử đơn hàng
                            </a>
                        </li>

                    </ul>

                </div>
                <!-- Close Button -->
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Panes -->

            <div class="modal-body">
                <div class="tab-content">
                    <div class="tab-pane" id="historyInfo">
                        <table id="example" class="table table-lg invoice-archive" width="100%">
                            <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Thời gian yêu cầu</th>
                                <th>Số tiền ứng</th>
                                <th>Trạng thái đơn</th>
                            </thead>
                            <tbody id="tbody">
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane active" id="aDepartments">
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
                            <div class="col-3 " id="relativeInfo">
                            </div>
                            <div class="col-3 " id="saInfo">
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
                                <div class="slide-container">
                                    <div class="image" id="imgCMND"></div>
                                </div>
                                <br>
                                <p>- Số CMND : <span id="customerId" style="color:grey;"></span></p>
                                <p>- Ngày cấp : <span id="dayid" style="color:grey;"></span>/<span id="monthid"
                                                                                                   style="color:grey;"></span>/<span
                                        id="yearid" style="color:grey;"></span></p>
                                <p>- Nơi cấp : <span id="customerIdLocation" style="color:grey;"></span></p></div>
                            <div class="col-3 ">
                                <div class="slide-container">
                                    <div class="image" id="imgHealth"></div>
                                </div>
                                <br>
                                <p>- Số bảo hiểm y tế : <span id="customerHealthInsurance" style="color:grey;"></span>
                                </p>
                            </div>
                            <div class="col-3 ">
                                <div class="slide-container">
                                    <div class="image" id="imgPayslip"></div>
                                </div>
                            </div>
                            <div class="col-3 ">
                                <p>Hình ảnh phụ lục :</p>
                                <div class="slide-container">
                                    <p id="imgAppendix"></p>
                                </div>
                                <p id=""></p><br>
                                <p>Hình ảnh bảo hiểm xã hội :</p>
                                <div class="slide-container">
                                    <p id="imgSocial"></p>
                                </div>
                                <br>
                                <p>Hình ảnh hợp đồng lao động :</p>
                                <div class="slide-container">
                                    <p id="imgContract"></p>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <h4 id="labelDanhgia"></h4>
                        <div class="row" id="danhgia">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Đóng trang
                </button>
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
                <button type="button" class="btn btn-rounded btn-close" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->


<!-- Modal xác nhận thẩm định -->
<div class="modal modal-fill fade" id="thamdinhVerify" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 style="color: #0b0b0b">Thẩm định hồ sơ</h4>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                <h4>Bạn có chắc chắn thẩm định cho đơn "<b style="color: black" id="ida"></b>"?</h4>
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-warning" data-dismiss="modal"
                        onclick="xacnhanThamdinh()">
                    Xác nhận
                </button>
                <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Hủy</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal xác nhận ky duyet -->
<div class="modal modal-fill fade" id="kyduyetVerify" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 style="color: #0b0b0b">Ký duyệt </h4>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                <h4>Bạn có chắc chắn ký duyệt cho đơn "<b style="color: black" id="ids"></b>"?</h4>
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-warning" data-dismiss="modal"
                        onclick="xacnhanKyduyet()">
                    Xác nhận
                </button>
                <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Hủy</button>
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
                <h4>Bạn có chắc chắn đặt lại mật khẩu của "<b id="userName"></b>"?</h4>
                <span id="idReset" style="display: none"></span>
            </div>
            <div class="modal-footer modal-footer-uniform">
                <button type="button" class="btn btn-rounded btn-warning" data-dismiss="modal"
                        onclick="resetPass()">
                    Đồng ý
                </button>
                <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Đóng trang</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal show info customer team nhac phi - thu phi - ke toan-->
<div tabindex="10" class="modal modal-right fade" id="modalRepayment" role="dialog" aria-hidden="true"
     aria-labelledby="exampleModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <div class="tabbable">
                    <!-- Nav Tabs, Modal Nav Bar -->
                    <ul class="nav nav-tabs" role="tablist">
                        <%

                            Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
                            String role = u.getRole();
                            if (role.equals("ketoan")) { %>
                        <li class="nav-item active">
                            <a class="nav-link active" href="#basicInfo" data-toggle="tab">
                                Thông tin khách hàng
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#documentChiThu" data-toggle="tab">
                                Chứng từ hình ảnh
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#historyCon" data-toggle="tab">
                                Lịch sử giao dịch
                            </a>
                        </li>
                        <% } else { %>
                        <li class="nav-item active">
                            <a class="nav-link active" href="#basicInfo" data-toggle="tab">
                                Thông tin khách hàng
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#impact" data-toggle="tab">
                                Tình trạng tác động
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link " href="#plan" data-toggle="tab">
                                Kế hoạch trả
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#document" data-toggle="tab">
                                Thông tin thẩm định và hình ảnh
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#historyCon" data-toggle="tab">
                                Lịch sử hợp đồng giải ngân
                            </a>
                        </li>
                        <% }%>
                    </ul>
                </div>
                <!-- Close Button -->
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Panes -->

            <div class="modal-body">
                <div class="tab-content">
                    <div class="tab-pane" id="historyCon">
                        <h4>&nbsp;&nbsp;Lịch sử đơn hàng</h4>
                        <table class="table table-lg invoice-archive" width="100%">
                            <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Thời gian giải ngân</th>
                                <th>Người giải ngân</th>
                                <th>Số tiền ứng</th>
                                <th>Số tiền còn nợ</th>
                                <th>Trạng thái đơn</th>
                            </thead>
                            <tbody id="tbodyCon">
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="impact">
                        <h4>&nbsp;&nbsp;Ghi chép tình trạng </h4>
                        <div class="box-body">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Số hợp đồng : </label>
                                    <span id="idContractimp"></span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Số điện thoại di động : </label>
                                    <span id="customerPhoneimp"></span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Kết quả thu thập
                                        : </label><select id="chkveg" data-style="btn-default"
                                                          class="selectpicker form-control" multiple>
                                    <option value="Khách hàng có bắt máy">
                                        <span>Khách hàng có bắt máy</span>
                                    </option>
                                    <option value="Thuê bao không liên lạc được">
                                        <span>Thuê bao không liên lạc được</span>
                                    </option>
                                    <option value="Hứa thanh toán">
                                        <span>Hứa thanh toán</span>
                                    </option>
                                    <option value="Đã thanh toán( KH nói đã thanh toán nhưng tiền chưa về )">
                                        <span>Đã thanh toán( KH nói đã thanh toán nhưng tiền chưa về )</span>
                                    </option>
                                    <option value="Khách hàng không hợp tác thanh toán ">
                                        <span>Khách hàng không hợp tác thanh toán </span>
                                    </option>
                                    <option value="Có đổ chuông, không nghe máy/ kẹt máy hoặc hộp thư thoại">
                                        <span>Có đổ chuông, không nghe máy/kẹt máy hoặc hộp thư thoại </span>
                                    </option>
                                    <option value="Khách hàng không có khả năng trả nợ">
                                        <span>Khách hàng không có khả năng trả nợ</span>
                                    </option>
                                    <option value="Khách bị giam tù hoặc đã chết/ bệnh/ tai nạn">
                                        <span>Khách bị giam tù hoặc đã chết/ bệnh/tai nạn</span>
                                    </option>
                                    <option value="Đang chờ nhận tiền lương">
                                        <span>Đang chờ nhận tiền lương</span>
                                    </option>
                                    <option value="Không thể thanh toán do thất nghiệp/ vay nhiều">
                                        <span>Không thể thanh toán do thất nghiệp/ vay nhiều</span>
                                    </option>
                                    <option value="Không thể thanh toán muốn chia nhỏ ra từng phần">
                                        <span>Không thể thanh toán muốn chia nhỏ ra từng phần</span>
                                    </option>
                                    <option value="Khác: những TH không có ở trên">
                                        <span>Khác: những TH không có ở trên</span>
                                    </option>
                                </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Diễn giải : </label>
                                    <textarea class="form-control"></textarea>
                                </div>
                            </div>
                            <button type="button" class="btn btn-rounded btn-primary">
                                Xác nhận
                            </button>
                        </div>

                    </div>
                    <div class="tab-pane" id="plan">
                        <table class="table table-striped table-bordered no-margin"
                               width="100%">
                            <thead>
                            <tr>
                                <th class="text-center">Trạng thái thanh toán</th>
                                <th class="text-center">Thời gian cần thanh toán</th>
                                <th class="text-left">Số tiền tạm ứng</th>
                                <th class="text-left">Phí dịch vụ</th>
                                <th class="text-left">Mức phí</th>
                                <th class="text-left">Thời gian tạm ứng</th>
                                <th class="text-left">Tổng số tiền phải trả</th>
                            </tr>
                            </thead>
                            <tbody id="planShow">

                            <tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="document">
                        <h4>Chứng từ : Hình ảnh </h4>
                        <div class="row">
                            <div class="col-3 ">CMND <br>(Hình ảnh 2 mặt)</div>
                            <div class="col-3 ">BHYT <br>(Hình ảnh 1 mặt)</div>
                            <div class="col-3 ">Phiếu lương <br>(Hình ảnh 1 mặt của 3 phiếu lương gần nhất)</div>
                            <div class="col-3 ">Chứng từ bổ sung</div>
                        </div>
                        <div class="row">
                            <div class="col-3 ">
                                <div class="slide-container">
                                    <p id="imgCMNDc"></p>
                                </div>
                            </div>

                            <div class="col-3 "><p id="imgHealthc"></p><br>
                            </div>
                            <div class="col-3 ">
                                <div class="slide-container"><p id="imgPayslipc"></p></div>
                            </div>
                            <div class="col-3 ">
                                <p>Hình ảnh phụ lục :</p>
                                <div class="slide-container">
                                    <p id="imgAppendixc"></p></div>
                                <br>
                                <p>Hình ảnh bảo hiểm xã hội :</p>
                                <div class="slide-container">
                                    <p id="imgSocialc"></p></div>
                                <br>
                                <p>Hình ảnh hợp đồng lao động :</p>
                                <div class="slide-container">
                                    <p id="imgContractc"></p></div>

                            </div>

                        </div>
                    </div>

                    <div class="tab-pane" id="documentChiThu">
                        <h4>Chứng từ : Hình ảnh </h4>
                        <div class="row">
                            <div class="col-5 ">Uỷ nhiệm chuyển tiền</div>
                            <div class="col-5 ">Uỷ nhiệm thu tiền</div>
                        </div>
                        <div class="row">
                            <div class="col-5 ">
                                <p id="payImages"></p>
                            </div>

                            <div class="col-5 "><p id="collectionImages"></p><br>
                            </div>


                        </div>
                    </div>
                    <div class="tab-pane active" id="basicInfo">
                        <h4>&nbsp;&nbsp;Thông tin khách hàng</h4>
                        <div class="row">
                            <div class="col-3 ">
                                <p>Họ và tên : <span id="customerNamec" style="color:grey;"></span></p>
                                <p>Giới tính : <span id="customerGenderc" style="color:grey;"></span></p>
                                <p>Ngày sinh : <span id="dayc" style="color:grey;"></span>/<span id="monthc"
                                                                                                 style="color:grey;"></span>/<span
                                        id="yearc" style="color:grey;"></span></p>
                                <p>Địa chỉ thường trú : <span id="customerAddressc" style="color:grey;"></span></p>
                                <p>Địa chỉ tạm trú : <span id="customerAddressTempc" style="color:grey;"></span></p>
                                <p>Số CMND : <span id="customerIdc" style="color:grey;"></span></p>
                                <p id="dateCMND"></p>
                                <p>Nơi cấp : <span id="customerIdLocationc" style="color:grey;"></span></p>


                            </div>
                            <div class="col-3 ">
                                <h4><b>*</b>&nbsp;&nbsp;Liên lạc</h4>
                                <p>Số điện thoại : <span id="customerPhonec" style="color:grey;"></span></p>
                                <p>Email : <span id="customerEmailc" style="color:grey;"></span></p>
                            </div>
                            <div class="col-3 " id="jobc"></div>
                            <div class="col-3 "><h4><b>*</b>&nbsp;&nbsp;Tài khoản nhận</h4>
                                <p> Chủ tài khoản : <span id="customerBankc" style="color:grey;"></span></p>
                                <p>Số tài khoản : <span id="customerBankAccc" style="color:grey;"></span></p>
                                <p> Tên ngân hàng : <span id="customerBankNamec" c style="color:grey;"></span></p></div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng trang</button>
            </div>

        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal show info contract -->
<div class="modal modal-fill fade" id="modalContract" tabindex="1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin chi tiết đơn hàng</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b" id="contractView">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng trang</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->
<!-- Modal reset password -->
<div class="modal modal-fill fade" id="modalGiaidoantrehan" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

            </div>
            <div class="modal-body" style="font-weight: bold; color: #0b0b0b">
                <div class="box-body">
                    <h4 style="color: #0b0b0b;font-weight:bold">Chỉnh sửa </h4>
                    <div class="form-group">
                        <label>Mã nguyên tắc : </label>
                        <input type="text" value="S0" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Tên nguyên tắc : </label>
                        <input type="text" value="S0" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Cấp ưu tiên : </label>
                        <input type="text" value="1" class="form-control">

                    </div>
                    <div class="form-group">
                        <label>Trạng thái : </label>
                        <select id="user_role" class="form-control">
                            <option value="nvthamdinh" selected>
                                <span>Hữu hiệu</span>
                            </option>
                            <option value="nvkyduyet">
                                <span>Vô hiệu hóa</span>
                            </option>

                        </select>

                    </div>
                    <div class="form-group">
                        <label>Số ngày quá hạn : </label>
                        <input type="text" value="-2" class="form-control"></div>
                    <div class="form-group">
                        <label><=T< : </label>
                        <input type="text" value="1" class="form-control"></div>

                    <div class="form-group">
                        <label>Giai đoạn trễ hạn : </label>
                        <input type="text" value="0" class="form-control"></div>
                    <div class="form-group">
                        <label>Ghi chú : </label>
                        <textarea class="form-control"></textarea>
                    </div>

                </div>
                <hr>
                <div class="modal-footer modal-footer-uniform">
                    <button type="button" class="btn btn-rounded btn-github" data-dismiss="modal">Hủy bỏ</button>
                    <button type="button" class="btn btn-rounded btn-primary">
                        Lưu
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->