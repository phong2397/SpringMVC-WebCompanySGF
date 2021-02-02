function xacnhanThamdinh() {
    var dataRequest = $('#saID').text();
    var employeeThamdinh = $('#employeeTD').text().trim();
    let data = {
        datarequest: dataRequest,
        status: 'wfs',
        step: '1',
        textDecline: 'Thông tin đầy đủ',
        employeeThamdinh: employeeThamdinh
    };
    var result = sendOrderThamdinh(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Xét duyệt thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $("#modal-right").modal('hide');
        $("#tr-" + dataRequest).remove();
    } else if (result === "errorEmployee") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Bạn không có quyền xét duyệt',
            showConfirmButton: false,
            timer: 3000
        });
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
    }
};

function sendOrderThamdinh(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "changes",
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

function tuchoiQuanlyxetduyet() {
    $("#loading").show();
    var dataRequest = $('#saID').text();
    var textdecline = $('#reason').val();
    var employeeThamdinh = $('#employeeTD').text().trim();
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
    let data = {
        datarequest: dataRequest,
        status: 'deni',
        step: '1',
        textDecline: textdecline,
        employeeThamdinh: employeeThamdinh
    };
    var result = sendOrderThamdinh(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Đơn dã bị từ chối',
            showConfirmButton: false,
            timer: 3000
        });
        $("#modal-right").modal('hide');
        $("#loading").hide();
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

function updateDeclineKyduyet() {
    var dataRequest = $('#saID').text();
    var employeeDuyet = $('#employeeduyet').text();
    console.log(dataRequest)
    let data = {
        datarequest: dataRequest,
        status: 'wfs',
        step: '2',
        textDecline: 'Cập nhật lại thông tin ở bước ký duyệt',
        employee: employeeDuyet
    };
    var result = updatestatusDeniKyduyet(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $("#modal-right").modal('hide');
        $("#tr-" + dataRequest).remove();
    } else if (result === "errorEmployee") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Bạn không có quyền cập nhật lại trạng thái đơn',
            showConfirmButton: false,
            timer: 3000
        });
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
    }
};

function updatestatusDeniKyduyet(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "updateStatusDecline",
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


function updateDeclineThamdinh() {
    var dataRequest = $('#saID').text();
    console.log(dataRequest)
    var employeeThamdinh = $('#employeeTD').text().trim();
    console.log(employeeThamdinh)
    let data = {
        datarequest: dataRequest,
        status: 'wait',
        step: '1',
        textDecline: 'Cập nhật lại thông tin ở bước thẩm định',
        employee: employeeThamdinh
    };
    var result = updatestatusDeniThamdinh(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Cập nhật thông tin thành công',
            showConfirmButton: false,
            timer: 3000
        });
        $("#modal-right").modal('hide');
        $("#tr-" + dataRequest).remove();
    } else if (result === "errorEmployee") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Bạn không có quyền cập nhật lại trạng thái đơn',
            showConfirmButton: false,
            timer: 3000
        });
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
    }
};

function updatestatusDeniThamdinh(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "updateStatusDecline",
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


function chiadon() {
    var IDValue = $('.checkEmployee:checkbox:checked').map(
        function () {
            return $(this).val();
        }
    ).get();
    console.log(IDValue);
    var employee = $('#userLogin').val();
    let data = {datarequest: IDValue, employeeThamdinh: employee};
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
            $("#empColumn-" + e).empty();
            $("#empColumn-" + e).append(employee);
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
            url: "updateEmployeeThamdinh",
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
