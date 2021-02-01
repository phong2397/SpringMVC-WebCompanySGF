function xacnhanKyduyet() {
    $("#loading").show();
    var dataRequest = $('#ids').text();
    var employeeDuyet = $('#employeeduyet').text();
    let data = {
        datarequest: dataRequest,
        status: 'act',
        step: '2',
        employeeDuyet: employeeDuyet,
        textDecline: 'Chờ chuyển tiền',
    };
    var result = sendOrderKyduyet(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Ký duyệt thành công',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
        $("#modal-right").modal('hide');
        $("#tr-" + dataRequest).remove();
    } else if (result === "errorEmployee") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Bạn không có quyền ký duyệt',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
    } else if (result === "errorStatus") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Trạng thái không khớp',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
    }
}

function sendOrderKyduyet(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "kyduyet",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

function tuchoiDuyetGiaiNgan() {
    $("#loading").show();
    var employeeDuyet = $('#employeeduyet').text();
    var textdecline = $('#reason').val();
    if (!textdecline || textdecline === 'null' || textdecline === 'undefined') {
        $("#loading").hide();
        return Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Lý do từ chối không hợp lệ',
            showConfirmButton: false,
            timer: 3000
        });
    }
    var dataRequest = $('#saID').text();
    let data = {
        datarequest: dataRequest, status: 'deni', step: '2', textDecline: textdecline,
        employeeDuyet: employeeDuyet
    };
    var result = sendOrderKyduyet(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Đơn dã bị từ chối',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
        $("#modal-right").modal('hide');
        $("#tr-" + dataRequest).remove();
    } else if (result === "errorEmployee") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Bạn không có quyền từ chối',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
    } else if (result === "errorStatus") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Trạng thái không khớp',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
    }
};


function chiadon() {
    var IDValue = $('.checkEmployee:checkbox:checked').map(
        function () {
            return $(this).val();
        }
    ).get();
    console.log(IDValue);
    var employee = $('#userLogin').val();
    let data = {datarequest: IDValue, employeeDuyet: employee};
    var result = updateEmployee(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        IDValue.map(e => {
            $("#employeeDuyet-" + e).empty();
            $("#employeeDuyet-" + e).append(employee);
            $('input:checkbox').prop('checked', false);
        })
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
    }
}

function updateEmployee(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "updateEmployeeDuyet",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
        console.log(text);
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

$("#rootcheckbox").click(function () {
    $('input:checkbox').not(this).prop('checked', this.checked);
});